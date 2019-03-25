<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>User Management</title>
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="dashboard/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="dashboard/bower_components/font-awesome/css/font-awesome.min.css">
 
 <link rel="stylesheet" href="dashboard/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  
  
  <link rel="stylesheet" href="dashboard/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dashboard/dist/css/skins/_all-skins.min.css">
  
  
  
 <!-- Date Picker -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="dashboard/customcolors/unizencolors.css">


<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<link rel="icon" type="image/png" href="dashboard/dist/img/Watermeter.png" style="">
	
	<!-- jQuery 3 -->
	<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- datepicker -->
	<!--  <script src="dashboard/bower_components/moment/min/moment.min.js"></script>
	<script src="dashboard/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>-->
	 <link rel="stylesheet" href="dashboard/plugins/timepicker/bootstrap-timepicker.min.css">
	 <!-- bootstrap time picker -->
<script src="dashboard/plugins/timepicker/bootstrap-timepicker.min.js"></script>
  <!-- Select2 -->
	
	
  <!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.21.0/moment.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="dashboard/bower_components/build/css/bootstrap-datetimepicker.min.css">
        <script src="dashboard/bower_components/build/js/bootstrap-datetimepicker.min.js"></script>-->
        
    <!--    <link href="dashboard/bower_components/date_time_pick/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
     <script src="dashboard/bower_components/date_time_pick/js/bootstrap-datetimepicker.min.js"></script>--> 
     
   <!--    <script src="dashboard/bower_components/moment/min/moment.min.js"></script>
      <link href="dashboard/bower_components/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
     <script src="dashboard/bower_components/build/js/bootstrap-datetimepicker.min.js"></script>
     <link href="dashboard/bower_components/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
     <script src="dashboard/bower_components/build/js/bootstrap-datetimepicker.js"></script>-->
     
</head>

 
<body class="hold-transition skin-blue skin-black sidebar-mini" onload="getmyorg()">

 
<div class="wrapper">
  <%@include file="Header_v3.jsp"%>
<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Add User <small></small>
				</h1>
				
		</section>
		<section class="content">
			<div class="row">
       <div class="col-md-12">
       <div class="box">
           
            <div class="box-body">
              <div class="row">
                
                <div class="col-xs-2">
                New User<br>
                <button type="button" class="btn btn-primary btn-block" onclick="addUserTitle()" data-toggle="modal" data-target="#uesr-model" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"><i class="glyphicon glyphicon-user" style=" "></i>&ensp;Add New User   </button>
                  
                 <!--  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger">
                Launch Danger Modal
              </button> -->
                  
                </div>
                <div class="col-xs-2"></div>
               
                 <div class="col-xs-2">
                 Block
                 <select class="form-control" id="downloadtemplatespp" style="background-color:#64B246;color:#ffff;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;border-radius:3px"></select>
                 </div>
                
                <div class="col-xs-2">
                   Users Template<br>
                <button  class="btn btn-primary btn-block" onclick="downloaduserTemplate()" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"> <i class="glyphicon glyphicon-cloud-download"></i>&ensp; Download   </button>
                 </div>
                <div class="col-xs-2">
                 Select File<br>
                <input type="file" id="uploadExcel" class="btn btn-primary btn-block" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"/> 
                
                    </div>
                    
                     <div class="col-xs-2">
                     Upload
                     <button  class="btn btn-primary btn-block" onclick="uploadUsers()" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"><i class="glyphicon glyphicon-cloud-upload"></i>&ensp;Upload   </button>
                     </div>
              </div>
            </div>
            
            </div>
            <!-- /.box-body -->
          </div>
       
        </div>
			</section>
			<section class="content-header" style="margin-top:-140px">
				<h1>
					User List <small></small>
				</h1>
				
		</section>
	<section class="content">
			<div class="box">
            <div class="box-header">
             
             <div class="row">
              <div class="col-xs-2"> 
              Select Block</div>
             <div class="col-xs-2"> 
               <select onchange="getusersbyapp()" class="form-control" id="filterblockselect" >
               
                </select>
             </div>
             </div>
             
            
            
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
             <div class="row"><div class="col-sm-12">
             
              <div class="table-responsive">
             <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead style="cursor: auto;">
                <tr role="row" style="color:#ffff;">
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 231px;">User Id</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 282px;">User Name</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 251px;">Phone</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 198px;">Email</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">Flat/Residence</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">Action/Edit</th>

               <!--  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">View</th> -->
                </tr>
                </thead>
                <tbody id="userslist">
                
                
                
               </tbody>
               
              </table></div></div></div></div>
            </div>
            <!-- /.box-body -->
          </div>
			
			</section>
  </div>
  
  
  
