<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@include file="WEB-INF/header.jsp" %>
<% HelperClass.activeClass = "home"; %>
<%@include file="WEB-INF/menu.jsp" %>
<section class="content-header">
    <h1>Dashboard</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>

    </ol>
</section>

<!-- Main content -->
<section class="content">

    <div class="row">
        <div class="col-sm-12">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">

                    <%! int total_no, pagination_count, successful, failed,
                        totaltransactionvolume, totaltransactionvalue;
                        String datefrom, dateto;
                        DecimalFormat decimalFormat, decimalFormatamt;
                        
                        String moneyString; String numberString;
                        double successm, declinedm, failedm, successm7, declinedm7, failedm7, totalamt7, totalamt;
                        NumberFormat formatter;
                        double successn, declinedn, failedn, successn7, declinedn7, failedn7, amount, totalvol7,totalvol;
                        ResultSet pagegraph, paginationResult, terminalgrandtotal, terminalapprovedtransaction;
                        String successvol, declinedvol, failedvol, successvol7, declinedvol7, failedvol7;
                        String successamt, declinedamt, failedamt, successamt7, declinedamt7, failedamt7;

                    %>
                    <%
                        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                        Date dateobj = new Date();
                        dateobj.setTime(dateobj.getTime()+(24*60*60*1000));  // Adds 24*60*60*1000 milliseconds
                        dateto = df.format(dateobj).toString();
                        totalamt =0; totalamt7 = 0;
                        totalvol = 0; totalvol7 = 0;
                        Date date = new Date();
                        date .setTime(date.getTime()-(24*60*60*1000*7));  // Subtract 24*60*60*1000 milliseconds to make last 7 days
                        String datefrom1 = df.format(date);
                        String dateto1 = dateto;

                        dateobj = new Date();
                        datefrom = df.format(dateobj).toString();
                        
                        decimalFormat = new DecimalFormat("#,###");
                        decimalFormatamt = new DecimalFormat("#,###.##");
                        LookUp helper = new LookUp();
                    %>

                    <div class="row">
                        <div class="col-sm-12"><!-- Pagination -->

                            <div style="text-align:center">
                                <section class="content-header" style="margin-left: -8px !important; margin-right: -10px !important; border-bottom: none;">
                                    <div class="row">
                                        <div class="col-lg-6 col-xs-6 col-sm-6">
                                            <!-- small box -->
                                            <div class="small-box bg-aqua">
                                                <div class="inner">
                                                    TODAY
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-xs-6 col-sm-6">
                                            <!-- small box -->
                                            <div class="small-box bg-aqua-active">
                                                <div class="inner">
                                                    LAST SEVEN (7) DAYS
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <h2><a href="terminal_dashboard.jsp" title="view dashboard chart">Terminal Report</a></h2>
                                    <% 
                                                    try{
                                                        terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM atmalert.CHANNEL_RESPONSE c JOIN atmalert.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Approved'");
                                                        terminalgrandtotal.next();

                                                        terminalapprovedtransaction = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM atmalert.CHANNEL_RESPONSE c JOIN atmalert.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Approved'");
                                                        terminalapprovedtransaction.next();
 
                                                        successn = terminalapprovedtransaction.getInt("total");
                                                        successvol = decimalFormat.format(successn);
                                                        successm = terminalapprovedtransaction.getDouble("amount");
                                                        moneyString = decimalFormatamt.format(successm);
                                                        successamt = moneyString; 
                                                        totalvol += successn; totalamt += successm;
                                                       }catch(Exception e){System.out.println("JSP: "+e);}
                                                        
                                                        
                                                        // Last 7 days
                                                        try{
                                                        successn7 = terminalgrandtotal.getInt("total");
                                                        successvol7 = decimalFormat.format(successn7);
                                                        successm7 = terminalgrandtotal.getDouble("amount");
                                                        totalamt7 += successm7; totalvol7 += successn7;
                                                        successamt7 = decimalFormatamt.format(successm7);
                                                        }catch(Exception e){
                                                            System.out.println("Exception index.jsp  "+e);
                                                        }
                                                    %>
                                                        
                                                        <%
                                                        
                                                        terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Declined'");
                                                        terminalgrandtotal.next();

                                                        terminalapprovedtransaction = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Declined'");
                                                        terminalapprovedtransaction.next();
                                                        
                                                    %>
                                                    
                                                    <% 
                                                       
 
                                                        declinedn = terminalapprovedtransaction.getInt("total");
                                                        declinedvol = decimalFormat.format(declinedn);
                                                        
                                                        declinedm = terminalapprovedtransaction.getDouble("amount");
                                                        declinedamt = decimalFormatamt.format(declinedm);
                                                        totalvol += declinedn; totalamt += declinedm;
                                                            %>
                                                        <% 
                                                        try{
                                                        declinedn7 = terminalgrandtotal.getInt("total");
                                                        declinedvol7 = decimalFormat.format(declinedn7);
                                                        declinedm7 = terminalgrandtotal.getDouble("amount");
                                                        totalvol7 += declinedn7; totalamt7 +=declinedm7;

                                                        declinedamt7 = decimalFormatamt.format(declinedm7);
                                                        }catch(Exception e){
                                                            System.out.println("Exception index.jsp  "+e);
                                                        }
                                                    %>
                                                    
                                                      
                                                        <%
                                                        
                                                        terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Failed'");
                                                        terminalgrandtotal.next();

                                                        terminalapprovedtransaction = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Failed'");
                                                        terminalapprovedtransaction.next();
                                                       
                                                        failedn = terminalapprovedtransaction.getInt("total");
                                                        failedvol = decimalFormat.format(failedn);
                                                        
                                                        failedm = terminalapprovedtransaction.getDouble("amount");
                                                        failedamt = decimalFormatamt.format(failedm);
                                                        totalvol += failedn; totalamt += failedm;
                                                            %>
                                                        <% 
                                                        try{
                                                        failedn7 = terminalgrandtotal.getInt("total");
                                                        failedvol7 = decimalFormat.format(failedn7);
                                                        failedm7 = terminalgrandtotal.getDouble("amount");
                                                        totalvol7 += failedn7; totalamt7 +=failedm7;

                                                        failedamt7 = decimalFormatamt.format(failedm7);
                                                        }catch(Exception e){
                                                            System.out.println("Exception index.jsp  "+e);
                                                        }
                                                    %>
                                                    
                                    <div class="row">

                                        
                                        <!-- ./col -->
                                        <div class="col-lg-6 col-xs-6 col-sm-6">
                                            <!-- small box -->
                                            <div class="small-box bg-green">
                                                <div class="inner">
                                                    <p>Successful Transaction Count: <strong><%=successvol+" ("+decimalFormatamt.format((successn/totalvol)*100)+"%)"%></strong></p>
                                                    <p>Successful Transaction Value <strong><%=successamt+" ("+decimalFormatamt.format((successm/totalamt)*100)+"%)"%></strong></p>
                                                </div>
                                                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-xs-6 col-sm-6">
                                            <!-- small box -->
                                            <div class="small-box bg-green-active">
                                                <div class="inner">
                                                    <p>Successful Transaction Count: <strong><%=successvol7+" ("+decimalFormatamt.format((successn7/totalvol7)*100)+"%)"%></strong></p>
                                                    <p>Successful Transaction Value <strong><%=successamt7+" ("+decimalFormatamt.format((successm7/totalamt7)*100)+"%)"%></strong></p>
                                                </div>
                                                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!-- ./col -->
                                        
                                    </div>

                                                <div class="row">

                                        
                                        <!-- ./col -->
                                        <div class="col-lg-6 col-xs-6 col-sm-6">
                                            <!-- small box -->
                                            <div class="small-box bg-yellow">
                                                <div class="inner">
                                                    <p>Declined Transaction Count: <strong><%=declinedvol+" ("+decimalFormatamt.format((declinedn/totalvol) *100)+"%)" %></strong></p>
                                                    <p>Declined Transaction Value <strong><%=declinedamt+" ("+decimalFormatamt.format((declinedm/totalamt) *100)+"%)"%></strong></p>
                                                </div>
                                                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-xs-6 col-sm-6">
                                            <!-- small box -->
                                            <div class="small-box bg-yellow-active">
                                                <div class="inner">
                                                    
                                                    <p>Declined Transaction Count: <strong><%=declinedvol7+" ("+decimalFormatamt.format((declinedn7/totalvol7) *100)+"%)"%></strong></p>
                                                    <p>Declined Transaction Value <strong><%=declinedamt7+" ("+decimalFormatamt.format((declinedm7/totalamt7) *100)+"%)"%></strong></p>
                                                </div>
                                                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!-- ./col -->
                                        
                                    </div>
                                                <div class="row">

                                        
                                        <!-- ./col -->
                                        <div class="col-lg-6 col-xs-6 col-sm-6">
                                            <!-- small box -->
                                            <div class="small-box bg-red">
                                                <div class="inner">
                                                    <p>Failed Transaction Count: <strong><%=failedvol+" ("+decimalFormatamt.format((failedn/totalvol) *100)+"%)"%></strong></p>
                                                    <p>Failed Transaction Value <strong><%=failedamt+" ("+decimalFormatamt.format((failedm/totalamt) *100)+"%)"%></strong></p>
                                                </div>
                                                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-xs-6 col-sm-6">
                                            <!-- small box -->
                                            <div class="small-box bg-red-active">
                                                <div class="inner">
                                                    <p>Failed Transaction Count: <strong><%=failedvol7+" ("+decimalFormatamt.format((failedn7/totalvol7) *100)+"%)"%></strong></p>
                                                    <p>Failed Transaction Value: <strong><%=failedamt7+" ("+decimalFormatamt.format((failedm7/totalamt7) *100)+"%)"%></strong></p>
                                                </div>
                                                <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!-- ./col -->
                                        
                                    </div>
                                                

                                </section>	
                            </div>
                        </div>

                    </div>





                    <br>
                    <div class="col-sm-12">



                        

                        <!--<img src="/POSMonitor/BarServlet?name=1" alt="Progress chart" />-->
<!--                         body -->





                        <div class="right_col" role="main">

                            <br />






                            <div class="col-md-8 col-sm-8 col-xs-12">





                            </div>
                        </div>
                    </div>





                </div>
            </div>
        </div>
    </div>
</div>

<!-- /.post -->
</div>
<!-- /.post -->

</div>

<!-- /.tab-pane -->
</div>
<!-- /.tab-content -->
</div>
<!-- /.nav-tabs-custom -->
</div>
<!-- /.col -->
</div>
<!-- /.row -->


<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script type="text/javascript">
  setTimeout(function(){
    location = ''
  },60*5000)
</script>
<%@include file="WEB-INF/footer.jsp" %>