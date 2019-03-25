<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> Invoice</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="dashboard/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="dashboard/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="dashboard/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue skin-black sidebar-mini">
<div class="wrapper">

  
  
  <!-- Left side column. contains the logo and sidebar -->
  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Invoice
        <small>#007612</small>
      </h1>
      <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Invoice</li>
      </ol>
    </section>

    

    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> Unizen Technologies Pvt. Ltd
            <small class="pull-right">Date : <span id="datetime"></span>
             <script>
 
             var today = new Date();
             var dd = today.getDate();
             var mm = today.getMonth() + 1;
             var yyyy = today.getFullYear();
             if (dd < 10) {
               dd = '0' + dd;
             } 
             if (mm < 10) {
               mm = '0' + mm;
             } 
             var today = yyyy + '-' + mm + '-' + dd;
             document.getElementById('datetime').innerHTML = today;
             
             </script>
             </small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          From
          <address>
            <strong>Unizen Technologies Pvt. Ltd</strong><br>
            577/B, 2nd Floor, Near Silk Board<br>
            Adjacent to Skoda Showroom<br>
            Santhosapuram, Sector 6, HSR Layout<br> 
            Bengaluru, Karnataka 560102<br>
            Phone: (+91)-9888998889<br>
            Email: info@unizentechnologies.com
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          To
          <address>
            <strong><span id = "uname">John Doe</span></strong><br>
            795 Folsom Ave, Suite 600<br>
            San Francisco, CA 94107<br>
            Phone:<span id = uphone>(555) 539-1037</span><br>
            Email:<span id = uemail>john.doe@example.com</span>
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          <br>
          <br>
          <br>
          <b>Account:</b> 968-34567
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Serial No.</th>
              <th>Product</th>
              <th>Slab 1</th>
              <th>Slab 1 price</th>
              <th>Slab 2</th>
              <th>Slab 2 price</th>
              <th>Slab 3</th>
              <th>Slab 3 price</th>
              <th>Sub-Total</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td>1234567</td>
              <td>345</td>
              <td>Rs.230</td>
              <td>265</td>
              <td>Rs.180</td>
              <td>500</td>
              <td>Rs.330</td>
              <td>Rs.740</td>
            </tr>
            <tr>
              <td>2</td>
              <td>1234789</td>
              <td>100</td>
              <td>Rs.100</td>
              <td>454</td>
              <td>Rs.280</td>
              <td>321</td>
              <td>Rs.200</td>
              <td>Rs.580</td>
            </tr>
            <tr>
              <td>3</td>
              <td>1235678</td>
              <td>600</td>
              <td>Rs.370</td>
              <td>150</td>
              <td>Rs.110</td>
              <td>420</td>
              <td>Rs.260</td>
              <td>Rs.640</td>
            </tr>
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      
      <!-- /.row -->

      <div class="row">
        <!-- accepted payments column -->
        <div class="col-xs-6">
          <p class="lead">Payment Methods:</p>
          <img src="dashboard/dist/img/credit/visa.png" alt="Visa">
          <img src="dashboard/dist/img/credit/mastercard.png" alt="Mastercard">
          <img src="dashboard/dist/img/credit/american-express.png" alt="American Express">
          <img src="dashboard/dist/img/credit/paypal2.png" alt="Paypal">

          <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg
            dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
          </p>
        </div>
        <!-- /.col -->
        <div class="col-xs-6">
          <p class="lead">Amount Due 2/22/2014</p>

          <div class="table-responsive">
            <table class="table">
              <tr>
                <th style="width:50%">Subtotal:</th>
                <td>Rs.1960</td>
              </tr>
              <tr>
                <th>Tax (10%)</th>
                <td>Rs.196</td>
              </tr>
              <tr>
                <th>GST + CGST (10%):</th>
                <td>Rs.196</td>
              </tr>
              <tr>
                <th>Total:</th>
                <td>Rs.<span id = "totalamount">2352</span></td>
              </tr>
            </table>
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
         <!--<a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>-->

          <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#modal-info" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0" onclick="Onsubmitpayment()">
          <i class="fa fa-credit-card"></i> Submit Payment
          </button>
          <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
            <i class="fa fa-download"></i> Generate PDF
          </button>
        </div>
      </div>
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
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

