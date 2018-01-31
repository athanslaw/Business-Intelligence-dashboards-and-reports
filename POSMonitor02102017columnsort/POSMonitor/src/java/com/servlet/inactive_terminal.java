
package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "inactive_terminal", urlPatterns = {"/inactive_terminal"})
public class inactive_terminal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String datefrom = request.getParameter("datefrom");
        String dateto = request.getParameter("dateto");
        
/*        List<Pos> pos1 = posFacade.findAll();
        
        Set<Pos> pos = new HashSet();
        pos.addAll(pos1);
        pos1.clear();
        Iterator<Pos> it = pos.iterator();
        Iterator<ChannelRequest> it1;
        Pos posInfo;
        Collection colPT;
        ArrayList<Pos> activeTerminal = new ArrayList();
        String terminalId="";ChannelRequest posT;
        while(it.hasNext()){
            posInfo = it.next();
            colPT = channelRequestFacade.findByTerminalDateRange(posInfo.getTerminalId(), datefrom, dateto);
            
                if(terminalId.equals(posInfo.getTerminalId()) || colPT.size() >0)
                    continue;
                terminalId = posInfo.getTerminalId();
                
                it1 = colPT.iterator();
                if(it1.hasNext()){
                    posT = it1.next();
                    posInfo.setMerchantId(posT.getFeedTimestamp());
                    posInfo.setId(colPT.size());
                    activeTerminal.add(posInfo);
                }
            
        }
        request.setAttribute("inactiveTerminal", activeTerminal);
        request.setAttribute("dateto", dateto);
        request.setAttribute("datefrom", datefrom);
        
        request.getRequestDispatcher("WEB-INF/inactive_terminal.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Pos> pos1 = posFacade.findAll();
        
        Set<Pos> pos = new HashSet();
        pos.addAll(pos1);
        pos1.clear();
        Iterator<Pos> it = pos.iterator();
        Iterator<ChannelRequest> it1;
        Pos posInfo;
        Collection colPT;
        ArrayList<Pos> activeTerminal = new ArrayList();
        String terminalId="";ChannelRequest posT;
        while(it.hasNext()){
            posInfo = it.next();
            colPT = channelRequestFacade.findByTerminal(posInfo.getTerminalId());
            
                if(terminalId.equals(posInfo.getTerminalId()) || colPT.size() >0)
                    continue;
                terminalId = posInfo.getTerminalId();
                
                it1 = colPT.iterator();
                if(it1.hasNext()){
                    posT = it1.next();
                    posInfo.setMerchantId(posT.getFeedTimestamp());
                    posInfo.setId(colPT.size());
                    activeTerminal.add(posInfo);
                }
            
        }
        request.setAttribute("inactiveTerminal", activeTerminal);
        */
        request.getRequestDispatcher("WEB-INF/inactive_terminal.jsp").forward(request, response);
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