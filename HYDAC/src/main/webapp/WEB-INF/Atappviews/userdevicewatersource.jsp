<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Device Mapping</title>
  
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <link rel="icon" type="image/png" href="dashboard/dist/img/Watermeter.png" style="">
        
        <style >
        
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
    background-color:#24659F;
}
table.dataTable thead .sorting_asc:after {
    content: "\e138";
}
     </style>         
        
</head>

<body class="hold-transition skin-blue skin-black sidebar-mini"  onload="getmyorg()">

 
<div class="wrapper">
 <%@include file="Header_v3.jsp"%>
<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Device Mapping <small></small>
				</h1>
				
		
			<div class="row">
      
        </div>
			
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
             <div class="row">
             <div class="col-sm-12">
             <div class="table-responsive">
             <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead>
                <tr role="row" style="color:#ffff;">
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column ascending" style="width: 231px;">Device</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 282px;">Water Source</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 251px;">Flat</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 200px;">Water Meter scale</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 251px;">Last Modified On</th>
                
                 
</tr>
                </thead>
                <tbody id="userslist">
                
                
                
               </tbody>
               
              </table></div></div></div>
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
<script>
var devicesist;

var myorgid;

var dummyJson;

var usersforapp;

var tabl;

function changemyeditor(eachrow){
	
    var rownumber;
	var devid;
	var devname;
	var userid;
	var appid = document.getElementById("filterblockselect").value.split(":")[0];
	var wsid;
	rownumber  = eachrow.parentElement.parentElement.rowIndex
	devid = eachrow.parentElement.parentElement.getElementsByTagName("td")[0].getElementsByTagName("input")[0].value
	devname = eachrow.parentElement.parentElement.getElementsByTagName("td")[0].getElementsByTagName("span")[0].innerHTML
	wsid = eachrow.parentElement.parentElement.getElementsByTagName("select")[0].value;
	userid = eachrow.parentElement.parentElement.getElementsByTagName("select")[1].value;
	ppltr = eachrow.parentElement.parentElement.getElementsByTagName("td")[3].getElementsByTagName("input")[0].value;
	

    if(devid != null){
		
		saveearlier(devid,devname,wsid,userid,appid,rownumber,ppltr);	
		
		
	}
	

	
	
	
	
}



function saveearlier(devid,devname,wsid,userid,appid,rownum,ppltr,ppltrid){
	
	var userlisttale = document.getElementById("userslist");
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    try{
	    	var result = this.responseText;
	    	console.log(result);
	   var updated = 	result.split("-")[0].split("=")[1]
	   var rownumber = 	result.split("-")[1].split("=")[1]
	   var pulseperltr = result.split("&")[1].split("=")[1]
	   console.log("ppltr"+pulseperltr);
	   
	   var spann = '<span style="color:green">'+updated+'</span>'
		    	
	    	userlisttale.getElementsByTagName("tr")[rownumber-1].getElementsByTagName("td")[4].innerHTML = spann;
	   userlisttale.getElementsByTagName("tr")[rownumber-1].getElementsByTagName("td")[3].getElementsByTagName("input")[0].value = pulseperltr;
	   
	    }catch(e){
	    	
	    	
	    	console.log(e);
	    }
	    }
	  };
	  xhttp.open("GET", "saveudm?devid="+devid+"&devname="+devname+"&wsid="+wsid+"&userid="+userid+"&appid="+appid+"&orgid="+myorgid+"&rownum="+rownum+"&ppltr="+ppltr, true);
	  xhttp.send();
	
	
	
	
}

function getusersbyapp(){
	  
	  var appId= document.getElementById("filterblockselect").value.split(":")[0];
		
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	console.log(this.responseText);
	    	usersforapp =  JSON.parse(this.responseText);
	    	
	    	getdevices();	
	    }
	  };
	  xhttp.open("GET", "getusersbyapp?appid="+appId, true);
	  xhttp.send();
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
	    	
	    	// document.getElementById("userblockselect").innerHTML="<option value='0'>--select--</option>"+this.responseText;
	    	// document.getElementById("downloadtemplatespp").innerHTML="<option value='0'>--select--</option>"+this.responseText;
	    	
	    	 
	    	 getwatersources();
	    	 
	    	 // filterblockselect 
	    
	    }
	  };
	  xhttp.open("GET", "getApplications?orgId="+myorgid, true);
	  xhttp.send();
}


