<%--
    Author     : Vikky
--%>


<%@page import="com.team.app.constant.AppConstants"%>
<%@page import="com.team.app.domain.*"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Water Sources</title>

<script type="text/javascript" src="js/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/custom_siemens.css" rel="stylesheet">
<link href="css/marquees.css" rel="stylesheet">



<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/AdminLTE.min.css">
<link rel="stylesheet" href="css/AdminLTE.css">
<link rel="stylesheet" href="css/skins/_all-skins.min.css">


<script src="js/app.min.js"></script>
<script src="js/demo.js"></script>

<!-- Pie Charts... -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript">
   
   function confirmValidate(){
	   
	   var orgid=document.getElementById("orgid").value;
 	  	var appid=document.getElementById("appid").value;
 	  	var devid=document.getElementById("devid").value;
 	  	var orgDesc=document.getElementById("orgN").value;
	  	var appDesc=document.getElementById("appN").value;
	  	var devDesc=document.getElementById("devN").value;
 		
	   	   
	   if(orgid=="0"){
		   alert(orgDesc);
		   document.getElementById("orgid").focus();
		   return false;
	   }else if(appid=="0"){
		   alert(appDesc);
		   document.getElementById("appid").focus();
		   return false;
	   }else if(devid=="0"){
		   alert(devDesc);
		   document.getElementById("devid").focus();
		   return false;
	   }else{		   
			   $.ajax({
	               url: 'syncDev',
	               type: 'POST',
	               //data: 'orgId='+orgid+'&appId='+appid+'&devId='+devid,
	               data: jQuery.param({ orgId: orgid, appId : appid, devId : devid}) ,
	               success: function (data) {
	               alert(data);
	               window.location.reload();
	            	   //$(".success").html(data);
	                   	
	                   },
	  		 		error: function(e){
	  	     			        alert('Error: ' + e);
	  	     		 }
	
	                  
	               });
			   
			  return false;
	   		} 
	   		
   }
   
   
   function getKeywords(){	  
	   var typeId=document.getElementById("typeId").value;
	     
	   $.ajax({
           url: 'getKeywordByTypeId',
           type: 'POST',
           data: jQuery.param({ typeId: typeId }) ,
           success: function (data) {
        	       var obj=eval("(function(){return " + data + ";})()");
      		       var resultant=obj.result;        		
	        	   if(resultant.length==0){
	        		   alert("Data not found!");            		
	        	   }else{
	        		   for (var i = 0; i <resultant.length; i++) {
	        			    if(resultant[i].organisation!==undefined){
	        			    	
	        				     document.getElementById("oId").innerHTML="<b>"+resultant[i].organisation+"</b>";  
	        				     document.getElementById("orgN").value=resultant[i].desc; 
	        				}else if(resultant[i].application!==undefined){
								 document.getElementById("aId").innerHTML="<b>"+resultant[i].application+"</b>"; 
								 document.getElementById("appN").value=resultant[i].desc; 
							}else if(resultant[i].device!==undefined){
								 document.getElementById("dId").innerHTML="<b>"+resultant[i].device+"</b>";
								 document.getElementById("devN").value=resultant[i].desc; 
							}       			    
	        			}	  
	        	   }
        	
               },
		 		error: function(e){
	     			        alert('Error: ' + e);
	     		 }

              
           }); 
	   
  }  
   
function getAppByOrgID()
{    
            	var orgid=document.getElementById("orgid").value;
            	
            	if(orgid=="0")
                	{      
            	
                	var appid=document.getElementById("appid");
                	var devid=document.getElementById("devid");
                		appid.innerHTML='<select name="appname" id="appid" > <option value="0" >Please Choose</option></select>';
                		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >Please Choose</option></select>';
                		return;
                	}
                else
                	{
                	                
                var url="getApplications?orgId="+orgid;                                    
                xmlHttp=GetXmlHttpObject()
                if (xmlHttp==null)
                {
                    alert ("Browser does not support HTTP Request");
                    return
                }                    
                xmlHttp.onreadystatechange=setApplication;	
                xmlHttp.open("GET",url,true);                
                xmlHttp.send(null);
                
                	}
 }
            

                
            function GetXmlHttpObject()
            {
                var xmlHttp=null;
                if (window.XMLHttpRequest) 
                {
                    xmlHttp=new XMLHttpRequest();
                }                
                else if (window.ActiveXObject) 
                { 
                    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                }

                return xmlHttp;
            }
            
            
            function GetXmlHttpObj()
            {
                var xmlHttp=null;
                if (window.XMLHttpRequest) 
                {
                    xmlHttp=new XMLHttpRequest();
                }                
                else if (window.ActiveXObject) 
                { 
                    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                }

                return xmlHttp;
            }
        
            function setApplication() 
            {                      
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                { 
                    var returnText=xmlHttp.responseText;
                    var appid=document.getElementById("appid");
                    var devid=document.getElementById("devid");
                    appid.innerHTML='<select  name="appname" id="appid" ><Option value="0">Please Choose</Option>'+returnText+'</select>';  
                    devid.innerHTML='<select  name="devname" id="devid"><Option value="0">Please Choose</Option></select>';
                }
            }
            
            function setDevEUI() 
            {                      
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                { 
                    var returnText=xmlHttp.responseText;
                    var devid=document.getElementById("devid");
                    devid.innerHTML='<select  name="devname" id="devid"><Option value="0">Please Choose</Option>'+returnText+'</select>';                                             
                }
            }
            
            
          
            
     </script>

