<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Water Source</title>
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="dashboard/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="dashboard/bower_components/font-awesome/css/font-awesome.min.css">
 
  
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
        .table-alignment {
  table-layout: fixed;
  width: 100%;
  white-space: nowrap;
}
td, th { border-top: 1px solid #f4f4f4; ;
height:35px;
padding-left:6px;
 }
 *{
   font-family:Segoe UI;
 }
 
 body{
 font-family:Segoe UI;
 }
        </style>
        
</head>

<body class="hold-transition skin-blue skin-black sidebar-mini" onload="AddwaterSource()">

 
<div class="wrapper" style="display:block" >
 <%@include file="Header_v3.jsp"%>

 
  <!-- Left side column. contains the logo and sidebar -->
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      Add Water Source        
      </h1>
     
    </section>

    <!-- Main content -->
    <section class="content">
     <div class="row">
   <!--   <div class="col-lg-10 col-xs-12"></div> -->
     
      <div class="col-lg-2 col-xs-12">
     
    <button type="button" class="btn btn-info pull-left" data-toggle="modal" data-target="#modal-info" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;">
              <i class="glyphicon glyphicon-tint" ></i> Add Water Source
              </button>
      </div>
     </div>
      <div  id="watersourcelist" class="row" style="margin-top: 40px">
        
        
        
        
      
        
         
        <!-- /.col -->
      </div>
      </section>
      
      <section class="content-header">
      <h1>
       Water Source - Add Billing Constraints
      </h1>
     
    </section>
      
      <section class="content">
      <div class="box">
      <div class="row">
      
       <div id="" class="col-sm-12">
     <table class="table" style="background-color:white"><tbody>
     
     <tr style="background-color:white;font-weight:bold"><td><input type="hidden" name="watersourceId" value="undefined">
      Add New Constraint For </td><td> <span id="watersourceselect"></span></td><td></td><td></td><td></td></tr><tr><td>Effective From 
      <input class="form-control" type="date" name="" id="mindateeffectivedate" min=""></td><td>From Unit
       <input class="form-control" type="number" readonly="" value="0" name="From"></td><td>
       To Unit <input class="form-control" type="number" name="To"></td><td>Price/Unit1(&#x20b9;) 
       <input class="form-control" type="number" name="Price"></td><td>
       <button  class="btn btn-success"  style="background-color:#64B246;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;margin-top:20px"  onclick="savewateSourceConstr(this)">Save</button><br>
       <button  class="btn btn-success" name="new_slab" style="background-color:#64B246;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;margin-top:7px"  onclick="new_slab(this)">Add slab</button>
       </td>
       </tr></tbody></table>
     </div>
      </div>
      </div>
      </section>
      <section class="content-header" style="margin-top:-40px">
      <h1>
      Water Source - Existing Billing Constraints
        
      </h1>
     
    </section>
      <section class="content">
     
      <div class="row">
       <div class="col-xs-12">
        
       
       <div class="table-responsive">
      <div id="waterSources" >
      </div>
      </div>
      </div>
      </div>
     
      <!-- /.row -->
    </section>
    <!-- /.content -->
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
 
        <!-- /.modal -->
<!-- jQuery 3 -->
<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


<!-- SlimScroll -->
<script src="dashboard/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<!-- AdminLTE App -->
<script src="dashboard/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dashboard/dist/js/demo.js"></script>
<!-- page script -->

<div class="modal fade in" id="modal-info" data-keyboard="false" data-backdrop="static" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93;color:#ffff ">
                <button type="button" class="pull-right" id="userclose"data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="clean()"  >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
              
                <h4 class="modal-title">Add water source</h4>
              </div>
              <div class="modal-body" style="background-color:#f9f9f9">
                <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label"style="margin-right:-80px" >Water Source &nbsp;:&nbsp;</label>

                  <div class="col-sm-8" >
                    
                    <input class="form-control" type="hidden" name="wsid" id="wsid" value="0" placeholder="Enter WaterSource">
                    
                    <input class="form-control" type="text" name="WS" id="WS" placeholder="Enter WaterSource" onkeyup="onFocusOut()">
                    <span id="wsexists" style="color: red;"></span>
                    <span id="wssaved" style="color: green;"></span>
                    <span id="wsvalid" style="color: red;"></span>
                  </div>
                </div>
              <div class="form-group text-center">
                  <button  class="btn btn-success" style="background-color:#235E93;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0; margin-top:50px"  onclick="savewaterSource()" >Save</button>
                 
                </div>
               
              </div>
              </div>
              
            </div>
            <!-- /.modal-content -->
          </div>
         
        </div>
        
   <div class="modal fade in" id="modal-info-alert" data-keyboard="false" data-backdrop="static" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93;color:white">
                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0">
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                <h4 class="modal-title">Error message</h4>
              </div>
              <div class="modal-body text-center"style="background-color:#f9f9f9">
         
              </div> 
            </div>
            
          </div>
         
        </div>  
     
          
         <!-- /.donot delete below -->
          <!-- /.donot delete below-->
           <!-- /.donot delete below-->
            <!-- /.donot delete below-->
             <!-- /.donot delete below-->
              <!-- /.donot delete -->
              
        
          <div class="col-lg-4 col-xs-6" id="widgetref" style="display:none;">
          <!-- small box -->
          <div class="small-box bg-aqua" >
          
            <div class="inner" style=" overflow-wrap: break-word;width:290px;" >
           
              <h4>Bore Well</h4>

              <p>id : </p>
              
            </div>
            <div class="icon">
              <i class="fa fa-tint"></i>
            </div>
            <a href="#" data-toggle="modal" data-target="#modal-info"  class="small-box-footer" style="margin-top:10px">
             Edit <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        
        
        
<script>

var dummyJson = [{"wsId":1,"billingConstraints":[{"bcid":11,"effectiveDate":1542825000000,"slabs":[{"units_from":1,"Slab_number":1,"price":1,"units_to":1}]},{"bcid":13,"effectiveDate":1542220200000,"slabs":[{"units_from":11,"Slab_number":1,"price":2,"units_to":23},{"units_from":23,"Slab_number":2,"price":1,"units_to":45}]}],"wsname":"bbmp"},{"wsId":2,"billingConstraints":[{"bcid":12,"effectiveDate":1542911400000,"slabs":[]}],"wsname":"recycled"},{"wsId":3,"billingConstraints":[],"wsname":"ground"}]

var modalalert = $("#modal-info-alert");
var modalwatersource = $("#modal-info");

function editws(id,name){
	modalwatersource.find('.modal-title').text('Edit water source');
	
	document.getElementById("wsid").value=id;
	document.getElementById("WS").value=name;
	
}

function getWaterSources(){
	var myDiv = document.getElementById("watersourceselect");

	//Create array of options to be added
	var selectList = document.createElement("select");
	selectList.id = "mySelect";
	selectList.setAttribute("class","form-control");
	myDiv.appendChild(selectList);
	 var option = document.createElement("option");
	    option.value =0;
	    option.text = "-- Select --";
	    selectList.appendChild(option);
	
	for(var i in dummyJson)
		{
		
		 var option = document.createElement("option");
		    option.value =dummyJson[i].wsId;
		    option.text = dummyJson[i].wsname;
		    selectList.appendChild(option);
		
		
		
		 var div = document.createElement("div");
         div.innerHTML = document.getElementById("widgetref").innerHTML;
  
	  div.setAttribute("class", "col-lg-4 col-xs-6");
	  
	 div.getElementsByTagName("p")[0].innerHTML = "Id : "+dummyJson[i].wsId
	 div.getElementsByTagName("h4")[0].innerHTML = dummyJson[i].wsname
	 div.getElementsByTagName("a")[0].setAttribute("onclick", "editws('"+dummyJson[i].wsId+"','"+dummyJson[i].wsname+"')");
	  document.getElementById("watersourcelist").appendChild(div)
       
		}
		
	}


	function AddwaterSource(){
		
		
		
	   var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			    	dummyJson = JSON.parse(this.responseText);
			    	getWaterSources()
			    	waterSourcesToTables()
			    }
			  };
			  xhttp.open("GET", "waterSourceForappOrg", true);
			  xhttp.send();	    
	}
	


