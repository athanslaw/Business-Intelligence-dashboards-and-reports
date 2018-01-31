<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="WEB-INF/headerexcel.jsp" %>
<%@include file="WEB-INF/menu.jsp" %>


<%! 
    String datefrom, dateto, whereq;
    StringTokenizer token;DecimalFormat decimalFormat;
    String query;String moneyString; double money; NumberFormat formatter; int number;
    ResultSet paginationResult, terminalgrandtotal;
%>
<% 
    moneyString="0.00"; money=0;whereq = "";
    datefrom = request.getParameter("datefromx") != null ? request.getParameter("datefromx") : "";
    dateto = request.getParameter("datetox") != null ? request.getParameter("datetox") : "";
    LookUp helper = new LookUp();
    if (dateto.equalsIgnoreCase("")) {
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
        Date dateobj = new Date();
        dateobj.setTime(dateobj.getTime());  // Adds 24*60*60*1000 milliseconds
        dateto = df.format(dateobj).toString();
    }
    if (datefrom.equalsIgnoreCase("")) {
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
        Date dateobj = new Date();
        datefrom = df.format(dateobj).toString();
    }
    if (datefrom.compareTo(dateto) > 1) {
        String a = datefrom;
        datefrom = dateto;
        dateto = a;
    }
    String dd1, dd2, mm1, mm2, yy1, yy2, dateto1, datefrom1;
    StringTokenizer datetoken = new StringTokenizer(dateto, "/");
    mm1 = datetoken.nextToken();
    dd1 = datetoken.nextToken();
    yy1 = datetoken.nextToken();
    dateto1 = yy1 + "-" + mm1 + "-" + dd1;

    datetoken = new StringTokenizer(datefrom, "/");
    mm2 = datetoken.nextToken();
    dd2 = datetoken.nextToken();
    yy2 = datetoken.nextToken();
    datefrom1 = yy2 + "-" + mm2 + "-" + dd2;
    String merchant_id = request.getParameter("merchantidx") != null ? request.getParameter("merchantidx") : "";
    String terminal_id = request.getParameter("terminalidx") != null ? request.getParameter("terminalidx") : "";
    String sol_id = request.getParameter("solidx") != null ? request.getParameter("solidx") : "";
    String state_code = request.getParameter("statecodex") != null ? request.getParameter("statecodex") : "";
    String ptsp = request.getParameter("ptspx") != null ? request.getParameter("ptspx") : "";
%>
<section class="content-header">
    <h1>Active Terminal Reports</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">POS Terminal</a></li>
        <li><a href="#">Active Terminals</a></li>
        
    </ol>
</section>