</head>

<body class="hold-transition skin-blue sidebar-mini">

	<%
		Map<String, Object> organisations = (Map<String, Object>) request.getAttribute("organisations");
		List<TblKeywordType> keyTypes = (List<TblKeywordType>) request.getAttribute("keyTypes");
	%>


	<div class="wrapper">
		<%@include file="Header.jsp"%>

		<div class="content-wrapper">

			<section class="content">
				<div class="content-wrap box box-primary">


					<div class="row">
						<div class="col-sm-12 text-right">
							<img src="images/user_iocn_header.png" />&nbsp;<b>Welcome <%=userSession.getUname()%></b>
						</div>

					</div>

					<div class="box-header with-border">
						<h5 class="text-blue text-left ">
							<span class="fa fa-upload"></span>&nbsp;&nbsp;<b>WaterSources</b>
						</h5>

					</div>
					<!-- /.box-header -->


					<div class="row">



						<div class="col-sm-6">



							<table class="table">
								<tr>
									<td align="right"><b>Housing Type</b></td>
									<td><select name="typeId" class="form-control" id="typeId"
										onchange="getKeywords()">
											<!-- <option value="0">Select Housing Type</option> -->
											<%
												if (keyTypes != null && !keyTypes.isEmpty()) {
													for (TblKeywordType type : keyTypes) {
											%>
											<option value="<%=type.getId()%>"><%=type.getType()%></option>
											<%
												}
												}
											%>
									</select> <%
 	for (TblKeyword key : keyTypes.get(0).getTblKeywords()) {
 		if (key.getKey().equalsIgnoreCase(AppConstants.orgName)) {
 			request.setAttribute("orgN", key.getValue());
 %> <input type="hidden" name="orgN" id="orgN"
										value="<%=key.getDesc()%>" /> <%
 	} else if (key.getKey().equalsIgnoreCase(AppConstants.appName)) {
 			request.setAttribute("appN", key.getValue());
 %> <input type="hidden" name="appN" id="appN"
										value="<%=key.getDesc()%>" /> <%
 	} else if (key.getKey().equalsIgnoreCase(AppConstants.devName)) {
 			request.setAttribute("devN", key.getValue());
 %> <input type="hidden" name="devN" id="devN"
										value="<%=key.getDesc()%>" /> <%
 	}
 %> <%
 	}
 %></td>

								</tr>
								<tr>
									<td id="oId" align="right"><b><%=(String) request.getAttribute("orgN")%></b></td>
									<%-- <td><input type="text" value="<%=orgName%>"  class="formbutton" id="<%=orgId%>" name="orgName" /></td>--%>

									<td><select name="orgname" class="form-control" id="orgid"
										onchange="getAppByOrgID()">
											<option value="0">Please Choose</option>
											<%
												if (userSession.getRoleBean().getType().equalsIgnoreCase(AppConstants.superAdmin)) {
													if (organisations != null && !organisations.isEmpty()) {
														for (Map.Entry<String, Object> map : organisations.entrySet()) {
											%>
											<option value="<%=map.getKey() + ":" + map.getValue()%>"><%=map.getValue()%></option>
											<%
												}
													}
												} else if (userSession.getRoleBean().getType().equalsIgnoreCase(AppConstants.admin)) {
													if (organisations != null && !organisations.isEmpty()) {
														for (Map.Entry<String, Object> map : organisations.entrySet()) {
															for (UserDeviceMapping udm : userSession.getUserDeviceMappings()) {
																if (udm.getOrgId().equals(map.getKey())) {
											%>
											<option value="<%=map.getKey() + ":" + map.getValue()%>"><%=map.getValue()%></option>
											<%
												}
															}
														}
													}
												}
											%>
									</select></td>
								</tr>
								<tr>
									<td id="aId" align="right"><b><%=(String) request.getAttribute("appN")%></b></td>

									<td><select name="appname" class="form-control" id="appid">
											<option value="0">Please Choose</option>
									</select></td>
								</tr>

								<%--  <tr>	
									   <td id="dId" align="right"><b><%=(String)request.getAttribute("devN")%></b></td>
									   
										 <td>
										 	<select name="devname" class="form-control" id="devid" >
										    	<option value="0">Please Choose</option>	
										    </select> 
										</td>
									</tr>  --%>


								<tr>
									<td></td>

									<td align="right"><input type="button"
										onclick="AddwaterSource()" class="form-control text-bold "
										style="background-color: #3c8dbc; color: white;"
										value="Configure WaterSources" />
										
										
										
										
										</td>
								</tr>



							</table>



						</div>

						<div id="watersource" class="col-sm-8"></div>

					</div>
				</div>
			</section>
			<%@include file="Footer.jsp"%>
		</div>
	</div>
	<script type="text/javascript">		
	var dummyJson = [{"wsId":1,"billingConstraints":[{"bcid":11,"effectiveDate":1542825000000,"slabs":[{"units_from":1,"Slab_number":1,"price":1,"units_to":1}]},{"bcid":13,"effectiveDate":1542220200000,"slabs":[{"units_from":11,"Slab_number":1,"price":2,"units_to":23},{"units_from":23,"Slab_number":2,"price":1,"units_to":45}]}],"wsname":"bbmp"},{"wsId":2,"billingConstraints":[{"bcid":12,"effectiveDate":1542911400000,"slabs":[]}],"wsname":"recycled"},{"wsId":3,"billingConstraints":[],"wsname":"ground"}]


