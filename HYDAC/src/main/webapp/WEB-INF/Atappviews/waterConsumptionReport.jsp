
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Water Consumption</title>
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <!-- Font Awesome -->
   <link rel="stylesheet" href="dashboard/bower_components/font-awesome/css/font-awesome.min.css">
 
 <link rel="stylesheet" href="dashboard/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="dashboard/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- jQuery 3 -->
	<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
  <link rel="stylesheet" href="dashboard/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dashboard/dist/css/skins/_all-skins.min.css">
  
  <link rel="stylesheet"
	href="dashboard/customcolors/unizencolors.css">


<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<link rel="icon" type="image/png" href="dashboard/dist/img/Watermeter.png" style="">
	
	
	
 <!-- Bootstrap Date-Picker Plugin -->

       <script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
      <script  src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"> </script> 
      <script src="dashboard/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
       <script src="dashboard/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
       <!-- SlimScroll -->
<script src="dashboard/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<!-- AdminLTE App -->
<script src="dashboard/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dashboard/dist/js/demo.js"></script>
       
      <!--  Bootstrap 3.3.7 -->
       <link rel="stylesheet" href="dashboard/bower_components/bootstrap/dist/css/bootstrap.min.css">
       
     <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>  -->
    
  
       <!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
     <!--   <link rel="stylesheet"  href="dashboard/bower_components/moment/min/moment.min.js"> -->
      
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>  
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker.min.css"> 
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker-standalone.css"> 
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/js/bootstrap-datetimepicker.min.js"></script>
      
      
      
      
      
      
     
     
     <style >
  
  
   *{
   font-family:Segoe UI;
 }
 
 body{
 font-family:Segoe UI;
 }
 table{
 border-color:#f1f1f1;
 }
 
 .input-sm {
    height: 30px;
    padding: 5px 10px;
    font-size: 13px;
    line-height: 1.5;
    border-radius: 3px;
}
 
 .table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, 
 .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
    border: 1px solid #f1f1f1;
}
 .table-bordered>thead>tr>th{
    border: 1px solid transparent;
    background-color:#64B246;
    color:#ffff;
}
  
 
 
table.dataTable thead  .sorting:after {
    opacity: 0.2;
    content: "\e138";
      
}
table.dataTable thead  .sorting_desc:after {
    content: "\e138";
    
}
table.dataTable thead  .sorting{
    content: "\e138";
    background-color:#24659F
}
table.dataTable thead  .sorting_asc:after {
    content: "\e138";
      
}
     </style>   
      
      
     
</head>

 
<body class="hold-transition skin-blue skin-black sidebar-mini" onload="getmyorg()">

 
<div class="wrapper">
  <%@include file="Header_v3.jsp"%>
<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Water Consumption <small></small>
				</h1>
			</section>
			<section class="content">
			<div class="box">
            <div class="box-header">
             
             <div class="row">
              <div class="col-xs-2"> 
              Select Block</div>
             <div class="col-xs-2"> 
               <select onchange="getusersbyapp()" class="form-control" id="filterblockselect">
               
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
                <tr role="row">
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 231px;">User Id</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 145px;">User Name</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 251px;">Phone</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 198px;">Email</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">Flat/Residence</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 282px;">View Consumption</th> 
                </tr>
                </thead>
                <tbody id="userslist">
                
                
                
               </tbody>
               
              </table></div></div>
              </div>
              </div>
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
 





<!-- page script -->

<!-- Modal for view consumption -->
<div class="modal fade in" id="modalview" data-keyboard="false" data-backdrop="static" style="display:none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93;color:#ffff">
                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="cleanwaterconsumption()"  >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                <h4 class="modal-title" style="color:#ffff">Water Consumption</h4>
              </div>
              <div class="modal-body" style="background-color:#f9f9f9">
                
                <div class="box-body">           
                <div class="form-group">
                  <label for="watermeter">WaterMeter</label>
                  <select class="form-control text-center"  id="watermeterselect">
														
											</select>
                </div>
               
               <div class="form-group">
                   <label>From Date</label>
		        <div class='input-group date' id='datetimepicker1'>
		          <input type='text' name="fromDate" id="fromDate" class="form-control" placeholder="Please choose"/>
		            <div class="input-group-addon">
		            	<span class="glyphicon glyphicon-calendar"></span>    
		            </div>
		           
		         </div>
			  </div>
				
			 	
				 <label for="todate">To Date</label>
			       <div class='input-group date' id='datetimepicker2'>
			          <input type='text' name="toDate" id="toDate" class="form-control" placeholder="Please choose"/>
			            <div class="input-group-addon">
			            	<span class="glyphicon glyphicon-calendar"></span>
			            </div>
			        </div> 
			        
			         <div class="alert" id="wc">
           
                     </div>
                     
                      <div id="wsreport">
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
<div class="modal modal-info" id="modal-info-alert" data-backdrop="static" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <!--   <span aria-hidden="true">×</span> -->
                  </button>
                <h4 class="modal-title">Info Modal</h4>
              </div>
              <div class="modal-body">
         
              </div> 
               <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-right" data-dismiss="modal" onclick="cleanfile()">close</button>
              </div> 
            </div>
            
          </div>
         
        </div>  
        
  
