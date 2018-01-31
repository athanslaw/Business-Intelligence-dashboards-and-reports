package com.servlet;

import java.util.TimeZone;
import java.sql.*;
import oracle.ucp.jdbc.PoolDataSourceFactory;
import oracle.ucp.jdbc.PoolDataSource;

public class LookUp {

    public static Connection con;
    Statement stm;

    public LookUp() {
            TimeZone timeZone = TimeZone.getTimeZone("GMT");
            TimeZone.setDefault(timeZone);
            
            try {
                String dbname = HelperClass.dbname;
                String dbhost = HelperClass.dbhost;
                String username = HelperClass.username;
                String password = HelperClass.password;
            //Creating a pool-enabled data source
            PoolDataSource pds = PoolDataSourceFactory.getPoolDataSource();
            //Setting connection properties of the data source
            pds.setConnectionFactoryClassName("oracle.jdbc.pool.OracleDataSource");
            pds.setURL("jdbc:oracle:thin:@"+dbhost+":"+dbname+"");
            pds.setUser(username);
            pds.setPassword(password);
            //Setting pool properties
            pds.setInitialPoolSize(5);
            pds.setMinPoolSize(5);
            pds.setMaxPoolSize(10);
            //Borrowing a connection from the pool
            LookUp.con = pds.getConnection();
            System.out.println("\nConnection borrowed from the pool");
            //Checking the number of available and borrowed connections
            /*int avlConnCount = pds.getAvailableConnectionsCount();
            System.out.println("\nAvailable connections: " + avlConnCount);
            int brwConnCount = pds.getBorrowedConnectionsCount();
            System.out.println("\nBorrowed connections: " + brwConnCount);*/
            //Working with the connection
        } catch (SQLException e) {
            System.out.println("\nAn SQL exception occurred : " + e.getMessage());
        }

    }
/*
    public LookUp() {
            TimeZone timeZone = TimeZone.getTimeZone("GMT");
            TimeZone.setDefault(timeZone);
            try {
                String dbname = HelperClass.dbname;
                String dbhost = HelperClass.dbhost;
                String username = HelperClass.username;
                String password = HelperClass.password;
                LookUp.con = HelperClass.con;

                Class.forName("oracle.jdbc.driver.OracleDriver");
                LookUp.con = DriverManager.getConnection("jdbc:oracle:thin:@"+dbhost+":"+dbname,username, password);
                //stm = con.createStatement();
            } catch (Exception e) {
                System.out.print("An exception occurred during SQL Connection: " + e);
            }

    }
*/
    
    public void connectDb(String username, String password) {
        TimeZone timeZone = TimeZone.getTimeZone("GMT");
        TimeZone.setDefault(timeZone);
        try {
            LookUp.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atmalert", username, password);
            //stm = LookUp.con.createStatement();
             /*
         con = DriverManager.getConnection("jdbc:oracle:thin:@10.100.20.104:1521:SOFTLIVE",username, password);
         stm = con.createStatement();*/
        } catch (Exception e) {
            System.out.print("An exception occurred during SQL Connection: " + e);
        }
    }

    public Pagination_Util fetch(String sql, int offset, int limit, String  countQ) {
        Pagination_Util list;
        //String limits = "";
        //if(limit > 0 ) limits = " AND rownum  BETWEEN 0 AND 10 ";
        int upperbound = offset > 0 ? limit+offset-1:limit+offset;
        //String query2 = "SELECT * FROM (SELECT ROWNUM rnum,a.* FROM ("+sql+") a) WHERE rnum BETWEEN "+offset+" AND "+(limit+offset);
        String query2 = "SELECT * FROM ("+sql+") WHERE R BETWEEN "+offset+" AND "+(upperbound);
        try {
            stm = LookUp.con.createStatement();
            //int numberOfRecords = 2;
            ResultSet rsC = stm.executeQuery(countQ);
            rsC.next();
            int numberOfRecords = rsC.getInt(1);
            
            /*ResultSet rs1 = stm.executeQuery(sql + limits);*/
            ResultSet rs1 = stm.executeQuery(query2);
            int pagination_count = new Integer(numberOfRecords / limit).intValue() + 1;
            //int pagination_count = 5;
            list = new Pagination_Util(rs1, numberOfRecords, pagination_count);
            return list;
        } catch (Exception e) {System.out.println("\nHere lookup: "+e);
        }
        return null;
    }

    public Pagination_Util fetchs(String sql, int offset, int limit, String  countQ) {
        Pagination_Util list;
        //String limits = "";
        //if(limit > 0 ) limits = " AND rownum  BETWEEN 0 AND 10 ";
        //int upperbound = offset > 0 ? limit+offset-1:limit+offset;
        
        String query2 = "select * from ( select a.*, ROWNUM rnum from ("+sql+") a where ROWNUM <= "+limit+" ) WHERE rnum  >= "+offset;
        //String query2 = "SELECT * FROM ("+sql+") WHERE R BETWEEN "+offset+" AND "+(upperbound);
        try {
            stm = LookUp.con.createStatement();
            //int numberOfRecords = 2;
            ResultSet rsC = stm.executeQuery(countQ);
            rsC.next();
            int numberOfRecords = rsC.getInt(1);
            
            /*ResultSet rs1 = stm.executeQuery(sql + limits);*/
            ResultSet rs1 = stm.executeQuery(query2);
            int pagination_count = new Integer(numberOfRecords / limit).intValue() + 1;
            //int pagination_count = 5;
            list = new Pagination_Util(rs1, numberOfRecords, pagination_count);
            return list;
        } catch (Exception e) {System.out.println("\nHere lookup: "+query2+": "+e);
        }
        return null;
    }

    public Pagination_Util fetch1(String sql, int offset, int limit, String  countQ) {
        Pagination_Util list;
        //String limits = "";
        //if(limit > 0 ) limits = " AND rownum  BETWEEN 0 AND 10 ";
        //int upperbound = offset > 0 ? limit+offset-1:limit+offset;
        //String query2 = "SELECT * FROM (SELECT ROWNUM rnum,a.* FROM ("+sql+") a) WHERE rnum BETWEEN "+offset+" AND "+(limit+offset);
        String query2 = sql;
        try {
            stm = LookUp.con.createStatement();
            //int numberOfRecords = 2;
            ResultSet rsC = stm.executeQuery(countQ);
            rsC.next();
            int numberOfRecords = rsC.getInt(1);
            
            /*ResultSet rs1 = stm.executeQuery(sql + limits);*/
            ResultSet rs1 = stm.executeQuery(query2);
            int pagination_count = new Integer(numberOfRecords / limit).intValue() + 1;
            //int pagination_count = 5;
            list = new Pagination_Util(rs1, numberOfRecords, pagination_count);
            return list;
        } catch (Exception e) {System.out.println("\nHere lookup: "+e);
        }
        return null;
    }

    public Pagination_Util view_record(String sql) {
        Pagination_Util list;
        
        try {
            stm = LookUp.con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            int numberOfRecords = 0;
            if (rs != null) {
                boolean b = rs.last();
                if (b) {
                    numberOfRecords = rs.getRow();
                }
            }
            ResultSet rs1 = stm.executeQuery(sql);
            int pagination_count = 1;
            list = new Pagination_Util(rs1, numberOfRecords, pagination_count);
            
            return list;
        } catch (Exception e) {System.out.println("\nHere lookup fetch2: \n"+e);
        }
        return null;
    }

    public ResultSet view_record_single(String sql) {
        try {
            stm = LookUp.con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            return rs;
        } catch (Exception e) {
            System.out.println("fetch single caught "+e);
        return null;
        }
    }

}
