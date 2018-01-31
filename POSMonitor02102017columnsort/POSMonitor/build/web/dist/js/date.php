<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- bootstrap -->
<link rel="stylesheet" href="bootstrap.min.css">
<script src="bootstrap.min.js"></script>
<!-- jquery -->
<script src="jquery.min.js"></script>
<!-- Bootstrap Date Picker -->
<link rel="stylesheet" href="datepicker3.css">
<script src="bootstrap-datepicker.js"></script>


<style>
label.control-label{
    text-align: left;
}
</style>
</head>
<body>
<div class="content-wrapper">
        <section class="content-header">
          <h1>
          Date Picker
          </h1>
         
        </section>
        <form action="" method="post" enctype="multipart/form-data" id="frm" >
		
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" >
            <div class="form-group">
                <label style="text-align: left"> Date<sup style="color:#FF0000">*</sup></label>
				<input type="text" name="employmentdate" id="employmentdate" class="form-control"  value="" required>
                </div>
		   </div>
		   
		   </div>
		
        </form>
    
    
<script type="text/javascript">
$(document).ready(function() {
    setTimeout(function() {
        $("#succ-msg").fadeOut(1500);
    }, 2000);
	
	$('#employmentdate').datepicker({
		format: "dd-mm-yyyy"
	}).on('changeDate',function(e) {
    	$('#employmentdate').datepicker('hide');
	});
});



</script>

</div>
</body>
</html>