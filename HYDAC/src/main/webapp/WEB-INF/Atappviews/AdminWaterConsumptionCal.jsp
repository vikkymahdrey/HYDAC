 <%--
    Document   : Water Consumption Unit
    Author     : Vikky
--%>
<%@ page errorPage="error.jsp" %> 
<%@page import="java.util.*"%>
<%@page import="com.team.app.domain.*"%>
<%@page import="com.team.app.dto.*"%>
<%@page import="org.displaytag.decorator.TotalTableDecorator"%>
<%@page import="org.displaytag.decorator.MultilevelTotalTableDecorator"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
 <%@ page buffer = "900kb" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<!DOCTYPE html >
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WaterConsumption |  Litre</title>
 <!--  Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <!--  Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
 <!--  Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!--   Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
 <!--  AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="css/skins/_all-skins.min.css">
   <link href="css/styling.css" rel="stylesheet">
  
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/export-data.js"></script>
  
  
  <script type="text/javascript" src="js/scroller.js"></script>


<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="js/pages/dashboard2.js"></script>
  
<!--  jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.js"></script>
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<script src="plugins/fastclick/fastclick.min.js"></script>
<!-- AdminLTE App -->
<script src="js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>
<!-- jQuery Knob -->
<script src="plugins/knob/jquery.knob.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.js"></script>
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- Bootstrap Date-Picker Plugin -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
 
 
 
 <!--  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>User Management</title>
  
  Tell the browser to be responsive to screen width
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
 
  
  Font Awesome
  <link rel="stylesheet" href="dashboard/bower_components/font-awesome/css/font-awesome.min.css">
 
 <link rel="stylesheet" href="dashboard/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
 
  <link rel="stylesheet" href="dashboard/dist/css/AdminLTE.min.css">
  
  AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load.
  <link rel="stylesheet" href="dashboard/dist/css/skins/_all-skins.min.css">
  
  <link rel="stylesheet" href="dashboard/customcolors/unizencolors.css">


Google Font
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<link rel="icon" type="image/png" href="dashboard/dist/img/Watermeter.png" style="">

     
     <script src="plugins/knob/jquery.knob.js"></script>
  
     <script src="plugins/sparkline/jquery.sparkline.min.js"></script>


Bootstrap Date-Picker Plugin

      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
       Bootstrap 3.3.7
       <link rel="stylesheet" href="dashboard/bower_components/bootstrap/dist/css/bootstrap.min.css">
       
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script> 
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker.min.css"> 
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker-standalone.css"> 
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/js/bootstrap-datetimepicker.min.js"></script>
     -->
</head>

