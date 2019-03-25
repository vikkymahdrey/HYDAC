<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <title>Dash board</title>
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
<!-- Ionicons -->

<!-- Theme style -->
<link rel="stylesheet" href="dashboard/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="dashboard/dist/css/skins/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet"
	href="dashboard/bower_components/morris.js/morris.css">

<!-- Date Picker -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="dashboard/customcolors/unizencolors.css">

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
	
	<!-- jQuery 3 -->
	<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- datepicker -->
	<script src="dashboard/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<style>
	
	 *{
   font-family:Segoe UI;
 }
 body{
 font-family:Segoe UI;
 }
	
	.pointer {cursor: pointer;}
	
	.small-box1 {
    border-radius: 2px;
    position: relative;
    display: block;
    margin-bottom:20px;
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);
    background-color:#ffff;
    height:max-content;
	}
	.small-box-footer1 {
    position: relative;
    text-align: center;
    padding: 3px 0;
    color: #fff;
    display: block;
    z-index: 10;
    text-decoration: none;
     margin-top:5px;
   }
   
   .example{
   
  margin-top: -95px;
  
  margin-left: 90px;
  max-width:50%;
  justify-content: space-between;
   text-align:center;
 }
 
   .example1{
   
   margin-top: -95px;
   margin-left:80px;
   max-width:100%;
   
   text-align:center;
   }
  
   @media screen and (max-width:600px) {
	   .example {
	   margin-top:-95px;
       margin-left:130px;
       position:inherit;
	 text-align: center; 
	  
	   }
	   }
	   
	   @media screen and (max-width:600px) {
	   .example1 {
	   margin-top:-95px;
       margin-left:60px;
       position:inherit;
	 text-align: center; 
	  
	   }
	   }
    
    
	</style>
	



	
