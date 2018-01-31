<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="WEB-INF/header.jsp" %>
<% HelperClass.activeClass = "inactive_terminal"; %>
<%@include file="WEB-INF/menu.jsp" %>      


<%! int limit, page1, offset, total_no, pagination_count, successful, failed,
            totaltransactionvolume, totaltransactionvalue;
    String datefrom, dateto;
    Pagination_Util pages;
    StringTokenizer token;DecimalFormat decimalFormat;
    String query;String moneyString; double money; NumberFormat formatter; int number;
    ResultSet paginationResult, terminalgrandtotal, terminalapprovedtransaction;
%>
<% 
    datefrom = request.getParameter("datefrom") != null ? request.getParameter("datefrom") : "";
    dateto = request.getParameter("dateto") != null ? request.getParameter("dateto") : "";
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
    <h1>Inactive Terminal Reports</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">POS Terminal</a></li>
        <li><a href="#">Inactive Terminals</a></li>
        <input type="button" onclick="tableToExcel('testTable', 'Inactive Terminals Report')" value="Export to Excel">
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
                                    </table>
                                </div>
                                <hr />
                            </div>

                                                
                            <div class="row">
                                <div class="col-sm-12"><!-- Pagination -->


                                    <div style="text-align:center">
                                        <section class="content-header" style="margin-left: -8px !important; margin-right: -10px !important; border-bottom: none;">

                                            <div class="alert alert-info">Inactive Terminal Report between <%= datefrom1 + " and " + dateto1%></div>
                                            
                                    <%
                                        dateto1 += " 23:59:59.999";
                                        query = "SELECT DISTINCT t1.TERMINAL_ID, t1.MERCHANT_ID, t1.MERCHANT_NAME, t1.SOL_ID, ROW_NUMBER() OVER (ORDER BY t1.TERMINAL_ID) R FROM ATMALERT.POS t1 WHERE t1.STATUS ='A' AND t1.TERMINAL_ID NOT IN (SELECT t2.A041_CARD_ACCEPTOR_TERMINAL_ID  FROM ATMALERT.CHANNEL_RESPONSE t2 WHERE t1.TERMINAL_ID = t2.A041_CARD_ACCEPTOR_TERMINAL_ID AND t2.FEED_TIMESTAMP >= '" + datefrom1 + "' AND t2.FEED_TIMESTAMP <= '" + dateto1 + "' ) ORDER BY t1.MERCHANT_NAME ASC";
                                        String queryC = "SELECT count(*) FROM ATMALERT.POS t1 WHERE t1.STATUS ='A' AND t1.TERMINAL_ID NOT IN (SELECT t2.A041_CARD_ACCEPTOR_TERMINAL_ID  FROM ATMALERT.CHANNEL_RESPONSE t2 WHERE t1.TERMINAL_ID = t2.A041_CARD_ACCEPTOR_TERMINAL_ID AND t2.FEED_TIMESTAMP >= '" + datefrom1 + "' AND t2.FEED_TIMESTAMP <= '" + dateto1 + "' )";

                                        try {
                                            pages = helper.fetch(query, offset, limit, queryC);
                                            total_no = pages.getTotal();
                                            paginationResult = pages.getPagination_result(); //result
                                            pagination_count = pages.getPagination_count();
                                        } catch (Exception e) {
                                            System.out.println("\n\n1st helper: " + e + "\n\n");
                                        }%>

                                                                    </section>	
                                                                    </div>
                                                                    </div>

                                                                    </div>




                                                                    <div class="col-sm-12">
                                                                        <table class="table table-hover table-striped table-bordered" style="border-width: 2px" id="testTable">
                                                                            <tr class="bg-blue">
                                                                                <th align="center">SNO</th>
                                                                                <th onclick="sortTable(6)">Terminal ID <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                                <th onclick="sortTable(6)">Merchant ID <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                                <th onclick="sortTable(6)">Merchant Name <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                                <th onclick="sortTable(6)">SOL ID <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                                <th onclick="sortTable(6)">Last Txn. Date <img src="images/sorting.jpg" title="sort" style="float:right; padding-right: 1px" width="10" height="10" /></th>
                                                                            </tr>
                                                                            <% int no = 0;
                                                                                ResultSet terminal;
                                                                                while (paginationResult.next()) {
                                                                                    try {
                                                                                        terminal = helper.view_record_single("SELECT FEED_TIMESTAMP FROM ATMALERT.CHANNEL_RESPONSE WHERE FEED_TIMESTAMP <= '" + datefrom1 + "' AND A041_CARD_ACCEPTOR_TERMINAL_ID = '" + paginationResult.getString("TERMINAL_ID")+"' ORDER BY FEED_TIMESTAMP DESC");
                                                                                        terminal.next();
                                                                                        no += 1;
                                                                            %>
                                                                            <tr>
                                                                                <td align="center"><%= limit * (page1 - 1) + no%></td>
                                                                                <td><%= paginationResult.getString("TERMINAL_ID")%></td>
                                                                                <td><%= paginationResult.getString("MERCHANT_ID")%></td>
                                                                                <td><%= paginationResult.getString("MERCHANT_NAME")%></td>
                                                                                <td><%= paginationResult.getString("SOL_ID")%></td>
                                                                                <td><%
                                                                                    try{
                                                                                    StringTokenizer  feed_timestamp = new StringTokenizer(terminal.getString("FEED_TIMESTAMP"), ".");
                                                out.print(feed_timestamp.nextToken());
                                                                                    }catch(Exception e){out.print("-");}%></td>
                                                                            </tr>
                                                                            <%  
                                                                                    } catch (Exception e) {
                                                                                        System.out.print("hjg " + e);
                                                                                    }
                                                                                }%>
                                                                        </table><table class="table">
                                                                            <tr><td colspan ="5" class='bg-primary'>Total number of records found: <%=total_no%></td></tr>

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