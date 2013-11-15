<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="team_trawell.*" %>
<%@ page import="java.util.*" %>
<%
	String user = (String)session.getAttribute("username");
	String pname = request.getParameter("planname");
	String planid ="";
	team_trawell.trawell l=new team_trawell.trawell();
	l.createConnection();
%>




<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Trawell | Fly the adventurous skies!">
    <meta name="Anand Soni" content="Trawell">
    <title>Trawell Inc. | Explore those adventurous skies! </title>
	
	<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="./css/bootstrap-responsive.min.css" />
	<link type="text/css" rel="stylesheet" href="./css/font-awesome.css" />
	<link type="text/css" rel="stylesheet" href="./css/font-awesome-ie7.css" />
	<link type="text/css" rel="stylesheet" href="./css/boot-business.css" />
	
	
  </head>
  <body>

    <header>
      
      <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
			<img src="./img/Logo.jpg"/>
            <a href="home.jsp" class="brand brand-bootbus">Trawell</a>

            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
       
            <div class="nav-collapse collapse">
              <ul class="nav pull-left">
              <li><a href="profile.jsp">Profile</a></li>
              <li><a href="plan.jsp">Plan</a></li>
              <li><a href="history.jsp">History</a></li>
              <li><a href="wishlist.jsp">Wishlist</a></li>
              </ul>        
              <ul class="nav pull-right">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">About Us<b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="team.jsp">The Team</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                  </ul>
                </li>
                <li><a href="faq.jsp">FAQ</a></li>
                <li><a href="contact_us.jsp">Contact us</a></li>
                <li><a href="home_loggedin.jsp">Home</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    <br>
    <br>     
    </header>
    
    <div class="content">
		<div class="container">
			<%
				int check = l.checkPlanExists(user,pname);
				if(check!=1){
			%>
					<div class="page-header">
						<h1>Plan already exists. Try different Name..!!</h1>
					</div>
			
					<a href ="planname.jsp"> Add name </a>
			
			<%
				}
				else{
					System.out.println("before addplan\n");
					l.addPlan(pname,user);
					planid=l.getPlanID(user,pname);
					System.out.println("after addplan\n");
			%>
				
				
			
		
		
		
			<div class="page-header">
				<h1>Add a Plan</h1>
			</div>
			
			<div class="row">
				<div class="span6 offset3">
					<h4 class="widget-header"><i class="icon-gift"></i> Add a Place now!</h4>
					<div class="widget-body">
						<div class="center-align">
							<form action="planplace.jsp" class="form-horizontal form-signin-signup">
								Select Date: <input type="date" name="date" placeholder="Enter Date">
								<input type="text" name="country" placeholder="Select Country">
								<input type="text" name="state" placeholder="Select State">
								<input type="text" name="city" placeholder="Select City">
								<input type="text" name="spot" placeholder="Select Spot">
								<div>
									<input type="submit" name="addplace" value="Add Place" class="btn btn-primary btn-large">
								</div>
							</form>
							<h4><i class="icon-question-sign"></i> Are You Done?</h4>
							<a href="plan.jsp" class="btn btn-large bottom-space">Go to Plans</a>
						</div>
					</div>
				</div>
			</div>
			<br>
    
    
    
   
    
    <footer>
      <hr class="footer-divider">
        <p>
          &copy; 2013-3000 Trawell, Inc. All Rights Reserved.
        </p>

    </footer>
    			
			<%
			}
			%>
			
			
		</div>
	</div>
    </body>
    </html>
