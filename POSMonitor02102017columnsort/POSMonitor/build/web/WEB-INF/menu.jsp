
<% String activeClass=HelperClass.activeClass;
%>       
        <li><a href="/POSMonitor" style="<%= activeClass != null && activeClass.equalsIgnoreCase("home")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-book"></i> <span>Home</span></a></li>
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span> Reports</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
            <ul class="treeview-menu">
                <li><a href="/POSMonitor/active_terminal.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("active_terminal")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Active Terminals</a></li>
                <li><a href="/POSMonitor/terminalranked.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("terminalranked")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Terminal Performance</a></li>
                <li><a href="/POSMonitor/merchant_performance.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("merchant_performance")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Merchant Performance</a></li>
                <li><a href="/POSMonitor/callhomereport.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("callhomereport")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Call Home Report</a></li>
                <li><a href="/POSMonitor/inactive_terminal.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("inactive_terminal")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Inactive Terminals</a></li>
                <li><a href="/POSMonitor/failed_transaction_by_reason_report.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("failed_transaction_by_reason_report")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Failed Txn by Reason</a></li>
            </ul>
        </li>
        
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span> Dashboards</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
                <ul class="treeview-menu">
                    <li><a href="/POSMonitor/terminal_dashboard.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("terminal_dashboard")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Transaction Status</a></li>
                    <li><a href="/POSMonitor/failed_transaction_reason.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("failed_transaction_reason")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Failed Txn by Reason</a></li>
                    <li><a href="/POSMonitor/failed_transaction_dashboard.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("failed_transaction_dashboard")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Failed Txn by Card</a></li>
                    <li><a href="/POSMonitor/approved_transaction_dashboard.jsp" style="<%= activeClass != null && activeClass.equalsIgnoreCase("approved_transaction_dashboard")?"background-color: #ffffff !important; color: #000000 !important;":""%>"><i class="fa fa-circle-o"></i> Successful Txn by Card</a></li>
                </ul>
        </li>
        	
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">