function savewaterSource(){
	

	var watersource =document.getElementById("WS").value
	var i_d = document.getElementById("wsid").value
	var wsnameRegx=/^[A-Za-z0-9_]{4,30}$/;
	
	
	if(watersource=="")
		{
		
		document.getElementById("WS").style.borderColor = "red";
		document.getElementById("WS").focus();
		document.getElementById("WS").addEventListener("keyup", onFocusOut);
		return false;
		}
	else if(wsnameRegx.test(watersource)==false)
		{
		document.getElementById("WS").style.borderColor = "red";

		document.getElementById("wsvalid").innerHTML="Watersource name must be 4 - 30 characters long, contain only letters, numbers and _ ";

		document.getElementById("WS").focus();
		document.getElementById("WS").addEventListener("keyup", onFocusOut);
		return false;
		
		}
	
	else{

   var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	console.log(this.responseText);
	    	if(this.responseText=='saved') {
		    	document.getElementById("wssaved").innerHTML = 'Watersource saved successfully';
		    	setTimeout(function(){ window.location.reload() }, 1000);
		    	
		    }
	    	else 	
	    if(this.responseText=='exists'){
	    	//console.log("exists");
	    	document.getElementById("WS").style.borderColor = "red";
	    	document.getElementById("wsexists").innerHTML = 'Watersource already exists';
		    document.getElementById("WS").focus();
		    document.getElementById("WS").addEventListener("keyup", onFocusOut);
	    }
	 
	  //  location.reload();  
	    }
	    
	  };
	  xhttp.open("GET","addWaterSource?appId=0&orgid=0&watersource="+watersource+"&i_d="+i_d, true);
	  xhttp.send();
}
 
}	


