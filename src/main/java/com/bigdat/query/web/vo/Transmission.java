package com.bigdat.query.web.vo;

import com.bigdat.query.web.Table;

public class Transmission {

    private String siteId;
    private String devid;
    private String start;
    private String end;
    private Table table;

    private String pages;// 共多少页
    private String pagecount;// 一页多大量数据，注意不是多少行数据，多少小时数据
    private String size;
    
    private String currentPage;

    private String InitStart;// 查询的开始页面

    private String startRow;

    
    public String getCurrentPage() {
        return currentPage;
    }

    
    public void setCurrentPage(String currentPage) {
        this.currentPage = currentPage;
    }

    public String getStartRow() {
        return startRow;
    }

    public void setStartRow(String startRow) {
        this.startRow = startRow;
    }

    public String getInitStart() {
        return InitStart;
    }

    public void setInitStart(String initStart) {
        InitStart = initStart;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    public String getDevid() {
        return devid;
    }

    public void setDevid(String devid) {
        this.devid = devid;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    public String getPages() {
        return pages;
    }

    public void setPages(String pages) {
        this.pages = pages;
    }

    public String getPagecount() {
        return pagecount;
    }

    public void setPagecount(String pagecount) {
        this.pagecount = pagecount;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

}
