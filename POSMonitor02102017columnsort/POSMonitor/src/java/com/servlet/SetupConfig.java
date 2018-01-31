
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

@WebServlet(name = "SetupConfig", urlPatterns = {"/setup-config"})
public class SetupConfig extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/setup-config.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TimeZone timeZone = TimeZone.getTimeZone("GMT");
        TimeZone.setDefault(timeZone);
        Connection con;
        //Statement stm; 
        String username = request.getParameter("username"); String password = request.getParameter("password");
        String host = request.getParameter("dbhost"); String dbname = request.getParameter("dbname");
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@"+host+":"+dbname,username, password);
            
            getServletConfig().getServletContext().setAttribute("dbname", dbname);
            getServletConfig().getServletContext().setAttribute("username", username);
            getServletConfig().getServletContext().setAttribute("password", password);
            getServletConfig().getServletContext().setAttribute("dbhost", host);

            //Creating a pool-enabled data source
            PoolDataSource pds = PoolDataSourceFactory.getPoolDataSource();
            //Setting connection properties of the data source
            pds.setConnectionFactoryClassName("oracle.jdbc.pool.OracleDataSource");
            pds.setURL("jdbc:oracle:thin:@"+host+":"+dbname+"");
            pds.setUser(username);
            pds.setPassword(password);
            //Setting pool properties
            pds.setInitialPoolSize(5);
            pds.setMinPoolSize(5);
            pds.setMaxPoolSize(10);
            //Borrowing a connection from the pool
            LookUp.con = pds.getConnection();
            //Checking the number of available and borrowed connections
            request.getRequestDispatcher("WEB-INF/setup-config.jsp?step=2").forward(request, response);
        } catch (Exception e) {
            System.out.print("An exception occurred during SQL Connection: SetUpConfig " + e);
            request.getRequestDispatcher("WEB-INF/setup-config.jsp?step=1&msg=error").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