function validation(table){
	
	var x = table.getElementsByTagName("TR");
	
	var nextFromVal;
	
	
	//console.log("validate"+document.getElementById("mySelect").value)
		
	if(document.getElementById("mySelect").value == 0){
	//	alert('Please Select Water Source To Configure')
	modalalert.modal('show');
	modalalert.find('.modal-body').text('Please Select Water Source To Configure');
		return -1;
	}
	
		for (i = 1; i < x.length; i++) {
			  var slab = {};
				slab['fromUnit']=x[i].getElementsByTagName("TD")[1].getElementsByTagName("INPUT")[0].value;
				 slab['toUnit']=x[i].getElementsByTagName("TD")[2].getElementsByTagName("INPUT")[0].value;
				 slab['pricePerunit']=x[i].getElementsByTagName("TD")[3].getElementsByTagName("INPUT")[0].value;
				 
				if(slab['fromUnit'] == ''){
					
					//alert('Please Provide From Unit at slab '+i)
					modalalert.modal('show');
	                modalalert.find('.modal-body').text('Please provide From unit for slab '+i);
				return -1;
					
				} 
				
				else if(slab['toUnit'] == ''){
			   
				//alert('Please provide TO unit at slab '+i)
				modalalert.modal('show');
	            modalalert.find('.modal-body').text('Please provide To unit for slab '+i);
					return -1;
				}
					
					
				else if(parseInt(slab['toUnit']) <= parseInt(slab['fromUnit'])){
					
					//alert('To Unit value must be greater than From Unit at slab '+i)
					modalalert.modal('show');
	                modalalert.find('.modal-body').text('To unit value must be greater than From unit at slab '+i);
				return -1;
				}
				else if(slab['pricePerunit'] == ''){
					
					//alert('please Provide price/unit at slab'+i)
					modalalert.modal('show');
	                modalalert.find('.modal-body').text('Please provide price/unit at slab'+i);
				return -1;
				}else if(parseInt(slab['pricePerunit']) < 0){
					
					//alert('price value must be greater than or equal to zero at slab '+i)
					modalalert.modal('show');
	                modalalert.find('.modal-body').text('Price value must be greater than or equal to zero at slab '+i);
				return -1;
				}
				else if(slab['toUnit'] != ''){
					
					nextFromVal = parseInt(slab['toUnit'])			
				
					x[i].getElementsByTagName("INPUT")[1].readOnly =true;
				}
				
				/* slab['pricePerunit']=x[i].getElementsByTagName("TD")[3].getElementsByTagName("INPUT")[0].value;
				 */ 
			
	}

		return nextFromVal;
}



function new_slab(newslabadd){
	
	var table = newslabadd.parentElement.parentElement.parentElement;
	var nextFromVal;
	var validationResponse = validation(table)
	
	 if(validationResponse == -1){
		
		return;
	}else{
		nextFromVal = validationResponse;
	}
	 
	
	var row = table.insertRow( newslabadd.parentElement.parentElement.parentElement.getElementsByTagName("TR").length);
	table.getElementsByTagName('input')[3].readOnly =true;
	var cell0 = row.insertCell(0);
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);
    var cell4 = row.insertCell(-1);
    
    cell1.innerHTML = 'From Unit <input class="form-control" type="number" readonly name="From" value="'+(nextFromVal)+'">';
    cell2.innerHTML = 'To Unit <input class="form-control" type="number" name="To">';
    cell3.innerHTML='Price/Unit <input class="form-control" type="number" name="Price">';
	
   cell4.innerHTML=' <button  class="btn btn-success"  style="background-color:#64B246;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;margin-top:16%"  onclick="deleteSlab(this)">Delete slab</button>' 
}


