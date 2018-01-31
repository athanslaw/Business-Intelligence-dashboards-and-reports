<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="WEB-INF/header.jsp" %>
<% HelperClass.activeClass = "active_terminal"; %>
<%@include file="WEB-INF/menu.jsp" %>


<%! int limit, page1, offset, total_no, pagination_count;
    String datefrom, dateto, whereq;
    Pagination_Util pages;
    StringTokenizer token;DecimalFormat decimalFormat;
    String query;String moneyString; double money; NumberFormat formatter; int number;
    ResultSet paginationResult, terminalgrandtotal, approvedterminal;
%>
<% 
    moneyString="0.00"; money=0;whereq = "";
    datefrom = request.getParameter("datefrom") != null ? request.getParameter("datefrom") : "";
    dateto = request.getParameter("dateto") != null ? request.getParameter("dateto") : "";
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
    String merchant_id = request.getParameter("merchant_id") != null ? request.getParameter("merchant_id") : "";
    String terminal_id = request.getParameter("terminal_id") != null ? request.getParameter("terminal_id") : "";
    String sol_id = request.getParameter("sol_id") != null ? request.getParameter("sol_id") : "";
    String state_code = request.getParameter("state_code") != null ? request.getParameter("state_code") : "";
    String ptsp = request.getParameter("ptsp") != null ? request.getParameter("ptsp") : "";
    limit = request.getParameter("limits") != null ? new Integer(request.getParameter("limits")).intValue() : 30;
    page1 = request.getParameter("page") != null ? new Integer(request.getParameter("page")).intValue() : 1;
    offset = limit * (page1 - 1);
%>
<script>
    function pagination(page, limit) {
        document.getElementById('page').value = page;
        document.getElementById('limits').value = limit;
        frm.submit();
    }
    
    function submitformoptions() {
        document.getElementById('limits').value = document.getElementById('limit').value;
        document.getElementById('page').value = 1;
        frm.submit();
    }

    function go() {
        document.getElementById('limits').value = document.getElementById('limit').value;
        document.getElementById('page').value = 1;
        frm.submit();
    }
