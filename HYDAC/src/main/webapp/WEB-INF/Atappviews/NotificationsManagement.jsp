<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Notifications Management</title>
  
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

.searchstyle{

 float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 10px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}
div.multiselect, select#meal, button {
  margin: 5px;
}

.multiselect {
  width: 200px;
}

.selectBox {
  position: relative;
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}
div.multiselect, select#meal, button {
  margin: 5px;
}

.multiselect {
  width: 200px;
}

.selectBox {
  position: relative;
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}

   </style>         
        
</head>

<body class="hold-transition skin-blue skin-black sidebar-mini" onload="getmyorg()">

 
<div class="wrapper">
 <%@include file="Header_v3.jsp"%>
<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			
			
			
			<section class="content">
			<div class="box">
            <div class="box-header">
             
              <div class="row">
              <section class="content-header">
				<h1>
					Create Notifications <small></small>
				</h1>
				
		
			
			</section>
			
  
                <div class="col-lg-2 col-xs-12 pull-right">
             
                <div class="form-group">
                <input type="hidden" id="uid">
                  <input class="form-control" type="text" id="searchbar" placeholder="Search User" name="search" onchange="getUserInfo(this)"><i class="fa fa-search"></i> 
              <div class="box" id="displayinfo" style="display:none">
              
              </div>
                </div>
                </div>
      
                <div class="col-lg-2 col-xs-12 pull-right">
             
                <div class="form-group">
                  <label>Blocks</label>
     
		   <select  class="form-control text-center" id="blockselect" multiple>	
		         
					  							
											</select>    
											
					<!-- <div class="multiselect">
  <div class="selectBox">
    <select name="category" id="blockselect">
     
    </select>

 
</div>				 -->		
	 <div id="checkboxes"><input type="checkbox" id="chck"></div>										
								
                </div>
                </div>
                
                </div>
                <div class="row">
  
     
      <div class="col-lg-12 col-xs-12">
               <div class="form-group">

                            <textarea id="notificationmsgtitle" class="form-control" rows="1"
							placeholder="Enter your title"
							style="border: 0; border-radius: 10px; background-color:#F5F5F5;" required
						    name="comment"></textarea>
			</div>
												
      
															<div class="form-group">

																<textarea id="notificationmsg" class="form-control" rows="6"
																	placeholder="Enter your comment here"
																	style="border: 0; border-radius: 10px; background-color:#F5F5F5;" required
																	name="comment"></textarea>
															</div>
												
			        
                     
                     
                 <div class="form-group text-center pull-left">
                  <button  class="btn btn-success" id="submitbutton" style="background-color:#64B246;width:100%;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"  onclick ="sendNotification(this)">Broadcast Now</button>
                </div>
              
             
              
             
                
                       
              
              
              
      </div>
     </div>
            
            </div>
 </div> 
 </section>
 </div>
 
 
 <!-- Modal for push notification -->
<div class="modal fade in" id="modalnotify" data-keyboard="false" data-backdrop="static" style="display:none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93;color:#ffff">
                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0">
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                <h4 class="modal-title" style="color:#ffff">Push Notifications</h4>
              </div>
              <div class="modal-body" style="background-color:#f9f9f9">
                
                <div class="box-body">           
                <div class="form-group">
                  <label for="watermeter">Blocks</label>
      <!--  <select class="form-control text-center"  id="blockselect" onchange="NotificationKeycall(this)" multiple>  -->
					  <select  class="form-control text-center"  id="blockselect" multiple>	 
					  							
											</select>
								
                </div>
               <div class="form-group">

                           <textarea id="notificationmsgtitle" class="form-control" rows="1"
							placeholder="Enter message title"
							style="border: 0; border-radius: 10px;" required
						    name="comment"></textarea>
			</div>
												
      
															<div class="form-group">

																<textarea id="notificationmsg" class="form-control" rows="6"
																	placeholder="Enter your comment here"
																	style="border: 0; border-radius: 10px;" required
																	name="comment"></textarea>
															</div>
												
			        
                     
                     
                 <div class="form-group text-center">
                  <button  class="btn btn-success" id="submitbutton" style="background-color:#235E93;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"  onclick ="sendNotification(this)">Submit</button>
                </div>
              
             
              
             
                
               </div>     
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
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
 

<!-- jQuery 3 -->
<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="dashboard/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="dashboard/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<!-- <script src="js/firebase-messaging-sw.js"></script>
 -->
<!-- SlimScroll -->
<script src="dashboard/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<!-- AdminLTE App -->
<script src="dashboard/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dashboard/dist/js/demo.js"></script>

 <script src="https://www.gstatic.com/firebasejs/5.2.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.2.0/firebase-app.js"></script>

