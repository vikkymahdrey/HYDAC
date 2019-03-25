<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Bills Management</title>
  
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
  
 
 
table.dataTable thead .sorting:after {
    opacity: 0.2;
    content: "\e138";
     
}
table.dataTable thead .sorting_desc:after {
    content: "\e138";
     
}
table.dataTable thead .sorting{
    content: "\e138";
    background-color:#24659F;
}
table.dataTable thead .sorting_asc:after {
    content: "\e138";
}
     </style>         
        
        
</head>

<body class="hold-transition skin-blue skin-black sidebar-mini" onload="getmyorg()">

 
<div class="wrapper" style="display:block">
 <%@include file="Header_v3.jsp"%>
<div class="content-wrapper" id="billList">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Generate Bill <small></small>
				</h1>
				</section>
		<section class="content">
			<div class="row">
       <div class="col-md-12">
       <div class="box">
           
            <div class="box-body">
              <div class="row">
                
              
               
                 <div class="col-xs-3">
                 From
                 <input type="date" name="fromdate" id="fromdate" class = "form-control"/>
                 </div>
                
                <div class="col-xs-3">
                   To
                 <input type="date" class = "form-control" id="todate" name="todate"/>
                 </div>
                
                    
                     <div class="col-xs-3">
                     &nbsp;
                     <button  class="btn btn-primary btn-block" onclick="generatebill()" style="background-color:#64B246;backbox-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;" >   Generate Bill   </button>
                     </div>
              </div>
            </div>
            
            </div>
            <!-- /.box-body -->
          </div>
       
        </div>
			
			</section>
			
			<section class="content-header" style="margin-top:-140px">
				<h1>
					Bill List <small></small>
				</h1>
				
		</section>
			
			<section class="content">
			<div class="box">
            <div class="box-header">
             
             <div class="row">
              <div class="col-xs-2"> 
              Select Bill Range</div>
             <div class="col-xs-3"> 
               <select onchange="rangebillsget()" class="form-control" id="filterrangeselect">
               <option value="0">-- Select --</option>
                </select>
             </div>
             
             <div class="col-xs-3"> 
                <button  class="btn btn-primary success" id="regenerate" onclick="regeneratebill()" style="background-color:#64B246;backbox-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;display:none;" >  Re-generate Bill   </button>
             </div>
             </div>
             
            
            
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
             <div class="row"><div class="col-sm-12">
             <div class="table-responsive">
             <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead>
                <tr role="row" style="color:#ffff;">
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 231px;">Bill Id</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 145px;">User Name</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 251px;">Flat</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 198px;">Total Amount(&#x20b9;)</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">Bill Status</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 282px;">Paid Date</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">Actions</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 145px;">Invoice</th>
               
                </tr>
                </thead>
                <tbody id="userslist">
                
                
                
               </tbody>
               
              </table></div></div></div>
            </div>
            </div>
            <!-- /.box-body -->
          </div>
			
			</section>
  </div>
  

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
              <th>Price Per Ltr (&#x20b9;)</th>
              <th>Sub Total (&#x20b9;)</th>
             
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
              <!--   <th style="width:60%">Total: (&#x20b9;)</th>
                <td id="subtotal"></td> -->
                
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
</body>

<script>

var myorgid;
var lastbilldate;

var displaybills;
function rangebillsget(){
	var rangeval = document.getElementById("filterrangeselect").value
	
	//console.log(rangeval)
	if(rangeval == 0){
		
		displaybills = [];
		showbills();
		return;
	}
	
	
	var fromdate = rangeval.split("#")[0];
	var todate =rangeval.split("#")[1];
	
	var url="getbillsfororg?fromDate="+fromdate+"&toDate="+todate                                    
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
    	  displaybills = JSON.parse(this.responseText);
    console.log("displaybills",displaybills)
    
  showbills();
      }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
	
}


function getmyorg(){
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	myorgid = this.responseText;
	    	
	    	lastbilldate()
	    }
	  };
	  xhttp.open("GET", "getMyorgId", true);
	  xhttp.send();
}

 
function lastbillrange(){
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	
	    	
	    var billr = JSON.parse(this.responseText);
	    
	    console.log("billr",billr)
	    var range = document.getElementById("filterrangeselect")
	    
	    var temp;
	    
	    for(var key in billr){
	    	
	    		var optiond = document.createElement("option")
	    		optiond.setAttribute("value",key +"#"+ billr[key])
	    optiond.innerHTML = key.split(" ")[0]+" TO "+billr[key].split(" ")[0];
	    range.appendChild(optiond)
	    	
	    }
	    }
	  };
	  xhttp.open("GET", "generatedrange", true);
	  xhttp.send();
}

