<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="WEB-INF/header.jsp" %>
<% HelperClass.activeClass = "terminal_dashboard"; %>
<%@include file="WEB-INF/menu.jsp" %>      

<script src="dist/js/Chart.min.js"></script>
<%! 
    String datefrom, dateto;
    String query;
    ResultSet terminalgrandtotal;
    
    String title1, label1, label2, value1; int failednumber = 0, approvednumber=0, declinednumber=0;
    double failedamount = 0, approvedamount=0, declinedamount=0;
%>
<%  
    datefrom = request.getParameter("datefrom") != null ? request.getParameter("datefrom") : "";
    dateto = request.getParameter("dateto") != null ? request.getParameter("dateto") : "";
    DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
    Date dateobj = new Date();
    if (dateto.equalsIgnoreCase("")) {
        dateto = df.format(dateobj).toString();
    }
    if (datefrom.equalsIgnoreCase("")) {
        datefrom = df.format(dateobj).toString();
    }
    if (datefrom.compareTo(dateto) > 1) {
        String a = datefrom;
        datefrom = dateto;
        dateto = a;
    }
    String dd1, dd2, mm1, mm2, yy1, yy2, dateto1, dateto2, datefrom1;
    StringTokenizer datetoken = new StringTokenizer(dateto, "/");
    mm1 = datetoken.nextToken();
    dd1 = datetoken.nextToken();
    yy1 = datetoken.nextToken();
    dateto2 = yy1 + "-" + mm1 + "-" + dd1;
    dateto1 = dateto2+" 23:59:59.999";

    datetoken = new StringTokenizer(datefrom, "/");
    mm2 = datetoken.nextToken();
    dd2 = datetoken.nextToken();
    yy2 = datetoken.nextToken();
    datefrom1 = yy2 + "-" + mm2 + "-" + dd2;

    LookUp helper = new LookUp();
%>
<section class="content-header">
    <h1>Transaction Status Dashboard</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Dashboard</a></li>
        <li><a href="#">Transaction Status Dashboard</a></li>
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
                                            <td>
                                                <input type="submit" name="view" class="form-control btn btn-primary" value="View" />
                                            </td>
                                        </tr>
                                    </table></div>
                                <hr />
                            </div>


                            <div class="row">
                                <div class="col-sm-12"><!-- Pagination -->

                                    <div style="text-align:center">
                                        <section class="content-header" style="margin-left: -8px !important; margin-right: -10px !important; border-bottom: none;">
                                            <div class="alert alert-info">Transaction Status Dashboard between <%= datefrom1 + " and " + dateto2%></h2>
                                        </section>	
                                    </div>
                                </div>
                            </div>




                                                                    <div class="col-sm-12 table-responsive">
                                                                        <%
            
            terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Failed' AND CHANNEL_MESSAGE_CODE = '0210'");
            terminalgrandtotal.next();

            failednumber = terminalgrandtotal.getInt(1) != 0 ? terminalgrandtotal.getInt(1) : 0;
            failedamount = terminalgrandtotal.getDouble(2) != 0 ? terminalgrandtotal.getDouble(2) : 0;

            
            terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Declined' AND CHANNEL_MESSAGE_CODE = '0210'");
            terminalgrandtotal.next();
            declinednumber = terminalgrandtotal.getInt(1) != 0 ? terminalgrandtotal.getInt(1) : 0;
            declinedamount = terminalgrandtotal.getDouble(2) != 0 ? terminalgrandtotal.getDouble(2) : 0;
            
            terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total, SUM(c.TRANSACTION_AMOUNT) AS amount FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Approved' AND c.CHANNEL_MESSAGE_CODE = '0210'");
            terminalgrandtotal.next();

            approvednumber = terminalgrandtotal.getInt(1) != 0 ? terminalgrandtotal.getInt(1) : 0;
            approvedamount = terminalgrandtotal.getDouble(2) != 0 ? terminalgrandtotal.getDouble(2) : 0;

               title1 = "Y-Axis: Transaction Count;     X-Axis: Response Status";
               value1 = approvednumber+"___"+declinednumber+"___"+failednumber;
               label2 = "Approved Txn.___Declined Txn.___Failed Txn.";
               label1 = "Approved___Declined___Failed";
                
            %>
            </div>
            </form>
<canvas id="bar-chart" width="800" height="450">Loading graph...</canvas>
            
            <script type="text/javascript">
    
    
    new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: [
          <%
            StringTokenizer value11  = new StringTokenizer(value1, "___");
            StringTokenizer label11  = new StringTokenizer(label1, "___");
            String label = "", vals="";
            while(label11.hasMoreTokens()){
                label = label11.nextToken();
                %>
                                "<%=label%>",
                                <% } %>],
      datasets: [
        {
          label: "Transaction Count",
          data: [<%
            while(value11.hasMoreTokens()){
                vals = value11.nextToken();
                %>
                                <%=vals%>,
            <% } %>],
          backgroundColor: ["#00AA00","#6e95cd","#FF0000",]
          
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: '<%=title1%>'
      }
    }
    
});

</script>

                                                                    <!-- body -->
                                                                    <% terminalgrandtotal.close(); LookUp.con.close(); %>
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