<script src="https://www.gstatic.com/firebasejs/5.2.0/firebase-messaging.js"></script>



 
 
 <script>
 
 
 

function sendNotification(notification){
	 
 var appId=[];
 
 var msgtitle =  document.getElementById("notificationmsgtitle").value;
 
	var textmsg =  document.getElementById("notificationmsg").value;
	var s = document.getElementById("blockselect");
	
	var name = document.getElementById("searchbar").value;
	var id = document.getElementById("uid").value;
	

     for (var i = 0; i < s.options.length; i++) {
        if(s.options[i].selected ==true){
          
            appId.push(s.options[i].value.split(":")[0]);
         }
     }
     console.log(appId);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	console.log(this.responseText);
	    	if(this.responseText=="success")
	    		alert("Notification Sent Successfully!");
	    	else
	    		alert("Notification not sent");
	
	    }
	  };
	  xhttp.open("POST", "getpushnotificationkey?orgId="+myorgid+"&appId="+appId+"&title="+msgtitle+"&msg="+textmsg+"&uid="+id, true);
	  xhttp.send(); 
	 
	 
	 
	 
 }
 
 
function getUserInfo(v){
	
	var user = v.value;
	console.log(user);
	
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	console.log(this.responseText);
	    	var br = document.createElement('br');
	    	var data = JSON.parse(this.responseText);
	    	var name= data.uname;
	    	var contact = data.ucontact;
	    	var flat = data.uflat;
	    	var email = data.uemail;
	    	var displayinfo = document.getElementById('displayinfo');
	    	displayinfo.setAttribute("style","display:block");
	    	displayinfo.innerHTML=name+'<br>'+flat+'<br>'+email+'<br>'+contact;
	    	document.getElementById("uid").value = data.uid;
	
	    }
	  };
	  xhttp.open("POST","getUserdata?user="+user, true);
	  xhttp.send(); 	
	
	
	
	
	
	
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 function gettokenids(){
	 
	 
	 
      var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
         	console.log(this.responseText);
         	
         }
       };
       xhttp.open("POST", "getpushnotificationkey", true);
       xhttp.send();	 	 
	 
 }
 
 
 
 var myorgid;

 function getmyorg(){
 	
 	var xhttp = new XMLHttpRequest();
 	  xhttp.onreadystatechange = function() {
 	    if (this.readyState == 4 && this.status == 200) {
 	    	myorgid = this.responseText;
 	    	
 	    	getapp();
 	    	
 	    	
 	    }
 	  };
 	  xhttp.open("GET", "getMyorgId", true);
 	  xhttp.send();
 }


 function getapp(){
	 
	var cb =document.getElementById("chck");
	
	//alert(cb);
 	
 	var xhttp = new XMLHttpRequest();
 	  xhttp.onreadystatechange = function() {
 	    if (this.readyState == 4 && this.status == 200) {
 	    	console.log(this.responseText);
 	    	var applist = this.responseText; 
 	    	
  document.getElementById("blockselect").innerHTML= '<option value="0">--Select--</option>'+this.responseText; 
 	    	      
 	    	      
 	    }
 	  };
 	  xhttp.open("GET", "getApplications?orgId="+myorgid, true);
 	  xhttp.send();
 }

 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 function pushNotification(){
	
	var config = {
			    apiKey: "AIzaSyDitVDGt8bZXMjSX8NsHoa4vBZ9PA6Eoe4",
			    authDomain: "http://localhost:8080/USWMDEMO/",
			 // authDomain: "aquacount-6c055.firebaseapp.com",
			    //databaseURL: "https://aquacount-6c055.firebaseio.com",
			    projectId: "aquacount-6c055",
			//   storageBucket: "aquacount-6c055.appspot.com",
			    messagingSenderId: "555529546098"
		 };
	 
	 
	 
    firebase.initializeApp(config);
	 
     const messaging = firebase.messaging();
	 alert("messaging");
	 
	
	
	
	 if ('serviceWorker' in navigator) {
	  
	 navigator.serviceWorker.register('fcm/firebase-messaging-sw.js')
	 .then(function(registration) {
		 messaging.useServiceWorker(registration);
		  console.log('ServiceWorker registration successful with scope:',registration.scope);
		requestNotificationsPermissions();
	  
	  })['catch'](function(error) {
		    console.error('Unable to register serviceworker.', error);
	   }); 
	  }
	 
	 
	 
 
 
//Requests permission to show notifications.
  function requestNotificationsPermissions() {
   console.log('Requesting notifications permission...');
  messaging.requestPermission().then(function() {
     // Notification permission granted.
     saveMessagingDeviceToken();
       })['catch'](function(error) {
    console.error('Unable to get permission to notify.', error);
   }); 
 } 
 
 
//Saves the messaging device token to the datastore.
 function saveMessagingDeviceToken() {
	alert("getting token");
    messaging.getToken()
   .then(function(tok) {
     if (tok) {
       console.log('Got FCM device token:',tok);
       
       var msg="hello";
       var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
          	console.log(this.responseText);
          	//requestNotificationsPermissions();
          	
          	 messaging.onMessage(function(payload) {
          	    console.log('Message received. ', payload);
          	    // [START_EXCLUDE]
          	    // Update the UI to include the received message.
          	   // appendMessage(payload);
          	    // [END_EXCLUDE]
          	  });
          }
        };
        xhttp.open("GET", "getpushnotification?msg="+msg+"&tok="+tok, true);
        xhttp.send();	 	 
       
       // Saving the Device Token to the datastore.
      // firebase.firestore().collection('fcmTokens').doc(currentToken)
         //  .set({uid: firebase.auth().currentUser.uid});
    } else {
       // Need to request permissions to show notifications.
      requestNotificationsPermissions();
    }
     })['catch'](function(error){
     console.error('Unable to get messaging token.', error);
   }); 
 } 
 
 

 
 }
 </script> 
 