<div class="modal  fade" id="modal-info">
          <div class="modal-dialog " style="margin-top:10vh;border:2px ridge #211d65">
            <div class="modal-content" style="background-color:#235E93">
              <div class="modal-header" style=" border:0">
                <button type="button" class="pull-right"  data-dismiss="modal" aria-label="Close" style="background:none;border:0" >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                <div  class=" text-center"style=" width:110px;height: 110px;border-radius:50%;background-color:white;margin-top:-60px;margin-right: auto;margin-left: auto">
                                                                                   
  
                <img src="dashboard/dist/img/logo.png" class="user-image text-center" alt="User Image" height="50" width="50" style="margin:25%" >
                
                </div>
              </div>
              <div class="modal-body">
                  
                
                
              <form role="form" action="https://test.payu.in/_payment" 
						     name="paybillform" id="payuform" method="post">
			            <input type="hidden" class="form-control" name="key" id="key" value="" /> 
					    <input type="hidden" class="form-control" name="productinfo" id="productinfo" value="" /> 
						<input type="hidden" class="form-control" name="surl" id="surl" value="" /> 
						<input type="hidden" class="form-control" name="furl" id="furl" value="" /> 
						<input type="hidden" class="form-control" name="txnid" id="txnid" value="" />
						<input type="hidden" class="form-control" name="hash" id="hash" value="" />
						<input type="hidden" name="udf1" id = "udf1" value="" /> 
                
                
                <div class="form-group">
                  
                  <input type="text" class="form-control" id="username" name="firstname" placeholder="Enter Name" style=" border: 0; border-radius:6px;" readonly="readonly">
                </div>
                
                <div class="form-group">
                 
                  <input type="email" class="form-control" id="useremail" name="email"
                  pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}"
                  placeholder="Enter email" style=" border: 0; border-radius:6px;" readonly="readonly" required>
                </div>
                
                <div class="form-group">
                 
                  <input type="tel" class="form-control" id="userphone" name="phone" pattern="[1-9][0-9]{9}" 
                  placeholder="Enter Number" style=" border: 0; border-radius:6px;" readonly="readonly" required>
                </div>
                
                <div class="form-group">
                  
                  <input type="text" class="form-control" id="amount" name="amount" placeholder="Amount to Pay" style=" border: 0; border-radius:6px;" readonly="readonly">
                </div>
                <div class="checkbox" style="color:white">
                  <label>
                    <input type="checkbox" id="tc" required> I have read and agree to the terms and conditions.
                  </label>
                </div><br>
                <div class="form-group text-center">
                <input type="submit" class="btn " value="Proceed To Pay" style="color:white;background-color:#64B246;border: 0; border-radius:6px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0" onclick="Onproceedtopay()">
                
                </div>
                </form>
               
                
              </div>
              
             
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
<!-- jQuery 3 -->
<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="dashboard/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dashboard/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dashboard/dist/js/demo.js"></script>
<script>
		function Onsubmitpayment() {

			var name = document.getElementById("uname").innerHTML;
			document.getElementById("username").value = name;

			var email = document.getElementById("uemail").innerHTML;
			document.getElementById("useremail").value = email;

			var phone = document.getElementById("uphone").innerHTML;
			document.getElementById("userphone").value = phone;

			var amount = document.getElementById("totalamount").innerHTML;
			document.getElementById("amount").value = amount;

		}

		function Onproceedtopay() {

			var name = document.getElementById("uname").innerHTML;
			document.getElementById("username").value = name;

			var email = document.getElementById("uemail").innerHTML;
			document.getElementById("useremail").value = email;

			var phone = document.getElementById("uphone").innerHTML;
			document.getElementById("userphone").value = phone;

			var amount = document.getElementById("totalamount").innerHTML;
			document.getElementById("amount").value = amount;

			if (!document.getElementById('tc').checked) {
				return;
			} 
			
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var r = this.responseText.split('&');
					
					document.getElementById("hash").value = r[0];
					document.getElementById("txnid").value = r[1];
					document.getElementById("key").value = r[2];
					document.getElementById("surl").value = r[3];
					document.getElementById("furl").value = r[4];
					document.getElementById("productinfo").value = r[5];
                    document.getElementById("udf1").value = r[6];
					document.forms.paybillform.submit();
				}
			};
			xhttp.open("POST", "payuPayment", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("name=" + name + "&email=" + email + "&phone=" + phone
					+ "&amount=" + amount);
		}
	</script>
</body>
</html>