</head>
<body class="hold-transition skin-blue skin-black sidebar-mini" onload="loadData()">



	<div class="wrapper">


		<!-- Left side column. contains the logo and sidebar -->

		<%@include file="Header_v2.jsp"%> 


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Total Water Consumption <small></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><button class=" btn btn-success"style="font-size:15px;background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;text-align:center" onclick="loadData()">Refresh &nbsp;<i class="fa fa-refresh fa-spin"></i> </button></a></li>
				
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Donot delete this tab -->
				
				<div id="refTotal" style="display: none;" class="col-lg-4 col-md-6 col-xs-12">
						<!-- small box -->
						<div class=" small-box1 bg-green" style="margin-top:30px">
						<!--     <div class="inner">
							  	<h3>
									53<sup style="font-size: 20px">%</sup>
								</h3>
							 	<p>Bounce Rate</p>
							</div>
							
						 	<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							
							  <span></span>
							
							<a href="#" class="small-box-footer" >
								class="fa fa-arrow-circle-right"></i></a>-->
							 
                              <div class="row">
                              <div class="col-md-6 col-xs-6">
							 <img src='dashboard/dist/img/Meter_1.png' class='user-image' alt='User Image' height='180' width='180'>
							 <br>
							 <span>
							 <img src='dashboard/dist/img/Drop_1.png' class='user-image' alt='User Image' height='26' width='18'Style='margin-top:-250px;auto;margin-right:auto;margin-left:150px'></span><br>
							 <span><img src='dashboard/dist/img/Drop_2.png' class='user-image' alt='User Image' height='22' width='15'Style='margin-top:-235px;margin-right:auto;margin-left:151px'></span><br>
							 <span><img src='dashboard/dist/img/Drop_3.png' class='user-image' alt='User Image' height='18' width='13'Style='margin-top:-230px;margin-right:auto;margin-left:152px'></span><br>
							 <span><img src='dashboard/dist/img/Bowl_1.png' class='user-image' alt='User Image' height='100' width='100' Style='margin-top:-157px;margin-right: auto;margin-left:109px' class='img-responsive'></span><br>
							
							<div class=" col-lg-3 text-center" style="width:100%" >
							
							<p class="text-center" id="watercount">1000000000
							<br><small>Ltr</small></p>
							</div>
							</div>
							
							<div class="col-md-6 col-xs-6  text-center" style=" overflow-wrap: break-word;">
							<p style="margin-top:15px;font-size:17px;color:#616160">water meter</p>
							</div>
							
						<!--  	<div class="col-md-6 col-xs-6 ">
							<p style="margin-top:130px; margin-left:50px;font-size:17px;color:#616160">water source</p>
							</div>-->
					       </div>
							<a id="footer1" href="#" class="small-box-footer1"></a>
							
						</div>
					</div>
				
				<div id="totalConsumption" class="row">

					<!-- ./col -->
					
					<!-- ./col -->
					<!--   <div class="col-lg-4 col-xs-6">
          
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>User Registrations</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        ./col
        <div class="col-lg-4 col-xs-6">
          small box
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>Unique Visitors</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div> -->
					<!-- ./col -->
				</div>
				<!-- /.row -->

				<!-- Main row -->
				

			</section>
			
			<section class="content">
			
			<div class="row">
					<!-- Left col -->
					<section class="col-lg-12 connectedSortable">
						<!-- Custom tabs (Charts with tabs)-->
						<div class="nav-tabs-custom">
							<!-- Tabs within a box -->
							<div class="box-header with-border">
								<div class="row">
							<div class="col-sm-12">
							<h3 class="box-title col-sm-3 pull-left">Daily history</h3>
						    

								
                                
                    <div class="input-group date col-sm-3  pull-right pointer" id="datepicker1">
                  
                  <input type="text" class="form-control" id="dayreportfordate" onchange ="getcurrebtDaysReport()" value="">
                  <span class="input-group-btn">
                            <button type="button" class="btn btn-success btn-flat"style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);text-align:center">Calendar&nbsp;<i class="glyphicon glyphicon-calendar"></i></button>
                          </span>
                </div>
                        
							</div>
							</div>

							
							</div>
							<div class="tab-content no-padding">
								<!-- Morris chart - Sales -->
								<div class="chart tab-pane active" id="daily-chart"
									style="position: relative; height: 300px;"></div>

							</div>
						</div>
						<!-- /.nav-tabs-custom -->

						<!-- Chat box -->

						<!-- /.box (chat box) -->

						<!-- TO DO List -->

						<!-- /.box -->

						<!-- quick email widget -->


					</section>
					<!-- /.Left col -->
					<!-- right col (We are only adding the ID to make the widgets sortable)-->

					<!-- right col -->
				</div>
				<!-- /.row (main row) -->
			
			
			</section>
			
			
			
			<section class="content">
				<!-- <div class="callout callout-warning">
        <h4>Warning!</h4>
     
        <p><b>Morris.js</b> charts are no longer maintained by its author. We would recommend using any of the other
          charts that come with the template.</p>
      </div>-->
				<div class="row">

					<!-- /.col (LEFT) -->
					<div class="col-md-12">
						<!-- LINE CHART -->

						<!-- /.box -->

						<!-- BAR CHART -->
						<div class="box" style="border:0">
							<div class="box-header with-border">
								<div class="row">
							<div class="col-sm-12">
							<h3 class="box-title col-sm-3 pull-left">Monthly history</h3>
						    

								
								
								<div class="input-group date col-sm-3  pull-right pointer" id="datepicker2">
                  
                  <input type="text" class="form-control" name="mothofseection" id="monthselected" onchange ="manualmonthload()" value="">
                  <span class="input-group-btn">
                            <button type="button" class="btn btn-success btn-flat"style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);text-align:center">Calendar&nbsp;<i class="glyphicon glyphicon-calendar"></i></button>
                          </span>
                </div>
								
								
								
                                

                  <!--    <div class="input-group date col-sm-3  pull-right pointer" id="">
                  
                  <input type="month" value="" name="mothofseection" id="monthselected"  onchange="manualmonthload()" class="form-control " >
                  <div class="input-group-btn">
                  
                    <button type="button" class="btn btn-success btn-flat"style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);text-align:center">Calendar&nbsp;<i class="glyphicon glyphicon-calendar"></i></button>
                  </div>
                </div>-->
                
                
                        
							</div>
							</div>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="bar-chart"
									style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
								
									<div class="morris-hover morris-default-style"
										style="left: 981.852px; top: 112px; display: none;">
										<div class="morris-hover-row-label">2011</div>
										<div class="morris-hover-point" style="color: #00a65a">
											CPU: 75</div>
										<div class="morris-hover-point" style="color: #f56954">
											DISK: 65</div>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
					<!-- /.col (RIGHT) -->
				</div>
				<!-- /.row -->



			</section>
           
      <!--       <section class="content">

				<div class="row">
					<div class="col-md-4">
						
						<!- - DONUT CHART - ->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Loading...</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart1"
									style="height: 300px; position: relative;">
								
								</div>
							</div>
							
						</div>
						

					</div>
					

					
					<div class="col-md-4">
						

						<!- - DONUT CHART - ->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Loading...</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart2"
									style="height: 300px; position: relative;">
									
								</div>
							</div>
							
						</div>
						

					</div>
					<div class="col-md-4">
						

					
						<!- - DONUT CHART - ->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Loading...</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart3"
									style="height: 300px; position: relative;">
																	</div>
							</div>
							
						</div>
					
					</div>
				</div>
				

			</section>-->
           

		 	<section class="content">
               <div class="box" style="border:0">
               <div class="box-header with-border">
								<div class="row">
							<div class="col-sm-12">
							<h3 class="box-title col-sm-3 pull-left">Comparison</h3>
						    </div>
							</div>

								
							</div>
				<div class="row">
					<div class="col-md-4">
						
						<!-- DONUT CHART -->
						
						 <div class="box-body chart-responsive" style="border:0">
								<div class="chart" id="sales-chart1"
									style="height: 300px; position: relative;">
								</div>
								<div class="chart text-center" id="nodata1"
									style="height: 300px; position: relative;display: none;">
								<img src="dashboard/dist/img/Nointernet.png" class="user-image text-center" alt="User Image" height="150px" width="120px" style="margin-top:55px;">
								<p style="font-size:40px;font-style: normal;color:red"><b>No data</b></p>
								</div>
							</div>
							
							<div class="box-footer text-center" style="border:0">
                             <h3 class="box-title">Loading...</h3>
                           </div>
							
                      </div>
					
					<div class="col-md-4">
						

						<!-- DONUT CHART -->
						
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart2"
									style="height: 300px; position: relative;">
									
									
								</div>
								
								<div class="chart text-center" id="nodata2"
									style="height: 300px; position: relative;display: none;">
								<img src="dashboard/dist/img/Nointernet.png" class="user-image text-center" alt="User Image" height="150px" width="120px" style="margin-top:55px;">
								<p style="font-size:40px;font-style: normal;color:red"><b>No data</b></p>
								</div>
								
							</div>
							
							<!-- /.box-body -->
							<div class="box-footer text-center" style="border:0">
                            <h3 class="box-title">Loading...</h3>
                           </div>
						
						<!-- /.box -->

					</div>
					<div class="col-md-4">
						

						<!-- DONUT CHART -->
						
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart3"
									style="height: 300px; position: relative;">
																	
								</div>
								
								<div class="chart text-center" id="nodata3"
									style="height: 300px; position: relative; display: none;">
								<img src="dashboard/dist/img/Nointernet.png" class="user-image text-center" alt="User Image" height="150px" width="120px" style="margin-top:55px;">
								<p style="font-size:40px;font-style: normal;color:red"><b>No data</b></p>
								</div>									
							</div>
							<!-- /.box-body -->
							<div class="box-footer text-center" style="border:0">
                            <h3 class="box-title">Loading...</h3>
                           </div>
						
						<!-- /.box -->

					</div>
				</div>
				<!-- /.row -->
              </div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
			<%@include file="footer_v2.jsp"%>


		<!-- Control Sidebar -->
	
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
 <div class="modal" id="modal-info-loader" data-backdrop="static" style="display: block; padding-right: 17px;">
        
        <div class="row">
         <div class="col-sm-5"></div>
        <div class="col-sm-4">
        <div class="loader"></div>
        </div>
          </div>
         
        </div>  
        
	
	<!-- jQuery UI 1.11.4 -->
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Morris.js charts -->
	<script src="dashboard/bower_components/raphael/raphael.min.js"></script>
	<script src="dashboard/bower_components/morris.js/morris.min.js"></script>
	<!-- Sparkline -->
		<!-- jvectormap -->
	
	<!-- jQuery Knob Chart -->
	<script
		src="dashboard/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
		<script
		src="dashboard/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<!-- Bootstrap WYSIHTML5 -->
	
	<!-- Slimscroll -->
	<script
		src="dashboard/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	
	<!-- AdminLTE App -->
	<script src="dashboard/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dashboard/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->

	<script>
	
	var urlval = window.location.href.split("/")[3];
