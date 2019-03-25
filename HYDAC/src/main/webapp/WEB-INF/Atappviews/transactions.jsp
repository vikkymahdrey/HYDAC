<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Payments</title>
  
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
        <style>
        
        *{
   font-family:Segoe UI;
 }
 
 body{
 font-family:Segoe UI;
 }
        
        .table-alignment {
  table-layout: fixed;
  width: 100%;
  white-space: nowrap;
}
        </style>
        
</head>

<body class="hold-transition skin-blue skin-black sidebar-mini" onload="loadDoc()">

 
<div class="wrapper" style="display:block" >
 <%@include file="Header_v2.jsp"%>

 
  <!-- Left side column. contains the logo and sidebar -->
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"id="billList">
   
   
   <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      Pay Bills
       
      </h1>
     
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <div class="table-responsive">
              <table id="example2"  class="table table-alignment ">
                <thead>
                <tr>
                  <th>Id</th>
                  
                  <th>From</th>
                  <th>To</th>
                  <th>Bill Amount (&#x20b9;)</th>
                  <th>Bill Generated on</th>
                  <th>Payment Status</th>
                   <th>Bill Paid on</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody id = "pendingbillrows">
              
                </tbody>
                <tfoot>
                <tr>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                   <th></th>
                   <th></th>
                </tr>
                </tfoot>
              </table>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

         
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
     
      <h3>
      Payment history
        
      </h3>
     
   
  
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <div class="table-responsive">
              <table id="example2"  class="table table-alignment ">
                <thead>
                <tr>
                  <th>Id</th>
                  
                  <th>From</th>
                  <th>To</th>
                  <th>Bill Amount (&#x20b9;)</th>
                  <th>Bill Generated on</th>
                  <th>Payment Status</th>
                   <th>Bill Paid on</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody id = "billrows">
              
                </tbody>
                <tfoot>
                <tr>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
                   <th></th>
                   <th></th>
                </tr>
                </tfoot>
              </table>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

         
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
   
      <!-- /.row -->
    </section>
    <!-- /.content -->
   
   
   
    <!-- Content Header (Page header) -->
    

    <!-- Main content -->
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <div class="content-wrapper" id="bill" style="display:none">
  
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Invoice Id
        <small id="billid"></small>
      </h1>
    <!--    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Invoice</li>
      </ol>-->
    </section>

    

    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <!-- <h2 class="page-header">
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
          </h2> -->
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <!-- <div class="col-sm-4 invoice-col">
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
        </div> -->
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          To
          <address>
            <strong><span id = "uname"> <%=userSession.getUname()%></span></strong><br>
            
            Phone : <span id = uphone><%=userSession.getContactnumber()%></span><br>
            Email : <span id = uemail><%=userSession.getEmailId()%></span>
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          <br>
          <br>
          <br>
        <!--   <b>Account:</b> 968-34567 -->
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
              <th>Device</th>
              <th>From Date</th>
              <th>To Date</th>
              <th>Watersource</th>
              <th>Consumption</th>
              <th>Price Per Ltr(&#x20b9;)</th>
              <th>Sub Total(&#x20b9;)</th>
             
            </tr>
            </thead>
            <tbody id="eachbill">
            
            
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


        </div>
        <!-- /.col -->
        <div class="col-xs-6">
         <!--  <p class="lead">Amount Due 2/22/2014</p> -->

          <div class="table-responsive">
            <table class="table">
              <tr>
               

           

                <th  style="width:65%;padding-left:70%;" >Total(&#x20b9;)&nbsp;:&nbsp;</th>
                
              
                <td id="subtotal"  style="width:65%;padding-left:17%;" ></td>

              </tr>
               
           <!--    <tr>
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
              </tr> -->
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
          <button id="paybutton" type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#modal-info" style="background-color:#64B246;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0 " onclick="Onsubmitpayment()">
          <i class="fa fa-credit-card"></i>  Pay Bill
          </button>
          <!-- <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
            <i class="fa fa-download"></i> Generate PDF
          </button> -->
        </div>
      </div>
    </section>
    
     
    <!-- /.content -->
    <div class="clearfix"></div>
  </div>
        
 
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


    <!-- Pay Modal...... -->
<div class="modal  fade" id="modal-info" data-keyboard="false" data-backdrop="static">
          <div class="modal-dialog " style="margin-top:10vh;border:2px ridge #211d65">
            <div class="modal-content" style="background-color:#235E93">
              <div class="modal-header" style=" border:0">
                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0"   >
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
						<input type="hidden" name="udf2" id = "udf2" value="" /> 
						
                
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
                <input type="submit" class="btn " value="Proceed To Pay" style="color:white;background-color:#64B246; border-radius:6px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0 " onclick="Onproceedtopay()">
                
                </div>
                </form>
               
                
              </div>
              
             
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        

        <!-- Payment success modal -->
        <div class="modal  fade" id="modal-paymentsuccess" data-keyboard="false" data-backdrop="static" style="display:none">
          <div class="modal-dialog modal-sm" style="margin-top:10vh;border-radius:15px;">
            <div class="modal-content" style="border-radius:15px;background-color:#ffff">      
              <div class="modal-header"style="border-top-left-radius:15px;border-top-right-radius:15px;background-color:#B7B7B7;height:50px">
                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0"   >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
             <!--    <div  class=" text-center"style=" width:140px;height: 140px;margin-top:-40px;border-radius:50%;background-color:#fff;margin-right: auto;margin-left: auto">
                <div class=" text-center"style=" width:125px;height: 125px;border-radius:50%;position:absolute;margin:7px;border:10px solid #64B246">                                                       
                <div class=" text-center"style=" width:101px;height: 101px;border-radius:50%;position:absolute;margin:2px;background-color:#64B246">
                <img src="dashboard/dist/img/logo.png" class="user-image text-center" alt="User Image" height="50" width="50" style="margin:25%" >
               </div>
                </div>
                </div>--> 
                <div  class=" text-center"style="margin-top:-40px;margin-right: auto;margin-left:30px">
                <img src="dashboard/dist/img/payment-icon.png" class="user-image text-center" alt="User Image" height="100px" width="100px" style="margin-right: auto;margin-left: auto;">
                </div>
                
              </div>
              <div class="modal-body text-center">
                  
                <h2><b>Payment successful</b></h2>
                <h3>ID&nbsp;:&nbsp;12ge3gj</h3>
                <h3>&#x20b9;&nbsp;900</h3>
             
                
              </div>
              
             
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
        

        <!-- Payment failed modal -->
        <div class="modal  fade" id="modal-paymentfailed" data-keyboard="false" data-backdrop="static" style="display:none">
          <div class="modal-dialog " style="margin-top:10vh;border-radius:15px">
            <div class="modal-content" style="border-radius:15px;background-color:#ffff">
              <div class="modal-header"style="border-top-left-radius:15px;border-top-right-radius:15px;background-color:#B7B7B7;height:70px">
                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0"   >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
             <!--    <div  class=" text-center"style=" width:140px;height: 140px;margin-top:-40px;border-radius:50%;background-color:#fff;margin-right: auto;margin-left: auto">
                <div class=" text-center"style=" width:125px;height: 125px;border-radius:50%;position:absolute;margin:7px;border:10px solid #64B246">                                                       
                <div class=" text-center"style=" width:101px;height: 101px;border-radius:50%;position:absolute;margin:2px;background-color:#64B246">
                <img src="dashboard/dist/img/logo.png" class="user-image text-center" alt="User Image" height="50" width="50" style="margin:25%" >
               </div>
                </div>
                </div>--> 
                <div  class=" text-center"style="margin-top:-40px;margin-right: auto;margin-left:30px">
                <img src="dashboard/dist/img/payment-failed.png" class="user-image " alt="User Image" height="100px" width="100px" style="margin-right: auto;margin-left: auto;">
                </div>

                
              </div>
              <div class="modal-body text-center">
                  
                <h2><b>Payment failed..!</b></h2>
             
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


<!-- SlimScroll -->
<script src="dashboard/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<!-- AdminLTE App -->
<script src="dashboard/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dashboard/dist/js/demo.js"></script>

<!-- page script -->
<script>

var modalsuccess = $("#modal-paymentsuccess");
var modalfailed = $("#modal-paymentfailed");
	
	

function showInvoice(billid,paystatus){
	
	console.log(billid)
	
		document.getElementById("billList").style.display = "none";
		
		
		
		document.getElementById("bill").style.display = "block";
		
	
		
		document.getElementById("billid").innerHTML=billid;
		
		
		document.getElementById("udf2").value=billid;
		
		 var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	// console.log("inside showInvoice"+this.responseText);
		    var	bill  =JSON.parse(this.responseText);
		   
		    showBill(bill,paystatus)
		    }
		  };
		  xhttp.open("GET", "billDetails?billid="+billid, true);
		  xhttp.send();
		
}

function showBill(bill,paystatus){
	
	var eachbillrows = document.getElementById("eachbill");
	eachbillrows.innerHTML="";
	
	var paybutton = document.getElementById("paybutton");
	paybutton.style.display="block";
	if(paystatus){
		
		paybutton.style.display="none";
	}
	
	var totalbillamount = 0;
	for(var i in bill){
		
		var tr = document.createElement("tr");
		
		var td0 = document.createElement("td");
		td0.innerHTML =bill[i].deviceId;
		var td1 = document.createElement("td");
		td1.innerHTML = new Date(bill[i].waterConsumtionFrom).toLocaleDateString();
		var td2 = document.createElement("td");
		td2.innerHTML =new Date(bill[i].waterConsumtionTo).toLocaleDateString();
		var td3 = document.createElement("td");
		td3.innerHTML = bill[i].wsName;
		var td4 = document.createElement("td");
		td4.innerHTML = bill[i].consumptionperslab;
		var td5 = document.createElement("td");
		td5.innerHTML = bill[i].priceappliedperltr;
		var td6 = document.createElement("td");
		td6.innerHTML =bill[i].payable_per_consumption_per_slab_per_device;
		
		totalbillamount = totalbillamount + parseInt(bill[i].payable_per_consumption_per_slab_per_device);
		
		tr.appendChild(td0);
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
		tr.appendChild(td6);
		
		eachbillrows.appendChild(tr);
	}
	


//document.getElementById("subtotal").innerHTML = "Rs." + totalbillamount;
//var rs = '&#x20B9;';
//console.log(rs);
//	document.getElementById("subtotal").innerHTML ="Total (&#x20b9;):" + totalbillamount;
  // console.log(document.getElementById("subtotal").innerHTML = "&#x20b9;"+totalbillamount);
	

	document.getElementById("subtotal").innerHTML =totalbillamount;


}

function loadDoc() {
	console.log('called')
	
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	//console.log("inside loaddoc"+ this.responseText);
	    var	billreport  =JSON.parse(this.responseText);
	    showBillsReport(billreport)
	    }
	  };
	  xhttp.open("GET", "getbills", true);
	  xhttp.send();
	}
	
	
	
	function showBillsReport(bills){
		console.log(bills);
		/*var modalsuccess = $("#modal-paymentsuccess");
		var modal=document.getElementById("modal-paymentsuccess");
		
		var modalfail = $("#modal-paymentfailed");
		var modal=document.getElementById("modal-paymentfailed");*/
		
		var billrows = document.getElementById("billrows");
		var pendingbillrows=document.getElementById("pendingbillrows");
		
		billrows.innerHTML="";
		pendingbillrows.innerHTML="";
		
		for(var i in bills){
			var tr = document.createElement("tr");
			
			var td0 = document.createElement("td");
			td0.innerHTML = bills[i].id;
			var td1 = document.createElement("td");
			td1.innerHTML = new Date(bills[i].bill_from_time).toLocaleDateString();
			var td2 = document.createElement("td");
			td2.innerHTML = new Date(bills[i].bill_to_time).toLocaleDateString();
			var td3 = document.createElement("td");
			td3.innerHTML = bills[i].payable_amount;
			var td4 = document.createElement("td");
			td4.innerHTML = bills[i].payment_status;
			var td5 = document.createElement("td");
			td5.innerHTML = new Date(bills[i].bill_generated_time).toLocaleDateString();
			var td6 = document.createElement("td");
			
			if(bills[i].bill_payed_time != null){
				td6.innerHTML = new Date(bills[i].bill_payed_time).toLocaleDateString();
					
			}
			
			var td7 = document.createElement("td");
			if(bills[i].payment_status == 'Pending'){

				td7.innerHTML =  '<a  class="btn btn-block " href="#"  onclick ="showInvoice('+bills[i].id+',false)"style="background-color:#91191c;color:white;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0 ">Pay</a>';


			}else if(bills[i].payment_status == 'Failed'){
				td7.innerHTML =  '<a  class="btn btn-block " href="#"  onclick ="showInvoice('+bills[i].id+',false)"style="background-color:#91191c;color:white;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0">Pay</a>';
				//modalfailed.modal('show');

			}
			else{
				
				td7.innerHTML =  '<a  class="btn btn-block " href="#"  onclick ="showInvoice('+bills[i].id+',true)" style="background-color:#64B246;color:white;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0 ">View</a>';
	//modalsuccess.modal('show');

				
			}
			
			
			tr.appendChild(td0);
			tr.appendChild(td1);
			tr.appendChild(td2);
			tr.appendChild(td3);
			tr.appendChild(td5);
			tr.appendChild(td4);
			tr.appendChild(td6);
			tr.appendChild(td7);
			
			
			
	        
			if(bills[i].payment_status == 'Pending'||bills[i].payment_status == 'Failed')
				{
				pendingbillrows.appendChild(tr);
				}
			else{
				billrows.appendChild(tr);
			}
			
			
			
			//console.log(bills[i]);
		}
	}
</script>
<script>
		function Onsubmitpayment() {

			var name = document.getElementById("uname").innerHTML;
			document.getElementById("username").value = name;

			var email = document.getElementById("uemail").innerHTML;
			document.getElementById("useremail").value = email;

			var phone = document.getElementById("uphone").innerHTML;
			document.getElementById("userphone").value = phone;


			//var amount = document.getElementById("subtotal").innerHTML.split(":")[1];
			var amount = document.getElementById("subtotal").innerHTML;

			document.getElementById("amount").value = amount;

		}

		function Onproceedtopay() {

			var name = document.getElementById("uname").innerHTML;
			document.getElementById("username").value = name;

			var email = document.getElementById("uemail").innerHTML;
			document.getElementById("useremail").value = email;

			var phone = document.getElementById("uphone").innerHTML;
			document.getElementById("userphone").value = phone;


			var amount = document.getElementById("subtotal").innerHTML;

			//var amount = document.getElementById("subtotal").innerHTML.split(":")[1];
			
			//console.log("amount"+amount);
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
					+ "&amount=" + amount+"&billid="+document.getElementById("udf2").value);
		}
	</script>
	
	 
<style>
td {
  padding-top:20px;
  padding-bottom:20px;
  padding-right:0px;
  
  
  
}


</style>

</body >
</html>