<!-- /.content -->
    <div class="clearfix"></div>

  <!-- Control Sidebar -->
 
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
       <%@include file="footer_v2.jsp"%>
  <div class="control-sidebar-bg"></div>
 </div>
 


<!-- jQuery 3 -->
<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

  <script src="dashboard/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="dashboard/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<!-- SlimScroll -->
<script src="dashboard/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<!-- AdminLTE App -->
<script src="dashboard/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dashboard/dist/js/demo.js"></script>


<!-- page script -->


<div class="modal fade in" id="uesr-model" data-keyboard="false" data-backdrop="static" style="display:none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93;color:#ffff">
                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="clean()"  >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                <h4 class="modal-title" style="color:#ffff">Add user</h4>
              </div>
              <div class="modal-body" style="background-color:#f9f9f9">
                
                <div class="box-body">

                <div class="alert alert-success " id="success1" style="display:none">
                <strong>User details updated successfully...!</strong>
                </div>
                <div class="alert alert-danger" id="failure1" style="display:none">
                <strong>User details updation failed!Please confirm the details</strong>
                </div>
               
                <div class="form-group">

                  <label>User name</label>

                  <input type="text" class="form-control" id="uname" name="uname" placeholder="Enter username"   value="" required onkeyup="onFocusOut()" autocomplete="off">
                  <input type="hidden" id="edituid" value="0">
                  <span id="namevalid1" style="color: red;"></span>
                  <span id="nameexists1" style="color: red;"></span>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="email" name="email" value=""    placeholder="Enter email"  required onkeyup="onFocusOut()" autocomplete="off">
                   <span id="emailvalid1" style="color: red;"></span>
                   <span id="emailexists1" style="color: red;"></span>
                  
                </div>
                
                <div class="form-group">
                  <label for="phone">Phone number</label>
                  <input type="tel" class="form-control" id="contact" name="contact" pattern="[1-9][0-9]{9}" 
                  placeholder="Enter number"  value= "" required onkeyup="onFocusOut()" autocomplete="off">
                   <span id="phonevalid1" style="color: red;"></span>
                </div>
                
                <div class="form-group">
                 <label >Residence/Flat</label>
                  <input type="text" id="flat" class="form-control" name="flat" placeholder="Enter flat" onkeyup="onFocusOut()" autocomplete="off">
                   
                </div>
                
                <div class="form-group">
                  <label for="block">Block</label>
                  <select class="form-control text-center" id="userblockselect"  onchange="onFocusOut()">
														
											</select>
                </div>
                 <div class="form-group text-center">
                  <button onclick="adduser()"  class="btn btn-success" id="detailssavebutton1" style="background-color:#235E93;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"  >Save</button>
                 
                </div>
                </div>
                
                 
                 

                   
                  
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>