//	alert(urlval)
	
	var loader = document.getElementById("modal-info");
	
	
	setInterval(loadData, 60000);
	
	
	var load = false;
	function loaderz(){
		
		if(load == false){
			loader.setAttribute("style","display:block");
			load = true;	
		}else{
			loader.setAttribute("style","display:none");
			load = false;
		}
		
	}
	
	
	
	
	
	function loadData(){
		try{
			getcurrebtDaysReport();
		    getMonthDates();	
		}
		catch(e){
			
			location.replace("/"+urlval)
		}
		
	}
	
	

	
	
		var dayreportjson = {}
		var totalConsumption = {}
		var dateJSON={"FirstMonth":{from:" ",to:" "},"SecondMonth":{from:" ",to:" "},"ThiredMonth":{from:" ",to:" "}};

		var monthconsumtion = {"FirstMonth":'',"SecondMonth":'',"ThiredMonth":''}
		
		var weekJSON={"FirstWeek":{from:" ",to:" "},"SecondWeek":{from:" ",to:" "},"ThirdWeek":{from:" ",to:" "},"FourthWeek":{from:" ",to:" "}};
		const monthNames = ["January", "February", "March", "April", "May", "June",
			  "July", "August", "September", "October", "November", "December"
			];
		
		
		
		
		function drawbarchart(){
			
			
var tempdata = []
var yykeys = []



for(var devices in totalConsumption){

yykeys.push(devices.split("->")[0])
}

			
			for(var week in weekJSON){
				
				
				
				
				var consuptionref = {y:''+weekJSON[week].from.split(" ")[0]+'-'+weekJSON[week].to.split(" ")[0]};
				for(var device in totalConsumption){
					
					var responsejson ;
						
					try{				
					 responsejson = JSON.parse(getConsumtion(device.split("->")[1],weekJSON[week].from,weekJSON[week].to,null))
					}catch(e){
						location.replace("/"+urlval);
					}
					
					var result = responsejson.result;
					
					var tempconsumtion = 0;
					
					for(var obj in result){
						
						tempconsumtion = tempconsumtion + result[obj].units;
						
					}
					
					consuptionref[''+device.split("->")[0]+''] = tempconsumtion
					

				}
				tempdata.push(consuptionref)
			}
			
			$("#bar-chart").empty();
			
			var bar = new Morris.Bar({
				element : 'bar-chart',
				resize : true,
				data : tempdata,
				barColors :  [ '#235E93', '#64B246', '#91191C','#F58C1F','#235E93', '#64B246', '#91191C','#F58C1F'],
				xkey : 'y',
				ykeys : yykeys,
				labels : yykeys,
				hideHover : 'auto',


			});
			
			document.getElementById("modal-info-loader").style.display = "none";	
		}
		
		
		
		
		
		var monthfilterdate = new Date();
		
		function getWeeksDates()
		{
		
			
			
			
		   var date =monthfilterdate ;
		   
		  //console.log(date)
		   var year = date.getFullYear(), month = date.getMonth();
		   //alert(year);
		  // alert(month);
		  
		   weekJSON.FirstWeek.from = new Date(year, month, 1).toLocaleDateString() + " 00:00:00";
		   weekJSON.FirstWeek.to=new Date(year, month, 7).toLocaleDateString()+ " 24:00:00";
		   
		   weekJSON.SecondWeek.from = (month+1)+"/08/"+year+ " 00:00:00"
		   weekJSON.SecondWeek.to=new Date(year, month, 14).toLocaleDateString()+ " 24:00:00";
		       
		   weekJSON.ThirdWeek.from= new Date(year, month, 15).toLocaleDateString()+ " 00:00:00";
		   weekJSON.ThirdWeek.to=new Date(year, month, 21).toLocaleDateString()+ " 24:00:00";
		       
		   weekJSON.FourthWeek.from = new Date(year, month, 22).toLocaleDateString()+ " 00:00:00";
		   
		   weekJSON.FourthWeek.to=new Date(year, month + 1, 0).toLocaleDateString()+ " 24:00:00";      
		
			
		   
		if(weekJSON.FourthWeek.from.split("/")[0].length == 1){
			weekJSON.FourthWeek.from = "0"+weekJSON.FourthWeek.from
			
		}
		if(weekJSON.FourthWeek.to.split("/")[0].length == 1){
			weekJSON.FourthWeek.to = "0"+weekJSON.FourthWeek.to
			
		}
		   
		drawbarchart();	
		}
		
		function lastFirstmonthdonut(){
			var tempmonth = JSON.stringify(dateJSON.FirstMonth.from).split('"')[1].split("/")[0]
			document.getElementById('sales-chart1').parentElement.parentElement.getElementsByTagName('h3')[0].innerHTML =monthNames[parseInt(tempmonth)-1]//(dateJSON.FirstMonth.from +' to '+ dateJSON.FirstMonth.to)
			
			if( monthconsumtion.FirstMonth[0].label=='Water Consumption')
				{
				  
				   document.getElementById("sales-chart1").style.display="none";
				   document.getElementById("nodata1").style.display="block";
				   
				}else{
					
				var donut = new Morris.Donut({
				element : 'sales-chart1',
				resize : true,
				colors : [ '#235E93', '#64B246', '#91191C','#F58C1F','#235E93', '#64B246', '#91191C','#F58C1F'],
				data :monthconsumtion.FirstMonth,
				hideHover : 'auto'
			});
				
				}
			lastSecondmonthdonut();
		}

		function lastSecondmonthdonut(){
			var tempmonth = JSON.stringify(dateJSON.SecondMonth.from).split('"')[1].split("/")[0]
			document.getElementById('sales-chart2').parentElement.parentElement.getElementsByTagName('h3')[0].innerHTML = monthNames[parseInt(tempmonth)-1]
			
			
			 if( monthconsumtion.SecondMonth[0].label=='Water Consumption')
				{
				   document.getElementById("sales-chart2").style.display="none";
				   document.getElementById("nodata2").style.display="block";
				   
				}else{
					
			
			var donut = new Morris.Donut({
				element : 'sales-chart2',
				resize : true,
				colors : [ '#235E93', '#64B246', '#91191C','#F58C1F','#235E93', '#64B246', '#91191C','#F58C1F'],
				data :monthconsumtion.SecondMonth,
				hideHover : 'auto'
			});
				}
			lastThirdmonthdonut();	
		}

		function lastThirdmonthdonut(){
			var tempmonth = JSON.stringify(dateJSON.ThiredMonth.from).split('"')[1].split("/")[0]
			
			document.getElementById('sales-chart3').parentElement.parentElement.getElementsByTagName('h3')[0].innerHTML = monthNames[parseInt(tempmonth)-1]
			
			 if(monthconsumtion.ThiredMonth[0].label=='Water Consumption')
				{
				   document.getElementById("sales-chart3").style.display="none";
				   document.getElementById("nodata3").style.display="block";
				   
				}else{
					
			
			var donut = new Morris.Donut({
				element : 'sales-chart3',
				resize : true,
				colors : [ '#235E93', '#64B246', '#91191C','#F58C1F','#235E93', '#64B246', '#91191C','#F58C1F'],
				data : monthconsumtion.ThiredMonth,
				hideHover : 'auto'
			});
				}
			getWeeksDates();
		}