function deleteSlab(row){
	
	var trs =row.parentElement.parentElement.parentElement.getElementsByTagName('TR')
	var count =0;
	for(var i=0;i< trs.length;i++){
		
		if((trs[i] == row.parentElement.parentElement)){
			
            if(i == (trs.length - 1)){
				row.parentElement.parentElement.parentElement.removeChild(trs[i]);
			}else{
				//alert('please delete  below slabs rows to delete this');
				modalalert.modal('show');
				modalalert.find('.modal-body').text('Please delete  below slabs rows to delete this');
			}
       }
	}
}

function savewateSourceConstr(savingUnit){
	
	
var ws = savingUnit.parentElement.parentElement.parentElement;

  var validationResponse = validation(ws)
	
  console.log(validationResponse);
  
	if(validationResponse == -1){
		
		return;
	}
	
	var x = ws.getElementsByTagName("TR");
	var i;
	
	var json = {};
	var slabs = {};
	
	json['waterSourceId']=document.getElementById("mySelect").value;
	
	console.log("saving"+document.getElementById("mySelect").value)
	json['effectiveDate']=x[1].getElementsByTagName("TD")[0].getElementsByTagName("INPUT")[0].value;
	
	if(json['effectiveDate'] == ''){
		
		//alert('please select effective date')
	    modalalert.modal('show');
	    modalalert.find('.modal-body').text('Please select Effective From'); 
		return;
	}
	
	
	for (i = 1; i < x.length; i++) {
			  var slab = {};
				slab['fromUnit']=x[i].getElementsByTagName("TD")[1].getElementsByTagName("INPUT")[0].value;
				slab['toUnit']=x[i].getElementsByTagName("TD")[2].getElementsByTagName("INPUT")[0].value;
				slab['pricePerunit']=x[i].getElementsByTagName("TD")[3].getElementsByTagName("INPUT")[0].value;
				slabs[''+i] = slab;
			
	}
		
		json['slabs'] = slabs;
				

		console.log(json)
		
		var xhr = new XMLHttpRequest();
		var url = "url";
		xhr.open("POST", "saveConstr", true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onreadystatechange = function () {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		        
		    	location.reload();
		    }
		};
		var data = JSON.stringify(json);
		xhr.send(data);
		
		
		
}


