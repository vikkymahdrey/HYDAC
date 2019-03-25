<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Forgot Password</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link href="//cdn.shopify.com/s/files/1/1198/3830/t/6/assets/theme.scss.css?10713448530586305152" rel="stylesheet" type="text/css" media="all" />
<link href="//cdn.shopify.com/s/files/1/1198/3830/t/6/assets/unslider.css?10713448530586305152" rel="stylesheet" type="text/css" media="all" />
<link href="//cdn.shopify.com/s/files/1/1198/3830/t/6/assets/unslider-dots.css?10713448530586305152" rel="stylesheet" type="text/css" media="all" />
<link href="//cdn.shopify.com/s/files/1/1198/3830/t/6/assets/custom.scss.css?10713448530586305152" rel="stylesheet" type="text/css" media="all" />
  <link rel="icon" type="image/png" href="dashboard/dist/img/Watermeter.png" style="">
	
  </head>
  <%-- <body class="login-bg">
  
<div class="wrapper">
	 	
	<div class="container">
	<div class="login-input-wrap">
			<div class="login-input-border-wrap">
							<%
						  
						String message="";
						
						try{
							message=request.getParameter("message");
							if(message!=null&&!message.equals(""))
									{
							}
							else
								{						
							message = "";
							message = request.getAttribute("status").toString();
						session.setAttribute("status", "");
								}
				
						}catch(Exception e)
						{
							;
						}
					
					%>	
							<div class="row mar-top-20">
								<div class="col-sm-12">
									<div class="alert alert-danger san" hidden="hidden"
										style="color: red">
										<p id="errortag"></p>
									</div>
								</div>
							</div>
							
			<form name="ChangePassword" action="resetPassword" method="post" onSubmit="return confirmValidate()">		
				<div class="row">
					<div class="col-sm-12">
						<h6 class="text-regular text-uppercase"><b>Forgot Password</b></h6>
						
						<input type="text" name="email" id="email" placeholder="Email Address" class="form-control" />
						<label id="emailvalid" style="color: red;" ><%=message%></label>
						
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-6 mar-top-20 text-left">
						<input type="submit" class="btn btn-blue" value="Submit"/>
					</div>
				
				<div class="col-sm-6 mar-top-20 text-right">
						<input type="button" value="Back"  onclick="window.history.back()" class="btn btn-blue"/>
					</div>
					</div>
				</form>
	</div>
	</div>
	</div>
	
	
</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
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
	var flag = true;
	var email=document.getElementById("email").value;
		
	if(email==null || email==""){
		 document.getElementById("emailvalid").innerHTML = "Please enter email address!";
		 document.getElementById("email").focus(); 
		flag=false;
	}
	return flag;
		}
		
		</script>
		</div>
  </body>--%>
  
  <body class="hold-transition skin-blue skin-black sidebar-mini" onload="ready()">
  

							<%
						  
						String message="";
						
						try{
							message=request.getParameter("message");
							if(message!=null&&!message.equals(""))
									{
							}
							else
								{						
							message = "";
							message = request.getAttribute("status").toString();
						session.setAttribute("status", "");
								}
				
						}catch(Exception e)
						{
							;
						}
					
					%>	
							<div class="row mar-top-20">
								<div class="col-sm-12">
									<div class="alert alert-danger san" hidden="hidden"
										style="color: red">
										<p id="errortag"></p>
									</div>
								</div>
							</div>
							
			
	
	
	
	
	
	<div class="modal  fade in" id="modal-forgotpwd" data-keyboard="false" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header" style="background-color:#235E93">
               <!--  <button type="button" class="pull-right" data-dismiss="modal" aria-label="Close" style="background:none;border:0" onclick="PasswordClean()" >
                  
                  <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                  </button> -->
                <h5 class="modal-title" style="color:#ffff">Forgot Password</h5>
              </div>
              <div class="modal-body" style="background-color:#f9f9f9">
                
                <div class="box-body">
                <form name="ChangePassword" action="resetPassword" method="post" onSubmit="return confirmValidate()">	
                
                <div class="form-group">
                  <input type="text" name="email" id="email" placeholder="Enter email" class="form-control" />
				  <span id="emailvalid" style="color: red;" ><%=message%></span>
                </div>
                 <div class="form-group text-center">
                 <input type="button" value="Back"  onclick="window.history.back()" class="btn  btn-success" style="background-color:#64B246;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0"/>
                  <button class="btn btn-success" style="background-color:#64B246;width:100px;box-shadow: 0px 0px 2px 2px rgba(0,0,0,0.10);border:0" onSubmit="confirmValidate()">Submit</button>
                  
                  
                </div>
                </form>
                  
                </div>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        
	
	
	
	
	
	
	
	

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	
	<script>
	$(document).ready(function() {
		  $('#modal-forgotpwd').modal('show');
		  
		});
	
	
	
	
	
	
	
	
	</script>
	
	
<script>





function confirmValidate() {
	var flag = true;
	var email=document.getElementById("email").value;
	
	 var emailRegx = /^((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+([!#\$%&\*\.\+\-\/=\?\^_`{\|}~]([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/;
		
	if(email==null || email==""){
		// document.getElementById("emailvalid").innerHTML = "Please enter email address!";
		 document.getElementById("email").focus(); 
		 document.getElementById("email").style.borderColor = "red";
		 document.getElementById("email").addEventListener("keyup", onFocusOut);
		flag=false;
	}
	else if(emailRegx.test(email)==false)
		{
  		
		   document.getElementById("email").style.borderColor = "red";
    	   document.getElementById("emailvalid").innerHTML="Invalid email address";
		   document.getElementById("email").focus();
		   document.getElementById("email").addEventListener("keyup", onFocusOut);
		   flag=false;
		}
	return flag;
		}
		
		
		
		
function onFocusOut()
{

	document.getElementById(this.id).style.borderColor = "";
	document.getElementById(this.id).parentNode.getElementsByTagName('span')[0].innerHTML="";
	document.getElementById(this.id).parentNode.getElementsByTagName('span')[1].innerHTML="";
	//doument.getElementById("detailssavebutton").addEventListener("click", changeState,false);
}

		
		</script>
  </body>
  
  
  
  
  
</html>