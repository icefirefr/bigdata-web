package com.bigdat.query.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.asiabao.hadoop.hbase.HbaseDAO;
import com.asiabao.hadoop.hbase.HbaseDaofactory;
import com.bigdat.query.web.util.JsonUtil;
import com.bigdat.query.web.vo.Transmission;

@WebServlet(name = "DisplayTableDataPages", urlPatterns = {"/pages" })
public class DisplayTableDataPages extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    private static final Log LOG = LogFactory.getLog(HbaseDAO.class);
    private JsonUtil jsonUtil = new JsonUtil();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String tableName, siteId, devid, start, columnfamily, pageCount, currentPage,pages,json;
            siteId = request.getParameter("siteId");
            devid = request.getParameter("devid");
            start = request.getParameter("start");
            pageCount = request.getParameter("pagecount");
            currentPage = request.getParameter("currentpage");
            pages = request.getParameter("pages");
            json = request.getParameter("json");

            if (!checkArgs(siteId, devid, start)) {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }

            tableName = siteId + getServletContext().getInitParameter("table_postfix");
            getServletContext().getInitParameterNames();

            columnfamily = getServletContext().getInitParameter(tableName);

            request.setAttribute("siteId", siteId);
            request.setAttribute("devid", devid);
            request.setAttribute("start", start);

            LOG.info("siteId " + siteId);
            LOG.info("devid " + devid);
            LOG.info("start " + start);

            HbaseDAO dao = HbaseDaofactory.getFactory().getHDao();
            dao.init(tableName, columnfamily);

            Date startD = sf.parse(start);
            Date startDs = DisplayTableData.addHour(startD, Integer.valueOf(pageCount) * (Integer.valueOf(currentPage) - 1) + 1);
            Date endDs = DisplayTableData.addHour(startDs, Integer.valueOf(pageCount));
            
            String ends = sf.format(endDs);
            String starts = sf.format(startDs);
            LOG.info("开始时间 " + sf.format(startDs));
            LOG.info("结束时间 " + ends);
            
            List<Map<String, String>> r = dao.findByTime(tableName, siteId, devid, startDs, endDs, -1L);
            Table table = new Table();
            LOG.debug("======================================== rows " + r.size());
            if (r.size() > 0) {
                Map<String, String> header = r.get(0);
                Set<String> keys = header.keySet();
                String[] ts = keys.toArray(new String[keys.size()]);
                List<String> h = Arrays.asList(ts);
                table.setHeaders(h);

                List<List<String>> datas = new ArrayList<List<String>>();
                for (Map<String, String> m : r) {
                    // System.out.println("======================================== ");
                    List<String> rs = new ArrayList<String>();
                    for (String item : h) {
                        if (m.containsKey(item)) {
                            String value = m.get(item);
                            rs.add(value);
                            LOG.debug("KEY=> " + item + " value=> " + m.get(item));
                        }
                    }
                    datas.add(rs);
                    table.setDatas(datas);

                }
            }
            request.setAttribute("siteId", siteId);
            request.setAttribute("devid", devid);
            request.setAttribute("start", start);
            request.setAttribute("starts", starts);
            request.setAttribute("end", ends);
            
            request.setAttribute("table", table);
            request.setAttribute("pages", pages);
            request.setAttribute("pagecount", pageCount);
            request.setAttribute("currentpage", currentPage);
            request.setAttribute("size", table.getDatas().size());
            
            if(StringUtils.isNotBlank(json) && json.equals("json")){
                Transmission tran = new Transmission();
                tran.setDevid(devid);
                tran.setSiteId(siteId);
                tran.setTable(table);
                tran.setPagecount(pageCount);
                tran.setPages(String.valueOf(pages));
                tran.setSize(String.valueOf(table.getDatas().size()));
                tran.setCurrentPage(currentPage);
                tran.setInitStart(start);
                tran.setStart(starts);
                tran.setEnd(ends);
                PrintWriter writer = response.getWriter();
                writer.write(jsonUtil.toJson(tran));
                writer.flush();
                writer.close();
            }else{
                request.getRequestDispatcher("/table.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    boolean checkArgs(String siteId, String devid, String start) {
        if (StringUtils.isBlank(siteId) || StringUtils.isBlank(devid) || StringUtils.isBlank(start)
                ) {
            return false;
        }
        return true;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
