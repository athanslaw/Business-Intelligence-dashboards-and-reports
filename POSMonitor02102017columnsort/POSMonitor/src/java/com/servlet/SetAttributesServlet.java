
package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SetAttributesServlet", urlPatterns = {"/set-attributes"})
public class SetAttributesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {
        String username, password;/*
        req.getServletContext().setAttribute("username", request.getParameter("username"));
        

        // set session scoped attribute
        HttpSession session = req.getSession();
        session.setAttribute("name", "session scoped attribute");

        // set request scoped attribute
        req.setAttribute("name", "request scoped attribute");

        // send redirect to other servlet
        req.getRequestDispatcher("get-attributes").forward(req, resp);*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
