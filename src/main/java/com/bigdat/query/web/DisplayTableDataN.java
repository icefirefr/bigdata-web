package com.bigdat.query.web;

import java.io.IOException;
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
import com.asiabao.hadoop.hbase.PageResult;

@WebServlet(name = "DisplayTableDataN", urlPatterns = {"/datasn" })
public class DisplayTableDataN extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    private static final Log LOG = LogFactory.getLog(HbaseDAO.class);

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String tableName, siteId, devid, start, end, columnfamily, max, pageCount, startRow, starts;
            // tableName = request.getParameter("tableName");
            // columnfamily = request.getParameter("columnfamily");
            siteId = request.getParameter("siteId");
            devid = request.getParameter("devid");
            start = request.getParameter("start");
            starts = request.getParameter("starts");
            startRow = request.getParameter("startRow");
            max = request.getParameter("max");
            pageCount = request.getParameter("pagecount");

            if (!checkArgs(siteId, devid)) {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }

            if (StringUtils.isBlank(pageCount)) {
                pageCount = "6";
            }

            tableName = siteId + getServletContext().getInitParameter("table_postfix");
            getServletContext().getInitParameterNames();

            columnfamily = getServletContext().getInitParameter(tableName);

            // request.setAttribute("tableName", tableName);

            LOG.info("siteId " + siteId);
            LOG.info("devid " + devid);
            LOG.info("start " + start);

            HbaseDAO dao = HbaseDaofactory.getFactory().getHDao();
            dao.init(tableName, columnfamily);

            Date startD = null;
            if (StringUtils.isNotBlank(start)) {
                startD = sf.parse(start);
            }

            PageResult pr = dao.getNext(Integer.valueOf(pageCount), tableName, siteId, devid, startRow, startD,new Date());
            List<Map<String, String>> r = pr.getLs();
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
            request.setAttribute("start", StringUtils.isBlank(start) ? starts : start);
            request.setAttribute("starts", StringUtils.isBlank(starts) ? start : starts);

            request.setAttribute("table", table);
            request.setAttribute("startRow", pr.getStartRow());
            request.setAttribute("pagecount", pageCount);
            request.setAttribute("size", table.getDatas().size());
            request.getRequestDispatcher("/tablen.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static long deltHour(Date start, Date end) {
        long from = start.getTime();
        long to = end.getTime();
        long m = ((to - from) / (1000 * 60 * 60));
        return m;
    }

    public static Date addHour(Date start, int hours) {
        long from = start.getTime();
        long to = from + hours * 60 * 60 * 1000;
        Date m = new Date(to);
        return m;
    }

    public static boolean checkArgs(String siteId, String devid) {
        if (StringUtils.isBlank(siteId) || StringUtils.isBlank(devid)) {
            return false;
        }
        return true;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