function createdonotjson(){
	
	for(var i in dateJSON){
		
		var consuptionref = [];
		
		for(var device in totalConsumption){
			
			
			var responsejson;
			
			
			try{
				
			
			responsejson = JSON.parse(getConsumtion(device.split("->")[1],dateJSON[i].from,dateJSON[i].to,null))
		
			}catch(e){
				location.replace("/"+urlval);
			}
			
			var result = responsejson.result;
			
			var tempconsumtion = 0;
			
			for(var obj in result){
				
				tempconsumtion = tempconsumtion + result[obj].units;
				
			}
			var devicedataref = {label:device.split("->")[0],value:tempconsumtion}
			consuptionref.push(devicedataref);
			
		}
		
		var consumptiontest = 0;
		for(var index in consuptionref){
			
			consumptiontest = consumptiontest + consuptionref[index].value
		}
		
		if(consumptiontest > 0){
			monthconsumtion[i] = consuptionref;
		}else {
			
			monthconsumtion[i] = [{label:'Water Consumption',value:0}]
			
			
		}
		
	}
	lastFirstmonthdonut();	
	
}


function getConsumtion(devid,fromDate,toDate,filter){
	
	
	
	var jsonVal;
	
	   $.ajax({
           url: 'getGraphOnDemand',
           async: false,
           type: 'POST',
           data: jQuery.param({ devId : devid,fromDate : fromDate, toDate:toDate,type: 'days'}) ,
           success: function (data) {
        	   jsonVal=data; 
        	  
        	   },
		 		error: function(e){
		 			location.replace("/"+urlval)
		 			
		 		}

              
           }); 


	   return jsonVal;

}