function waterSourcesToTables(){
	
	
	var waters =document.getElementById('waterSources');
var watersources = dummyJson;


var table = document.createElement("TABLE");
table.setAttribute("class", "table");

table.setAttribute("style", "background-color:white");
var row = table.insertRow(0);
row.setAttribute("style","background-color:white;font-weight:bold")
    row.insertCell(-1);row.insertCell(-1);row.insertCell(-1);row.insertCell(-1);
var cell0 = row.insertCell(0);
cell0.innerHTML='<input type="hidden" name="watersourceId" value="'+id + '"/> Add New Configuration For '+name;

row  = table.insertRow(1);
cell0 = row.insertCell(0);
var cell1 = row.insertCell(-1);
var cell2 = row.insertCell(-1);
var cell3 = row.insertCell(-1);
var cell4 = row.insertCell(-1);
var tmrw = new Date(new Date().getTime()+24*60*60*1000);
var formatted =  tmrw.getFullYear()+'-'+(tmrw.getMonth()+1)+'-'+tmrw.getDate();
cell0.innerHTML='Effective From <input class="form-control"  type="date" name="" min = "'+formatted+'">'
cell1.innerHTML = 'From Unit <input class="form-control" type="number" readonly value="0" name="From">';
cell2.innerHTML = 'To Unit <input class="form-control" type="number" name="To">';
cell3.innerHTML='Price/Unit <input class="form-control" type="number" name="Price">';
cell4.innerHTML= '<input class="form-control" type="button" id="addbtn" name="new_slab" value="add_slab" onclick="new_slab(this)" style="background-color: #64B246; color: white;"><input type="button" class="form-control" style="background-color: #3c8dbc; color: white;" value="Save" onclick="savewateSourceConstr(this)">';


//waters.appendChild(table);


for(var i in watersources)
{
	
	
	
     var id = watersources[i].wsId;
     var name = watersources[i].wsname;
     
     
     
     var tableWS = document.createElement("TABLE");
     tableWS.setAttribute("class", "table");
     
    
     tableWS.setAttribute("style", "background-color:white;");
	   // var rowWS = tableWS.insertRow(0);
	   var tr1 = document.createElement("tr");
	   
	    //rowWS.setAttribute("style", "background-color:white;font-weight: bold");
	    tr1.setAttribute("style", "background-color:white;font-weight:bold;height:50px");
	   // var cell0WS = rowWS.insertCell(0);
	   // cell0WS.setAttribute("style","")
	   // cell0WS.innerHTML='<input type="hidden" name="watersourceId" value="'+id + '"/> Existing Billing Constraints for '+"<span style='color:#00c0ef'>"+name +"</span>"+' Water Source';
	   // rowWS.insertCell(-1);rowWS.insertCell(-1);rowWS.insertCell(-1);rowWS.insertCell(-1);
	   var td0 = document.createElement("td");
	   td0.setAttribute("colspan","5");
	   td0.innerHTML ='<input type="hidden" name="watersourceId" value="'+id + '"/> Existing Billing Constraints for '+"<span style='color:#00c0ef'>"+name +"</span>"+' Water Source';
	   tr1.appendChild(td0);
	   tableWS.appendChild(tr1);
	  var bcons = watersources[i].billingConstraints;
     
     for(var bc in bcons){
    	 
    	 
    	 
    	 
    	 var slabs = bcons[bc].slabs;
    	 
    	 var tr2 = document.createElement("tr");
    	// rowWS  = tableWS.insertRow(1);
    	
    	 //rowWS.setAttribute("style","background-color:white;font-weight: bold");
    	   tr2.setAttribute("style","background-color:white;font-weight: bold");
		     //rowWS.insertCell(0).innerHTML='Effective From : '+new Date(bcons[bc].effectiveDate).toLocaleDateString();
		    
			// rowWS.insertCell(-1).innerHTML="Slab Number";
			// rowWS.insertCell(-1).innerHTML="Units From";
			// rowWS.insertCell(-1).innerHTML="Units To";
			// rowWS.insertCell(-1).innerHTML="Price(&#x20b9;)";
			 var td1 = document.createElement("td");
			 var td2 = document.createElement("td");
			 var td3 = document.createElement("td");
			 var td4 = document.createElement("td");
			 var td5 = document.createElement("td");
			 var td6 = document.createElement("td");
			 
			 td1.setAttribute("id","effdate")
			 td1.innerHTML ='Effective From : '+new Date(bcons[bc].effectiveDate).toLocaleDateString();
			 td2.innerHTML ="Slab Number";
		     td3.innerHTML ="Units From";
			 td4.innerHTML ="Units To";
			 td5.innerHTML ="Price(&#x20b9;)";
			 td6.innerHTML ='<input type="button" data-toggle="collapse" data-target="#adslab" class="form-control"  id="addbtn" name="new_slab" value="Add slab" onclick="new_slab1(this)" style="background-color: #64B246; color: white;">';
				
			 
			 tr2.appendChild(td1);
			 tr2.appendChild(td2);
			 tr2.appendChild(td3);
			 tr2.appendChild(td4);
			 tr2.appendChild(td5);
			 tr2.appendChild(td6);
			 tableWS.appendChild(tr2);
			 
    	 for(var s in slabs){
    		 
    		//rowWS = tableWS.insertRow((parseInt(s)+parseInt(2)))
    		//rowWS.setAttribute("style","")
    		//rowWS.insertCell(-1);
    		//rowWS.insertCell(-1).innerHTML= slabs[s].Slab_number ;
    		//rowWS.insertCell(-1).innerHTML= slabs[s].units_from ;
    		//rowWS.insertCell(-1).innerHTML= slabs[s].units_to ;
    		//rowWS.insertCell(-1).innerHTML= slabs[s].price ;
    		 var tr3 = document.createElement("tr");
    		 
    		 var td6 = document.createElement("td");
			 var td7 = document.createElement("td");
			 var td8 = document.createElement("td");
			 var td9 = document.createElement("td");
			 var td10 = document.createElement("td"); 
		 
			 td6.innerHTML ="";
			 td7.innerHTML =slabs[s].Slab_number ;
		     td8.innerHTML =slabs[s].units_from ;
			 td9.innerHTML =slabs[s].units_to ;
			 td10.innerHTML =slabs[s].price ;
			 
			 tr3.appendChild(td6);
			 tr3.appendChild(td7);
			 tr3.appendChild(td8);
			 tr3.appendChild(td9);
			 tr3.appendChild(td10);
			 
			 tableWS.appendChild(tr3);
    	 }	 
    		
    	
			 var tr4 = document.createElement("tr");
			 tr4.setAttribute("id","adslab");
	    	 tr4.setAttribute("class","collapse");
			 
			/*  var td11 = document.createElement("td");
			 var td12 = document.createElement("td");
			 var td13 = document.createElement("td");
			 var td14= document.createElement("td");
			 var td15 = document.createElement("td"); 
		 
			 td11.innerHTML ="";
			 td12.innerHTML =slabs[s].Slab_number ;
		     td13.innerHTML = 'From Unit <input class="form-control" type="number" name="From">';
			 td14.innerHTML = 'To Unit <input class="form-control" type="number" name="To">';
			 td15.innerHTML ='Price/Unit <input class="form-control" type="number" name="Price">';
			 
			 
			
			 
			 tr4.appendChild(td11);
			 tr4.appendChild(td12);
			 tr4.appendChild(td13);
			 tr4.appendChild(td14);
			 tr4.appendChild(td15); */
			 
			  var td11 = document.createElement("td");
			 var td12 = document.createElement("td");
			 var td13 = document.createElement("td");
			 var td14= document.createElement("td");
			 var td15 = document.createElement("td"); 
		 
			 td11.innerHTML ="";
			 td12.innerHTML ="";
		     td13.innerHTML = "";
			 td14.innerHTML = "";
			 td15.innerHTML ="";
			 
			 
			
			 
			 tr4.appendChild(td11);
			 tr4.appendChild(td12);
			 tr4.appendChild(td13);
			 tr4.appendChild(td14);
			 tr4.appendChild(td15);
    		 
			 tableWS.appendChild(tr4);
    	
 	 	
     }

     
    waters.appendChild(tableWS);
   
}

}