<script>

function pushNotifications(){
	
	var configp = {
			    apiKey: "AIzaSyDitVDGt8bZXMjSX8NsHoa4vBZ9PA6Eoe4",
			  //  authDomain: "http://localhost:8080/USWMDEMO/",
			  authDomain: "aquacount-6c055.firebaseapp.com",
			    //databaseURL: "https://aquacount-6c055.firebaseio.com",
			    projectId: "aquacount-6c055",
			//   storageBucket: "aquacount-6c055.appspot.com",
			    messagingSenderId: "555529546098"
		  };
	 
	 
	 
    firebase.initializeApp(configp);
	 
     var messaging = firebase.messaging();
	// alert("messaging");
	 
	 var msg="HI, testing Firebase Cloud Messaging for group message";
	 var tok="APA91bH_6h_HANpXNCXhKXZalZMJIbGh69Y0yEo2jNKeEQashhQrraB-wKHNQcNOID3T8b8qdwKf1-BDsaZE7OAtnpbSwj53VYDBsE1ntuGyC0OJVtBuMCE";
     var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        	console.log(this.responseText);
        }
      };
      xhttp.open("GET", "getpushnotification?msg="+msg+"&tok="+tok, true);
      xhttp.send();	
      
      
 
}




function pushNotificationsingleBlock(){
	
	
	//alert( document.getElementById("blockselect").value)
	
	var appid = document.getElementById("blockselect").value.split(":")[0];
	var appname = document.getElementById("blockselect").value.split(":")[1];
	var notificationmsg = document.getElementById("notificationmsg").value;
	//alert(notificationmsg);
	
	console.log(usersforapp);
	
	/* var json = JSON.parse(usersforapp);
	
	for(var i in json){
		var userid = json[i].id;
		console.log(userid);
	} */
	
	NotificationKeycall();
	
/* 	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	console.log(this.responseText);
	
	    	 document.getElementById("blockselect").innerHTML="<option value='0'>--select--</option>"+this.responseText;
         
	    }
	  };
	  xhttp.open("GET", "getApplications?orgId="+myorgid, true);
	  xhttp.send();
	 */
	
}



var usersforapp;
function getusersbyapp(){
	    
	  var appId= document.getElementById("blockselect").value.split(":")[0];
	 
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	console.log(this.responseText)
	    	usersforapp =   this.responseText;
	    	
	    }
	  };
	  xhttp.open("GET", "getusersbyapp?appid="+appId, true);
	  xhttp.send();
}


function NotificationKeycall(s){
	
	// var appId= document.getElementById("blockselect").value.split(":")[0];
	 var appId=[];
	 

     for (var i = 0; i < s.options.length; i++) {
        if(s.options[i].selected ==true){
            // console.log(x.options[i].value);
             
            appId.push(s.options[i].value.split(":")[0]);
         }
     }
     console.log(appId);
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	console.log(this.responseText);
	
	    }
	  };
	  xhttp.open("POST", "getpushnotificationkey?orgId="+myorgid+"&appId="+appId, true);
	  xhttp.send();
	 
}



</script>
 
</body>
</html>