function getWaterSources(){
	
	    var water =document.getElementById('watersource');  
	    var watersources = dummyJson;
	    
	    var table = document.createElement("TABLE");
		table.setAttribute("class", "table");
		   
		    var row  = table.insertRow(0);
		    var cell0 = row.insertCell(0);
		    var cell1 = row.insertCell(-1);
		    cell0.innerHTML ='<b>WSId</b>';
		    cell1.innerHTML ='<b>WSName</b>';
		   
		    
		for(var i in watersources)
		{
		     var id = watersources[i].wsId;
		     var name = watersources[i].wsname;
		      
		    var row  = table.insertRow(1);
		    cell0 = row.insertCell(0);
		    var cell1 = row.insertCell(-1);
		    var cell2 = row.insertCell(-1);
		    cell0.innerHTML ='<input type="hidden" name="paramId" value="'+id+'"/>'+ id;
		    cell1.innerHTML ='<a>'+name+'</a>';
		    cell2.innerHTML ='<input class="form-control" type="button" name="edit" id="editbtn" value="Edit" onclick="GotoWS(this)" style="background-color: #3c8dbc; color: white;">';
		    water.appendChild(table);
		
		}
		
	}


	function AddwaterSource(){
		
		 document.getElementById('watersource').innerHTML="";
		var appId=document.getElementById("appid").value.split(":")[0]
		var orgid= document.getElementById("orgid").value.split(":")[0]
		
		console.log(appId)
		if((orgid ==0) || (appId ==0)){
			alert("please fill above parameters to configure ")
			return;
		}
	    
		var water =document.getElementById('watersource');
	    var tablews = document.createElement("TABLE");
	    tablews.setAttribute("class", "table");
	    var row = tablews.insertRow(0);
	    row.setAttribute("style","background-color:#E0E0E0;font-weight:bold")
		row.insertCell(-1);row.insertCell(-1);row.insertCell(-1);row.insertCell(-1);
	    var cell0 = row.insertCell(0);
	    cell0.innerHTML='Add New WaterSource'
	    cell0 = row.insertCell(0);
	    var cell1 = row.insertCell(-1);
	    cell0.innerHTML = 'WaterSource<input type="hidden" id="wsid" value="0"/> <input class="form-control" type="text" name="WS" id="WS" placeholder="Enter WaterSource">';
	    cell1.innerHTML= '&nbsp<input class="form-control" type="button" id="savebtn" name="save" value="save" onclick="savewaterSource()" style="background-color: #3c8dbc; color: white;">';
	    water.appendChild(tablews); 
	    
		    var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			    	dummyJson = JSON.parse(this.responseText);
			    	getWaterSources()
			    }
			  };
			  xhttp.open("GET", "waterSourceForappOrg?appid="+appId+"&orgid="+orgid, true);
			  xhttp.send();	    
	}
	
	
	 function GotoWS(editable){	
	    
		var w = editable.parentElement.parentElement.getElementsByTagName('a')[0].innerHTML;
	    var i_d = editable.parentElement.parentElement.getElementsByTagName('input')[0].value
		var appId=document.getElementById("appid").value.split(":")[0]
		var orgid= document.getElementById("orgid").value.split(":")[0]
		document.getElementById("WS").value = w
		document.getElementById("wsid").value = i_d
		
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		     console.log(this.responseText);
		    }
		   };
		  xhttp.open("GET","addWaterSource?appId="+appId+"&orgid="+orgid+"&watersource="+w+"&i_d="+i_d, true);
		  xhttp.send(); 
	} 
	 
	 function savewaterSource(){
			
			var appId=document.getElementById("appid").value.split(":")[0]
			var orgid= document.getElementById("orgid").value.split(":")[0]
			var watersource =document.getElementById("WS").value
			var i_d = document.getElementById("wsid").value
			
			if(document.getElementById("WS").value==""){
				document.getElementById("WS").style.borderColor = "blue";
				document.getElementById("WS").focus();
				return;
			}else{

		   var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			     console.log(this.responseText);
			     AddwaterSource();
			    }
			    
			  };
			  xhttp.open("GET","addWaterSource?appId="+appId+"&orgid="+orgid+"&watersource="+watersource+"&i_d="+i_d, true);
			  xhttp.send();
		}
		 
		}	
		
	</script>

</body>
</html>