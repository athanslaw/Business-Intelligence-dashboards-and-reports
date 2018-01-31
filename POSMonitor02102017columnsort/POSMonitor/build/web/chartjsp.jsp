<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
<img src="/POSMonitor/PieServlet" alt="Progress chart" />
<%
                    
                /* Step - 1: Define the data for the bar chart  */
                DefaultCategoryDataset bar_chart_servlet = new DefaultCategoryDataset();
                bar_chart_servlet.addValue(33, "Q1", "Rome");
                bar_chart_servlet.addValue(44, "Q1", "Cairo");
                bar_chart_servlet.addValue(22, "Q2", "Rome");
                bar_chart_servlet.addValue(12, "Q2", "Cairo");
                bar_chart_servlet.addValue(56, "Q3", "Rome");
                bar_chart_servlet.addValue(98, "Q3", "Cairo");
                bar_chart_servlet.addValue(2, "Q4", "Rome");
                bar_chart_servlet.addValue(15, "Q4", "Cairo");    
                %>
<img src="/POSMonitor/BarChartServletExample?bar_chart_servlet=<%=bar_chart_servlet%>" alt="Progress chart" />
<img src="/POSMonitor/BarServlet" alt="Progress chart" />