<script type="text/javascript">

	$(function() {
	  $('#datetimepicker1').datetimepicker();
	  $('#datetimepicker2').datetimepicker();
	});
   
   function confirmValidate(){
	   
	   var orgid=document.getElementById("orgid").value;
 	  	var appid=document.getElementById("appid").value;
 	  	var devid=document.getElementById("devid").value;
 	   var orgDesc=document.getElementById("orgN").value;
	  	var appDesc=document.getElementById("appN").value;
	  	var devDesc=document.getElementById("devN").value;
	  	 var fromDate = new Date($('#fromDate').val());
	 	  var toDate = new Date($('#toDate').val());
 	  		   	   
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
	   }else if ($("input[name=fromDate]").val() == "") {
			alert("Choose FromDate");
			document.getElementById("fromDate").focus();
			return false;
	   }else if ($("input[name=toDate]").val() == "") {
			alert("Choose ToDate");
			document.getElementById("toDate").focus();
			return false;
	   }else if (fromDate > toDate) {
		  	 alert("Invalid Date Range"); 
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
	        			    	
	        				     document.getElementById("oId").innerHTML=resultant[i].organisation;  
	        				     document.getElementById("orgN").value=resultant[i].desc; 
	        				}else if(resultant[i].application!==undefined){
								 document.getElementById("aId").innerHTML=resultant[i].application; 
								 document.getElementById("appN").value=resultant[i].desc; 
							}else if(resultant[i].device!==undefined){
								 document.getElementById("dId").innerHTML=resultant[i].device;
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
                		appid.innerHTML='<select name="appid" id="appid" onchange="getDevEUIByAppID()"> <option value="0" >Please Choose</option></select>';
                	var devid=document.getElementById("devid");
                		devid.innerHTML='<select name="devid" id="devid"> <option value="0" >Please Choose</option></select>';
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
            
            
function getDevEUIByAppID()
{     
	var appid=document.getElementById("appid").value;
	
	if(appid=="0")
    	{                	
    	var devid=document.getElementById("devid");
    		devid.innerHTML='<select name="devid" id="devid"> <option value="0" >Please Choose</option></select>';
    	return;
    	}
    else
    	{
    var url="getDevEUISync?appId="+appid;                                    
    xmlHttp=GetXmlHttpObj()
    if (xmlHttp==null)
    {
        alert ("Browser does not support HTTP Request");
        return
    }                    
    xmlHttp.onreadystatechange=setDevEUI;	
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
                    appid.innerHTML='<select  name="appid" id="appid" onchange="getDevEUIByAppID()"><Option value="0">Please Choose</Option>'+returnText+'</select>';
                    var devid=document.getElementById("devid");
            		devid.innerHTML='<select name="devid" id="devid"> <option value="0" >Please Choose</option></select>';
                }
            }
            
            function setDevEUI() 
            {                      
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                { 
                    var returnText=xmlHttp.responseText;
                    var devid=document.getElementById("devid");
                    devid.innerHTML='<select  name="devid" id="devid"><Option value="0">Please Choose</Option>'+returnText+'</select>';                                             
                }
            }
     </script>      
     
     
     <script type="text/javascript">
			function showPopup(url) {
				var params = "toolbars=no,menubar=no,location=no,scrollbars=yes,resizable=yes";
				size = "height=450,width=520,top=200,left=300," + params;
				if (url == "LandMarkSearch") {
					size = "height=450,width=600,top=200,left=300," + params;
				}
				
				var orgId=document.getElementById("orgid").value;
				if (url == "LandMarkSearch") {
					
					if(orgId=="0")
					{
					alert("Select Organisation");
					return false;
					}
					url+="?orgId="+orgId;
				}
				
				newwindow = window.open(url, 'name', size);
		
				if (window.focus) {
					newwindow.focus();
				}
			}
</script> 
     

<body class="hold-transition skin-blue sidebar-mini">
			<% 
			String fname1=("WaterConsumptionUnits :").concat(new Date().toString()).concat(".csv");
			String fname2=("WaterConsumptionUnits :").concat(new Date().toString()).concat(".xls");
			String fname3=("WaterConsumptionUnits :").concat(new Date().toString()).concat(".xml");
			
			 
				Map<String,Object> organisations=(Map<String,Object>)request.getAttribute("organisations");
				List<TblKeywordType> keyTypes=(List<TblKeywordType>)request.getAttribute("keyTypes");
			
  			
  			%>	
<div class="wrapper">  
 <%@include file="Header.jsp"%>  
 
	<div class="content-wrapper">
		
			<section class="content">
		 		<div class="content-wrap box box-primary">
		 			
			 		
						
						<div class="row">
							<div class="col-sm-12 text-right ">	
							   <img src="images/user_iocn_header.png" />&nbsp;<b>Welcome <%=userSession.getUname()%></b> 
													
							</div>
						</div>	
					
													
						
						<div class="box-header with-border">
  					 		 <h5 class="text-blue text-left "><span class="fa fa-tint"></span><b> Water Consumption In Litre</b></h5>
          				</div><!-- /.box-header -->
          				
          				
						   				  
		   				  
		   				  <div class="row" >
    				    	<div class="col-sm-12">	
    				    	
    				    	<form name="form1" action="waterConsumptionUnits" onsubmit="return confirmValidate();" method="post">
										
								  <table class="table">
								  <tr>	
								  		<td> 
									   		<label>Housing Type</label>
									   		<div>
											 	<select name="typeId" class="form-control" id="typeId" onchange="getKeywords()">
											    	<!-- <option value="0">Select Housing Type</option> -->
											    	<%if(keyTypes!=null && !keyTypes.isEmpty()){
											    		for(TblKeywordType type :keyTypes){%>	
											    			<option value="<%=type.getId()%>"><%=type.getType()%></option>
											    		<%} 
											    	}%>
											    </select> 
											    <%
											    for(TblKeyword key : keyTypes.get(0).getTblKeywords()){
											    	if(key.getKey().equalsIgnoreCase(AppConstants.orgName)){
											    	   	request.setAttribute("orgN", key.getValue());%>											    	
											    	     <input type="hidden" name="orgN" id="orgN" value="<%=key.getDesc()%>"/> 
											    	     
				 									<%}else if(key.getKey().equalsIgnoreCase(AppConstants.appName)){ 
				 										request.setAttribute("appN", key.getValue());%>
				 										<input type="hidden" name="appN" id="appN" value="<%=key.getDesc()%>"/>
				 										
				 									<%}else if(key.getKey().equalsIgnoreCase(AppConstants.devName)){
				 										request.setAttribute("devN", key.getValue());%>
				 										<input type="hidden" name="devN" id="devN" value="<%=key.getDesc()%>"/>
				 										
				 									<%}%>	
				 								<%} %>	
			 									
										    </div>
										</td>							  		
								  		<td>
								  			<label id="oId"><%=(String)request.getAttribute("orgN")%></label>
								  			 <div>
										           <select name="orgid" id="orgid" class="form-control" onchange="getAppByOrgID()">
										    			<option value="0">Please Choose</option>	
													    <%if(userSession.getRoleBean().getType().equalsIgnoreCase(AppConstants.superAdmin)){										    
														    if(organisations!=null && !organisations.isEmpty()){
														    	for(Map.Entry<String,Object> map :organisations.entrySet()){%>
														    	    <option value="<%=map.getKey()+":"+map.getValue()%>"><%=map.getValue()%></option>
														    	<%}
														    }
													    }else if(userSession.getRoleBean().getType().equalsIgnoreCase(AppConstants.admin)){
													    	if(organisations!=null && !organisations.isEmpty()){
														    	for(Map.Entry<String,Object> map :organisations.entrySet()){
														    		for(UserDeviceMapping udm : userSession.getUserDeviceMappings()){
														    		   if(udm.getOrgId().equals(map.getKey())){%>
														    	    	 <option value="<%=map.getKey()+":"+map.getValue()%>" ><%=map.getValue()%></option>
														    		   <%}
														    		} 
														    	}
														    }	    
													    }%>
													 </select> 
										 			  <%-- <input type="hidden" id="orgName" name="orgName" value=<%=orgName%>> --%>									            
									        </div>										
										</td>
																														
									    <td> 
									   		<label id="aId"><%=(String)request.getAttribute("appN")%></label>
									   		<div>
											 	<select name="appid" class="form-control" id="appid" onchange="getDevEUIByAppID()">
											    	<option value="0">Please Choose</option>	
											    </select> 
										    </div>
										</td>
									
									
									
									    <td>
									   		<label id="dId"><%=(String)request.getAttribute("devN")%></label>
										  	<div>
									          <select name="devid" id="devid" class="form-control">
										    	<option value="0">Please Choose</option>	
										      </select> 
									            
									        </div>
										</td>
									</tr>
									
								  <tr>      
								      <td>
								        <label>From Date</label>
								        <div class='input-group date' id='datetimepicker1'>
								          <input type='text' name="fromDate" id="fromDate" class="form-control" placeholder="Please Choose"/>
								            <span class="input-group-addon">
								            	<span class="glyphicon glyphicon-calendar"></span>    
								            </span>
								         </div>
								      </td>
								      
							           <td>
							       		 <label>To Date</label>
									        <div class='input-group date' id='datetimepicker2'>
									          <input type='text' name="toDate" id="toDate" class="form-control" placeholder="Please Choose" />
									            <span class="input-group-addon">
									            	<span class="glyphicon glyphicon-calendar"></span>
									            </span>
									        </div>
							            </td>
							           							           
							            
							            <td>
							       		 <label>Action</label>
									        <div>
									         <input type="submit"  class="form-control" style="background-color:#3c8dbc;color:white" value="Submit"/>
									            
									        </div>
							            </td>
							            
							            
        							</tr>
									
									
								</table>	
							 </form> 
							</div>	
											 
					   </div>
					      				    		   				
				 </div>
			</section>	
			<%@include file="Footer.jsp"%> 	
	</div>	

		 
		 <%-- <div class="clearfix"></div>
 
       <%@include file="footer_v2.jsp"%>
  <div class="control-sidebar-bg"></div> --%>
 </div>
</body>
</html> 