<%@page import="com.entity.BankAcquirers"%>
<%@include file="header.jsp" %>

<%@include file="menu.jsp" %>
<%  
    String classes  = ""; 
    String content = ""; 
%>
<section class="content-header">
      <h1>Bank Acquirers</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Manage Page</a></li>
        <li><a href="#">Create Page</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-sm-12">
          
              
              

    <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
    <div class="col-sm-7"><div class="<%=classes%>"><%= content%></div>
							
                                             
        <h1>List of Banks</h1> 
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>Bank Name</th>
                <th>ATM Terminal Prefix</th>
                <th>POS Terminal Prefix</th>
            </tr>
            <c:forEach items="${bankList}" var="product">
                <tr>
                    <td>${product.bankId}</td>
                    <td><c:out value="${product.bank}" /></td>
                    <td><c:out value="${product.atmTerminalPrefix}" /></td>
                    <td><c:out value="${product.posTerminalPrefix}" /></td>
                </tr>
            </c:forEach>
       </table>
                                                    
                                                    <!-- body -->
                                                    
<% 
    List dt = (List)request.getAttribute("bankList"); 
    Iterator<BankAcquirers> it = dt.iterator();
    ArrayList aList = new ArrayList();
    BankAcquirers ba = new BankAcquirers();
%>
    </div>
    <div class="col-sm-5">
        <h1>&nbsp;</h1> 
        <div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
        <script language="JavaScript">
function drawChart() {
   // Define the chart to be drawn.
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Browser');
   data.addColumn('number', 'Percentage');
   data.addRows([
       <%
           int no = 0;
           while(it.hasNext()){
                no += 1;
                ba =it.next();
                if(no > 5){
                    %>
                ['<%=ba.getBank()%>', 4]<%
                    break;
                }
            else{
       %>
                ['<%=ba.getBank()%>', 4],
        <% }} %>
   ]);
   
   // Set chart options
   var options = {'title':'Browser market shares at a specific website, 2014',
      'width':550,
      'height':400};

   // Instantiate and draw the chart.
   var chart = new google.visualization.PieChart(document.getElementById('container'));
   chart.draw(data, options);
}
google.charts.setOnLoadCallback(drawChart);
</script>
            
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
  
		
		<%@include file="footer.jsp" %>