function lastbilldate(){
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	
	    	
	    	lastbilldate = this.responseText;
	    	console.log("lastbilldate",lastbilldate)
	    	lastbillrange();
	    	
	    	document.getElementById("todate").setAttribute("min",lastbilldate.split(" ")[0])
	    	
	    	if(lastbilldate != ""){
	    	
	    	document.getElementById("fromdate").setAttribute("value",lastbilldate.split(" ")[0])
	    	document.getElementById("fromdate").setAttribute("readonly",true)
	    	
	    	}
	    	
	    	
	    	
	    	var today = new Date();
	    	today.setDate(today.getDate() - 1);
	    	
	    	var dd = today.getDate();
	    	var mm = today.getMonth()+1; //January is 0!
	    	var yyyy = today.getFullYear();
	    	 if(dd<10){
	    	        dd='0'+dd
	    	    } 
	    	    if(mm<10){
	    	        mm='0'+mm
	    	    } 

	    	today = yyyy+'-'+mm+'-'+dd;
	    	document.getElementById("todate").setAttribute("max", today);
	    	document.getElementById("fromdate").setAttribute("max", today);
	    	
	    	//document.getElementById("todate").setAttribute("min", today);
	    	
	    //	document.getElementById("todate").setAttribute("max","27-12-2018")
	    	
	    	//getmyapp()
	    }
	  };
	  xhttp.open("GET", "lastbilleddate", true);
	  xhttp.send();
}
 
  
  
  
function generatebill()
{     
	
	var fromdate = document.getElementById("fromdate").value;
	var todate = document.getElementById("todate").value;
	
	var url="generatebill?fromDate="+fromdate+"&toDate="+todate                                    
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
      location.reload();
      }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
  
}
  
  
  
  function getmyapp(){
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	// console.log(this.responseText);
	   
	    	 document.getElementById("filterblockselect").innerHTML="<option value='0'>--select--</option>"+this.responseText;

	    	 document.getElementById("userblockselect").innerHTML="<option value='0'>--select--</option>"+this.responseText;
	    	 document.getElementById("downloadtemplatespp").innerHTML="<option value='0'>--select--</option>"+this.responseText;
	    	
	    	 
	    	 
	    	 
	    	 // filterblockselect 
	    
	    }
	  };
	  xhttp.open("GET", "getApplications?orgId="+myorgid, true);
	  xhttp.send();
}
  
  
  
 /*  var usersforapp;
  function getusersbyapp(){
	  
	  var appId= document.getElementById("filterblockselect").value.split(":")[0];
		
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	usersforapp =   this.responseText;
	    	showusers();
	    }
	  };
	  xhttp.open("GET", "getusersbyapp?appid="+appId, true);
	  xhttp.send();
  } */

  var tble;
  
  function showbills(){
	 
	//  console.log(displaybills)
	
	  if(tble != null){
			 tble.destroy();
	  }
	  
	    var fromDate = lastbilldate;
		var rangeval = document.getElementById("filterrangeselect").value
		var todate =rangeval.split("#")[1];
		var regeneratebill = document.getElementById("regenerate");	
		
		if(todate==fromDate){
	          regeneratebill.setAttribute("style","display:block");
		}else{
			regeneratebill.setAttribute("style","display:none");
		}
		
		
	  var json = displaybills;
	
	  var tbody = document.getElementById("userslist");
	  
	  tbody.innerHTML="";
	 
	  
	  for(var i in json){
		  
		var tr =  document.createElement("tr");
		tr.setAttribute("role","row");
		
		tr.setAttribute("class","odd");
		
		var td1 =  document.createElement("td");
		var td2 =  document.createElement("td");
		var td3 =  document.createElement("td");
		var td4 =  document.createElement("td");
		var td5 =  document.createElement("td");
		var td6 =  document.createElement("td");
		var td7 =  document.createElement("td");
		var td8 =  document.createElement("td");
		
		td1.innerHTML = json[i].billid
		td1.setAttribute("class","sorting_1");
	
		
		td2.innerHTML = json[i].username
		td3.innerHTML = json[i].flat
		td4.innerHTML = json[i].billamount
		td5.innerHTML = json[i].status
		
		if(json[i].payedDate != null){
			td6.innerHTML = new Date(json[i].payedDate).toString().split("GMT")[0];
		}
		if(td5.innerHTML=='Paid')
			{
			td7.innerHTML  =	'<button type="button" billid="'+json[i].billid+'" onclick="payamount(this)" class="btn btn-primary btn-block" style="background-color:#64B246;color:white;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0" disabled>Paid</button>'
			}
		else{
			td7.innerHTML  =	'<button type="button" billid="'+json[i].billid+'" onclick="payamount(this)" class="btn btn-primary btn-block"style="background-color:#91191c;color:white;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0 ">Mark as paid</button>'
		}
		

		
		td8.innerHTML =  '<a  class="btn btn-block " href="#"  onclick ="showInvoice('+json[i].billid+')" style="background-color:#64B246;color:white;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0 ">View</a>';
		
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
		tr.appendChild(td6);
		tr.appendChild(td7);
		tr.appendChild(td8);
		
		tbody.appendChild(tr);
		
			  }
  
	 tble =  $('#example1').DataTable()
  }
  
  function payamount(billpay){
	  
	  
	 var rownum = billpay.parentElement.parentElement.rowIndex//getElementsByTagName("td")[5]
	 var billidd = billpay.getAttribute("billid")
	  
	 //console.log(billidd)
	 
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	
	    	if((this.responseText).split("$")[0].split("=")[0] == "success"){
	    		billpay.parentElement.parentElement.getElementsByTagName("td")[4].innerHTML="Paid";
	    	
	    	billpay.parentElement.parentElement.getElementsByTagName("td")[5].innerHTML=(this.responseText).split("$")[1].split("=")[1];
	    	billpay.innerHTML="Paid";
	    	billpay.style.background="#64B246";
	    	billpay.disabled=true;;
	    }}
	  };
	  xhttp.open("GET", "adminbillpay?billid="+billidd+"&rownum="+rownum, true);
	  xhttp.send();	  
	  
	  
	  
	  
  }
  
 
  
  
  function clean(){
	  
	  
	  
	 
	  document.getElementById("edituid").value="0";
		 document.getElementById("uname").value="";
	document.getElementById("contact").value="";
		 document.getElementById("email").value="";
		 document.getElementById("flat").value="";
	  
	  
  }
  
  function showInvoice(billid){
		
		console.log(billid)
		
			document.getElementById("billList").style.display = "none";
			
			
			
			document.getElementById("bill").style.display = "block";
			
		
			
			document.getElementById("billid").innerHTML=billid;
			
			
			//document.getElementById("udf2").value=billid;
			
			 var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			    var	bill  =JSON.parse(this.responseText);
			   
			    showBill(bill)
			    }
			  };
			  xhttp.open("GET", "billDetails?billid="+billid, true);
			  xhttp.send();
			
	}

	function showBill(bill){
		
		var eachbillrows = document.getElementById("eachbill");
		eachbillrows.innerHTML="";
		
		
		
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
		
		document.getElementById("subtotal").innerHTML = totalbillamount;
		
	}

	
	
	function regeneratebill(){
		
		var rangeval = document.getElementById("filterrangeselect").value
		var fromdate = rangeval.split("#")[0];
		var todate =rangeval.split("#")[1];
		
		var url="regenerate?fromDate="+fromdate+"&toDate="+todate                                    
	    var xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function() {
	      if (this.readyState == 4 && this.status == 200) {
	     location.reload();
	      }
	    };
	    xhttp.open("GET", url, true);
	    xhttp.send();				
	}
</script>
</html>