function getExistingConstr(){
document.getElementById('waterSources').innerHTML = "";


	

var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    	dummyJson = JSON.parse(this.responseText);
    	
    //	console.log(dummyJson);
    	
    		if(Object.keys(dummyJson).length < 1){
    			
    			//alert("Water Sources Not Mapped to the above params , please map water sources to continue");
    			modalalert.modal('show');
	            modalalert.find('.modal-body').text('Water Sources Not Mapped to the above params , please map water sources to continue');
    	return;
    		}
    	waterSourcesToTables()
    }
  };
  xhttp.open("GET", "waterSourceForappOrg", true);
  xhttp.send();

}

function mineffectivedate(){
	
	//mindateeffectivedate
	var mindateeffectivedate = document.getElementById("mindateeffectivedate");
	var date = new Date();
	date.setDate(date.getDate() + 1)
	mindateeffectivedate.min = date.toISOString().split("T")[0];

	
	
}

function clean(){
	modalwatersource.find('.modal-title').text('Add water source');
	document.getElementById("WS").value = "";
	document.getElementById("wsexists").innerHTML = "";
	document.getElementById("wssaved").innerHTML = "";
	document.getElementById("wsvalid").innerHTML = "";
	 document.getElementById("WS").style.borderColor = "";
}

function onFocusOut()
{

	document.getElementById(this.id).style.borderColor = "";
	document.getElementById(this.id).parentNode.getElementsByTagName('span')[0].innerHTML="";
	document.getElementById(this.id).parentNode.getElementsByTagName('span')[1].innerHTML="";
	document.getElementById(this.id).parentNode.getElementsByTagName('span')[2].innerHTML="";
}