var collop = 0;
function getLineColors(){
			
	if(collop == 4){
		collop = 0;
	}
	var staticlineColors = [ '#235E93', '#64B246', '#91191C','#F58C1F']
			
			return staticlineColors[collop++]
		
		}
		
		
		var colorloop = 0;
		
		function getBoxColor(){
			if(colorloop == 4){
				colorloop = 0;
			}
			var totalBoxClasses = ['unizen-blue','unizen-green','unizen-red','unizen-orange']
			return totalBoxClasses[colorloop++]
			
		}
		
		
		
		
		
		
		function getcurrebtDaysReport() {
			
			
			//console.log(document.getElementById("dayreportfordate").value)
			
			$.ajax({
				url : 'getGraphOnBodyLoad?date='+document.getElementById("dayreportfordate").value,
				async: false,
				type : 'GET',
				success : function(data) {
					
					try{
						dayreportjson = JSON.parse(data);
					}
					catch(e){
						
						location.replace("/"+urlval)
					}

					plotdayChart();
				},
				error : function(e) {
					location.replace("/"+urlval)
				}

			});

			$.ajax({
				url : 'totalWaterConsumedByUser',
				async: false,
				type : 'GET',
				success : function(data) {
					
					try{
						totalConsumption = data;
					
				//	console.log(totalConsumption)
					}
					catch(e){
						
						location.replace("/"+urlval)
					}

				
					plotTotalConsuption()

				},
				error : function(e) {
					location.replace("/"+urlval)				}

			});

		}

		function plotTotalConsuption() {
			
			colorloop = 0;
			var refdiv = document.getElementById('refTotal')	

			var devicesCount = Object.keys(totalConsumption).length;
			
			document.getElementById('totalConsumption').innerHTML = "";
			
			for ( var i in totalConsumption) {
				
				//console.log(totalConsumption)

				var innerval = refdiv.cloneNode(true);

				innerval.setAttribute("style", "");
				innerval.setAttribute("id", "");
				
				var boxwidthclass = 'col-lg-4 col-md-6 col-xs-12';
				if(devicesCount == 1){
					
					innerval.getElementsByTagName("div")[3].setAttribute("class","example1");
					boxwidthclass = 'col-lg-4 col-md-6 col-xs-12'
					
				}else if(devicesCount == 2){
					innerval.getElementsByTagName("div")[3].setAttribute("class","example1");
					boxwidthclass = 'col-lg-4 col-md-6 col-xs-12'
				}else{
					innerval.getElementsByTagName("div")[3].setAttribute("class","example1");
				}
				
				innerval.setAttribute("class",boxwidthclass)
                innerval.getElementsByTagName("p")[0].innerHTML ="<span >"+"<font size='2'>"+"<b>"+'&nbsp;&nbsp;'+totalConsumption[i] +'&nbsp;'+"</br>"+"<small>Ltrs</small>"+"</b>"+"</font>"+"</span>";
                innerval.getElementsByTagName("p")[1].innerHTML ="<span>"+ "<b>"+i.split('->')[0]+"</b>"+"</span>";
				innerval.getElementsByTagName("div")[0].setAttribute("class","small-box1");
				//innerval.getElementsByTagName("div")[0].classList.add(getBoxColor());
				//innerval.getElementsByTagName("h3")[0].innerHTML = "<span style='color:white'>"+totalConsumption[i] + "<small style='color:white'>Ltrs</small>"+"</span>";
				//innerval.getElementsByTagName("div")[4].innerHTML = "<span >"+totalConsumption[i] +"<br>"+ "<small>Ltrs</small>"+"</span>";
				//innerval.getElementsByTagName("p")[0].innerHTML ="<span >"+"<font size='2'>"+"<b>"+'&nbsp;&nbsp;'+10000000000+'&nbsp;'+"</br>"+"<small>Ltrs</small>"+"</b>"+"</font>"+"</span>";
				innerval.getElementsByTagName("a")[0].setAttribute("class","small-box-footer1");
				innerval.getElementsByTagName("a")[0].classList.add(getBoxColor());
				//---------adding imaege-----------
				//innerval.getElementsByTagName("span")[0].innerHTML = "<span>"+"<img src='dashboard/dist/img/Meter.png' class='user-image' alt='User Image' height='180' width='180'>"+"<br>"+"<span>"+"<img src='dashboard/dist/img/Drop_1.png' class='user-image' alt='User Image' height='30' width='20'Style='margin-top:-250px;auto;margin-right:auto;margin-left:149px'>"+"</span>"+"<br>"+"<span>"+"<img src='dashboard/dist/img/Drop_2.png' class='user-image' alt='User Image' height='25' width='18'Style='margin-top:-230px;margin-right:auto;margin-left:150px'>"+"</span>"+
				                                                  // "<br>"+"<span>"+"<img src='dashboard/dist/img/Drop_3.png' class='user-image' alt='User Image' height='20' width='15'Style='margin-top:-224px;margin-right:auto;margin-left:152px'>"+"</span>"+"<br>"+"<span>"+"<img src='dashboard/dist/img/Bowl_1.png' class='user-image' alt='User Image' height='100' width='100' Style='margin-top:-157px;margin-right: auto;margin-left:110px' class='img-responsive'>"+"<br>"+"<span style='margin-top:-500px'>hiii</span>"+"</span>"+"</span>";
				
				
				document.getElementById('totalConsumption').appendChild(
						innerval);

			}
		
		}

		function plotdayChart() {
			collop =0;
			var ykeys = []
			var labels = []
			var lineColors = []

			var eachValObj = {}

			var dataVal = []

			try {
				var config = dayreportjson.result.units;
				var timeval = dayreportjson.result.xAxis.categories;

				for ( var k in config) {

					ykeys.push(config[k].name);
					labels.push(config[k].name.split('->')[0]);
					lineColors.push(getLineColors())

				}

				for ( var i in timeval) {

					var newobj = {}
					newobj['y'] = timeval[i]

					for ( var j in config) {

						var waterval = config[j].data[i]
						var name = config[j].name

						newobj['' + name + ''] = waterval;

					}

					dataVal.push(newobj)

				}

			} catch (e) {

				var line = new Morris.Line({
					element : 'daily-chart',
					resize : true,
					data : dataVal,
					xkey : 'y',
					ykeys : ykeys,
					labels : labels,
					lineColors : lineColors,
					hideHover : 'auto'
				});

			}
			
			$("#daily-chart").empty();

			var line = new Morris.Line({
				element : 'daily-chart',
				resize : true,
				data : dataVal,
				xkey : 'y',
				ykeys : ykeys,
				labels : labels,
				lineColors : lineColors,
				hideHover : 'auto'
			});

		}
		
		
		
		
		 function monthformat(value){
			 
				if(value.split("/")[0].length == 1){
					   
					   return "0"+value;
					   
				   } else{
					   return value;
					   
				   }
				 }
		
		
			function getMonthDates()
		{

		   var date = new Date();
		   var year = date.getFullYear(), month = date.getMonth();

		   dateJSON.FirstMonth.from = monthformat(new Date(year, month, 1).toLocaleDateString())+ " 00:00:00";
		   
		  dateJSON.FirstMonth.to = monthformat(new Date(year, month + 1, 0).toLocaleDateString())+ " 24:00:00";
		   
		   dateJSON.SecondMonth.from = monthformat(new Date(year, month-1, 1).toLocaleDateString())+ " 00:00:00";
		   dateJSON.SecondMonth.to = monthformat(new Date(year, (month-1)+1, 0).toLocaleDateString())+ " 24:00:00";
		 
		   
		   dateJSON.ThiredMonth.from =monthformat( new Date(year, month-2, 1).toLocaleDateString())+ " 00:00:00";
		   dateJSON.ThiredMonth.to= monthformat(new Date(year, (month-2) + 1, 0).toLocaleDateString())+ " 24:00:00";
		
		 
		   
		   createdonotjson();
		   
		}
			
			
			function manualmonthload(){
				var monttemp=document.getElementById("monthselected").value;
				//monthfilterdate = new Date(monttemp.split("-")[0],parseInt(monttemp.split("-")[1])-1,1,12,0,0,0);
				
				monthfilterdate = new Date(monttemp);
				getWeeksDates();
				
				
			}
		
			
			
</script>

<script type="text/javascript">
	
    
	   $('#datepicker1').datepicker({
		   maxDate: 2, 
	   
	      autoclose: true,
	      minViewMode: 0,
	      format:"dd/mm/yyyy",
	      orientation: "bottom",
	      
	      
	    }).datepicker("setDate",new Date());
	     
	     
	  $('#datepicker2').datepicker({
		      autoclose: true,
		      minViewMode: 1,
		      format:"MM yyyy",
		      orientation: "bottom"
		      
		      
		      
		    }).datepicker("setDate", new Date());
		     

	   
	   

</script>


</body>
<style>


.loader {
 margin-top:200px;
  margin-left:100px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #235E93;
  border-right: 16px solid #64B246;
  border-bottom: 16px solid #F58C1F;
  border-left: 16px solid  #91191C;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>

</html>
