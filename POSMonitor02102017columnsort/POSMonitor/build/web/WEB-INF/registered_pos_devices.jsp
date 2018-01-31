<%@page import="java.util.HashSet"%>
<%@page import="com.entity.PosTransaction"%>
<%@include file="header.jsp" %>

<%@include file="menu.jsp" %>
<%  
    String classes  = ""; 
    String content = ""; 
%>
<section class="content-header">
      <h1>Terminal Reports</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">POS Terminal</a></li>
        <li><a href="#">Terminal List</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-sm-12">
          
              
              

    <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
    <div class="col-sm-12"><div class="<%=classes%>"><%= content%></div>
							
                                             
        <h1>List of All Terminals</h1> 
        <table class="table table-bordered table-striped">
            <tr>
                <th>Terminal ID</th>
                <th>Merchant Name</th>
                <th>PTSP</th>
                <th>State Code</th>
                <th>Physical Address</th>
            </tr>
            <% int no = 0; %>
            <c:forEach items="${pos}" var="product">
                <% no += 1; %>
                <tr>
                    <td>${product.terminalId}</td>
                    <td><c:out value="${product.merchantName}" /></td>
                    <td><c:out value="${product.ptsp}" /></td>
                    <td><c:out value="${product.stateCode}" /></td>
                    <td><c:out value="${product.physicalAddress}" /></td>
                </tr>
            </c:forEach>
                <tr>
                <th colspan="5">Total Number of Records: <%= no %></th>
            </tr>
       </table>
                                                    
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