function validation1(table){
	
	var x = table.getElementsByTagName("TR");
	
	var nextFromVal1;
	
	
	//console.log("validate"+document.getElementById("mySelect").value)
		
	
	
		for (i = 1; i < x.length; i++) {
			  var slab = {};
				slab['fromUnit']=x[i].getElementsByTagName("TD")[1].getElementsByTagName("INPUT")[0].value;
				 slab['toUnit']=x[i].getElementsByTagName("TD")[2].getElementsByTagName("INPUT")[0].value;
				 slab['pricePerunit']=x[i].getElementsByTagName("TD")[3].getElementsByTagName("INPUT")[0].value;
				 
				if(slab['fromUnit'] == ''){
					
					//alert('Please Provide From Unit at slab '+i)
					modalalert.modal('show');
	                modalalert.find('.modal-body').text('Please provide From unit for slab '+i);
				return -1;
					
				} 
				
				else if(slab['toUnit'] == ''){
			   
				//alert('Please provide TO unit at slab '+i)
				modalalert.modal('show');
	            modalalert.find('.modal-body').text('Please provide To unit for slab '+i);
					return -1;
				}
					
					
				else if(parseInt(slab['toUnit']) <= parseInt(slab['fromUnit'])){
					
					//alert('To Unit value must be greater than From Unit at slab '+i)
					modalalert.modal('show');
	                modalalert.find('.modal-body').text('To unit value must be greater than From unit at slab '+i);
				return -1;
				}
				else if(slab['pricePerunit'] == ''){
					
					//alert('please Provide price/unit at slab'+i)
					modalalert.modal('show');
	                modalalert.find('.modal-body').text('Please provide price/unit at slab'+i);
				return -1;
				}else if(parseInt(slab['pricePerunit']) < 0){
					
					//alert('price value must be greater than or equal to zero at slab '+i)
					modalalert.modal('show');
	                modalalert.find('.modal-body').text('Price value must be greater than or equal to zero at slab '+i);
				return -1;
				}
				else if(slab['toUnit'] != ''){
					
					nextFromVal = parseInt(slab['toUnit'])			
				
					x[i].getElementsByTagName("INPUT")[1].readOnly =true;
				}
				
				/* slab['pricePerunit']=x[i].getElementsByTagName("TD")[3].getElementsByTagName("INPUT")[0].value;
				 */ 
			
	}

		return nextFromVal1;
}

 function new_slab1(addnewslab){
	
	//var table = addnewslab.parentElement.parentElement.parentElement;
		var tdata = addnewslab.getElementsByTagName('tr').getElementsByTagName('td')[1];
alert(tdata);
	//document.getElementsByTagName('table')[0].rows[2].firstChild.textContent;
	
	var row = table.insertRow(addnewslab.parentElement.parentElement.parentElement.getElementsByTagName("TR").rows);
	//table.getElementsByTagName('input')[3].readOnly =true;
	var cell0 = row.insertCell(0);
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);
    var cell4 = row.insertCell(-1);
    
    cell1.innerHTML = 'From Unit <input class="form-control" type="number" name="From">';
    cell2.innerHTML = 'To Unit <input class="form-control" type="number" name="To">';
    cell3.innerHTML='Price/Unit <input class="form-control" type="number" name="Price">';
	
   cell4.innerHTML=' <button  class="btn btn-success" style="background-color:#64B246;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;margin-top:16%"  onclick="savewateSourceConstr1(this)">Save</button>' 
}
 

function savewateSourceConstr1(savingUnit){
	
	
	var ws = savingUnit.parentElement.parentElement.parentElement;
	

		var x = ws.getElementsByTagName("TR");
		alert("ws"+x);
		var i;
		
		var json = {};
		var slabs = {};
		
		 json['waterSourceId']='6';
		
		//console.log("saving"+document.getElementById("mySelect").value)
		json['effectiveDate']='2019-02-04';
		
		if(json['effectiveDate'] == ''){
			
			//alert('please select effective date')
		    modalalert.modal('show');
		    modalalert.find('.modal-body').text('Please select Effective From'); 
			return;
		}
		
		 
		for (i = 1; i < x.length; i++) {
				  var slab = {};
					slab['fromUnit']='2000';
					slab['toUnit']='3000';
					slab['pricePerunit']='1';
					slabs[''+i] = slab;
				
		}
			
			json['slabs'] = slabs;
					

			console.log(json)
			
			var xhr = new XMLHttpRequest();
			var url = "url";
			xhr.open("POST", "saveConstr", true);
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.onreadystatechange = function () {
			    if (xhr.readyState === 4 && xhr.status === 200) {
			        
			    	location.reload();
			    }
			};
			var data = JSON.stringify(json);
			alert("data"+data);
			xhr.send(data);
			alert("data sent");
			
			
	}

</script>
</body >
</html>