function getdevices(){
	
	var appId= document.getElementById("filterblockselect").value.split(":")[0];
	 var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	devicesist =   this.responseText;
	    	
	    	console.log(devicesist)
	    	show()
	    }
	  };
	  xhttp.open("GET", "getDevicesForApp?appId="+appId, true);
	  xhttp.send();
	
	
}



function getwatersources(){
	var appId= document.getElementById("filterblockselect").value.split(":")[0];
	
	 var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	dummyJson = JSON.parse(this.responseText);
	
	    	
	    	console.log(dummyJson)
	    }
	  };
	  xhttp.open("GET", "watersourceForappOrg?appid="+appId+"&orgid="+myorgid, true);
	  xhttp.send();	 	
	
	
}
 function show(){
	 
	 if(tabl != null)
	 tabl.destroy();
	 
	  var json = JSON.parse(devicesist);
	
	  var tbody = document.getElementById("userslist");
	  
	  tbody.innerHTML="";
	  console.log(json)
		
	  
	  for(var i in json){
		  
		var tr =  document.createElement("tr");
		tr.setAttribute("role","row");
		
		tr.setAttribute("class","odd");
		
		var td1 =  document.createElement("td");
		var td2 =  document.createElement("td");
		var td3 =  document.createElement("td");
		var td4 =  document.createElement("td");
		var td5 =  document.createElement("td");
		
		td5.innerHTML = json[i].updated;
		
		var inp1 = document.createElement("input");
		inp1.type = "hidden";
		inp1.name="devid";
		inp1.value=json[i].devid;
		
		var span = document.createElement("span");
		span.innerHTML = json[i].deviceName;
		
		document.createElement("td");
		td1.appendChild(inp1)
		td1.appendChild(span)
		
		td1.setAttribute("class","sorting_1");
	
		var select =  document.createElement("select");
		select.setAttribute("class","form-control");
		select.setAttribute("kind","ws");
		select.setAttribute("onchange","changemyeditor(this)");
		
		
		var optionx =  document.createElement("option");
		optionx.setAttribute("value",0);
		optionx.innerHTML = "--Select--";
		select.appendChild(optionx);
		
		for(var j in dummyJson){
			var option =  document.createElement("option");
			option.setAttribute("value",dummyJson[j].wsId);
			
			
			
			if(dummyJson[j].wsId == json[i].watersource){
				
				option.selected = true;
				
			}
			
			option.innerHTML = dummyJson[j].wsname;
			select.appendChild(option);
			
		}
		
		
		td2.appendChild(select); 
		
		
		
		var select1 =  document.createElement("select");
		select1.setAttribute("class","form-control");
		select1.setAttribute("kind","flat");
		select1.setAttribute("onchange","changemyeditor(this)");
		
		var optiony =  document.createElement("option");
		optiony.setAttribute("value",0);
		optiony.innerHTML = "--Select--";
		select1.appendChild(optiony); 
		
		
		for(var k in usersforapp){
			
			//console.log(usersforapp[k])
		 	var option =  document.createElement("option");
			option.setAttribute("value",usersforapp[k].id);
			
			
			option.innerHTML = usersforapp[k].flat +" -- " +usersforapp[k].uname;
			
if(usersforapp[k].id == json[i].userid){
				
				option.selected=true;
				
			}
			
			
			select1.appendChild(option); 
			
		}
		
		
		
		td3.appendChild(select1); 
		
		
		
		
		 
		 
		 
		 
		 var inp2 = document.createElement("input");
			inp2.type = "text";
			//inp2.name="ppltr";
			//inp2.setAttribute("placeholder","Enter pulse per ltr");
			inp2.setAttribute("onchange","changemyeditor(this)");
			
			if(json[i].pulseperltr=="" || json[i].pulseperltr==null){
				
				inp2.setAttribute("placeholder","Litres per pulse");
			}else{ 
				inp2.value=json[i].pulseperltr;
			}
			
			
			td4.appendChild(inp2);

		
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
			
		tbody.appendChild(tr);
		
			//  }
	  }
  
	tabl =  $('#example1').DataTable()
	
  }


 
</script>
 
 
 

</body>
</html>