</script>
<section class="content-header">
    <h1>Active Terminal Reports</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">POS Terminal</a></li>
        <li><a href="#">Active Terminals</a></li>
        <input type="button" onclick="tableToExcel('testTable', 'Active Terminal Report')" value="Export to Excel">
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
                                <div class="col-sm-12 table-responsive">
                                    <div class="row">
                                        <div class="col-sm-3"><input type="text" name="datefrom" class="form-control" id="datefrom" value="<%= datefrom%>" placeholder="Click to Pick Start Date" readonly="readonly" /></div>
                                        <div class="col-sm-3"><input type="text" name="dateto" class="form-control" id="dateto" value="<%= dateto%>" placeholder="Click to Pick End Date" readonly="readonly" /></div>
                                        <div class="col-sm-3">
                                            <input name="send" type="hidden" id="send">
                                            <input type="text" name="merchant_id" class="form-control" id="merchant_id" value="<%= merchant_id%>" <%= merchant_id.equalsIgnoreCase("")?"":merchant_id %> placeholder="Enter Merchant Id" /><input name="page" id="page" type="hidden" value="<%=page1%>" />
                                            <input name="limits" id="limits" type="hidden" value="<%=limit%>" />
                                        </div>
                                        <div class="col-sm-3"><input type="text" name="terminal_id" class="form-control" id="terminal_id" value="<%= terminal_id%>" <%= terminal_id.equalsIgnoreCase("")?"":terminal_id %> placeholder="Enter Terminal Id" /></div>
                                    
                                        <div class="col-sm-3"><input type="text" name="state_code" class="form-control" id="state_code" value="<%= state_code%>" <%= sol_id.equalsIgnoreCase("")?"":state_code %> placeholder="Enter State Code" /></div>
                                        <div class="col-sm-3"><input type="text" name="sol_id" class="form-control" id="sol_id" value="<%= sol_id%>" <%= sol_id.equalsIgnoreCase("")?"":sol_id %> placeholder="Enter Sol Id" /></div>
                                        <div class="col-sm-3"><input type="text" name="ptsp" class="form-control" id="ptsp" value="<%= ptsp%>" <%= ptsp.equalsIgnoreCase("")?"":ptsp %> placeholder="Enter PTSP" /></div>
                                        <div class="col-sm-3"><input type="submit" name="view" class="form-control btn btn-primary" value="View" /></div>
                                    </div>
                                </div>
                            </div>
                            <hr />


                            <div class="row">
                                <div class="col-sm-12"><!-- Pagination -->

                                    <div style="text-align:center">
                                        <section class="content-header" style="margin-left: -8px !important; margin-right: -10px !important; border-bottom: none;">

                                            <div class="alert alert-info">Active Terminal Report between <%= datefrom1 + " and " + dateto1%></div>
                                            
                                    <%
                                        dateto1 += " 23:59:59.999";
                                if(!terminal_id.equalsIgnoreCase("")){
                                    whereq += " AND t.TERMINAL_ID = '"+request.getParameter("terminal_id")+"'";
                                }
                                if(!merchant_id.equalsIgnoreCase("")){
                                    whereq += " AND t.MERCHANT_ID = '"+request.getParameter("merchant_id")+"'";
                                }
                                if(!sol_id.equalsIgnoreCase("")){
                                    whereq += " AND t.SOL_ID = '"+request.getParameter("sol_id")+"'";
                                }
                                if(!state_code.equalsIgnoreCase("")){
                                    whereq += " AND t.STATE_CODE = '"+request.getParameter("state_code")+"'";
                                }
                                if(!ptsp.equalsIgnoreCase("")){
                                    System.out.println("PTSP Id");
                                    whereq += " AND t.PTSP = '"+request.getParameter("ptsp")+"'";
                                }

                                
                                        query = "SELECT t.MERCHANT_NAME, t.TERMINAL_ID, t.MERCHANT_ID, t.SOL_ID, ROW_NUMBER() OVER (ORDER BY MERCHANT_NAME) R FROM ATMALERT.CHANNEL_RESPONSE p JOIN ATMALERT.pos t ON t.TERMINAL_ID = p.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE p.FEED_TIMESTAMP >= '" + datefrom1 + "' AND p.FEED_TIMESTAMP <= '" + dateto1 + "' AND p.CHANNEL_MESSAGE_CODE ='0210' AND p.AUTH_RESPONSE_CODE = '00' "+whereq+" GROUP BY t.MERCHANT_NAME, t.TERMINAL_ID, t.MERCHANT_ID, t.SOL_ID";
                                        String queryC = "SELECT count(*) FROM (SELECT t.terminal_id FROM ATMALERT.CHANNEL_RESPONSE p JOIN ATMALERT.pos t ON t.TERMINAL_ID = p.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND FEED_TIMESTAMP <= '" + dateto1 + "' AND CHANNEL_MESSAGE_CODE ='0210' AND AUTH_RESPONSE_CODE = '00' "+whereq+" GROUP BY t.TERMINAL_ID)";

                                        try {
                                            pages = helper.fetch(query, offset, limit, queryC);
                                            total_no = pages.getTotal();
                                            paginationResult = pages.getPagination_result(); //result
                                            pagination_count = pages.getPagination_count();
                                        } catch (Exception e) {
                                            System.out.println("\n\n1st helper: " + e + "\n\n");
                                        }%>
