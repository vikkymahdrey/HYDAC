<%@ page import="java.util.*"%>
<%@ page import="com.team.app.domain.TblDeviceFeedback"%>
<%@ page import="com.team.app.constant.AppConstants"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Report Issue</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="dashboard/bower_components/font-awesome/css/font-awesome.min.css">

<link rel="stylesheet" href="dashboard/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="dashboard/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myModal").modal('show');
	});
</script>
<style type="text/css">

 *{
   font-family:Segoe UI;
 }
 body{
 font-family:Segoe UI;
 }

.collapse-row.collapsed+tr {
	display: none;
}

 .table-alignment {
  table-layout: fixed;
  width: 100%;
  white-space: nowrap;
} 
/* .table-alignment {
  width: 100%;
  white-space: nowrap;
} */
.text-overflow {
  display: block;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
</style>

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<link rel="icon" type="image/png"
	href="dashboard/dist/img/Watermeter.png" style="">
<!-- View issue details model -->

<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script type="text/javascript">

var app = angular.module('serviceApp', []);

app.controller('serviceCtrl', function ($scope, $http,$timeout) {
	  $scope.loading = true; 
$http({

method: 'GET',

url: 'userdivices'


}).then(function success(response) {
	//console.log("response data",response.data)
$scope.myWelcome = response.data;


$scope.statusval = response.status;

$scope.statustext = response.statusText;

$scope.headers = response.headers();
$scope.loading = false;

}, function error(response) {

});

});

app.controller('childCtrl', function ($scope, $http) {
	 
	
	   $scope.myFunction = function() {
	  // alert("Dataaaa="+$scope.data)
	        //$scope.count++;
	   
	   var msgId = $scope.data;
	   
	   $scope.myVar = $scope.data;
	   
	   
	
	  
	   
   
$http({

method: 'GET',

url: 'getusrstatus/'+ msgId

}).then(function success(response) {
//console.log("response", response.data)
	$scope.userStatus = response.data;
	
	$scope.id = response.data.id;

	//console.log($scope.userStatus);
	$scope.statusvalue = response.status;

	$scope.stustext = response.statusText;

	$scope.headers = response.headers();

	}, function error(response) {

	});
	
	   }

	});

</script>


</head>
<body class="hold-transition skin-blue skin-black sidebar-mini" ng-app="serviceApp" >



	<%
		Map<String, Object> organisations = (Map<String, Object>) request.getAttribute("userDevice");
		Map<String, String> fdType = (Map<String, String>) request.getAttribute("deviceFb");

		List<TblDeviceFeedback> fblist = (List<TblDeviceFeedback>) request.getAttribute("devicefblist");
	%>
	<%
		String success = (String) session.getAttribute("success");
		if (success == null) {
			success = "";
		}

		else {
			success = ("<div id='myModal' class='modal fade' data-keyboard='false' data-backdrop='static'>" + "<div class='modal-dialog'>"
					+ " <div class='modal-content'>" + "<div class='modal-header' style='background-color:#235E93;color:#ffff'>"
					+ " <button type='button' class='pull-right' data-dismiss='modal' aria-label='Close' style='background:none;border:0'>"
	                + "<span aria-hidden='true' class='glyphicon glyphicon-remove'></span></button>"
					+ " <h4 class='modal-title'>Success message</h4>" + "</div>"
					+ "<div class='modal-body text-center' style='background-color:#f9f9f9'>Issue registered successfully" + "</div>"
					+ "<div class='modal-footer'style='background-color:#f9f9f9'>"
					+ "</div>" + "</div>" + "</div>" + "</div>");

		}
	%>


	<%
		String fail = (String) session.getAttribute("fail");
		if (fail == null) {
			fail = "";
		}

		else {
			success = ("<div id='myModal' class='modal fade' data-keyboard='false' data-backdrop='static'>" + "<div class='modal-dialog'>"
					+ " <div class='modal-content'>" + "<div class='modal-header'style='background-color:#235E93;color:#ffff'>"
					+ " <button type='button' class='pull-right' data-dismiss='modal' aria-label='Close' style='background:none;border:0'>"
			        + "<span aria-hidden='true' class='glyphicon glyphicon-remove'></span></button>"
					+ " <h4 class='modal-title'>Failure message</h4>" + "</div>"
					+ "<div class='modal-body'style='background-color:#f9f9f9'>Unable to report the issue, please try again" + "</div>"
					+ "<div class='modal-footer'style='background-color:#f9f9f9'>"
					+ "</div>" + "</div>" + "</div>" + "</div>");

		}
	%>



	<%=success%>
	<%=fail%>
	<%
		request.getSession().removeAttribute("success");
		request.getSession().removeAttribute("fail");
	%>

	<div class="wrapper">

			<%@include file="Header_v2.jsp"%> 

		<!-- Left side column. contains the logo and sidebar -->


		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">

				<h1>Report Issue</h1>
				<!--  	<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Device Complaint Report</li>
				</ol>-->
			</section>

			<!-- Main content -->
			<section class="content">


				<div class="box">
					<div class="row">
						<div class="col-md-12">

							<div class="box-body">



								<div class="row">
									<div class="col-md-3 pull-left">
										<button type="button" class="btn btn-primary btn-lg"
											data-toggle="modal" data-target="#modal-info"
											style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">
											<b>Create Issue</b>
										</button>
									</div>


									<div class="modal  fade in" id="modal-info" data-keyboard="false" data-backdrop="static"
										style="display: none;">
										<div class="modal-dialog">
											<div class="modal-content" style="background-color: #eee">
												<div class="modal-header" style="background-color:#235E93;color:#ffff">
													<button type="button" class="pull-right"
														data-dismiss="modal" aria-label="Close"
														style="background: none; border: 0"
														onclick="ComplaintClean()">
														<span aria-hidden="true"
															class="glyphicon glyphicon-remove"></span>
													</button>
													<h4 class="modal-title">
														<b>Create Issue</b>
													</h4>
												</div>
												<div class="modal-body">
													<form action="userComplaint" method="POST">
														<div class="row">

															<div class="col-xs-12">


																<div class="col-xs-6">

																	<div class="form-group">

																		<select class="form-control"
																			id="selectdevice" style="border: 0; border-radius: 6px;" required
																			name="devicename">
																			<option value="">Select Device</option>
																		
																			<option value=" - N/A">N/A</option>	
																	

																			<%
																				if (organisations != null && !organisations.isEmpty()) {
																					for (Map.Entry<String, Object> map : organisations.entrySet()) {
																			%>
																			<option
																				value="<%=map.getKey()%> - <%=map.getValue()%>"><%=map.getValue()%></option>
																					
																			<%
																				}
																				}
										                       				%>
																		</select>
																	</div>

																</div>
																<div class="col-xs-6">
																	<div class="form-group">

																		<select class="form-control"
																			id="complainttype"style="border: 0; border-radius: 6px;" required
																			name="feedbacktype">
																			<option value="">Complaint Type</option>
																			<%
																				if (fdType != null && !fdType.isEmpty()) {
																					for (Map.Entry<String, String> map : fdType.entrySet()) {
																			%>
																			<option value="<%=map.getKey()%>"><%=map.getValue()%></option>
																			<%
																				}
																				}
																			%>
																		</select>
																	</div>

																</div>

																<div class="col-xs-12">
																	<div class="form-group">

																		<textarea class="form-control" rows="6" id="textcomment" maxlength="250"
																			placeholder="Enter your comment here"
																			style="border: 0; border-radius: 6px;" required
																			name="comment"></textarea>
																	</div>
																</div>
																
																	<div class="form-group text-center">
																		<input type="submit" 
																			class="btn btn-primary btn-sm" width="100px"
																			value="Submit"
																			style="background-color:#235E93;box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0" />

																	</div>
															</div>

														</div>

													</form>



												</div>

											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
								</div>






							</div>
							<!-- /.box-body -->
						</div>
					</div>
                   </div>
                   </section>
                   
                   
                <section class="content-header" style="margin-top:-150px">
				<h1>
					Open Issue(s) <small></small>
				</h1>
				
		         </section>
		         <section class="content">
					<!-- ********************* Table start -->
					 <div class="box">
					<div ng-controller="serviceCtrl">
					
					<div ng-show="loading" class="text-center">
					
                     <img src="http://thinkfuture.com/wp-content/uploads/2013/10/loading_spinner.gif" />
                  
                   </div>
                      
                        <div ng-show="!loading">
						<div class="table-responsive">
							<table class="table table-hover table-alignment">
								<thead>
									<tr class="active ">
									<th>#</th>
										<th>Issue Id</th>
										<th>Device Name</th>
										<th>Raised Date</th>
										<th>Type</th>
										<th>Status</th>
										<!--  <th style="width:20%">Comment</th>-->
										<th>Details</th>
									</tr>
								</thead>
								<tbody ng-show="myWelcome.length!=0"  ng-repeat="store in myWelcome track by $index">
								
								<tr>
								


 </tr>
									<tr ng-if="store.status !== 'Closed' ">

										<td align="left"> <span ng-bind="$index + 1"></span></td>
										<td align="left"> <span ng-bind="store.ticketId"></span></td>
										<td align="left"><span class="text-overflow" ng-bind="store.nodeName"></span> <br>
											<span ng-bind="store.devEUI"></span>
										</td>
										<td align="left"><span ng-bind="store.createdAt"></span></td>
										<td align="left"><span class="text-overflow" ng-bind="store.type"></span></td>
										<td align="left">
											<div ng-if="store.status === 'Open'">
												<font color="red"><span ng-bind="store.status"></span></font>
											</div>
											<div ng-if="store.status === 'Closed' ">
												<font color="Green"><span ng-bind="store.status"></span></font>
											</div>
											<div ng-if="store.status === 'ReOpen' ">
												<font color="red"><span ng-bind="store.status"></span></font>
											</div>

											<div ng-if="store.status === 'Pending' ">
												<font color="red"><span ng-bind="store.status"></span></font>
											</div>


										</td>
									<!-- 	<td align="left"><span ng-bind="store.textarea"></span></td> -->

										<td align="left" >
										
										<div ng-controller="childCtrl" >
										  <button  ng-click="myFunction(data=store.id)"  data-toggle="modal" data-target="#collapseOne{{$index}}"  class="btn btn-success" data-toggle="collapse" style="box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0; background-color:#91191c">
    
 view 
</button>

<div class="modal  fade in" id="collapseOne{{$index}}" data-keyboard="false" data-backdrop="static"
										style="display: none;">
										<div class="modal-dialog">
											<div class="modal-content" style="background-color: #eee">
												<div class="modal-header" style="background-color:#235E93;color:#ffff">
													<button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="onModalclose()" >
                  
                                                             <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                                                                  </button>
													<h4 class="modal-title">
														<b># {{store.ticketId}} Transactions</b>
													</h4>
												</div>
												<div class="modal-body">
													
<div class="table-responsive">
							<table class="table table-hover ">
							<thead>
								<tr class="active ">
										<th>#</th>
										<th>Status</th>
										<th>Comment</th>
										<th>Created On</th>
										
									</tr>
									</thead>
								<tbody>
									<tr ng-repeat="status in userStatus track by $index">

<td >{{$index + 1}} </td>
										<td align="left" >{{status.status}}</td>
										<td align="left" >{{status.comment}}</td>
										<td align="left" >{{status.createdAt}}</td>
										
									</tr>
								</tbody>
							</table>
							
							
							<div ng-if="store.status === 'Close'">
												 <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo{{store.ticketId}}" style="background-color:#24659F;box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">ReOpen</button>
											</div>
											
											
											
											
											<div ng-if="store.status === 'null'">
												 
											</div>
							
 
  <div id="demo{{store.ticketId}}" class="collapse">
 
    <form action="resolveReOpen" method="POST">

Status : <select name="status" class="form-control" id="status1">
<option value="ReOpen">ReOpen</option>

</select><br/><br/>



<input type="hidden" class="form-control" ng-value="myVar"   name="id" >

Comment :<textarea class="form-control" required name="comment" id="comment1"></textarea> <br/>



<input type="submit" value="Submit" class="btn btn-success" style="background-color: #64B246;box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0"/> <br/><br/>

</form>
   

  
  
						</div>


					
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
								</div>
								

										
										
										
										</td>



									</tr>
								</tbody>
								<tbody ng-show="myWelcome.length==0">
								 <tr >
            <td >
                No data available.                
            </td>
        </tr>
        
        </tbody>
								
							</table>

						</div>
						
						</div>	
					</div>
                 </div>
					
  
   
     
    

    

  
    
 
	
						
							
					

		<%-- 			<div class="table-responsive">
						<table class="table table-hover ">
							<thead>
								<tr class="active ">
									<th>Issue Id</th>
									<th>Device Name</th>
									<th>Raised Date</th>
									<th>Status</th>
									<th>Type</th>
									<th>Actions</th>
								</tr>
							</thead>

							<tbody>

								<%
									if (fblist != null && !fblist.isEmpty()) {

										for (TblDeviceFeedback fb : fblist) {
								%>
								<tr data-toggle="collapse" data-target="#<%=fb.getId()%>"
									class="clickable collapse-row collapsed">



									<td><%=fb.getId()%></td>
									<td><%=fb.getNodeName()%></td>
									<td><%=fb.getCreatedAt()%></td>
									<td><%=fb.getStatus()%></td>
									<td><%=fb.getType()%></td>

									<td><a href="#" class="btn btn-success btn-sm"
										style="background-color: #64B246; box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">
											+ </a></td>
								</tr>
								<tr>
									<td colspan="6">
										<div id="<%=fb.getId()%>" class="collapse">
											Ticket #<%=fb.getTicketId()%>
											<br>

											<button type="button"
												class="btn btn-success btn-circle btn-sm"
												style="background-color: #64B246; box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">UN</button>
											<%=fb.getTextarea()%>

										</div> <%
 	if (fb.getStatus().equals("Close")) {
 %> <br>
										<p>
											<button type="button" class="btn btn-success btn-sm"
												data-toggle="modal" data-target="#reopen"
												style="background-color: #64B246; box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">
												<b>Re Open</b>
											</button>

										</p> <%
 	}
 %>

									</td>
								</tr>
								<%
									}
									}
								%>
							</tbody>
						</table>




						<!-- ***************** Table end -->

					</div> --%>
					
				<h3>
					Issue history <small></small>
				</h3>
				
				
					<!-- ********************* Table start -->
					 <div class="box">
					<div ng-controller="serviceCtrl">
					
					<div ng-show="loading" class="text-center">
					
                     <img src="http://thinkfuture.com/wp-content/uploads/2013/10/loading_spinner.gif" />
                  
                   </div>
                      
                        <div ng-show="!loading">
						<div class="table-responsive">
							<table class="table table-hover table-alignment">
								<thead>
									<tr class="active ">
									<th>#</th>
										<th>Issue Id</th>
										<th>Device Name</th>
										<th>Raised Date</th>
										<th>Type</th>
										<th>Status</th>
									<!--  	<th style="width:20%">Comment</th>-->
										<th>Details</th>
									</tr>
								</thead>
								<tbody ng-show="myWelcome.length!=0"  ng-repeat="store in myWelcome track by $index">
								
								<tr>
								


 </tr>
									<tr ng-if="store.status === 'Closed' ">

										<td align="left"> <span ng-bind="$index + 1"></span></td>
										<td align="left"> <span ng-bind="store.ticketId"></span></td>
										<td align="left"><span class="text-overflow" ng-bind="store.nodeName"></span> <br>
											<span ng-bind="store.devEUI"></span>
										</td>
										<td align="left"><span ng-bind="store.createdAt"></span></td>
										<td align="left"><span class="text-overflow" ng-bind="store.type"></span></td>
										<td align="left">
											<div ng-if="store.status === 'Open'">
												<font color="red"><span ng-bind="store.status"></span></font>
											</div>
											<div ng-if="store.status === 'Closed' ">
												<font color="Green"><span ng-bind="store.status"></span></font>
											</div>
											<div ng-if="store.status === 'ReOpen' ">
												<font color="red"><span ng-bind="store.status"></span></font>
											</div>

											<div ng-if="store.status === 'Pending' ">
												<font color="red"><span ng-bind="store.status"></span></font>
											</div>


										</td>
									<!--  	<td align="left"><span ng-bind="store.textarea"></span></td>-->

										<td align="left" >
										
										<div ng-controller="childCtrl" >
										  <button  ng-click="myFunction(data=store.id)"  data-toggle="modal" data-target="#collapseOne{{$index}}"  class="btn btn-success " data-toggle="collapse" style="box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;background-color:#64B246">
    
 view 
</button>

<div class="modal  fade in" id="collapseOne{{$index}}" data-keyboard="false" data-backdrop="static"
										style="display: none;">
										<div class="modal-dialog">
											<div class="modal-content" style="background-color: #eee">
												<div class="modal-header" style="background-color:#235E93;color:#ffff">
													<button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="onModalclose()" >
                  
                                                             <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                                                                  </button>
													<h4 class="modal-title">
														<b># {{store.ticketId}} Transactions</b>
													</h4>
												</div>
												<div class="modal-body">
													
<div class="table-responsive">
							<table class="table table-hover ">
							<thead>
								<tr class="active ">
										<th>#</th>
										<th>Status</th>
										<th>Comment</th>
										<th>Created On</th>
										
									</tr>
									</thead>
								<tbody>
									<tr ng-repeat="status in userStatus track by $index">

<td >{{$index + 1}} </td>
										<td align="left" >{{status.status}}</td>
										<td align="left" >{{status.comment}}</td>
										<td align="left" >{{status.createdAt}}</td>
										
									</tr>
								</tbody>
							</table>
							
							
							<div ng-if="store.status === 'Close'">
												 <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo{{store.ticketId}}" style="background-color:#24659F;box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">ReOpen</button>
											</div>
											
											
											
											
											<div ng-if="store.status === 'null'">
												 
											</div>
							
 
  <div id="demo{{store.ticketId}}" class="collapse">
 
    <form action="resolveReOpen" method="POST">

Status : <select name="status" class="form-control" id="status2">
<option value="ReOpen">ReOpen</option>

</select><br/><br/>



<input type="hidden" class="form-control" ng-value="myVar"   name="id" >

Comment :<textarea class="form-control" required name="comment" id="comment2"></textarea> <br/>



<input type="submit" value="Submit" class="btn btn-success" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0"/> <br/><br/>

</form>
   

  
  
						</div>


					
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
								</div>
								

										
										
										
										</td>



									</tr>
								</tbody>
								<tbody ng-show="myWelcome.length==0">
								 <tr >
            <td >
                No data available.                
            </td>
        </tr>
        
        </tbody>
								
							</table>

						</div>
						
						</div>	
					</div>
                 </div>
					
  
   
     
    

    

  
    
 
	
						
							
					

		<%-- 			<div class="table-responsive">
						<table class="table table-hover ">
							<thead>
								<tr class="active ">
									<th>Issue Id</th>
									<th>Device Name</th>
									<th>Raised Date</th>
									<th>Status</th>
									<th>Type</th>
									<th>Actions</th>
								</tr>
							</thead>

							<tbody>

								<%
									if (fblist != null && !fblist.isEmpty()) {

										for (TblDeviceFeedback fb : fblist) {
								%>
								<tr data-toggle="collapse" data-target="#<%=fb.getId()%>"
									class="clickable collapse-row collapsed">



									<td><%=fb.getId()%></td>
									<td><%=fb.getNodeName()%></td>
									<td><%=fb.getCreatedAt()%></td>
									<td><%=fb.getStatus()%></td>
									<td><%=fb.getType()%></td>

									<td><a href="#" class="btn btn-success btn-sm"
										style="background-color: #64B246; box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">
											+ </a></td>
								</tr>
								<tr>
									<td colspan="6">
										<div id="<%=fb.getId()%>" class="collapse">
											Ticket #<%=fb.getTicketId()%>
											<br>

											<button type="button"
												class="btn btn-success btn-circle btn-sm"
												style="background-color: #64B246; box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">UN</button>
											<%=fb.getTextarea()%>

										</div> <%
 	if (fb.getStatus().equals("Close")) {
 %> <br>
										<p>
											<button type="button" class="btn btn-success btn-sm"
												data-toggle="modal" data-target="#reopen"
												style="background-color: #64B246; box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0">
												<b>Re Open</b>
											</button>

										</p> <%
 	}
 %>

									</td>
								</tr>
								<%
									}
									}
								%>
							</tbody>
						</table>




						<!-- ***************** Table end -->

					</div> --%>
				
					
		        
					</section>
					
					
					
					
		    
				
				<div class="col-md-12">

					<div class="box-body">



						<div class="row">



							<div class="modal  fade in" id="reopen" style="display: none;">
								<div class="modal-dialog">
									<div class="modal-content" style="background-color: #eee">
										<div class="modal-header" style="border: 0">
											<button type="button" class="pull-right" data-dismiss="modal"
												aria-label="Close" style="background: none; border: 0"
												>

												<span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
											</button>
											<h4 class="modal-title">
												<b>Compliant Reopen</b>
											</h4>
										</div>
										<div class="modal-body">
											<form action="userComplaint" method="POST">
												<div class="row">

													<div class="col-xs-12">


														<div class="col-xs-6">

															<div class="form-group">

																<select class="form-control"
																	style="border: 0; border-radius: 6px;" required
																	name="devicename">
																	<option value="">Select Device</option>
                                                                     <option value=" - N/A">N/A</option>
																	<%
																		if (organisations != null && !organisations.isEmpty()) {
																			for (Map.Entry<String, Object> map : organisations.entrySet()) {
																	%>
																	<option value="<%=map.getKey()%> - <%=map.getValue()%>"><%=map.getValue()%></option>
																	<%
																		}
																		}
																	%>
																</select>
															</div>

														</div>
														<div class="col-xs-6">
															<div class="form-group">

																<select class="form-control"
																	style="border: 0; border-radius: 6px;" required
																	name="feedbacktype">
																	<option value="">Complaint Type</option>
																	<%
																		if (fdType != null && !fdType.isEmpty()) {
																			for (Map.Entry<String, String> map : fdType.entrySet()) {
																	%>
																	<option value="<%=map.getKey()%>"><%=map.getValue()%></option>
																	<%
																		}
																		}
																	%>
																</select><input type="hidden" name="status" value="ReOpen">
															</div>

														</div>

														<div class="col-xs-12">
															<div class="form-group">

																<textarea class="form-control" rows="6"
																	placeholder="Enter your comment here"
																	style="border: 0; border-radius: 6px;" required
																	name="comment"></textarea>
															</div>
														</div>
														<div class="col-xs-12">
															<div class="form-group">
																<input type="submit" 
																	class="btn btn-primary btn-sm" width="100px"
																	value="Submit"
																	style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.10); border: 0" />

															</div>
														</div>
													</div>

												</div>

											</form>



										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
						</div>






					</div>
					<!-- /.box-body -->
				</div>

			

		</div>
		<%@include file="footer_v2.jsp"%>
		<div class="control-sidebar-bg"></div>
	</div>






	<!-- jQuery 3 -->
	<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<script src="dashboard/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dashboard/dist/js/demo.js"></script>
	
	<script>
	function ComplaintClean()
	{
		//document.getElementById("selectdevice").value=="";
		document.getElementById("selectdevice").selectedIndex = 0;
		document.getElementById("complainttype").selectedIndex = 0;
		document.getElementById("textcomment").value = '';
		
	}
	
	function onModalclose()
	{
		//document.getElementById("selectdevice").value=="";
		document.getElementById("status1").selectedIndex = 0;
		document.getElementById("comment1").value = '';
		//document.getElementById("selectdevice").value=="";
		document.getElementById("status2").selectedIndex = 0;
		document.getElementById("comment2").value = '';
		
		
	}
	
	
	</script>
	
</body>
</html>