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

<title>invoice setings</title>

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

<body 
	class="hold-transition skin-blue sidebar-mini">

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
							<span class="fa fa-upload"></span>&nbsp;&nbsp;<b>Invoice
								Settings</b>
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
										onclick="getExistingConstr()" class="form-control text-bold "
										style="background-color: #3c8dbc; color: white;"
										value="Configure" /></td>
								</tr>


							</table>



						</div>

						<div id="waterSources" class="col-sm-12"></div>

						<script type="text/javascript">
						
						
						function validation(table){
							
							var x = table.getElementsByTagName("TR");
							
							var nextFromVal;
								
								for (i = 1; i < x.length; i++) {
									  var slab = {};
										slab['fromUnit']=x[i].getElementsByTagName("TD")[1].getElementsByTagName("INPUT")[0].value;
										 slab['toUnit']=x[i].getElementsByTagName("TD")[2].getElementsByTagName("INPUT")[0].value;
										 slab['pricePerunit']=x[i].getElementsByTagName("TD")[3].getElementsByTagName("INPUT")[0].value;
										 
										if(slab['fromUnit'] == ''){
											
											alert('Please Provide From Unit at slab '+i)
										return -1;
											
										} 
										
										else if(slab['toUnit'] == ''){
											
											alert('Please provide TO unit at slab '+i)
											return -1;
										}
											
											
										else if(parseInt(slab['toUnit']) <= parseInt(slab['fromUnit'])){
											
											alert('To Unit value must be greater than From Unit at slab '+i)
										return -1;
										}
										else if(slab['pricePerunit'] == ''){
											
											alert('please Provide price/unit at slab'+i)
										return -1;
										}else if(parseInt(slab['pricePerunit']) < 0){
											alert('price value must be greater than or equal to zero at slab '+i)
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
						    cell4.innerHTML=' <input value="Delete slab" class="form-control" type="button" style="background-color: #3c8dbc; color: white;" onclick="deleteSlab(this)">';
							   
						}
						
						
						function deleteSlab(row){
							
							var trs =row.parentElement.parentElement.parentElement.getElementsByTagName('TR')
							var count =0;
							for(var i=0;i< trs.length;i++){
								
								if((trs[i] == row.parentElement.parentElement)){
									
                                    if(i == (trs.length - 1)){
										row.parentElement.parentElement.parentElement.removeChild(trs[i]);
									}else{
										alert('please delete  below slabs rows to delete this');
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
							
							json['orgId']=6;
							json['appId']=11;
							
							json['waterSourceId']=x[0].getElementsByTagName("TD")[0].getElementsByTagName("INPUT")[0].value;
							json['effectiveDate']=x[1].getElementsByTagName("TD")[0].getElementsByTagName("INPUT")[0].value;
							
							if(json['effectiveDate'] == ''){
								
								alert('please select effective date')
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
										
						
								
								
								var xhr = new XMLHttpRequest();
								var url = "url";
								xhr.open("POST", "saveConstr", true);
								xhr.setRequestHeader("Content-Type", "application/json");
								xhr.onreadystatechange = function () {
								    if (xhr.readyState === 4 && xhr.status === 200) {
								        
								    	getExistingConstr();
								    }
								};
								var data = JSON.stringify(json);
								xhr.send(data);
								
								
								
						}
						
						</script>
					</div>

				</div>
			</section>
			<%@include file="Footer.jsp"%>
		</div>
	</div>
	<script type="text/javascript">
var dummyJson ;//= [{"wsId":1,"billingConstraints":[{"bcid":11,"effectiveDate":1542825000000,"slabs":[{"units_from":1,"Slab_number":1,"price":1,"units_to":1}]},{"bcid":13,"effectiveDate":1542220200000,"slabs":[{"units_from":11,"Slab_number":1,"price":2,"units_to":23},{"units_from":23,"Slab_number":2,"price":1,"units_to":45}]}],"wsname":"bbmp"},{"wsId":2,"billingConstraints":[{"bcid":12,"effectiveDate":1542911400000,"slabs":[]}],"wsname":"recycled"},{"wsId":3,"billingConstraints":[],"wsname":"ground"}]


function waterSourcesToTables(){
	
	
		var waters =document.getElementById('waterSources');
	var watersources = dummyJson;
	
	
	
	for(var i in watersources)
	{
		
		
		
	     var id = watersources[i].wsId;
	     var name = watersources[i].wsname;
	     
	     
	     
	     var tableWS = document.createElement("TABLE");
	     tableWS.setAttribute("class", "table");
		    var rowWS = tableWS.insertRow(0);
		    rowWS.setAttribute("style", "background-color:#9E9E9E;font-weight: bold");
		    var cell0WS = rowWS.insertCell(0);
		    cell0WS.setAttribute("style","color:white")
		    cell0WS.innerHTML='<input type="hidden" name="watersourceId" value="'+id + '"/> Existing Billing Constraints For '+name +' Water Source';
		    rowWS.insertCell(-1);rowWS.insertCell(-1);rowWS.insertCell(-1);rowWS.insertCell(-1);
		  var bcons = watersources[i].billingConstraints;
	     
	     for(var bc in bcons){
	    	 
	    	 
	    	 
	    	 
	    	 var slabs = bcons[bc].slabs;
	    	 
	    	 
	    	 rowWS  = tableWS.insertRow(1);
	    	
	    	 rowWS.setAttribute("style","background-color:#E0E0E0;font-weight: bold")
			     rowWS.insertCell(0).innerHTML='Effective From : '+new Date(bcons[bc].effectiveDate).toLocaleDateString();
			    
				 rowWS.insertCell(-1).innerHTML="Slab Number";
				 rowWS.insertCell(-1).innerHTML="Units From";
				 rowWS.insertCell(-1).innerHTML="Units To";
				 rowWS.insertCell(-1).innerHTML="Price";
				 
	    	 for(var s in slabs){
	    		 
	    		rowWS = tableWS.insertRow((parseInt(s)+parseInt(2)))
	    		 rowWS.setAttribute("style","")
	    		rowWS.insertCell(-1);
	    		rowWS.insertCell(-1).innerHTML= slabs[s].Slab_number ;
	    		rowWS.insertCell(-1).innerHTML= slabs[s].units_from ;
	    		rowWS.insertCell(-1).innerHTML= slabs[s].units_to ;
	    		rowWS.insertCell(-1).innerHTML= slabs[s].price ;
	    		 
	    			 
	    	 }
	     }
	     
	     waters.appendChild(tableWS);
	    var table = document.createElement("TABLE");
	    table.setAttribute("class", "table");
	    var row = table.insertRow(0);
	    row.setAttribute("style","background-color:#E0E0E0;font-weight:bold")
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
	    cell4.innerHTML= '<input class="form-control" type="button" name="new_slab" value="add_slab" onclick="new_slab(this)" style="background-color: #3c8dbc; color: white;"><input type="button" class="form-control" style="background-color: #3c8dbc; color: white;" value="save" onclick="savewateSourceConstr(this)">';
	    waters.appendChild(table);
	}
	
}


function getExistingConstr(){
	//document.getElementById('waterSources').innerHTML = "";
	
	
		
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	dummyJson = JSON.parse(this.responseText);
	    	
	    //	console.log(dummyJson);
	    	
	    		if(Object.keys(dummyJson).length < 1){
	    			
	    			alert("Water Sources Not Mapped to the above params , please map water sources to continue");
	    	return;
	    		}
	    	waterSourcesToTables()
	    }
	  };
	  xhttp.open("GET", "waterSourceForappOrg", true);
	  xhttp.send();
	
}

</script>
</body>
</html>