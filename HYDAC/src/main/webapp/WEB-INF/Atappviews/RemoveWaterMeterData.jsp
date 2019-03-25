<%@ page errorPage="error.jsp" %> 
<%@page import="com.team.app.domain.*"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Remove Water Meter Data
</title>
  
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
     *{
   font-family:Segoe UI;
 }
 
 body{
 font-family:Segoe UI;
 }
     
     </style>     
          
          
          
  
          <script >
          
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
       	   }
       	   else{		   
       			    $.ajax({
       	               url: 'deleteDevEUI',
       	               type: 'POST',
       	               //data: 'orgId='+orgid+'&appId='+appid+'&devId='+devid,
       	               data: jQuery.param({ orgId: orgid, appId : appid, devId : devid}) ,
       	               success: function (data) {
       	               alert(data);
       	               //$(".success").html(data);
       	               window.location.reload();
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
                       		appid.innerHTML='<select name="appname" id="appid" onchange="getDevEUIByAppID()"> <option value="0" >Please Choose</option></select>';
                       	var devid=document.getElementById("devid");
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
                   
                   
       function getDevEUIByAppID()
       {     
       	var appid=document.getElementById("appid").value;	
       	//devid.innerHTML='<select name="devname" id="devid"> <option value="0" >--Choose Device EUI--</option></select>';
       	if(appid=="0")
           	{                	
           	var devid=document.getElementById("devid");
           		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >Please Choose</option></select>';
           	return;
           	}
           else
           	{
           	
           var url="getDevEUIDel?appId="+appid;                                    
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
                           	appid.innerHTML='<select  name="appname" id="appid" onchange="getDevEUIByAppID()"><Option value="0">Please Choose</Option>'+returnText+'</select>';
                           var devid=document.getElementById("devid");
                   			devid.innerHTML='<select name="devname" id="devid"> <option value="0" >Please Choose</option></select>';
                   	
                       }
                   }
                   
                   function setDevEUI() 
                   {                      
                       if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                       { 
                           var returnText=xmlHttp.responseText;
                           var devid=document.getElementById("devid");
                           if(returnText!=""){ 	  
                           
                           devid.innerHTML='<select  name="devname" id="devid"><Option value="0">Please Choose</Option>'+returnText+'</select>';      
                          }else{
                       	   alert("No Water Meters Found!");
                       	    devid.innerHTML='<select name="devname" id="devid"> <option value="0" >Please Choose</option></select>'
                          }	
                       }
                   }
                   
                  
            </script>       
            
 

 
        
        
</head>

<body class="hold-transition skin-blue skin-black sidebar-mini">

<% 
  				Map<String,Object> organisations=(Map<String,Object>)request.getAttribute("organisations");
  			    List<TblKeywordType> keyTypes=(List<TblKeywordType>)request.getAttribute("keyTypes");
  			%>
  			

 
<div class="wrapper" style="display:block" >
 <%@include file="Header_v3.jsp"%>

 
  <!-- Left side column. contains the logo and sidebar -->
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   
   
   <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      Remove Water Meter Data

      </h1>
     
    </section>
    <section class="content">
   <div class="box">
    <div class="box-body">
              <div class="row" >
    				    	<div class="col-sm-6">	
    				    	
    				    	<form name="form1" action="#" onsubmit="return confirmValidate();" method="post">
										
								  <table class="table">
									 <tr>								  		
										<td align="right"><b>Housing Type</b></td>
										<td>	
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
			 																	    
										</td>
																	  		
								    </tr>						 	
								  	<tr>
								  		<td id="oId" align="right"><b><%=(String)request.getAttribute("orgN")%></b></td>
								  											
										<td>
										 <select name="orgname" class="form-control" id="orgid" onchange="getAppByOrgID()">
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
											    	    	 <option value="<%=map.getKey()+":"+map.getValue()%>"><%=map.getValue()%></option>
											    		   <%}
											    		} 
											    	}
											    }	    
										    }%>
										 </select> 
										</td>
									</tr>
									<tr>	
									   <td id="aId" align="right"><b><%=(String)request.getAttribute("appN")%></b></td>
									   
										 <td>
										 	<select name="appname" class="form-control" id="appid" onchange="getDevEUIByAppID()">
										    	<option value="0">Please Choose</option>	
										    </select> 
										</td>
									</tr>
									
									<tr>	
									   <td id="dId" align="right"><b><%=(String)request.getAttribute("devN")%></b></td>
									   
										 <td>
										 	<select name="devname" class="form-control" id="devid">
										    	<option value="0">Please Choose</option>	
										    </select> 
										</td>
									</tr>
									
									
									<tr>	
										<td align="right"></td>
											<td> <input type="submit"  class="form-control btn btn-success" style="background-color:#64B246;backbox-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;" value="Remove"/></td>
										 
									</tr>	
								 </table>	
							 </form> 
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
 
<!-- ./wrapper -->


         
       
        
        
        
        
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



</body >
</html>
