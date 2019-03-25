<%@ page errorPage="error.jsp" %> 
<%@page import="com.team.app.constant.AppConstants"%>
<%@page import="com.team.app.domain.*"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sync
</title>
  
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

<body class="hold-transition skin-blue skin-black sidebar-mini" onload="getmyorg()">

<%-- <div class="wrapper" style="display:block" >
 <%@include file="Header_v3.jsp"%>

 
  <!-- Left side column. contains the logo and sidebar -->
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   
   
   <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      Sync-Water Meter 

      </h1>
     
    </section>
    <section class="content">
				<div class="box">
					<div class="box-body">
						<div class="row">
							<div class="col-sm-6">

								<table class="table">

									<tr>
										<td align="center"><label>Blocks</label></td>
										<td><select class="form-control" id="applicationid"
											onchange="getdevbyapp()">

										</select></td>
									</tr>

									<tr>
										<td align="center"><label>WaterMeters</label></td>
										<td><select class="form-control" id="deviceid">
												<!-- <option value="0">Please Choose</option> -->
										</select></td>
									</tr>
									
									<tr>
										<td align="center"></td>
										<td><input type="button"
											class="form-control text-bold btn btn-success"
											style="background-color: #64B246; color: #ffff; backbox-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0;"
											value="Sync" onclick="return confirmValidate()" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>  
  </div>
  <!-- /.content-wrapper -->
  
 
<!-- /.content -->
    <div class="clearfix"></div>

  <!-- Control Sidebar -->
 
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
       <%@include file="footer_v2.jsp"%>
  <div class="control-sidebar-bg"></div>
   
 
</div>
 
<!-- ./wrapper --> --%>


         
<div class="wrapper">
 <%@include file="Header_v3.jsp"%>
