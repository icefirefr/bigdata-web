package com.bigdat.query.web;

import java.util.ArrayList;
import java.util.List;

public class Table {

    List<String> headers = new ArrayList<String>();
    List<List<String>> datas = new ArrayList<List<String>>();

    public List<String> getHeaders() {
        return headers;
    }

    public void setHeaders(List<String> headers) {
        this.headers = headers;
    }

    public List<List<String>> getDatas() {
        return datas;
    }

    public void setDatas(List<List<String>> datas) {
        this.datas = datas;
    }

}
