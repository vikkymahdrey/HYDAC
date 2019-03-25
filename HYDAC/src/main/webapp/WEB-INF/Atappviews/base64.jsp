<%--
    Author     : Vikky
--%>

<%@ page errorPage="error.jsp" %> 
<%@page import="com.team.app.domain.*"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.util.List"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Base64</title>
    
	<script type="text/javascript" src="js/jquery-latest.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
	  <link href="css/bootstrap.min.css" rel="stylesheet">
	  <link href="css/custom_siemens.css" rel="stylesheet">
	   <link href="css/marquees.css" rel="stylesheet">
	       
    
   
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	  <!-- Ionicons -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	  <link rel="stylesheet" href="css/AdminLTE.min.css">
	  <link rel="stylesheet" href="css/AdminLTE.css">
	  <link rel="stylesheet" href="css/skins/_all-skins.min.css"> 
	  <link href="css/style.css" rel="stylesheet" type="text/css" />
	 

	<script src="js/app.min.js"></script>
	<script src="js/demo.js"></script>
	
<!-- Pie Charts... -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
    
   <script type="text/javascript">
   
   function confirmValidate(){
	   
	   var base64=document.getElementById("base64").value;
 	  	
	   	   
 	   if(base64==""){
		   alert(base64);
		   document.getElementById("base64").focus();
		   return false;
	    }else{
		   $.ajax({
	           url: 'base64Decode',
	           type: 'POST',
	           data: jQuery.param({base64: base64}) ,
	           success: function (data) {	        	          		
		        	   alert(data);	        	
	               },
			 		error: function(e){
		     			        alert('Error: ' + e);
		     		 }

	              
	           }); 
		   
		   return false;
	   }				
   }
   
   
     </script>      
     
    
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini">
  
  			
							 
  <div class="wrapper">  
  	<%@include file="Header.jsp"%>  
 
	<div class="content-wrapper">
		
			<section class="content">
		 		<div class="content-wrap box box-primary">
		 		
						
		 		
		 		<div class="box-header with-border">
  					  <h5 class="text-blue text-left "><span class="fa fa-device"></span><b> Base64 Algorithm</b></h5>
       
   				</div><!-- /.box-header -->
		 							
		 					<div class="row">
									<div class="col-sm-12 text-center">
									<%String message="";
						
										try{
											message=request.getParameter("message");
											if(message!=null&&!message.equals("")){
												
											}else{						
													message = "";
													message = request.getAttribute("status").toString();
													session.setAttribute("status", "");
											}
				
										}catch(Exception e)
										{
											;
										}	%>
				 						<span style="color: red;" ><%=message %></span>	
				 									
		   						</div>
		   				  </div>		
   						
   						  <div class="row" >
    				    	<div class="col-sm-6">	
    				    	
    				    	<form name="form1" action="#" onsubmit="return confirmValidate();" >
										
								  <table class="table" >
								   
									<tr>	
									   <td align="right"><b>Base64</b></td>
									   
										 <td>
										 	<input type="text" name="base64" class="form-control" id="base64"  placeholder="Encoded value..">
										</td>
									</tr>
									
									
									
									<tr>	
										<td align="right"></td>
											<td> <input type="submit"  class="form-control"  style="background-color:#3c8dbc;color:white;" value="Decoder"/></td>
										 
									</tr>	
								</table>	
							 </form> 
							</div>	
					   </div>
										
					</div>	
			</section>	
			<%@include file="Footer.jsp"%>  		
	</div>	
	</div>
			
  </body>
</html>