<%@page import="java.util.*"%>
<%@page import="com.team.app.constant.*"%>
<%@page import="com.team.app.domain.*"%>
<%@page import="com.team.app.service.impl.UserLoginServiceImpl"%>
<%@ page errorPage="error.jsp" %> 
<header class="main-header" >

   
	    <a href="#" class="logo affix">
			    <svg width="135px" height="50px" >
						  <defs>
						    <filter id="MyFilter" filterUnits="userSpaceOnUse" x="50" y="50" width="200" height="120">
						        <feGaussianBlur in="SourceGraphic" stdDeviation="15" />
						      <feOffset result="offOut" in="SourceAlpha" dx="60" dy="60" />
						    
						    </filter>
						  </defs>
						  <text stroke-width="3.5"  stroke="white" font-size="26" font-family="Verdana" x="0" y="40">HYDAC</text>
						  
						  Sorry, your browser does not support inline SVG.
				</svg>
		</a> 
	    

	    <!-- Header Navbar: style can be found in header.less -->
	    <nav class="navbar navbar-static-top affix" >
	      <!-- Sidebar toggle button-->
	      <a href="#" class="sidebar-toggle" style="width:2.5em;" data-toggle="offcanvas" role="button">
	      </a> 
	    </nav>
	    
   </header>
  
  
  <aside class="main-sidebar" style="position:fixed;">
  
   <% TblUserInfo userSession = (TblUserInfo) request.getSession().getAttribute("user");
   		            	if (userSession == null){
			                response.sendRedirect("/");
			            }else if(userSession.getRoleBean().getType().equals(AppConstants.admin) || userSession.getRoleBean().getType().equalsIgnoreCase(AppConstants.superAdmin)){
			            
			            
  %>
    <section class="sidebar">
        
      <ul class="sidebar-menu">
        <li class="header"><b>MAIN NAVIGATION</b></li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span><b>Dashboard</b></span>
          </a>
        </li>
                 
      </ul>
    </section>
  <%}%>
  </aside>