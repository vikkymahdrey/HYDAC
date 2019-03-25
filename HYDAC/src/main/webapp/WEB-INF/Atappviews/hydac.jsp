 <%--
    Document   : HYDAC Report
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Hydac Report</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/custom_siemens.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/AdminLTE.min.css">
<link rel="stylesheet" href="css/skins/_all-skins.min.css">
<link rel="stylesheet" href="css/slider.css">
  <link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-latest.js"></script>
<script  src="https://code.jquery.com/jquery-2.2.0.js"></script>
<script type="text/javascript" src="js/jquery-latest.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="js/app.min.js"></script>
<script src="js/demo.js"></script>
<script src="js/scroller.js"></script>

</head>

<body class="hold-transition skin-blue sidebar-mini">
					<% 
						String fname1=("HydacList :").concat(new Date().toString()).concat(".csv");
						String fname2=("HydacList :").concat(new Date().toString()).concat(".xls");
						String fname3=("HydacList :").concat(new Date().toString()).concat(".xml");
						
						List<TblHydacInfo> list=(List<TblHydacInfo>)request.getAttribute("hydacList");
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
													
						</div><br/>
					
					
						<div class="row">
								<div class="box-header with-border">
								<h5 class="text-blue text-left "><span class="fa fa-files-o"></span><b> Hydac Report</b></h5>
						</div> 
						
													
						</div>
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
		   				  	
						
						<div class="row" style="overflow-y: auto;">
							<div class="col-sm-12 ">	
							
							<display:table  class="table table-hover text-center"  name="<%=list%>" id="row"
									export="true" requestURI="" defaultsort="1" defaultorder="descending" pagesize="100">
							
							<display:column  property="id" title="ID" sortable="true" headerClass="sortable" />
							<display:column  property="CSName" title="CSName" sortable="true"  />
							<display:column  property="serialNumber" title="serialNumber" sortable="true"  />
							<display:column  property="date" title="date" sortable="true"  />
							<display:column  property="iso4" title="iso4"  sortable="true"  />
							<display:column  property="iso6" title="iso6" sortable="true"  />
							<display:column  property="iso14" title="iso14" sortable="true"  />
							<display:column  property="nas2_5" title="nas2_5" sortable="true"  />
							<display:column  property="nas25" title="nas25"  sortable="true"  />
							<display:column  property="nas515" title="nas515" sortable="true"  />
							<display:column  property="nas1525" title="nas1525" sortable="true"  />
							<display:column  property="drive" title="drive" sortable="true"  />
							<display:column  property="max" title="max"  sortable="true"  />
							<display:column  property="sat" title="sat"  sortable="true"  />
							<display:column  property="version" title="version"  sortable="true"  />
							<display:column  property="createdDt" title="createdDt"  sortable="true"  />
							<display:column  property="updatedDt" title="updatedDt"  sortable="true"  />
							
													     		   
						 	<display:setProperty name="export.csv.filename" value="<%=fname1%>" />
							<display:setProperty name="export.excel.filename" value="<%=fname2%>" />
							<display:setProperty name="export.xml.filename" value="<%=fname3%>" /> 
							
						</display:table> 
						
						
							</div>
						</div>
						<a  id="goTop"><i class="fa fa-eject"></i></a>	
				 </div>
			</section>	
			<%@include file="Footer.jsp"%>  		
	</div>	
</div>
		 
		
</body>
</html> 