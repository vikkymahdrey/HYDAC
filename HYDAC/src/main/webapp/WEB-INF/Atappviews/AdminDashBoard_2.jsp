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
	.pointer {cursor: pointer;}
	
	.box-aline {
    border-top-left-radius: 2px;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 2px;
    
    float: left;
    min-height: 100%;
    width:100px;
    text-align: center;
    
    text-align: center;
    display: table-cell;
   vertical-align: middle;
   line-height:156PX;
   
 }
	progress {
  border: none;
 
  height: 100px;
  background: crimson;
  border-radius: 9px;
}

progress::-webkit-progress-value {
  background: lightblue;
}progress {
  color: lightblue;
}

progress::-moz-progress-bar {
  background: lightcolor;
}

progress::-webkit-progress-value {
  background: red;
}

progress::-webkit-progress-bar {
  background:local;
}
	
	</style>
</head>
<body class="hold-transition skin-blue skin-black sidebar-mini" >



	<div class="wrapper">


		<!-- Left side column. contains the logo and sidebar -->

		<%@include file="Header_v3.jsp"%> 


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			
			
			<section class="content">   
			<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box" Style="background-color:#F58C1F;height:max-content;">
        
            <span class="box-aline" ><img src="dashboard/dist/img/Dummyicon.png" class="user-image " alt="User Image" height="80px" width="80px" style="text-align: center; vertical-align: middle;"></span>
            

            <div class="info-box-content" style="color:#ffff">
            
              <address style="margin-top:2%">
            <strong><span id="uname"> Apartment name</span></strong><br>

            
            Location &nbsp;:&nbsp;<span id="landmark">Near Silk board </span><br>
             <span id="area">6th Sector,HSR Layout</span><br>
              <span id="City">Bangalore-560030</span><br>
              
              <p ></p>
          </address>
           <br>
          Blocks&nbsp;:&nbsp;<span id="blocks">12</span>&emsp; &emsp; &emsp; &emsp; &emsp; &emsp;&emsp; &emsp; &emsp; &emsp;
          Flats &nbsp;:&nbsp;<span id="flats">300</span>
        
            </div>
            
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>   
        
         <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box" Style="background-color:#64B246;height: max-content;">
            <span class="box-aline" ><img src="dashboard/dist/img/Dummyicon.png" class="user-image " alt="User Image" height="80px" width="80px" style="text-align: center; vertical-align: middle;"></span>
            
            <div class="info-box-content" style="color:#ffff;" >
              
              
            <p style="margin-top:2%"><strong ><span>This month's total water consumption </span></strong></p><br><br>
           
            <!--  <progress max="1000" value="100" class="progress"></progress>-->
            <div class="progress sm" style="margin-left:5px;margin-top:-5%;width:100%;height:5px;background-color:transparent;border-radius:50px;">
                      <div class="progress-bar progress-bar-aqua" data-toggle="tooltip" title="100 Ltr"style="width:20%;background-color:#C7E4FF"></div>
                    </div>
                    <div class="progress sm" style="margin-left:5px;width:100%;height:5px;background-color:transparent;border-radius:50px">
                      <div class="progress-bar progress-bar-aqua" data-toggle="tooltip" title="500 Ltr" style="width:40%;background-color:#2184CE "></div>
                    </div>
                    <div class="progress sm" style="margin-left:5px;width:100%;height:5px;background-color:transparent;border-radius:50px">
                      <div class="progress-bar progress-bar-aqua" data-toggle="tooltip" title="1000 Ltr" style="width:60%;background-color:#24659F"></div>
                    </div>
               
                    
                    <br><br>
          Device&nbsp;:&nbsp;<span id="blocks">500</span>&emsp; &emsp; &emsp; &emsp; &emsp;&emsp;&emsp; &emsp;&emsp;
          Total consumption &nbsp;:&nbsp;<span id="flats">1000 <span>Ltr</span></span>
        
          
          
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>   
        </div>
        </div>
        
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
						<div class="box box-success">
							<div class="box-header with-border">
								<div class="row">
								
							<div class="col-sm-12">
							<h3 class="box-title col-sm-3 pull-left">Monthly history</h3>
						    

								
                                
                    <div class="input-group date col-sm-2  pull-right pointer" id="datepicker2">
                  
                  <input type="text" class="form-control " >
                  <div class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                  </div>
                </div>
                        
							</div>
							</div>

								
							</div>
							<div class="box-body chart-responsive">
							<div class="row">
							<div class="col-md-10">
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
								<div class="col-md-2" style="color:gray">
                               <span><b>A&nbsp;<i class="glyphicon glyphicon-arrow-right"></i>&nbsp;Block1</b></span><br>
                               <span><b>B&nbsp;<i class="glyphicon glyphicon-arrow-right"></i>&nbsp;Block2</b></span><br>
                              <span><b>C&nbsp;<i class="glyphicon glyphicon-arrow-right"></i>&nbsp;Block3</b></span><br>
                              
                                 
                  
                  
                                </div>
                <!-- /.col -->
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
        
			
			


			<section class="content">

				<div class="row">
					<div class="col-md-4">
						<!-- AREA CHART -->

						<!-- /.box -->

						<!-- DONUT CHART -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Loading...</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart1"
									style="height: 300px; position: relative;">
									
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
					<!-- /.col (LEFT) -->

					<!-- /.col (RIGHT) -->
					<div class="col-md-4">
						<!-- AREA CHART -->

						<!-- /.box -->

						<!-- DONUT CHART -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Loading...</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart2"
									style="height: 300px; position: relative;">
									
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
					<div class="col-md-4">
						<!-- AREA CHART -->

						<!-- /.box -->

						<!-- DONUT CHART -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Loading...</h3>

								
							</div>
							<div class="box-body chart-responsive">
								<div class="chart" id="sales-chart3"
									style="height: 300px; position: relative;">
																	</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
				</div>
				<!-- /.row -->

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

	