<!-- Modal for view consumption -->
<div class="modal fade in" id="modalview" data-keyboard="false" data-backdrop="static" style="display:none;">
          <div class="modal-dialog">
            <div class="modal-content">

              <div class="modal-header" style="background-color:#235E93;color:#ffff">

                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="cleanwaterconsumption()"  >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                <h4 class="modal-title" style="color:#ffff">View Water Consumption</h4>
              </div>
              <div class="modal-body" style="background-color:#f9f9f9">
                
                <div class="box-body">           
                <div class="form-group">
                  <label for="watermeter">WaterMeter</label>
                  <select class="form-control text-center"  id="watermeterselect" required >
														
											</select>
                </div>
               
               <div class="form-group">
                   <label>From Date</label>

		        <div class='input-group date' id='datetimepicker1'>
		          <input type='text' name="fromDate" id="fromDate" class="form-control" placeholder="Please choose" />
		            <span class="input-group-addon">
		            	<span class="glyphicon glyphicon-calendar"></span>    
		            </span>
		         </div>

			  </div>
				
			 	
			 	
				 <label for="todate">To Date</label>

			       <div class='input-group date' id='datetimepicker2'>
			          <input type='text' name="toDate" id="toDate" class="form-control clsDatePicker" placeholder="Please choose" />
			            <span class="input-group-addon">
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </span>

			        </div> 
			        
			         <div class="alert" id="wc">
           
                     </div>
            
                 <div class="form-group text-center">
                  <button  class="btn btn-success" id="submitbutton" style="background-color:#235E93;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"  onclick ="enduserwaterconsumption()">Submit</button>
                 
                </div>
               </div>     
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>

<!-- Modal for alert message -->        
<div class="modal fade in" id="modal-info-alert" data-backdrop="static" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93;color:#ffff">
               <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="cleanfile()" >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
              <!--   <span aria-hidden="true">×</span> -->
                  </button>
                <h4 class="modal-title" style="color:#ffff">Error Message</h4>
              </div>
              <div class="modal-body text-center"style="background-color:#f9f9f9">
              
               
                
               
               </div> 
               
            </div>
            
          </div>
         
        </div>  
        

        
        
        <div class="modal" id="modal-info-loader" data-backdrop="static" style="display: none; padding-right: 17px;">
        
        <div class="row">
         <div class="col-sm-5"></div>
        <div class="col-sm-4">
        <div class="loader"></div>
        </div>
          </div>
         
        </div>  
        
      

<script>

var myorgid;
var modalalert = $("#modal-info-alert");
var modal=document.getElementById("modal-info-alert");

var modaleditprofile=$("#uesr-model");

  function addUserTitle()
   {
		modaleditprofile.find('.modal-title').text('Add user');
	}


function getmyorg(){
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	myorgid = this.responseText;
	    	
	    	getmyapp()
	    	
	  
	    }
	  };
	  xhttp.open("GET", "getMyorgId", true);
	  xhttp.send();
}

 
  
  
  function getmyapp(){
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	// console.log(this.responseText);
	   
	    	 document.getElementById("filterblockselect").innerHTML="<option value='0'>--Select--</option>"+this.responseText;

	    	 document.getElementById("userblockselect").innerHTML="<option value='0'>--Select--</option>"+this.responseText;
	    	 document.getElementById("downloadtemplatespp").innerHTML="<option value='0'>--Select--</option>"+this.responseText;
	    	
	    	
	    	 
	    	 
	    	 // filterblockselect 
	    
	    }
	  };
	  xhttp.open("GET", "getApplications?orgId="+myorgid, true);
	  xhttp.send();
}
  
  function getapp(){
		
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	// console.log(this.responseText);
		   
		    	document.getElementById("userblockselect").disabled = false;
		    	 document.getElementById("downloadtemplatespp").innerHTML="<option value='0'>--Select--</option>"+this.responseText;
		    	 document.getElementById("userblockselect").innerHTML="<option value='0'>--Select--</option>"+this.responseText;
		    	 // filterblockselect 
		    
		    }
		  };
		  xhttp.open("GET", "getApplications?orgId="+myorgid, true);
		  xhttp.send();
	}
	  
