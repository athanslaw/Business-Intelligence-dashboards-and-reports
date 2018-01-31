
package com.servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

@WebServlet(name = "terminalranking", urlPatterns = {"/terminalranking"})
public class terminalranking extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    /*  String datefrom = request.getParameter("datefrom");
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
        
        
        String fetchType = request.getParameter("rank");
        request.setAttribute("rank", fetchType);
        if(fetchType.equals("1")){
            request.setAttribute("value", "Total Number of Transactions");
        }
        else{
            request.setAttribute("value", "Transaction Amount");
        }
        
        
        
        List<ChannelRequest> channel = channelRequestFacade.findAllDateRange(datefrom1, dateto1);
        
        Iterator<Pos> it;
        Iterator<ChannelRequest> it1, it2;
        it1 = channel.iterator();
        Pos posInfo;
        ChannelRequest re, posT;
        Collection colPT, colRequest;
        ArrayList<Pos> activeTerminal = new ArrayList();
        String terminalId;
        while(it1.hasNext()){
            re = it1.next();
            if(fetchType.equals("1")){
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
            else{
                colPT = posFacade.findByTerminalId(re.getA041CardAcceptorTerminalId());

                    it = colPT.iterator();
                    if(it.hasNext()){
                        posInfo = it.next();

                        colRequest = channelRequestFacade.findByTerminalDateRange(posInfo.getTerminalId(), datefrom1, dateto1);
                        it2 = colRequest.iterator();
                        int amount = 0;
                        while(it2.hasNext()){
                            posT = it2.next();
                            try{
                                amount += Integer.parseInt(posT.getA004TransactionAmount());
                            }catch(Exception e){}
                        }

                        if(amount < 1) continue;
                        DecimalFormat twoPlaces = new DecimalFormat("###,###,###.00");
                        posInfo.setSolId(twoPlaces.format(amount));
                        posInfo.setMerchantId(re.getFeedTimestamp());
                        posInfo.setId(amount);
                        activeTerminal.add(posInfo);
                    }
            }
        }
        
        Collections.sort(activeTerminal,new TerminalComparator());
        request.setAttribute("activeTerminal", activeTerminal);
        request.setAttribute("datefrom", datefrom);
        request.setAttribute("dateto", dateto);
    */
        request.getRequestDispatcher("WEB-INF/terminalranking.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Date date = new Date();
        String datefrom= new SimpleDateFormat("MM-dd-yyyy").format(date);
        String dateto = datefrom;
        String datefrom1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
        String dateto1 = datefrom1;
//        List<ChannelRequest> channel = channelRequestFacade.findAllDateRange(datefrom1, dateto1);
        /*
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
        
        request.setAttribute("value", "Total Number of Transactions");
        Collections.sort(activeTerminal,new TerminalComparator());
        request.setAttribute("activeTerminal", activeTerminal);
        request.setAttribute("datefrom", datefrom);
        request.setAttribute("dateto", dateto);
        */
        request.getRequestDispatcher("WEB-INF/terminalranking.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
