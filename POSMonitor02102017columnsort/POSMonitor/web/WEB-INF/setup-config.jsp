<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Setup Configuration File</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- bootstrap -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!--<link rel="stylesheet" href="css/portal.css">-->
  <!-- jquery -->
  <script src="dist/js/jquery.min.js"></script>
  <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">-->
  <link rel="stylesheet" href="dist/css/font-awesome.css">

<style>
body{
	font-size:14px;
	line-height:30px;
}</style>
</head>
<body style="background-color:#eeeeee"><br><br>
	<div class="col-sm-3"></div><div class="col-sm-6" style="text-align:center">
            <img class="img-circle" alt="Logo" src="images/UBA_Logo_red.jpg" width="120" /><br><br>
	<div style="padding:10px; text-align:left; background-color:#fff; border-radius:10px">
            <% if(request.getParameter("step") == null || request.getParameter("step").equals("0")){ %>
	<p>Welcome to Nathan Claire POS Monitoring Dashboard and Reports. Before getting started, we need some information on the database. You will need to know the following items before proceeding.</p>
	<ol>
		<li>SID / Service Name</li><li>
		Database username</li><li>
		Database password</li><li>
		Database hostname : Port</li>
	</ol>

	<p>We are going to use this information to setup your database connection.</p>
	<a class="btn btn-primary" href="/POSMonitor/setup-config?step=1">Continue</a>
	
	
	<%
	}else if(request.getParameter("step").equals("1")){
            if(request.getParameter("msg") != null){ %>
            <p class="alert alert-danger">Error! The application could not communicate with your database. Kindly specify the accurate database parameters below.</p>
            <% } 
            else{ %>
            <p>Below you should enter your database connection details. If you are not sure about these, contact a higher authority.</p>
            <% } %>
	
	<form name="a" action="/POSMonitor/setup-config" method="POST">
	<fieldset><legend></legend>
            <div class="row" style="padding:5px"><div class="col-sm-3"><label for="dbhost"><strong>Database Hostname:Port</strong></label></div><div class="col-sm-4"><input type="text" class="form-control" id="dbhost" name="dbhost" placeholder="ip:port" /></div><div class="col-sm-5">Your database hostname and port.</div></div>
            <div class="row" style="padding:5px"><div class="col-sm-3"><label for="dbname"><strong>SID / Service Name</strong></label></div><div class="col-sm-4"><input type="text" class="form-control" id="dbname" name="dbname" placeholder="SID / Service Name" /></div><div class="col-sm-5">The SID of the database you want to use.</div></div>
            <div class="row" style="padding:5px"><div class="col-sm-3"><label for="username"><strong>Database Username</strong></label></div><div class="col-sm-4"><input type="text" class="form-control" id="username" name="username" placeholder="username" /></div><div class="col-sm-5">Your database username.</div></div>
            <div class="row" style="padding:5px"><div class="col-sm-3"><label for="password"><strong>Database Password</strong></label></div><div class="col-sm-4"><input type="password" class="form-control" id="password" name="password" placeholder="password" /></div><div class="col-sm-5">Your database password.</div></div>
	</fieldset>
	<p>We are going to use this information to setup your database connection.</p>
        <input type="submit" value="Submit" name="send" class="btn btn-primary" />
        </form>
	
	<%
	}else if(request.getParameter("step").equals("2")){  %>
            <p>Congrats! You have made it through this part of the installation. The application can now communicate with your database. If you are ready, time now to visit?</p>
            <a class="btn btn-primary" href="/POSMonitor/">Home Page</a>
        <% } %>

	</div></div>
	<div class="col-sm-3"></div>
<body>

</html>