<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Device Synchronization <small></small>
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
               <select onchange="getdevbyapp()" class="form-control" id="filterblockselect">
               
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
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 50px;">Sync</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 251px;">Last Modified On</th>
</tr>
                </thead>
                <tbody id="devlist">
                
                
                
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

   <script type="text/javascript">
      var myorgid;
      var devicelist;
      var tabl;
      var dummyJson;
   
   function syncdev(){
	   
	   var orgid=myorgid;
	   var appid= document.getElementById("filterblockselect").value.split(":")[0];
 	   var devid=document.getElementById("deviceid").value;
 		alert("devid"+devid);
	  /* if(appid=="0"){
		   alert("Please select Block");
		   document.getElementById("applicationid").focus();
		   return false;
	   }else if(devid=="0"){
		   alert("Please select WaterMeter");
		   document.getElementById("deviceid").focus();
		   return false;
	   }else{		   */ 
			   $.ajax({
	               url: 'syncDev',
	               type: 'POST',
	               //data: 'orgId='+orgid+'&appId='+appid+'&devId='+devid,
	               data: jQuery.param({ orgId: orgid, appId : appid, devId : devid}) ,
	               success: function (data) {
	             // alert(data);
	            //  alert("update"+data.split("-")[1])
	              // window.location.reload();
	            if(data!="No need to sync it again! Already synced" && data!="Water Meter syncing has failed! Thank you")	{
	            	document.getElementById('syncbtn').innerHTML="Synced";
	            	document.getElementById('syncbtn').disabled="true";
	            	document.getElementById('syncbtn').style.backgroundColor="#64B246";
	            	document.getElementById('update').innerHTML=data.split("-")[1];
	            	} 
	            },
	                   
	  		 		error: function(e){
	  	     			        alert('Error: ' + e);
	  	     		 }
	
	                  
	               });
			   
			  
	   		
	   		
   }
   
   
 
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
        		  
        		    	 document.getElementById("filterblockselect").innerHTML="<option value='0'>--Select--</option>"+this.responseText;
        		    	// getdevbyapp();
        		    }
        		  };
        		  xhttp.open("GET", "getApplications?orgId="+myorgid, true);
        		  xhttp.send();
        	}
            
            function getdevbyapp(){
        		
           	 var appid= document.getElementById("filterblockselect").value.split(":")[0];
           	 //alert("appid"+appid);
                 		var xhttp = new XMLHttpRequest();
           		        xhttp.onreadystatechange = function() {
           		    if (this.readyState == 4 && this.status == 200) {
           		    	 console.log(this.responseText);
           		    	 devicelist=this.responseText;
           		    	show()
           		    //	 document.getElementById("deviceid").innerHTML="<option value='0'>--Select--</option>"+this.responseText;
           		  
           		    }
           		  };
           		  xhttp.open("GET", "getDevForApp?appId="+appid, true);
           		  xhttp.send();
           	}
            
            function changemyeditor(eachrow){
            	//alert("called changeeditor()");
                var rownumber;
            	var devid;
            	var devname;
            	
            	var appid = document.getElementById("filterblockselect").value.split(":")[0];
            	
            	rownumber  = eachrow.parentElement.parentElement.rowIndex
            	//alert("rownumber"+rownumber);
            	devid = eachrow.parentElement.parentElement.getElementsByTagName("td")[0].getElementsByTagName("input")[0].value
            	devname = eachrow.parentElement.parentElement.getElementsByTagName("td")[0].getElementsByTagName("span")[0].innerHTML
                syncbtn = eachrow.parentElement.parentElement.getElementsByTagName("td")[1].getElementsByTagName("input")[0].value

             // alert("deviceID"+devid);
            //	alert("Syncbutton"+syncbtn);
            	
            	 if(devid != null){
            			
            			saveearlier(devid,devname,rownumber,syncbtn);	
            			
            			
            		}
            			
            	
            } 
            
            function saveearlier(devid,devname,rownum,syncbtn){
            	
            	var userlisttale = document.getElementById("devlist");
            	
            	 var orgid=myorgid;
            	 var appid= document.getElementById("filterblockselect").value.split(":")[0];
            	var xhttp = new XMLHttpRequest();
            	  xhttp.onreadystatechange = function() {
            	    if (this.readyState == 4 && this.status == 200) {
            	    try{
            	    	var result = this.responseText;
            	    	//console.log(result);
            	    	//alert("result"+result);
            	    	//alert("firstresult"+"    "+result.split("-")[0].split(".")[1]);
            	    	//var res = result.split("-")[0].split(".")[1];
            	 var updated = 	result.split("=")[0].split("-")[1];
            	 
            	//alert("update"+updated);
            	     var rownumber = 	result.split("=")[1];
            	   
            	   
            	   var spann = '<span style="color:green">'+updated+'</span>'
            		    	
            	    	userlisttale.getElementsByTagName("tr")[rownumber-1].getElementsByTagName("td")[2].innerHTML = spann; 
            	   
            	    	
            	    	
            	    		// userlisttale.getElementsByTagName("tr")[rownumber-1].getElementsByTagName("td")[1].getElementsByTagName("input")[0].value = res;
            	    		 	
         	        	userlisttale.getElementsByTagName("tr")[rownumber-1].getElementsByTagName("td")[1].getElementsByTagName("input")[0].disabled="true";
         	            userlisttale.getElementsByTagName("tr")[rownumber-1].getElementsByTagName("td")[1].getElementsByTagName("input")[0].style.backgroundColor="#64B246";
         	            userlisttale.getElementsByTagName("tr")[rownumber-1].getElementsByTagName("td")[1].getElementsByTagName("input")[0].value = "Synced"; 
         	            	
            	    	
            	    }catch(e){
            	    	
            	    	
            	    	console.log(e);
            	    }
            	    }
            	  };
            	  xhttp.open("GET", "syncDev?orgId="+orgid+"&appId="+appid+"&devId="+devid+"&rownum="+rownum, true);
            	  xhttp.send();
            	
            	//alert("data sent");
            	
            	 
            }

       
            function show(){
           	 
           	 if(tabl != null)
           	 tabl.destroy();
           	 
           	  var json = JSON.parse(devicelist);
           	
           	  var tbody = document.getElementById("devlist");
           	 
           	  
           	  tbody.innerHTML="";
           	  console.log(json)
           		
           	  
           	  for(var i in json){
           		  
           		var tr =  document.createElement("tr");
           		tr.setAttribute("role","row");
           		
           		tr.setAttribute("class","odd");
           		
           		var td1 =  document.createElement("td");
           		var td2 =  document.createElement("td");
           		var td3 =  document.createElement("td");
           	//	var td4 =  document.createElement("td");
           		
           	    td3.setAttribute("id","update")
           		td3.innerHTML = json[i].updated;
           		
           		var inp1 = document.createElement("input");
           		inp1.setAttribute("id","deviceid");
           	
           		inp1.type = "hidden";
           		inp1.name="devid";
           		inp1.value=json[i].devid;
           		//alert("value inputr"+inp1.value);
           		
           		var span = document.createElement("span");
           		span.innerHTML = json[i].deviceName;
           		
           		document.createElement("td");
           		td1.appendChild(inp1)
           		td1.appendChild(span)
           		
           td1.setAttribute("class","sorting_1");
          // 	alert(document.getElementById("resu").innerHTML);	
               // td2.innerHTML ='<input type="hidden" id="res">'
               
               if(json[i].syncstatus=="already synced"){
            	   td2.innerHTML  =	'<input type="button" value="Synced"  class="btn btn-primary btn-block" style="background-color:#64B246;color:white;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0" disabled>'
             		    
               }else{
               
      			td2.innerHTML  =	'<input type="button" value="Sync" id="sync" onclick="changemyeditor(this)" class="btn btn-primary btn-block" style="background-color:#91191c;color:white;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0">'
      		    
               }
      			/* 	td2.setAttribute("id","syncbtn");
      			var val= document.getElementById('syncbtn').value;
      			alert("VAlue"+val); */
      		
      			
      			
      			
      				//td2.setAttribute("onclick","changemyeditor(this)");
           	
           		/* var select =  document.createElement("select");
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
           		
           		
           		
           		
           		
           	 */   		
           		tr.appendChild(td1);
           		tr.appendChild(td2);
           		tr.appendChild(td3);
           		//tr.appendChild(td4);
          			
           		tbody.appendChild(tr);
           		
           			  }
             
           	tabl =  $('#example1').DataTable()
           	
             }


     </script>       
 
        

</body >
</html>
