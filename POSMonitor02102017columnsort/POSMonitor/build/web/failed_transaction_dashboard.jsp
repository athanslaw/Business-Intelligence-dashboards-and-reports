<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="WEB-INF/header.jsp" %>
<% HelperClass.activeClass = "failed_transaction_dashboard"; %>
<%@include file="WEB-INF/menu.jsp" %>      


<script src="dist/js/Chart.min.js"></script>
<%! int total_no, number, no, number1, no1;
    String datefrom, dateto, moneyString;
    StringTokenizer token;
    String query;
    
    ResultSet terminalgrandtotal;
    
    String title1, label1, value1;
    DecimalFormat decimalFormat;
%>
<%  
    label1=""; value1="";
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
    <h1>Failed Transaction by Card Dashboard</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Dashboard</a></li>
        <li><a href="#">Transaction Dashboard</a></li>
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
                                            <div class="alert alert-info">Failed Analysis by Cards between <%= datefrom1 + " and " + dateto2%></h2>
                                        </section>	
                                    </div>
                                </div>
                            </div>



                                        
                                        
                                        
<div class="row">
                                <div class="col-sm-12"><!-- Pagination -->

                                    <div style="text-align:center">
                                        <section class="content-header" style="margin-left: -8px !important; margin-right: -10px !important; border-bottom: none;">

                                            
                                    <%
                                        dateto1 += " 23:59:59.999";
                                        %>
<div class="row">
            <%
                terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Failed'");
                terminalgrandtotal.next();  
            %>
                                                

            <div class="col-lg-4 col-xs-4">
                <!-- small box -->
                    <div class="small-box bg-red-active">
                        <div class="inner">
                            <h4><strong><% number =terminalgrandtotal.getInt("total");
                                decimalFormat = new DecimalFormat("#,###");
                                no = number;
                                moneyString = decimalFormat.format(number);
                                %><%=moneyString%></strong></h4>
                            <p>Total Failed Tnxs. Count</p>
                        </div>
                </div>
            </div>
                
            <!-- ./col -->
            
            <div class="col-lg-4 col-xs-4">
                <!-- small box -->
                <%
                terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE JOIN ATMALERT.ISSUER i ON substr(c.PRIMARY_ACCOUNT_NUMBER,0,6) = i.BIN WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Failed'");
                terminalgrandtotal.next();  
            %>
                <div class="small-box bg-red-active">
                    <div class="inner">
                        <h4><strong><% number =terminalgrandtotal.getInt("total");
                        no1 = number;
                        moneyString = decimalFormat.format(no-no1);
                        %><%=moneyString%></strong></h4>
                        <p>Failed Tnxs. Count (Other Banks)<br></p>
                    </div>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-xs-4">
                <!-- small box -->
                
                    <div class="small-box bg-red-active">
                        <div class="inner">
                            <h4><strong><% 
                                moneyString = decimalFormat.format(no1);
                                %><%=moneyString%></strong></h4>
                                <p>Total Failed Tnxs. Count (UBA)<br></p>
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
            <%
            terminalgrandtotal = helper.view_record_single("SELECT count(*) AS total, i.BIN FROM ATMALERT.CHANNEL_RESPONSE c JOIN ATMALERT.RESPONSE_CODE r ON c.AUTH_RESPONSE_CODE = r.RESP_CODE JOIN ATMALERT.ISSUER i ON substr(c.PRIMARY_ACCOUNT_NUMBER,0,6) = i.BIN WHERE c.FEED_TIMESTAMP >= '" + datefrom1 + "' AND c.FEED_TIMESTAMP <= '" + dateto1 + "' AND r.STATUS = 'Failed' GROUP BY i.BIN ORDER BY total DESC");
            
            
            int no = 0;// AND c.a041_card_acceptor_terminal_id like '2033%'
            while(terminalgrandtotal.next()){
                if(terminalgrandtotal.getString("BIN") == null) continue;
                value1 +=  terminalgrandtotal.getString("total") != null ? terminalgrandtotal.getString("total"):"0";
                label1 += terminalgrandtotal.getString("BIN");
                no++;
                if(no > 20){ break; }
                value1 += "___";
                label1 += "___";
            }
            title1 = "Y-Axis: Transaction Count;     X-Axis: Cards";
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
              int num = 0;
            while(value11.hasMoreTokens()){
                num += 1;
                vals = value11.nextToken();
                %>
                                <%=vals%>,
            <% } %>],
          backgroundColor: [
            <%
            for(int i=0; i< num; i++){
            %>
                      "#FF0000",
            <% } %>]
          
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
            
        </div>
                            <% terminalgrandtotal.close(); LookUp.con.close(); %>
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