<div class="row">
    
                                                <% 
                                                    terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total, SUM(TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND FEED_TIMESTAMP <= '" + dateto1 + "' AND CHANNEL_MESSAGE_CODE = '0210'");
                                                    terminalgrandtotal.next();

                                                    approvedterminal = helper.view_record_single("SELECT count(*) AS total, SUM(TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND FEED_TIMESTAMP <= '" + dateto1 + "' AND CHANNEL_MESSAGE_CODE = '0210' AND AUTH_RESPONSE_CODE = '00'");
                                                    approvedterminal.next();
                                                    
                                                %>
                                                

                                                <div class="col-lg-3 col-xs-6">
                                                    <!-- small box -->
                                                    <div class="small-box bg-yellow">
                                                        <div class="inner">
                                                            <h4><strong><% number =terminalgrandtotal.getInt(1);
                                                                decimalFormat = new DecimalFormat("#,###");
                                                                
                                                                 moneyString = decimalFormat.format(number);
                                                            %><%=moneyString%></strong></h4>
                                                                    <p>Total Transaction Count</p>
                                                                    </div>
                                                                    </div>
                                                                    </div>
                                                                    <!-- ./col -->
                                                                    <div class="col-lg-3 col-xs-6">
                                                                        <!-- small box -->
                                                                        <div class="small-box bg-yellow-active">
                                                                            <div class="inner">
                                                                                <h4><strong>
                                                                                    <%
                                                                                        money = terminalgrandtotal.getDouble(2);
                                                                                        decimalFormat = new DecimalFormat("#,###.##");
                                                                                        moneyString = decimalFormat.format(money);
                                                                                    
                                                                                    %>
                                                                                <%= moneyString %></strong>
                                                                                </h4>

                                                                                <p>Total Transaction by Value</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- ./col -->
                                                                    <div class="col-lg-3 col-xs-6">
                                                                        <!-- small box -->
                                                                        <div class="small-box bg-green">
                                                                            <div class="inner">
                                                                                <h4><strong>
                                                                                       <% number =approvedterminal.getInt(1);
                                                                decimalFormat = new DecimalFormat("#,###");
      moneyString = decimalFormat.format(number);
      %><%=moneyString%> </strong></h4>

                                                                                <p>Total Successful Txn. Count</p>
                                                                            </div>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                    <!-- ./col -->
                                                                    <div class="col-lg-3 col-xs-6">
                                                                        <!-- small box -->
                                                                        <div class="small-box bg-green-active">
                                                                            <div class="inner">
                                                                                <h4><strong><%
                                                                                   money = approvedterminal.getDouble(2);
                                                                                        decimalFormat = new DecimalFormat("#,###.##");
                                                                                        moneyString = decimalFormat.format(money);%>
                                                                                        <%= moneyString %></strong></h4>
                                                                                        
                                                                                <p>Successful Transaction Value</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- ./col -->
                                                                </div>
                                    

                                                                    </section>	
                                                                    </div>
                                                                    </div>

                                                                    </div>




                                                                    <div class="col-sm-12 table-responsive">
                                                                        <table class="table table-hover table-striped table-bordered" style="border-width: 2px" id="testTable">
                                                                            <tr class="bg-blue">
                                                                                <th align="center">SNO</th>
                                                                                <th onclick="sortTable(1)">Terminal ID <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                                <th onclick="sortTable(2)">Merchant ID <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                                <th onclick="sortTable(3)">Merchant Name<img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                                <th>Txn. Count</th>
                                                                                <th style="text-align:right">Txn. Value</th>
                                                                                <th onclick="sortTable(6)">SOL ID<img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                                <th onclick="sortTable(7)">Last Txn. Date<img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
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
                                                                                            moneyString="0.00";System.out.println("2: ");
                                                                            %>
                                                                            <tr>
                                                                                <td align="center"><%= limit * (page1 - 1) + no%></td>
                                                                                <td><%= paginationResult.getString("TERMINAL_ID")%></td>
                                                                                <td><%= paginationResult.getString("MERCHANT_ID")%></td>
                                                                                <td><%= paginationResult.getString("MERCHANT_NAME")%></td>
                                                                                <td><%  System.out.println("1: ");
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
                                                                        </table><table class="table">
                                                                            <tr><td colspan ="8" class='bg-primary'>Total number of records found: <%=(total_no+1)%></td></tr>

                                                                        </table>

                                                                        Pagination: &nbsp;&nbsp;
                                                                        <%
                                                                            try {
                                                                                %>
                                                                                <%
                                                                                if(page1 > 1){ %>
                                                                                <a href="#" onclick='pagination("1", "<%=limit%>")'><img src="images/firstpage.jpg" title="Go to First Page" width="30" height="30" /></a>
                                                                                <a href="#" onclick='pagination("<%=(page1 - 1)%>", "<%=limit%>")'><img src="images/previous.ico" width="30" height="30" title="Previous Page" /></a>
                                                                                <% }%>
                                                                                &nbsp;&nbsp;&nbsp;&nbsp;<span class="btn btn-default">Page <%=page1%> of <%= pagination_count %></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                <%
                                                                                if(page1 < pagination_count){ %>
                                                                                <a href="#" onclick='pagination("<%=(page1 + 1)%>", "<%=limit%>")'><img src="images/next.ico" width="30" height="30" title="Next Page"/></a>
                                                                                <a href="#" onclick='pagination("<%=pagination_count%>", "<%=limit%>")'><img src="images/lastpage.jpg" width="30" height="30" title="Last Page"/></a>
                                                                                <% }%>
                                                                                <%
                                                                            } catch (Exception e) {
                                                                                System.out.println("\n\n1st helper: " + e + "\n\n");
                                                                            }%>

                                                                        <select name="limit" style="border-radius:4px; padding: 5px 4px;" id="limit">
                                                                            <option <%= limit == 30 ? "selected" : ""%> value="30">30</option>
                                                                            <% for (int v = 50; v <= 350; v += 50) {%>
                                                                            <option <%= v == limit ? "selected" : ""%> value="<%= v%>"><%= v%></option>
                                                                            <% }%>
                                                                        </select>
                                                                        <span>
                                                                            <button type="button" name="rppagebtn" class="btn btn-primary" id="rppagebtn" onclick='go()'>Go</button>
                                                                        </span>
                                                                    </div>
                                                                            
                                                                    </form>


                        <%
                                                                                paginationResult.close(); terminalgrandtotal.close(); approvedterminal.close();
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