function adduser(){
	
	var userid = document.getElementById("edituid").value
	var uname= document.getElementById("uname").value;
	var phone= document.getElementById("contact").value;
	var email= document.getElementById("email").value;
	var flat= document.getElementById("flat").value;
	var appId= document.getElementById("userblockselect").value.split(":")[0];
	 var emailRegx = /^((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+([!#\$%&\*\.\+\-\/=\?\^_`{\|}~]([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/;
	//var emailRegx = /^((([a-z]|\d|[!#\$%&\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/;
	//var emailRegx= /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var phoneRegx = /^[0][1-9]\d{9}$|^[1-9]\d{9}$/g;
	var unameRegx=/^[A-Za-z0-9_]{4,32}$/;
	
	
	if(uname=="")
	{
	
	document.getElementById("uname").style.borderColor = "red";
	 document.getElementById("uname").focus();
	document.getElementById("uname").addEventListener("keyup", onFocusOut);
	return false;
	}
else if(unameRegx.test(uname)==false)
	{
	
	document.getElementById("uname").style.borderColor = "red";
	document.getElementById("namevalid1").innerHTML="Username must be 4 - 32 characters long, contain only letters, numbers and _ ";
	document.getElementById("uname").focus();
	document.getElementById("uname").addEventListener("keyup", onFocusOut);
	return false;
	
	}
		  
   else if(email==""){
	   
	  document.getElementById("email").style.borderColor = "red";
	
	  document.getElementById("email").focus();
	  document.getElementById("email").addEventListener("keyup", onFocusOut);
	   return false;
}
else if(emailRegx.test(email)==false)
	{
	
	   document.getElementById("email").style.borderColor = "red";
 	   document.getElementById("emailvalid1").innerHTML="Invalid email address";
	   document.getElementById("email").focus();
	   document.getElementById("email").addEventListener("keyup", onFocusOut);
		   return false;
	}
	else if(phone=="")
	{
	    document.getElementById("contact").style.borderColor = "red";
		document.getElementById("contact").focus();
	    document.getElementById("contact").addEventListener("keyup", onFocusOut);
	return false;
	}
	else if(phoneRegx.test(phone)==false)
		{
		
		document.getElementById("contact").style.borderColor = "red";
		document.getElementById("phonevalid1").innerHTML="Invalid phone number";
		document.getElementById("contact").focus();
		document.getElementById("contact").addEventListener("keyup", onFocusOut);
	return false;
		}
	else if(flat=="")
	{
	    document.getElementById("flat").style.borderColor = "red";
		document.getElementById("flat").focus();
	    document.getElementById("flat").addEventListener("keyup", onFocusOut);
	return false;
	}
	else if(appId==false)
	{
	    document.getElementById("userblockselect").style.borderColor = "red";
		document.getElementById("userblockselect").focus();
	    document.getElementById("userblockselect").addEventListener("change", onFocusOut);
	return false;
	}
	else{
	
		
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	  
	    //	alert(this.responseText);
	  //console.log(this.responseText);
	   
	  if(this.responseText=='s') {
		  document.getElementById("success1").style.display="block";
	  		setTimeout(function(){ window.location.reload() }, 1000);
	  		 	
	}
	  else if(this.responseText=="f"){
	  		document.getElementById("failure1").style.display="block";
			
			 }	
	  else 
			 if(this.responseText=='nameexsisting'){
				  
				  document.getElementById("uname").style.borderColor = "red";
				  document.getElementById("nameexists1").innerHTML= "Username already exists";
				  document.getElementById("uname").focus();
				  document.getElementById("uname").addEventListener("keyup", onFocusOut);
				  }	
	    
		 else
	  if(this.responseText=='emailexsisting'){
		  	
		     document.getElementById("email").style.borderColor = "red";
		     document.getElementById("emailexists1").innerHTML="Emailid already exists";
		     document.getElementById("email").focus();
		     document.getElementById("email").addEventListener("keyup", onFocusOut);
		     
	  }	
	    }
	  };
	  xhttp.open("POST", "adduserbyadmin", true);
	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  xhttp.send("username="+uname+"&email="+email+"&appId="+appId+"&phone="+phone+"&flat="+flat+"&userid="+userid);
	}
}



  function downloaduserTemplate(){
	  //console.log()
	  var appId= document.getElementById("downloadtemplatespp").value.split(":")[0];
	  var appName= document.getElementById("downloadtemplatespp").value.split(":")[1];
	  

	  if(appId!=0){
	
	  window.open("getuserUploadTemplate?appId="+appId+"&appName="+appName);
	  getapp();
	  }
	  else{
		 
	  modalalert.modal('show');
	  modalalert.find('.modal-title').text('Error message');
	 modalalert.find('.modal-body').text('Please select the block before downloading the template');
	  
	  }
  }
  
  function uploadUsers(){
	  
	  modalalert.modal('show');
	     modalalert.find('.modal-body').text('');
		 
		 var file = document.getElementById("uploadExcel").files[0];
		console.log(file);
		if(file==undefined){
			//alert("Please select a file to upload");
			 modalalert.modal('show');
			 modalalert.find('.modal-title').text('Error message');
		     modalalert.find('.modal-body').text('Please select a file to upload');
			return;
		}
		
		 var filename = file.name;
		 var fileName= filename.split("_");
		
		 if(file.type !="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"){
			
			// console.log(file.name);
			modalalert.modal('show');
			modalalert.find('.modal-title').text('Error message');
	        modalalert.find('.modal-body').text('please select valid file extension');
	        modalalert.find('.modal-body')
			//alert("please select valid format of file");
		    return; 
		 }else if(!parseInt(fileName[0])){
			 //alert("Invalid format of file");
			 modalalert.modal('show');
			 modalalert.find('.modal-title').text('Error message');
		     modalalert.find('.modal-body').text('Invalid format of file');
			    return; 
		 } 
	
		 
		 var formData = new FormData();
		 console.log(file.name)
		 formData.append("uploadExcel",file,file.name);
		 
		
		 var xhttp = new XMLHttpRequest();
		    xhttp.onreadystatechange = function() {
		        if (this.readyState == 4 && this.status == 200) {
		        	//response
		                modalalert.modal('show');
		                modalalert.find('.modal-title').text('Success message');
			            modalalert.find('.modal-body').append("File uploaded successfully"+"<br />"+"<br />");
		        	
		        //	document.getElementById("uploadfunction").style.display = "none";
		        	
		        	
		        	var obj = JSON.parse(this.responseText);
		        	//console.log(obj)
		        	
		        	for (var key in obj) {
		        		  if (obj.hasOwnProperty(key)) {
		        		    var val = obj[key];
		        		 // alert(key+ "  " +val);  
			        	modalalert.modal('show');
			            modalalert.find('.modal-title').text('Success message');
			            modalalert.find('.modal-body').append(key  +"     "+ val +"<br />");
		        		
		        		//document.getElementById("response").innerHTML = document.getElementById("response").innerHTML +"<tr><td>"+ key+"</td><td> " + val+"</td></tr>"  
		        		  }
		        		}
		        	
		        		//document.getElementById("response").innerHTML=this.responseText;
		        }
		    };
		    xhttp.open("POST", "userUploadRaw", true);
		    xhttp.send(formData); 
		 
		 
	 }
  
  var usersforapp;
  function getusersbyapp(){
	  
	  
	  
	  
	  
	  var appId= document.getElementById("filterblockselect").value.split(":")[0];
	 
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	//console.log(this.responseText)
	    	usersforapp =   this.responseText;
	    	showusers();
	    }
	  };
	  xhttp.open("GET", "getusersbyapp?appid="+appId, true);
	  xhttp.send();
  }
  var tabl;

  function showusers(){
	  
	//donot change the order  keep it in the first row only  
	  if(tabl != null){
			 tabl.destroy();
	  }
	  
	  var json = JSON.parse(usersforapp);
	
	  var tbody = document.getElementById("userslist");
	  
	  
	  
	  tbody.innerHTML="";
		  
	  
	  
	  for(var i in json){
		  
		var tr =  document.createElement("tr");
		tr.setAttribute("role","row");
		
		tr.setAttribute("class","odd");
		
		var td1 =  document.createElement("td");
		var td2 =  document.createElement("td");
		var td3 =  document.createElement("td");
		var td4 =  document.createElement("td");
		var td5 =  document.createElement("td");
		var td6 =  document.createElement("td");
		//var td7 =  document.createElement("td");
		
		td1.innerHTML = json[i].id
		td1.setAttribute("class","sorting_1");
	
		
		td2.innerHTML = json[i].uname
		td3.innerHTML = json[i].contactnumber
		td4.innerHTML = json[i].emailId
		td5.innerHTML = json[i].flat
		
		
		td6.innerHTML  =	'<button type="button" userid="'+json[i].id+'" onclick="edituser(this)" class="btn btn-danger" data-toggle="modal" data-target="#uesr-model" style="background-color:#91191c;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;">Edit</button>'


	//	td7.innerHTML  =	'<button type="button" userid="'+json[i].id+'" onclick="getdevbyapp()" class="btn btn-success" data-toggle="modal" data-target="#modalview">View Consumption</button>'

		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
		tr.appendChild(td6);
		//tr.appendChild(td7);
		
		tbody.appendChild(tr);
		
			  }
	 

	tabl=  $('#example1').DataTable()
  }
  
  function edituser(vals){
	  
	    
		modaleditprofile.find('.modal-title').text('Edit user');
	  
	  var appId= document.getElementById("filterblockselect").value.split(":")[0];
	  var appName= document.getElementById("filterblockselect").value.split(":")[1];
	
	var tds =  vals.parentElement.parentElement.getElementsByTagName("td")
	/*   console.log(tds[0].innerHTML);
	console.log(tds[1].innerHTML);
	 console.log(tds[2].innerHTML);
		console.log(tds[3].innerHTML);
		 console.log(tds[4].innerHTML);
		console.log(tds[5].innerHTML);
 */		
		
		     document.getElementById("edituid").value=tds[0].innerHTML
			 document.getElementById("uname").value=tds[1].innerHTML
		     document.getElementById("contact").value=tds[2].innerHTML;
			 document.getElementById("email").value=tds[3].innerHTML;
			 document.getElementById("flat").value=tds[4].innerHTML;
			 document.getElementById("userblockselect").innerHTML='<option value="'+appId+'">'+appName+'</option>';
			 document.getElementById("userblockselect"). disabled=true;
  }
  
  
  function clean(){
	  
	  document.getElementById("edituid").value="0";
	  document.getElementById("uname").value="";
	  document.getElementById("uname").style.borderColor = "";
	  document.getElementById("namevalid1").innerHTML= "";
	  document.getElementById("nameexists1").innerHTML= "";
	  document.getElementById("contact").value="";
	  document.getElementById("contact").style.borderColor = "";
	  document.getElementById("phonevalid1").innerHTML= "";
	  document.getElementById("email").value="";
	  document.getElementById("email").style.borderColor = "";
	  document.getElementById("emailexists1").innerHTML= "";
	  document.getElementById("emailvalid1").innerHTML= "";
	  document.getElementById("flat").value="";
	  document.getElementById("flat").style.borderColor = "";
	  document.getElementById("failure1").style.display= "none";
	 // document.getElementById("userblockselect").innerHTML="<option value='0'>--select--</option>";
	  document.getElementById("userblockselect").style.borderColor = "";
	  document.getElementById("userblockselect").selectedIndex = 0;
	  getapp();
  }
  
  /* function checkUsername(){
		var uname=document.getElementById("uname").value;
	   if(uname!=''){
	   $.ajax({
         url: 'validateUserName',
         type: 'POST',
         //data: 'orgId='+orgid+'&appId='+appid+'&devId='+devid,
         data: jQuery.param({uname: uname}) ,
         success: function (data) {
      	   if(data!=''){
      	  	//	alert(data); 
      		  document.getElementById("uname").style.borderColor = "red";
    		  document.getElementById("nameexists1").innerHTML= data;
    		  document.getElementById("uname").focus();
   		      document.getElementById("uname").addEventListener("keyup", onFocusOut);
      	   }
             },
		 		error: function(e){
	     			        alert('Error: ' + e);
	     		 }

            
         });
	   }  
	  return false;
 }
 
 function checkEmail(){
	   var email=document.getElementById("email").value;
	   if(email!=''){
		   $.ajax({
	           url: 'validateEmail',
	           type: 'POST',
	           data: jQuery.param({email: email}) ,
	           success: function (data) {
	        	   if(data!=''){
	        	  		//alert(data);
	        		   document.getElementById("email").style.borderColor = "red";
		        	   document.getElementById("emailvalid1").innerHTML=data;
		        	   document.getElementById("email").focus();
		       		   document.getElementById("email").addEventListener("keyup", onFocusOut);
	        	   }
	               },
			 		error: function(e){
		     			        alert('Error: ' + e);
		     		 }

	              
	           });
		   }
	   return false;
 }
  */
 function onFocusOut()
 {

 	document.getElementById(this.id).style.borderColor = "";
 	document.getElementById(this.id).parentNode.getElementsByTagName('span')[0].innerHTML="";
 	document.getElementById(this.id).parentNode.getElementsByTagName('span')[1].innerHTML="";
 } 
 
 function getdevbyapp(){
		
	 var appid= document.getElementById("filterblockselect").value.split(":")[0];
	 
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	 console.log(this.responseText);
		   
		    	 document.getElementById("watermeterselect").innerHTML="<option value='0'>--Select--</option>"+this.responseText;
		    	 
		    	 
		    }
		  };
		  xhttp.open("GET", "getDevEUISync?appId="+appid, true);
		  xhttp.send();
	}

