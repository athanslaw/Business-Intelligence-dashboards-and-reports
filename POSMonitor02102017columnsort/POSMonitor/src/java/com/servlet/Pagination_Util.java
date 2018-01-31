
package com.servlet;

import java.sql.ResultSet;

public class Pagination_Util {
    ResultSet pagination_result;
    int total;
    int pagination_count;
    
    public Pagination_Util(ResultSet pagination_result, int total, int pagination_count) {
        this.pagination_result = pagination_result;
        this.total = total;
        this.pagination_count = pagination_count;
        System.out.println("Pagination 1");
    }

    public ResultSet getPagination_result() {
        return pagination_result;
    }

    public void setPagination_result(ResultSet pagination_result) {
        this.pagination_result = pagination_result;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPagination_count() {
        return pagination_count;
    }

    public void setPagination_count(int pagination_count) {
        this.pagination_count = pagination_count;
    }
    
}
