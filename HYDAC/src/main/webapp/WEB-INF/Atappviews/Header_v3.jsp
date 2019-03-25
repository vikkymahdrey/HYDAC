<%@page import="java.util.*"%>
<%@page import="com.team.app.constant.*"%>
<%@page import="com.team.app.domain.*"%>
<%@page import="com.team.app.service.impl.UserLoginServiceImpl"%>
<%@ page errorPage="error.jsp" %> 

<% TblUserInfo userSession = (TblUserInfo) request.getSession().getAttribute("user"); %>
    
   <header class="main-header">
   
   
  
    <!-- Logo -->
    <a href="#" class="logo" style="background-color:#1f5484;">
   
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><img src="dashboard/dist/img/hydac.png" class="user-image" alt="User Image" height="35" width="35" style="margin-bottom:8px;"></span>
      <!-- logo for regular state and mobile devices -->
      
      <span class="logo-lg "><b> <img src="dashboard/dist/img/hydac.png" class="user-image" alt="User Image " height="35" width="35" align="middle" style="margin-bottom:7px;margin-left:-8px"><span style="font-family:Gabriola;font-size:25px;color:#ffff;vertical-align: middle;" >HYDAC</span></b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button" style="border-left:2px solid #1f5484;margin-left:-2px">
        <span class="sr-only">Toggle navigation</span>
      </a>
      
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
         
          <!-- Notifications: style can be found in dropdown.less -->

          <!-- Tasks: style can be found in dropdown.less -->
         
          <!-- User Account: style can be found in dropdown.less --> 
          <li class="dropdown user user-menu">
          <!--    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dashboard/dist/img/logo.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><%=userSession.getUname()%></span>
            </a>-->
             <div class="dropdown-toggle pointer" data-toggle="dropdown" style="margin:5px">
            <div  class=" text-center"style=" width:40px;height: 40px;border-radius:50%;background-color:green;margin:auto;float:left; ">
                                                                                   
                
              
               <span style="margin:auto;font-size: 25px;color:#ffff"><%=userSession.getUname().charAt(0)%></span>
                
                </div>
            </div>
           
            
            <ul class="dropdown-menu"style="box-shadow: 2px 2px 2px 0px rgba(0,0,0,0.10);margin-right:15Px;border-top:0;margin-top:5px;width:max-content;" >
              <!-- User image -->
              <li class="user-body" style="background-color:#fff;">
              
              
             
              
              
              <div class="row">
              <div class="col-md-2 col-sm-6 col-xs-6">
              <div  class=" text-center"style=" width:70px;height: 70px;border-radius:50%;background-color:green;margin:auto;float:left; ">
               <span style="margin:auto;font-size: 45px;color:#ffff"><%=userSession.getUname().charAt(0)%></span>
                
                </div>
               </div>
               <div class="col-md-10 col-sm-6 col-xs-6" >
               
             <div class="underline" style="float:right; margin-top:2%;width:max-content">
               <p style="line-height:15px;"><span ><b ><%=userSession.getUname()%></b></span><br>
               <span ><%=userSession.getEmailId()%></span><br></p>
              <a href="#" ><span style="color:#36c">Terms & Conditions</span></a>
              
              
               </div>
              
              </div>
              </div>
              
              
              
              
              
             <!--   <span>
              
                 <b><img src="dashboard/dist/img/logo.png" class="img-circle pull-left" alt="User Image">
               <span><%=userSession.getUname()%></span></b></span>-->
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer" style="background-color: #f4f4f4"">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat" data-toggle="modal" data-target="#modal-AdminProfile" onclick="profileclick()" >Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat" data-toggle="modal" data-target="#modal-AdminChangePwd">Change Password</a>
                </div>
              </li>
               
            </ul>
         </li>
          <!-- Control Sidebar Toggle Button -->
         
        </ul>
      </div>
    </nav>
  </header>
     
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar" style="background-color: #24659F;color:#C7E4FF;">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar ">
      <!-- Sidebar user panel -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      
      <ul class="sidebar-menu sidefocus "data-widget="tree">
        
     <!--     <li >

          <a href="admindashboard2"  > 
            <i class="fa fa-dashboard" ></i> <span><b>Dashboard</b></span>
            <span class="pull-right-container">
             
            </span>
          </a>
        </li>-->
        
      <!--   <li >
         

          <a href="watersourc"  > 
            <i class="glyphicon glyphicon-tint" ></i> <span><b>Water Source</b></span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">new</small>
            </span>
          </a>
        </li>
        <li >
          <a href="usermgmts"  > 

            <i class="fa fa-user" ></i> <span><b>User Management</b></span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">new</small>
            </span>
          </a>
        </li>
        

        
        
         <li >
          <a href="userdevicewatersource"  > 
            <i class="glyphicon glyphicon-scale" ></i> <span><b>Device Mapping</b></span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">new</small>
            </span>
          </a>
        </li>
        
        
        <li >
          <a href="adminbillpage"  > 
            <i class="fa fa-money" ></i> <span><b>Bills Management</b></span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">new</small>
            </span>
          </a>
        </li>
        
          <li>
          <a href="feedback"  > 
          <i class="fa fa-support" ></i> <span><b>Issue Management</b></span>
         </a>
         </li>



          <li>
          <a href="notification"> 
          <i class="fa fa-support" ></i> <span><b>Notifications Management</b></span>
         </a>
         </li> -->

          
         <li class="treeview">
          <a href="#">
            <i class="fa fa-arrow-right"></i>
            <span><b>HYDAC-INFO</b></span>
            <!--  <span class="pull-right-container">
              <span class="label label-primary pull-right">1</span>
            </span>-->
          </a>
          
          
          <!-- <ul class="treeview-menu">
            <li><a href="waterconsumptionreport"><i class="fa fa-circle-o"></i><b>HYDAC SENSOR INFO</b></a></li>
           
          </ul> -->
          
        </li>
         

       
      <!--  <li class="treeview">
          <a href="#">
            <i class="fa fa-cloud"></i>
            <span><b>Debug Reports</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="white-space:normal;">
            <li><a href="regularPacketLogs" ><i class="fa fa-circle-o" ></i><b>Regular  packet logs</b></a></li>
            <li><a href="consolidatedPacketLogs"><i class="fa fa-circle-o"></i><b>Consolidated packet logs</b></a></li>
          </ul>
        </li>
         
         <li class="treeview">
          <a href="#">
            <i class="fa fa-database"></i>
            <span><b>Data Management</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu"style="white-space:normal;">
            <li><a href="removeWaterMeterData"><i class="fa fa-circle-o"></i><b> Remove Water Meter Data</b></a></li>
            <li><a href="removeConsolidatedData"><i class="fa fa-circle-o"></i><b> Remove Consolidated Data</b></a></li>
          </ul>
        </li>
         
         <li class="treeview">
          <a href="#">
            <i class="fa fa-random"></i>
            <span><b>Sync</b></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-down pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="syncWaterMeter"><i class="fa fa-circle-o"></i><b>Sync-Water Meter</b></a></li>
            
          </ul>
        </li>   -->
       
        <li>
          <a href="logout">
            <i class="fa fa-sign-out"></i> <span><b>Sign Out</b></span>
           </a>
		</li>
       <!--   <li>
          <a href="issue">
          <i class="fa fa-support"></i> <span><b>Feedback</b></span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">new</small>
            </span>
          </a>
        </li>  -->

      </ul>
      
      
    </section>
    <!-- user details edit  model -->
    
    <!-- /.sidebar -->
  </aside>  
  
  
  <!-- Admin Profile modification modal.... -->
  <div class="modal  fade in" id="modal-AdminProfile" data-keyboard="false" data-backdrop="static" style="display:none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93;color:#ffff ">
                <button type="button" class="pull-right" id="userclose"data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="ProfileClean()"  >
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                <h4 class="modal-title" style="color:#ffff">Admin details</h4>
              </div>
              <div class="modal-body" style="background-color:#f9f9f9">
                
                <div class="box-body">

                <div class="alert alert-success " id="success" style="display:none">
                <strong>User details updated successfully...!</strong>
                </div>
                <div class="alert alert-danger" id="failure" style="display:none">
                <strong>User details updation failed!Please confirm the details</strong>
                </div>
               
                <div class="form-group">

                  <label>Admin name</label>

                  <input type="text" class="form-control" id="changeName" name="uname"placeholder="Enter username"  readonly="readonly"  value="<%=userSession.getUname()%>" required onkeyup="onFocusOut()">
                  <input type="hidden" name="uId" id="uId" value="<%=userSession.getId()%>">
                  <span id="namevalid" style="color: red;"></span>
                  <span id="nameexists" style="color: red;"></span>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="changeEmail" name="email" value="<%=userSession.getEmailId()%>"  pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}"  placeholder="Enter email" readonly="readonly" required onkeyup="onFocusOut()">
                   <span id="emailvalid" style="color: red;"></span>
                   <span id="emailexists" style="color: red;"></span>
                </div>
                
                <div class="form-group">
                  <label for="phone">Phone number</label>
                  <input type="tel" class="form-control" id="changecontact" name="contact" pattern="[1-9][0-9]{9}" 
                  placeholder="Enter number" readonly="readonly" value= "<%=userSession.getContactnumber()%>" required onkeyup="onFocusOut()">
                   <span id="phonevalid" style="color: red;"></span>
                </div>
                 <div class="form-group text-center">
                  <button  class="btn btn-success" id="editbutton" style="background-color:#64B246;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0" onclick="editUserDetails()">Edit</button>
                  <button  class="btn btn-success" id="detailssavebutton" style="background-color:#235E93;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0;"  onclick="saveUserDetails()" disabled="disabled">Save</button>
                 
                </div>
                </div>
                
                 
                 

                   
                  
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
  
  
  <!-- Change Password Model -->
        
        <div class="modal  fade in" id="modal-AdminChangePwd" data-keyboard="false" data-backdrop="static" style="display:none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93;color:#ffff">
                <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="PasswordClean()" >
                  
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                  </button>
                <h4 class="modal-title" style="color:#ffff">Change Password</h4>
              </div>
              <div class="modal-body" style="background-color:#f9f9f9">
                
                <div class="box-body">
                
                <div class="alert alert-success " id="success2" style="display:none">
                <strong>Changing Password has been done successfully...!Please Sign-in again</strong>
                </div>
                <div class="alert alert-danger" id="failure2" style="display:none">
                <strong>Changing Password failed!Please confirm the details</strong>
                </div>
                <div class="form-group">
                  <label>Current Password</label>
                  <input type="password" id="currentpwd" name="currentpwd" class="form-control" placeholder="Current Password" autocomplete="off" required onkeyup="onFocusOut()">
                  <span id="invalid" style="color: red;"></span>
                </div>
                
                <div class="form-group">
                  <label >New Password</label>
                  <input type="password" id="newpwd" name="newpwd" class="form-control" placeholder="New Password" autocomplete="off" required onkeyup="onFocusOut()">
                   <span id='alertwarn' style="color: red;"></span>
                </div>
                
                <div class="form-group">
                  <label >Confirm NewPassword</label>
                  <input type="password" id="confrmpwd" name="confrmpwd" class="form-control" placeholder="Confirm NewPassword" autocomplete="off" required onkeyup="onFocusOut()">
                   <span id='message2'></span>
                </div>
                
                <div class="form-group">
                  <div class="checkbox" >
                  <label>
                    <input type="checkbox" id="pwdshow" onclick="check()"> Show Password
                  </label>
                </div>
                </div><br>
                <div class="form-group">
                  <p><b>your password needs to:</b></p>
                  <p>&gt;&ensp;include both lower and upper case characters</p>
                  <p>&gt;&ensp;include one special character</p>
                  <p>&gt;&ensp;include one number</p>
                  <p>&gt;&ensp;be at least 8 characters long</p>
                </div>
                 <div class="form-group text-center">
                  <button class="btn btn-success" style="background-color:#64B246;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0" onclick="ChangePasswordValidation()">Save</button>
                </div>
                
                  
                </div>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
  </div>

  
  <script>
  function editUserDetails()
  {
  	if(document.getElementById("editbutton").disabled=true)
  		{
  	document.getElementById("changeName").readOnly=false;
  	document.getElementById("changeEmail").readOnly=false;
  	document.getElementById("changecontact").readOnly=false;
  	document.getElementById("editbutton").disabled=true;
  	document.getElementById("detailssavebutton").disabled=false;
  	//document.getElementById("userclose").setAttribute("onclick","parent.location.reload()");
  		}
  }
  
  
  
  function saveUserDetails()
  {
  	
  	var uId=document.getElementById("uId").value;
      var uname=document.getElementById("changeName").value;
  	var email=document.getElementById("changeEmail").value;
  	var contact=document.getElementById("changecontact").value;

   // var emailRegx = /^((([a-z]|\d|[!#\$%&\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/;

  	 var emailRegx = /^((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+([!#\$%&\*\.\+\-\/=\?\^_`{\|}~]([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/;

     //var emailRegx= /^(?!.* )[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}$/;
  //  var emailRegx= /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  	var phoneRegx = /^[0][1-9]\d{9}$|^[1-9]\d{9}$/g;
  	var unameRegx=/^[A-Za-z0-9_]{4,32}$/;
  	
  	
  	if(uname=="")
  		{
  		
  		document.getElementById("changeName").style.borderColor = "red";
  		document.getElementById("changeName").focus();
  		document.getElementById("changeName").addEventListener("keyup", onFocusOut);
  		return false;
  		}
  	else if(unameRegx.test(uname)==false)
  		{
  		document.getElementById("changeName").style.borderColor = "red";
  		document.getElementById("namevalid").innerHTML="Username must be 4 - 32 characters long, contain only letters, numbers and _ ";
  		document.getElementById("changeName").focus();
  		document.getElementById("changeName").addEventListener("keyup", onFocusOut);
  		return false;
  		
  		}
  	else if(email==""){
		   
   	   document.getElementById("changeEmail").style.borderColor = "red";
   	   document.getElementById("changeEmail").focus();
   	   document.getElementById("changeEmail").addEventListener("keyup", onFocusOut);
		   return false;
  	}
  	else if(emailRegx.test(email)==false)
  		{
  		
  		   document.getElementById("changeEmail").style.borderColor = "red";
       	   document.getElementById("emailvalid").innerHTML="Invalid email address";
   		   document.getElementById("changeEmail").focus();
   		   document.getElementById("changeEmail").addEventListener("keyup", onFocusOut);
   		   return false;
  		}
   	else if(contact=="")
		{
      	document.getElementById("changecontact").style.borderColor = "red";
   		document.getElementById("changecontact").focus();
   	    document.getElementById("changecontact").addEventListener("keyup", onFocusOut);
      	return false;
		}
   	else if(phoneRegx.test(contact)==false)
   		{
   		
   		document.getElementById("changecontact").style.borderColor = "red";
   		document.getElementById("phonevalid").innerHTML="Invalid phone number";
   		document.getElementById("changecontact").focus();
   		document.getElementById("changecontact").addEventListener("keyup", onFocusOut);
      	return false;
   		}
   	else{
   		$.ajax({
  	           url: 'userUpdateInfo',
  	           type: 'POST',
  	           data: jQuery.param({uId: uId,uname:uname,email:email,contact:contact}),
  	           success: function (data) {	
  	        	  
  	        	 if(data=='success'){
  	        		     document.getElementById("success").style.display="block";
  	        		     setTimeout(function(){ window.location.reload() }, 1000);
		        	   }else if(data=='failed') {
		        		 document.getElementById("failure").style.display="block";
		        	   }else if(data=='existsemail') {
		        		  document.getElementById("changeEmail").style.borderColor = "red";
		        		  document.getElementById("emailexists").innerHTML="The email address you entered already exists with another account. Please try with another one";
		        		  document.getElementById("changeEmail").focus();
		       		      document.getElementById("changeEmail").addEventListener("keyup", onFocusOut);
		        	   }else if(data=='existsuname') {
		        		  document.getElementById("changeName").style.borderColor = "red";
		        		  document.getElementById("nameexists").innerHTML="The user name you entered already exists with another account. Please try with another one";
		        		  document.getElementById("changeName").focus();
		       		      document.getElementById("changeName").addEventListener("keyup", onFocusOut);
		        	   }     		   
  	               },
  			 		error: function(e){
  		     			        alert('Error: ' + e);
  		     		 }
  	           });
   		
   	}	 
   	

   }	
   
  
  
  function ChangePasswordValidation()
  {

   	var currentPwd=document.getElementById("currentpwd").value;
  	var newPwd=document.getElementById("newpwd").value;
  	var confirmPwd=document.getElementById("confrmpwd").value;
  	
  	var pwdvalid=/^(?!.* )(?=^.{8,}$)((?=.*\d)(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/;
  	
  	if(currentPwd=="")
  	{
  		document.getElementById("currentpwd").style.borderColor = "red";
  		document.getElementById("currentpwd").focus(); 
  		document.getElementById("currentpwd").addEventListener("keyup", onFocusOut);
		    return false;
  	}
  	else if(newPwd=="")
  	{
  		  
  		document.getElementById("newpwd").style.borderColor = "red";
  		document.getElementById("newpwd").focus();
  		document.getElementById("newpwd").addEventListener("keyup", onFocusOut);
  		return false;
  	}
  	
  	else if(pwdvalid.test(newPwd)==false)
  	{ 
 	    	  document.getElementById("alertwarn").innerHTML ="Please check the instructions below for creating password";
  		  document.getElementById("newpwd").style.borderColor = "red";
  		  document.getElementById("newpwd").focus();
  		  document.getElementById("newpwd").addEventListener("keyup", onFocusOut);
     		    //document.getElementById("newpwd").value="";
     		    return false;
  	}
  	else if(confirmPwd=="")
  	{
  		document.getElementById("confrmpwd").style.borderColor = "red";
  		document.getElementById("confrmpwd").focus();
  		document.getElementById("confrmpwd").addEventListener("keyup", onFocusOut);
  	   return false;
  	}
  	else if(newPwd!=confirmPwd)
  	{
  		document.getElementById("confrmpwd").style.borderColor = "red";
  		document.getElementById("message2").style.color = "red";
		   document.getElementById("message2").innerHTML ="Not matching with New Password";
		  document.getElementById("confrmpwd").focus();
		 document.getElementById("confrmpwd").addEventListener("keyup", onFocusOut);
		 //document.getElementById("confrmpwd").value="";
		 
		 return false;

  	}
  	
  	else{
  		var xhttp = new XMLHttpRequest();
		     xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log(this.responseText);
					 if(this.responseText == 'success'){
						document.getElementById("success2").style.display="block";
						setTimeout(function(){ window.location.href = '/USWMDEMO/' }, 3000);
					} else  if(this.responseText == 'invalid'){
						document.getElementById("invalid").innerHTML="Invalid Current Password";
						document.getElementById("currentpwd").style.borderColor = "red";
			    		document.getElementById("currentpwd").focus(); 
			    		document.getElementById("currentpwd").addEventListener("keyup", onFocusOut);
						
					}else{
						document.getElementById("failure2").style.display="block";
					}
				}
			};
			xhttp.open("POST", "changePasswordSubmit",true);
			xhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
			xhttp.send("currentPwd="+currentPwd+"&newPwd="+newPwd); 
  	} 
  }
  
  function onFocusOut()
  {
  
  	document.getElementById(this.id).style.borderColor = "";
  	document.getElementById(this.id).parentNode.getElementsByTagName('span')[0].innerHTML="";
  	document.getElementById(this.id).parentNode.getElementsByTagName('span')[1].innerHTML="";
  	//doument.getElementById("detailssavebutton").addEventListener("click", changeState,false);
  }

  
  
  function ProfileClean()
  {
  
    document.getElementById("uId").value="<%=userSession.getId()%>";
 	  document.getElementById("changeName").value="<%=userSession.getUname()%>";
 	  document.getElementById("changeName").style.borderColor = "";
 	 document.getElementById("changeName").readOnly=true;
 	  document.getElementById("nameexists").innerHTML= "";
 	  document.getElementById("namevalid").innerHTML= "";
 	  
 	  document.getElementById("changecontact").value="<%=userSession.getContactnumber()%>";
 	  document.getElementById("changecontact").style.borderColor = "";
 	  document.getElementById("changecontact").readOnly=true;
 	  document.getElementById("phonevalid").innerHTML= "";
 	  
 	  document.getElementById("changeEmail").value="<%=userSession.getEmailId()%>";
 	  document.getElementById("changeEmail").style.borderColor = "";
 	  document.getElementById("changeEmail").readOnly=true;
 	  document.getElementById("emailvalid").innerHTML= "";
 	  document.getElementById("emailexists").innerHTML= "";
 	  
 	  document.getElementById("editbutton").disabled=false;
	  document.getElementById("detailssavebutton").disabled=true;
  	   
  
  }
    
  
  function PasswordClean()
  {
  	
	  document.getElementById("currentpwd").value="";
	  document.getElementById("currentpwd").style.borderColor = "";
	  document.getElementById("invalid").innerHTML= "";
	  
	  document.getElementById("newpwd").value="";
	  document.getElementById("newpwd").style.borderColor = "";
	  document.getElementById("alertwarn").innerHTML= "";
	  
	  document.getElementById("confrmpwd").value="";
	  document.getElementById("confrmpwd").style.borderColor = "";
	  document.getElementById("confinvalid").innerHTML= "";
	  
	 
  	
  }
  
  
  function check()
  {
  	var ischecked=document.getElementById("pwdshow");
  	if(ischecked.checked == true)
  	{
  		document.getElementById("currentpwd").type = "text";
  		document.getElementById("newpwd").type = "text";
  		document.getElementById("confrmpwd").type = "text";
  	}
  	else if(ischecked.checked == false)
  	{
  		document.getElementById("currentpwd").type = "password";
  		document.getElementById("newpwd").type = "password";
  		document.getElementById("confrmpwd").type = "password";
  	}
  	
  }
  
  

</script>
        
        
    <style>
    
   /* .skin-blue .sidebar-menu>li>a:active, .skin-blue .sidebar-menu>li>a:focus {
    border-left-color: #3c8dbc;
}
.skin-blue .sidebar-menu>li:hover>a, .skin-blue .sidebar-menu>li>a:focus{
 cursor: pointer; 
    color: #fff;
    background: #24537D;
     border-left-color: #3c8dbc;
}*/
    
 /*   .sidenav a:active,.sidenav a:focus,.sidenav a:hover {
    color:white;
     background-color: green;
     border-left-color:yellow;
}*/

 .skin-blue .sidefocus>li>a:active, .skin-blue .sidefocus>li:hover>a, .skin-blue .sidefocus>li>a:focus{
    color: #fff;
    background: #24537D;
     border-left-color: #3c8dbc;
}

.skin-black .sidebar-menu>li:hover>a, .skin-black .sidebar-menu>li.active>a, .skin-black .sidebar-menu>li.menu-open>a {
    color: #fff;
    background: #24537D;
    border-left-color: #3c8dbc;
}
 
 .underline>a:hover{
  text-decoration: underline;
  text-decoration-color:#36c;
 }
 .pointer {cursor: pointer;}
 *{
   font-family:Segoe UI;
 }
    </style>