<script type="text/javascript">
	
    
	   $('#datepicker1').datepicker({
	      autoclose: true,
	      minViewMode: 0,
	      format:"dd/mm/yyyy",
	      orientation: "bottom",
	      
	      
	    }).datepicker("setDate",new Date());
	     
	     
	   $('#datepicker2').datepicker({
		      autoclose: true,
		      minViewMode: 1,
		      format:"MM",
		      orientation: "bottom"
		      
		      
		      
		    }).datepicker("setDate", new Date());
		     



</script>
<script type="text/javascript">
var data2 = [
    { y: 'A', a: 50, b: 90},
    { y: 'B', a: 65,  b: 75},
    { y: 'C', a: 50,  b: 50},
    { y: 'D', a: 75,  b: 60},
    { y: 'E', a: 80,  b: 65},
    { y: 'F', a: 90,  b: 70},
    { y: 'G', a: 100, b: 75},
    { y: 'H', a: 115, b: 75},
    { y: 'I', a: 120, b: 85},
    { y: 'J', a: 145, b: 85},
    { y: 'K', a: 160, b: 95},
    { y: 'L', a: 90,  b: 70},
    { y: 'M', a: 100, b: 75},
    { y: 'N', a: 115, b: 75},
    { y: 'O', a: 120, b: 85},
    { y: 'P', a: 145, b: 85},
    { y: 'Q', a: 160, b: 95},
  ],
  config2 = {
    data: data2,
    xkey: 'y',
    ykeys: ['a', 'b'],
    labels: ['Total Income', 'Total Outcome'],
    fillOpacity: 0.6,
    hideHover: 'auto',
    behaveLikeLine: true,
    resize: true,
    pointFillColors:['#ffffff'],
    pointStrokeColors: ['black'],
    lineColors:['gray','red'],
    stacked : true
};

config2.element = 'bar-chart';
Morris.Bar(config2);
Morris.Donut({
	  element: 'sales-chart1',
	  data: [
	    {label: "Friends", value: 30},
	    {label: "Allies", value: 15},
	    {label: "Enemies", value: 45},
	    {label: "Neutral", value: 10}
	  ]
	});

Morris.Donut({
	  element: 'sales-chart2',
	  data: [
	    {label: "Friends", value: 30},
	    {label: "Allies", value: 15},
	    {label: "Enemies", value: 45},
	    {label: "Neutral", value: 10}
	  ]
	});
Morris.Donut({
	  element: 'sales-chart3',
	  data: [
	    {label: "Friends", value: 30},
	    {label: "Allies", value: 15},
	    {label: "Enemies", value: 45},
	    {label: "Neutral", value: 10}
	  ]
	});



</script>
<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
</script>

</body>
</html>