<script>

var myorgid;
var modalalert = $("#modal-info-alert");
var modal=document.getElementById("modal-info-alert");

$(function() {
	  $('#datetimepicker1').datetimepicker({maxDate: new Date()});
	  $('#datetimepicker2').datetimepicker({maxDate: new Date()});
        
	});

function getmyorg(){
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	myorgid = this.responseText;
	    	
	    	getapp();
	    	
	    	
	    }
	  };
	  xhttp.open("GET", "getMyorgId", true);
	  xhttp.send();
}

  function getapp(){
		
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	// console.log(this.responseText);
		
		    	 document.getElementById("filterblockselect").innerHTML="<option value='0'>--Select--</option>"+this.responseText;
	           
		    }
		  };
		  xhttp.open("GET", "getApplications?orgId="+myorgid, true);
		  xhttp.send();
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
		
		
		td1.innerHTML = json[i].id
		td1.setAttribute("class","sorting_1");
	
		
		td2.innerHTML = json[i].uname
		td3.innerHTML = json[i].contactnumber
		td4.innerHTML = json[i].emailId
		td5.innerHTML = json[i].flat
		td6.innerHTML = '<button type="button"  id="uid" value="'+json[i].id+'" onclick="getdevbyuser(this)" class="btn btn-success" data-toggle="modal" data-target="#modalview" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;">View</button>'
		
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
		tr.appendChild(td6);
		
		
		tbody.appendChild(tr);
		
			  }
  
	  tabl= $('#example1').DataTable();
  }
  
 
  
 function onFocusOut()
 {

 	document.getElementById(this.id).style.borderColor = "";
 	document.getElementById(this.id).parentNode.getElementsByTagName('span')[0].innerHTML="";
 	document.getElementById(this.id).parentNode.getElementsByTagName('span')[1].innerHTML="";
 }
 
 
 function getdevbyuser(values){
		
	      var userid = values.value;
		 // alert("userid"+userid);
		  var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		   //  console.log(this.responseText)
		     
		 
		  var selectdata = document.getElementById("watermeterselect").innerHTML="<option value='0'>--select--</option>";
		 
		    var jsonData = JSON.parse(this.responseText);
		   for (var key in jsonData) {
			   
			   selectdata +='<option value="'+jsonData[key].deveui+'">'+jsonData[key].devNode+'</option>';
			  
		   }    
		  
		  document.getElementById("watermeterselect").innerHTML=selectdata;
		
		   
		    }
		  };
		  xhttp.open("GET", "getDevbyUser?userid=" + userid, true);
	    xhttp.send();		  
	}
 

function enduserwaterconsumption(){
	var devid = document.getElementById("watermeterselect").value;
		//alert("devid"+devid);
	var fromDate = document.getElementById("fromDate").value;
	var toDate =  document.getElementById("toDate").value;
	
	if(devid==false){
		 document.getElementById("watermeterselect").style.borderColor = "red";
		 document.getElementById("watermeterselect").focus();
		 document.getElementById("watermeterselect").addEventListener("change", onFocusOut);
		return false;
	}else if(fromDate==""){
		document.getElementById("fromDate").style.borderColor = "red";
		document.getElementById("fromDate").focus();
	    document.getElementById("fromDate").addEventListener("blur", onFocusOut);
		 return false;
		 
	}else if(toDate==""){
		 document.getElementById("toDate").style.borderColor = "red";
		 document.getElementById("toDate").focus();
		 document.getElementById("toDate").addEventListener("blur", onFocusOut);
		 return false;
	}else{

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			
			//console.log(this.responseText)
		
			
			//alert("WaterConsumption is   "+ this.responseText);
		 if(this.responseText=="null"){
			document.getElementById("wc").innerHTML ="No Water Consumption";
		}else{
			document.getElementById("wc").innerHTML ="Total Water Units Consumed  "+ '<b>'+this.responseText+'</b>';
			
			
			
			//setTimeout(function(){ window.location.reload() }, 2000);
	     	}
		} 
	};
	xhttp.open("POST", "endUserwaterconsumption", true);
	xhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xhttp.send("devid=" + devid + "&fromDate=" + fromDate + "&toDate=" + toDate);
	}
}
	

function cleanwaterconsumption() 
{
	document.getElementById("fromDate").value= "";
	document.getElementById("toDate").value= "";
	document.getElementById("wc").innerHTML="";
	 document.getElementById("watermeterselect").style.borderColor = "";
	//document.getElementById("watermeterselect").innerHTML="<option value='0'>--select--</option>";
	
}
</script>



  






</body>

</html>
