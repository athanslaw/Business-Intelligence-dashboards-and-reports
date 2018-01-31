
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
<script type="text/javascript">
var checkInfo=function(){
   if(document.frm.user.value==""||document.frm.pass.value==""){
   alert('you must provide all and valid credentials');
   return false;
        }
    }
</script>
        <title>Home Page</title>
        
</head>
    <body>
	<div align="center" style="background-color:#FFF; width:100%;">
            <%@include file="heead1.jsp" %>
	</div><%! String username="", password="";String msg; %>
        <% msg ="";
                      if(request.getParameter("ok")!=null && request.getParameter("ok")!=""){
                      username = request.getParameter("username").trim();
                      password = request.getParameter("password").trim();
                      if(password.length()<1 || username.length() <1) msg="Please Enter Username and Password";
                      else {try{                          
                      login l = msl.viewOneRecord(username);
                      viewstudents stud=null;viewlecturers lec=null;

                 if(msl.authenticate(username).equalsIgnoreCase(msl.encrypt(password))){
                    session.setAttribute("user", username);
                    session.setAttribute("role", l.getRoleId());
                    response.sendRedirect("index.jsp");
                 }
                    
                } else{ msg = "<font color='red'>Invalid Login Entry</font>";}}
            catch(Exception ex){
                msg = "<font color='red'>Invalid Login Entry</font>";
                System.out.println("index.jsp "+ex.getMessage());
                                                   } }}%>
 <table align="center" cellpadding="10" width="80%" bgcolor="#ccf">
 <tr align="justify" valign="top"><td width="46%" style="color:#066;">
<h2>Welcome Message</h2>
  <p>Automated Thesis Management System.</p>
  <p>This system is aimed at assisting the students in achieving thesis at ease. </p>
  <p>It also assists the supervisors in performing their duties maximally without distance barrier.</p>
  <p>The users of this system which includes the students, the supervisors and the admin should note that all actions performed in this system authomatically sends a message to the necessary recipient to take corresponding actions.</p>
</td><td width="54%" valign="top" align="center">
 <blink><%=msg%></blink>
 <fieldset style="width:80%"><legend align="center"><b>Login</b></legend>
            <form action="" method="post">
                <table><tr><td>User</td><td><input name="username" type="text"/></td></tr>
                <tr><td>Password</td><td><input name="password" type="password"/></td></tr>
                <tr><td></td><td><input name="ok" type="submit" value="login"/></td></tr>
                </table>
            </form></fieldset></td></tr>
    <tr><td colspan="2" bgcolor="#fff" align="center">
            <font color="#006600"><a href="electronicThesis/viewThesisBySessionRange.jsp">View Thesis by Session Range</a> || <a href="electronicThesis/viewThesisBySupervisor.jsp">View Thesis by Supervisor</a></font></td></tr></table>
 <script type="text/javascript">
swfobject.registerObject("FlashID");
 </script>
    </body>
</html>