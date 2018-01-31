
package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "active_terminal", urlPatterns = {"/active_terminal"})
public class active_terminal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //pagination stuff
        int pages=1, offset=0, limit = 50;
        limit = request.getParameter("limits")!=null?new Integer(request.getParameter("limits")).intValue():limit;
        pages = request.getParameter("page")!=null?new Integer(request.getParameter("page")).intValue():pages;
	offset=limit*(pages-1);
        request.setAttribute("limits", limit);
        request.setAttribute("page", pages);
        request.setAttribute("offset", offset);
        //pagination ends
        
        String datefrom = request.getParameter("datefrom");
        String dateto = request.getParameter("dateto");
        if(datefrom.compareTo(dateto) > 0){String da = datefrom; datefrom = dateto; dateto = da;}
        StringTokenizer token = new StringTokenizer(datefrom, "/");
        StringTokenizer token2 = new StringTokenizer(dateto, "/");
        String years="", months="", days="", datefrom1, dateto1;
        if(token.hasMoreTokens()) months = token.nextToken();
        if(token.hasMoreTokens()) days = token.nextToken();
        if(token.hasMoreTokens()) years = token.nextToken();
        datefrom1 = years + "-" + months + "-" +days;
        
        if(token2.hasMoreTokens()) months = token2.nextToken();
        if(token2.hasMoreTokens()) days = token2.nextToken();
        if(token2.hasMoreTokens()) years = token2.nextToken();
        dateto1 = years+"-"+months+"-"+days;
        
//        List<ChannelRequest> channel = channelRequestFacade.findAllDateRange(datefrom1, dateto1);
        
/*        Iterator<Pos> it;
        Iterator<ChannelRequest> it1 = channel.iterator();
        Pos posInfo;
        ChannelRequest re;
        Collection colPT;
        ArrayList<Pos> activeTerminal = new ArrayList();
        String terminalId;
        while(it1.hasNext()){
            re = it1.next();
            colPT = posFacade.findByTerminalId(re.getA041CardAcceptorTerminalId());
                terminalId = re.getA041CardAcceptorTerminalId();
                System.out.println(" here ");
                it = colPT.iterator();
                if(it.hasNext()){
                    posInfo = it.next();
                    posInfo.setMerchantId(re.getFeedTimestamp());
                    posInfo.setId(channelRequestFacade.findAllDateRangeCount(terminalId, datefrom1, dateto1).size());
                    activeTerminal.add(posInfo);
                }
            
        }
        request.setAttribute("activeTerminal", activeTerminal);
        request.setAttribute("datefrom", datefrom);
        request.setAttribute("dateto", dateto);
        */
        request.getRequestDispatcher("WEB-INF/active_terminal.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date date = new Date();
        String datefrom= new SimpleDateFormat("MM-dd-yyyy").format(date);
        String dateto = datefrom;
        String datefrom1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
        String dateto1 = datefrom1;
/*        List<ChannelRequest> channel = channelRequestFacade.findAllDateRange(datefrom1, dateto1);
        
        Iterator<Pos> it;
        Iterator<ChannelRequest> it1 = channel.iterator();
        Pos posInfo;
        ChannelRequest re;
        Collection colPT;
        ArrayList<Pos> activeTerminal = new ArrayList();
        request.setAttribute("rank", "1");
        String terminalId;
        while(it1.hasNext()){
            re = it1.next();
            colPT = posFacade.findByTerminalId(re.getA041CardAcceptorTerminalId());
            
                terminalId = re.getA041CardAcceptorTerminalId();
                
                it = colPT.iterator();
                if(it.hasNext()){
                    posInfo = it.next();
                    posInfo.setMerchantId(re.getFeedTimestamp());
                    posInfo.setId(channelRequestFacade.findAllDateRangeCount(terminalId, datefrom1, dateto1).size());
                    posInfo.setSolId(channelRequestFacade.findAllDateRangeCount(terminalId, datefrom1, dateto1).size()+"");
                    activeTerminal.add(posInfo);
                }
            
        }
        */
        request.setAttribute("value", "Total Number of Transactions");
//        request.setAttribute("activeTerminal", activeTerminal);
        request.setAttribute("datefrom", datefrom);
        request.setAttribute("dateto", dateto);
        
        request.getRequestDispatcher("WEB-INF/active_terminal.jsp").forward(request, response);
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