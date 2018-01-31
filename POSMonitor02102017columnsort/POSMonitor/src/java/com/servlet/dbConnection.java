/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.TimeZone;
import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class dbConnection {
    
    
    Connection con;
    Statement stm;
    public boolean dbco(String host, String dbname, String username, String password){
        TimeZone timeZone = TimeZone.getTimeZone("GMT");
        TimeZone.setDefault(timeZone);
        
        /*Statement stm; String username = request.getParameter("username"); String password = request.getParameter("password");
        String host = request.getParameter("dbhost"); String dbname = request.getParameter("dbname");*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/atmalert", "root", "");
            con = DriverManager.getConnection("jdbc:mysql://"+host+"/"+dbname,username, password);
            stm = con.createStatement();
            /*
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@"+host+":"+dbname,username, password);
            stm = con.createStatement();
            */
            /*
            getServletConfig().getServletContext().setAttribute("dbname", dbname);
            getServletConfig().getServletContext().setAttribute("username", username);
            getServletConfig().getServletContext().setAttribute("password", password);
            getServletConfig().getServletContext().setAttribute("dbhost", host);*/
            
            //request.getRequestDispatcher("WEB-INF/setup-config.jsp?step=2").forward(request, response);
            return true;
        } catch (Exception e) {
            System.out.print("An exception occurred during SQL Connection: dbConnect " + e);System.out.println("dsds : "+host+dbname+username+password);
            //request.getRequestDispatcher("WEB-INF/setup-config.jsp?step=1&msg=error").forward(request, response);
            return false;
        }
    }
}