function enduserwaterconsumption(){
	var devid = document.getElementById("watermeterselect").value;
	var fromDate = document.getElementById("fromDate").value;
	var toDate =  document.getElementById("toDate").value;

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			//console.log(this.responseText)
			//alert("WaterConsumption is   "+ this.responseText);
			document.getElementById("wc").innerHTML ="WaterConsumption is   "+ this.responseText;
			//setTimeout(function(){ window.location.reload() }, 2000);
		}
	};
	xhttp.open("POST", "endUserwaterconsumption", true);
	xhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xhttp.send("devid=" + devid + "&fromDate=" + fromDate + "&toDate=" + toDate);
}
	

function cleanfile(){
	document.getElementById("uploadExcel").value="";
	 modalalert.modal('show');
	 
     modalalert.find('.modal-body').append(""); 
	
}

</script>

</body>
<style>

*{
   font-family:Segoe UI;
 }
body{
font-family:Segoe UI;
}


.input-sm {
    height: 30px;
    padding: 5px 10px;
    font-size: 13px;
    line-height: 1.5;
    border-radius: 3px;
}

.loader {
 margin-top:100px;
  margin-left:100px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

 
 
  
</style> 
<style >
.table-bordered>thead>tr>th{
    border: 1px solid transparent;
     background-color:#64B246;
    
}
  
 
 
table.dataTable thead .sorting:after {
    opacity: 0.2;
    content: "\e138";
     
}
table.dataTable thead .sorting_desc:after {
    content: "\e138";
     
}
table.dataTable thead .sorting{
    content: "\e138";
     background-color:#24659F
}
table.dataTable thead .sorting_asc:after {
    content: "\e138";
}
     </style>  
</html>