<!-- Main content -->
<section class="content">

    <div class="row">
        <div class="col-sm-12">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <div class="col-sm-12">



                        <form action="" method="POST" name="frm">
                            
                            <div class="row">
                                <div class="col-sm-12"><!-- Pagination -->

                                    <div style="text-align:center">
                                        <section class="content-header" style="margin-left: -8px !important; margin-right: -10px !important; border-bottom: none;">

                                            <div class="alert alert-info">Active Terminal Report between <%= datefrom1 + " and " + dateto1%></div>
                                            
                                    <%
                                        dateto1 += " 23:59:59.999";
                                if(!terminal_id.equalsIgnoreCase("")){
                                    whereq += " AND t.TERMINAL_ID = '"+request.getParameter("terminalidx")+"'";
                                }
                                
                                if(!merchant_id.equalsIgnoreCase("")){
                                    whereq += " AND t.MERCHANT_ID = '"+request.getParameter("merchantidx")+"'";
                                }
                                if(!sol_id.equalsIgnoreCase("")){
                                    whereq += " AND t.SOL_ID = '"+request.getParameter("solidx")+"'";
                                }
                                if(!state_code.equalsIgnoreCase("")){
                                    whereq += " AND t.STATE_CODE = '"+request.getParameter("statecodex")+"'";
                                }
                                if(!ptsp.equalsIgnoreCase("")){
                                    System.out.println("PTSP Id");
                                    whereq += " AND t.PTSP = '"+request.getParameter("ptspx")+"'";
                                }

                                
                                        query = "SELECT t.MERCHANT_NAME, t.TERMINAL_ID, t.MERCHANT_ID, t.SOL_ID FROM ATMALERT.CHANNEL_RESPONSE p JOIN ATMALERT.pos t ON t.TERMINAL_ID = p.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE p.FEED_TIMESTAMP >= '" + datefrom1 + "' AND p.FEED_TIMESTAMP <= '" + dateto1 + "' AND p.CHANNEL_MESSAGE_CODE ='0210' AND p.AUTH_RESPONSE_CODE = '00' "+whereq+" GROUP BY t.MERCHANT_NAME, t.TERMINAL_ID, t.MERCHANT_ID, t.SOL_ID";
                                        
                                        try {
                                            paginationResult = helper.view_record_single(query);
                                        } catch (Exception e) {
                                            System.out.println("\n\n1st helper: " + e + "\n\n");
                                        }%>
                                                                    
                                                                
                                    

                                                                    </section>	
                                                                    </div>
                                                                    </div>

                                                                    </div>




                                                                    <div class="col-sm-12 table-responsive">
                                                                        <table class="table table-hover table-striped table-bordered" style="border-width: 2px" id="testTable">
                                                                            <tr class="bg-blue">
                                                                                <th align="center">SNO</th>
                                                                                <th>Terminal ID</th>
                                                                                <th>Merchant ID</th>
                                                                                <th>Merchant Name</th>
                                                                                <th>Transaction Count</th>
                                                                                <th style="text-align:right">Transaction Value</th>
                                                                                <th>SOL ID</th>
                                                                                <th>Last Transaction Date</th>
                                                                            </tr>
                                                                            <% int no = 0;
                                                                                ResultSet terminaltotal;
                                                                                while (paginationResult.next()) {
                                                                                    try {
                                                                                        System.out.println("3: ");
                                                                                        terminaltotal = helper.view_record_single("SELECT count(*) AS total, sum(TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND CHANNEL_MESSAGE_CODE ='0210' AND FEED_TIMESTAMP <= '" + dateto1 + "' AND AUTH_RESPONSE_CODE = '00' AND A041_CARD_ACCEPTOR_TERMINAL_ID = '" + paginationResult.getString("TERMINAL_ID") + "'");
                                                                                            terminaltotal.next();

                                                                                        terminalgrandtotal = helper.view_record_single("SELECT FEED_TIMESTAMP FROM ATMALERT.CHANNEL_RESPONSE WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND CHANNEL_MESSAGE_CODE ='0210' AND FEED_TIMESTAMP <= '" + dateto1 + "' AND AUTH_RESPONSE_CODE = '00' AND A041_CARD_ACCEPTOR_TERMINAL_ID = '" + paginationResult.getString("TERMINAL_ID") + "' ORDER BY FEED_TIMESTAMP DESC");
                                                                                            terminalgrandtotal.next();
                                                                                            no += 1;
                                                                                            moneyString="0.00";
                                                                            %>
                                                                            <tr>
                                                                                <td align="center"><%= no%></td>
                                                                                <td><%= paginationResult.getString("TERMINAL_ID")%></td>
                                                                                <td><%= paginationResult.getString("MERCHANT_ID")%></td>
                                                                                <td><%= paginationResult.getString("MERCHANT_NAME")%></td>
                                                                                <td><% 
                                                                                    number =terminaltotal.getInt(1);
                                                                                decimalFormat = new DecimalFormat("#,###");
                                                                                moneyString = decimalFormat.format(number);
                                                            %><%= moneyString %></td>
                                                                                <td align="right"><% 
                                                                                        money = terminaltotal.getDouble(2);
                                                                                        formatter = NumberFormat.getCurrencyInstance();
                                                                                        moneyString = formatter.format(money).substring(1);
                                           %><%=moneyString%></td>
                                                                                <td><%= paginationResult.getString("SOL_ID")%></td>
                                                                                <td><% 
                                                                                    StringTokenizer  feed_timestamp = new StringTokenizer(terminalgrandtotal.getString("FEED_TIMESTAMP"), ".");
                                                out.print(feed_timestamp.nextToken()); %></td>
                                                                            </tr>
                                                                            <%  
                                                                                    } catch (Exception e) {
                                                                                        System.out.print("hjg " + e);
                                                                                    }
                                                                                }%>
                                                                            <tr><td colspan ="8" class='bg-primary'>Total number of records found: <%=no%></td></tr>

                                                                        </table>

                                                                        
                                                                    </div>
                                                                            
                                                                    </form>


                        <%
                                                                                paginationResult.close(); terminalgrandtotal.close();
                                                                                LookUp.con.close();LookUp.con = null;%>
                                                                    <!-- body -->

                                                                    </div>
                                                                    </div>
                                                                    </div>
                                                                    </div>
                                                                    </div>

                                                                    <!-- /.post -->
                                                                    </div>
                                                                    <!-- /.post -->

                                                                    </div>
                                                                    <!-- /.content-wrapper -->

                                                                    <%@include file="WEB-INF/footer.jsp" %>