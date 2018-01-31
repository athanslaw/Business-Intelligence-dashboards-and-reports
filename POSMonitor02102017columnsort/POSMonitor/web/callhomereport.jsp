<%@include file="WEB-INF/header.jsp" %>
<% HelperClass.activeClass = "callhomereport"; %>
<%@include file="WEB-INF/menu.jsp" %>      
      
      
<%! int limit, page1, offset, total_no, pagination_count, callhome;
    String datefrom, dateto;
    Pagination_Util pages;
    StringTokenizer token;
    String query;
    ResultSet paginationResult;
%>
<% 
    datefrom = request.getParameter("datefrom") != null ? request.getParameter("datefrom"): "";
    dateto = request.getParameter("dateto") != null ? request.getParameter("dateto") : "";
    
    if(dateto.equalsIgnoreCase("")){
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
        Date dateobj = new Date();
        dateto = df.format(dateobj).toString();
    }
    if(datefrom.equalsIgnoreCase("")){
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
        Date dateobj = new Date();
        datefrom = df.format(dateobj).toString();
    }
    String dd1, dd2, mm1, mm2, yy1, yy2, dateto1, datefrom1;
    StringTokenizer datetoken = new StringTokenizer(dateto, "/");
    mm1 = datetoken.nextToken();
    dd1 = datetoken.nextToken();
    yy1 = datetoken.nextToken();
    dateto1 = yy1+"-"+mm1+"-"+dd1;
    
    datetoken = new StringTokenizer(datefrom, "/");
    mm2 = datetoken.nextToken();
    dd2 = datetoken.nextToken();
    yy2 = datetoken.nextToken();
    datefrom1 = yy2+"-"+mm2+"-"+dd2;
    
                                                    
    callhome = request.getParameter("callhome") != null ? new Integer(request.getParameter("callhome")).intValue() : 0;
    limit = request.getParameter("limits") != null ? new Integer(request.getParameter("limits")).intValue() : 30;
    page1 = request.getParameter("page") != null ? new Integer(request.getParameter("page")).intValue() : 1;
    offset = limit * (page1 - 1);
    LookUp helper = new LookUp();
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
    <h1>Call Home Information</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">POS Terminal</a></li>
        <li><a href="#">Call Home Information</a></li>
        <input type="button" onclick="tableToExcel('testTable', 'Call Home Report')" value="Export to Excel">
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
                                        <table class="bg-gray table table-bordered">
                                            <tr>
                                                <td><input type="text" name="datefrom" class="form-control" id="datefrom" value="<%= datefrom%>" placeholder="Click to Pick Start Date" readonly="readonly" /></td>
                                                <td><input type="text" name="dateto" class="form-control" id="dateto" value="<%= dateto%>" placeholder="Click to Pick End Date" readonly="readonly" /></td>
                                                <td><input name="send" type="hidden" id="send">
                                                    <input name="page" id="page" type="hidden" value="<%=page1%>" />
                                                    <input name="limits" id="limits" type="hidden" value="<%=limit%>" /><input type="submit" name="view" class="form-control btn btn-primary" value="View" />
                                                </td>
                                            </tr>
                                        </table></div>
                                    <hr />
                                </div>


                                <div class="row">
                                    <div class="col-sm-12"><!-- Pagination -->
                                        
                                        <%
                                            String queryC=""; dateto1 += " 23:59:59.999";
                                            if (callhome == 0) {
                                                query = "SELECT r.T11_CALL_HOME_INFORMATION, r.A041_CARD_ACCEPTOR_TERMINAL_ID, p.MERCHANT_ID, p.MERCHANT_NAME,r.FEED_TIMESTAMP, ROW_NUMBER() OVER (ORDER BY FEED_TIMESTAMP) R FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE r.FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND (r.T11_CALL_HOME_INFORMATION LIKE '%BATTERY_DEAD%' OR r.T11_CALL_HOME_INFORMATION LIKE '%PAPER OUT%') ORDER BY r.FEED_TIMESTAMP DESC";
                                                queryC = "SELECT count(*) FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE r.FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND (r.T11_CALL_HOME_INFORMATION LIKE '%BATTERY_DEAD%' OR r.T11_CALL_HOME_INFORMATION LIKE '%PAPER OUT%')";
                                            } else if (callhome == 1){ 
                                                query = "SELECT r.T11_CALL_HOME_INFORMATION, r.A041_CARD_ACCEPTOR_TERMINAL_ID, p.MERCHANT_ID, p.MERCHANT_NAME,r.FEED_TIMESTAMP, ROW_NUMBER() OVER (ORDER BY FEED_TIMESTAMP) R FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE r.FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.CHANNEL_MESSAGE_CODE = '0800' ORDER BY r.FEED_TIMESTAMP DESC";
                                                queryC = "SELECT count(*) FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE r.FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.CHANNEL_MESSAGE_CODE = '0800'";
                                            }
                                            else if (callhome == 3) {
                                                query = "SELECT r.T11_CALL_HOME_INFORMATION, r.A041_CARD_ACCEPTOR_TERMINAL_ID, p.MERCHANT_ID, p.MERCHANT_NAME,r.FEED_TIMESTAMP, ROW_NUMBER() OVER (ORDER BY FEED_TIMESTAMP) R FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE r.FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND (r.T11_CALL_HOME_INFORMATION LIKE '%BATTERY_DEAD%') ORDER BY r.FEED_TIMESTAMP DESC";
                                                queryC = "SELECT count(*) FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND FEED_TIMESTAMP <= '" + dateto1 + "' AND (T11_CALL_HOME_INFORMATION LIKE '%BATTERY_DEAD%')";
                                            }
                                            else if (callhome == 4) {
                                                query = "SELECT r.T11_CALL_HOME_INFORMATION, r.A041_CARD_ACCEPTOR_TERMINAL_ID, p.MERCHANT_ID, p.MERCHANT_NAME,r.FEED_TIMESTAMP, ROW_NUMBER() OVER (ORDER BY FEED_TIMESTAMP) R FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND (r.T11_CALL_HOME_INFORMATION LIKE '%PAPER OUT%') ORDER BY r.FEED_TIMESTAMP DESC";
                                                queryC = "SELECT count(*) FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND (r.T11_CALL_HOME_INFORMATION LIKE '%PAPER OUT%')";
                                            }
                                            else if (callhome == 5) {
                                                query = "SELECT r.T11_CALL_HOME_INFORMATION, r.A041_CARD_ACCEPTOR_TERMINAL_ID, p.MERCHANT_ID, p.MERCHANT_NAME,r.FEED_TIMESTAMP, ROW_NUMBER() OVER (ORDER BY FEED_TIMESTAMP) R FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND (r.T11_CALL_HOME_INFORMATION LIKE '%BATTERY LOW%') ORDER BY r.FEED_TIMESTAMP DESC";
                                                queryC = "SELECT count(*) FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND FEED_TIMESTAMP <= '" + dateto1 + "' AND (T11_CALL_HOME_INFORMATION LIKE '%BATTERY LOW%')";
                                            }
                                            else if (callhome == 6) {
                                                query = "SELECT r.T11_CALL_HOME_INFORMATION, r.A041_CARD_ACCEPTOR_TERMINAL_ID, p.MERCHANT_ID, p.MERCHANT_NAME,r.FEED_TIMESTAMP, ROW_NUMBER() OVER (ORDER BY FEED_TIMESTAMP) R FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND r.FEED_TIMESTAMP <= '" + dateto1 + "' AND (r.T11_CALL_HOME_INFORMATION LIKE '%BATTERY BROKEN%') ORDER BY r.FEED_TIMESTAMP DESC";
                                                queryC = "SELECT count(*) FROM ATMALERT.channel_request r JOIN ATMALERT.pos p ON p.TERMINAL_ID = r.A041_CARD_ACCEPTOR_TERMINAL_ID WHERE FEED_TIMESTAMP >= '" + datefrom1 + "' AND FEED_TIMESTAMP <= '" + dateto1 + "' AND (T11_CALL_HOME_INFORMATION LIKE '%BATTERY BROKEN%')";
                                            }
                                            try {
                                                pages = helper.fetch(query, offset, limit, queryC);
                                                total_no = pages.getTotal();
                                                paginationResult = pages.getPagination_result(); //result
                                                 
                                                pagination_count = pages.getPagination_count();
                                            } catch (Exception e) { System.out.println("\n\n1st helper: "+e+"\n\n");
                                            }%>

                                        <div style="text-align:center">
                                            <input name="callhome" id="all" value="1" type="radio" onclick="this.form.submit()" 
                                                                        <%= callhome == 1 ? "checked" : ""%>>
                                            <label for="all">All</label>&nbsp;&nbsp;
                                            <input name="callhome" id="issue" value="0" type="radio" <%= callhome == 0 ? "checked" : ""%>
                                                   onclick="this.form.submit()" /><label for="issue">Issue</label>
                                            &nbsp;&nbsp;
                                            <input name="callhome" id="batterydead" value="3" type="radio" <%= callhome == 3 ? "checked" : ""%>
                                                   onclick="this.form.submit()" /><label for="batterydead">Battery Dead</label>
                                            &nbsp;&nbsp;<input name="callhome" id="batterylow" value="5" type="radio" <%= callhome == 5 ? "checked" : ""%>
                                                   onclick="this.form.submit()" /><label for="batterylow">Battery Low</label>
                                            &nbsp;&nbsp;<input name="callhome" id="batterybroken" value="6" type="radio" <%= callhome == 6 ? "checked" : ""%>
                                                   onclick="this.form.submit()" /><label for="batterybroken">Battery Broken</label>
                                            &nbsp;&nbsp;
                                            <input name="callhome" id="paperout" value="4" type="radio" <%= callhome == 4 ? "checked" : ""%>
                                                   onclick="this.form.submit()" /><label for="paperout">Paper Out</label>
                                        </div>
                                    </div>

                                </div>


                                <div class="col-sm-12 table-responsive">
                                    <table class="table table-hover table-striped table-bordered" style="border-width: 2px" id="testTable">
                                        <tr class="bg-blue">
                                            <th align="center">SNo</th>
                                            <th onclick="sortTable(1)">Terminal Id <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                            <th onclick="sortTable(2)">Merchant Id <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                            <th onclick="sortTable(3)">Merchant Name <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                            <th onclick="sortTable(4)" style="text-align:center">Battery Status <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                            <th onclick="sortTable(5)">Paper Status <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                            <th onclick="sortTable(6)">Call Home Date / Time <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                        </tr>
                                        <% int no = 0;
                                            while (paginationResult.next()) {
                                                try {
                                                    
                                                    no += 1;
                                                    String batteryStatus = "", paperStatus = "";
                                                    try{
                                                    token = new StringTokenizer(paginationResult.getString("T11_CALL_HOME_INFORMATION"), "&");

                                                    while (token.hasMoreTokens()) {
                                                        String w = token.nextToken();
                                                        if (w.contains("BATTERY")) {
                                                            batteryStatus = w;
                                                        }
                                                        if (w.contains("PAPER")) {
                                                            paperStatus = w;
                                                        }
                                                    }
                                                    }catch(Exception ex1){}
                                        %>
                                        <tr>
                                            <td align="center"><%= limit * (page1 - 1) + no%></td>
                                            <td><%= paginationResult.getString("A041_CARD_ACCEPTOR_TERMINAL_ID")%></td>
                                            <td><%= paginationResult.getString("MERCHANT_ID")%></td>
                                            <td><%= paginationResult.getString("MERCHANT_NAME")%></td>
                                            <td><%= batteryStatus%></td>
                                            <td><%= paperStatus%></td>
                                            <td><%
                                                StringTokenizer  feed_timestamp = new StringTokenizer(paginationResult.getString("FEED_TIMESTAMP"), ".");
                                                out.print(feed_timestamp.nextToken()); %></td>
                                        </tr>
                                        <%  
                                        }catch (Exception e) {
                                                    System.out.print("hjg "+e);
                                                } 
                                            }%>
                                    </table><table class="table">
                                        <tr><td colspan ="7" class='bg-primary'>Total number of records found: <%=total_no%></td></tr>

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
                                                                            
                                            <% paginationResult.close(); LookUp.con.close(); LookUp.con = null; %>
                                
                            </form>



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