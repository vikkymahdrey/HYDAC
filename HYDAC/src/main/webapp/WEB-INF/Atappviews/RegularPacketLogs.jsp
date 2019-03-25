<%@page import="java.util.*"%>
<%@ page errorPage="error.jsp" %> 
<%@page import="com.team.app.domain.*"%>
<%@page import="com.team.app.dto.*"%>
<%@page import="org.displaytag.decorator.TotalTableDecorator"%>
<%@page import="org.displaytag.decorator.MultilevelTotalTableDecorator"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
 <%@ page buffer = "900kb" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Regular packet logs</title>
  
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
  <!-- jQuery 3 -->
	<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
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
          <script>
  
	     $('#example1').DataTable();
 

  </script> 
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

<body class="hold-transition skin-blue skin-black sidebar-mini" >

<% 
						String fname1=("CMSFrameList :").concat(new Date().toString()).concat(".csv");
						String fname2=("CMSFrameList :").concat(new Date().toString()).concat(".xls");
						String fname3=("CMSFrameList :").concat(new Date().toString()).concat(".xml");
						
						List<LoraFrame> frames=(List<LoraFrame>)request.getAttribute("frames");
						%>
 
<div class="wrapper" style="display:block" >
 <%@include file="Header_v3.jsp"%>

 
  <!-- Left side column. contains the logo and sidebar -->
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   
   
   <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      Regular packet logs
      </h1>
     
    </section>
    <section class="content">
   <div class="box">
    <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
             <div class="row">
             <div class=" col-sm-12">
            <%--  <display:table    name="<%=frames%>"  
                id="example1" class="table table-bordered table-striped dataTable" export="true" requestURI="" defaultsort="1" defaultorder="descending" pagesize="25">
							<display:column  property="id" title="ID" sortable="true" headerClass="sortable" />
							<display:column  property="applicationID" title="ApplicationID" sortable="true"  />
							<display:column  property="applicationName" title="ApplicationName" sortable="true"  />
							<display:column  property="nodeName" title="WaterMeterName" sortable="true"  />
							<display:column  property="devEUI" title="WaterMeter" sortable="true"  />
							<display:column  property="pktType" title="Pkt_Type" sortable="true"  />
							<display:column  property="devMapId" title="PktID" sortable="true"  />
							<display:column  property="gatewayMac" title="GatewayMac" sortable="true"  />
							<display:column  property="gatewayName" title="GatewayName" sortable="true"  />
							<display:column  property="waterltr" title="Water_Ltr"  sortable="true"  />
							<display:column  property="createdAt" title="CreatedDt"  sortable="true" format="{0,date,yyyy-MM-dd HH:mm:ss}" /> 
                            <%-- <display:column   title="CreatedDt" >
								 <fmt:timeZone value="${timeZone}">	    								
	          									<fmt:formatDate value="${createdAt}" timeZone="${timeZone}" type="both" />	        							
	    						</fmt:timeZone>	
    						</display:column> 			     		   
						 	<display:setProperty name="export.csv.filename" value="<%=fname1%>" />
							<display:setProperty name="export.excel.filename" value="<%=fname2%>" />
							<display:setProperty name="export.xml.filename" value="<%=fname3%>" /> 
							<display:setProperty name="paging.banner.placement" value="bottom"/>
						</display:table > --%>
						
						
						
					<div class="table-responsive">
				<table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead style="cursor: auto;">
                <tr role="row" style="color:#ffff;">
                <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 231px;">ID</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 282px;">ApplicationID</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 251px;">ApplicationName</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 198px;">WaterMeterName</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">WaterMeter</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">Pkt_Type</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">PktID</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">GatewayMac</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">GatewayName</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">Water_Ltr</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">CreatedDt</th>
               <!--  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">View</th> -->
                </tr>
                </thead>
                <tbody id="userslist">
                <tr>
                <% 
                for(int i=0;i<frames.size();i++){
                    %>
                
                <td><%=frames.get(i).getId()%></td>
                <td><%=frames.get(i).getApplicationID()%></td>
                <td><%=frames.get(i).getApplicationName()%></td>
                <td><%=frames.get(i).getNodeName()%></td>
                <td><%=frames.get(i).getDevEUI()%></td>
                <td><%=frames.get(i).getPktType()%></td>
                <td><%=frames.get(i).getDevMapId()%></td>
                <td><%=frames.get(i).getGatewayMac()%></td>
                <td><%=frames.get(i).getGatewayName()%></td>
                <td><%=frames.get(i).getWaterltr()%></td>
                <td><%=frames.get(i).getCreatedAt()%></td>
                </tr>
              <%   }%>
               </tbody>
               
              </table>
						
						
						
						
             </div>
             </div>
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


<script type="text/javascript">
$('#example1').DataTable();
</script>


</body >
</html>
