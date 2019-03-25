<%@page import="com.team.app.domain.TblUserInfo"%>
<%@page import="java.util.*"%>
<%@ page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Change Password</title>
	  <!--  <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom_siemens.css" rel="stylesheet"> -->
   <!-- jQuery 3 -->
	<script src="dashboard/bower_components/jquery/dist/jquery.min.js"></script> 
   <!-- Bootstrap 3.3.7 -->
	<script
		src="dashboard/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
		<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="dashboard/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="dashboard/bower_components/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet"
	href="dashboard/dist/css/skins/_all-skins.min.css">
	
	 <link rel="icon" type="image/png" href="dashboard/dist/img/Watermeter.png" style="">
	
<script>

/* $(document).ready(function() {		
	  $('#modalpwd').modal('show');	
}); */

</script>	
   
  </head>
 <%--  <body class="login-bg">
  <% TblUserInfo emp=(TblUserInfo)(request.getSession().getAttribute("user"));%>

	<div class="container">
			
			<div class="login-input-wrap">
			<div class="login-input-border-wrap">
			<form action="changePasswordSubmit"  name="changePasswordSubmit" onsubmit="return confirmValidate();" method="post">	
				<div class="row">
					<div class="col-sm-10">
						
						<p align="center"><h3><b> <i>Change Password</i></b></h3></p><br/>
						<p>Old Password</p><input type="password" id="currentPwd" name="currentPwd"  class="form-control login-fields username mar-top-5" />
						<p>Enter New Password</p><input type="password" id="newPwd" name="newPwd"  class="form-control login-fields password mar-top-5" />
						<p>Confirm New Password</p><input type="password" id="conpwd" name="conpwd"  class="form-control login-fields password mar-top-5" />
						
					</div>
				</div>
				
				<div class="row">
					
					<div class="text-center left mar-top-10">
						<input type="submit" value="Save"  class="btn btn-blue" onSubmit="return confirmValidate()"/> &nbsp;&nbsp;&nbsp;
						<input type="reset" value="Reset" class="btn btn-blue"/> 
					</div>
				</div>
				</form>
				</div>
			</div>
		</div>
		<div class="modal fade" tabindex="-1" role="dialog"
			id="validationAlertModal">
			<div class="modal-dialog modal-md">
				<div class="modal-content">

					<div class="modal-body">
						<p class="alert alert-warning" id="alertwarn">
							<img src="images/alert_icon.png" />
						</p>
					</div>
					<div class="modal-footer text-center">
						<button type="button" class="btn btn-blue" data-dismiss="modal">OK</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	
	
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	
	<script>
	
	var docHeight = $(window).height();
	//alert(docHeight);
	var footerHeight = $(".login-footer").outerHeight();
	var headerHeight = $(".header-wrap-login").outerHeight() + 50;
	var contentheight = $(".login-bg .container").outerHeight();
	
	
	
	$(window).on('resize', function () {	
		$(".wrapper").css({
			"min-height" : $(window).height(),
			"padding-bottom" : (footerHeight + 30)
		});				
		var marginValue = ($(window).height() - footerHeight - headerHeight - contentheight)/2;		
		function loginMargin() {
			if (marginValue > 0) {
				$(".login-bg .container").css({
					"margin-top": marginValue
				});
			}
		}
		loginMargin();
	});			
	$( document ).ready(function() {		
		$(window).trigger('resize');		
	});	
</script>
<script type="text/javascript">
function confirmValidate() {
	var pwdvalid=/^(?!.* )(?=^.{8,}$)((?=.*\d)(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/;
	var flag = true;
	var currentPwd=$("input[name=currentPwd]").val();
	var newPwd = $("input[name=newPwd]").val();
	var conpwd = $("input[name=conpwd]").val();
	var ogpwd = $("input[name=ogpwd]").val();
	if(currentPwd=="")
		{
		document.getElementById("alertwarn").innerHTML ="Please Specify Old Password1!";
		$('#validationAlertModal').modal();
		flag=false;
		}
	else if(newPwd=="")
		{
		document.getElementById("alertwarn").innerHTML ="Please Enter New Password!";
		$('#validationAlertModal').modal();
		flag=false;
	
		}
	else if(conpwd=="")
		{
		document.getElementById("alertwarn").innerHTML ="Please confirm your Password!";
		$('#validationAlertModal').modal();
		flag=false;
		
		}
	else if(newPwd!= "" && newPwd == conpwd) {
	      if(pwdvalid.test(newPwd)==false) {
	    	  document.getElementById("alertwarn").innerHTML ="Password must be min 8 characters long, contain at least one number, one uppercase letter, one lowercase letter and a special character";
	  		$('#validationAlertModal').modal();
	        flag=false;
	      }
	} 
	else if(newPwd!=conpwd)
		{
		flag=false;
		alert("New Password And Confirm Password Are Different!");
		
		}
	
	return flag;
		}
		</script>

  </body> --%>
  
  
  <body class="hold-transition skin-blue skin-black sidebar-mini" onload="load()">
  
  <!-- Change Password Model -->
        
        <div class="modal  fade in" id="modalpwd" data-keyboard="false" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93">
               <!--  <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="PasswordClean()" >
                  
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                  </button> -->
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
                   <span id='confinvalid'></span>
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
        var modalalert = $("#modalpwd");
        
        
        function load(){
       	 modalalert.modal('show');
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
        		document.getElementById("confinvalid").style.color = "red";
     		   document.getElementById("confinvalid").innerHTML ="Not matching with New Password";
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
        
        
       /*  function PasswordClean()
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
      	    	
        } */
         
  </script>
  
  
  
  </body>
  
  
</html>