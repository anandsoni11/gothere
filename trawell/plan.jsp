<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="team_trawell.*" %>
<%@ page import="java.util.*" %>

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
              <li><a href="planname.jsp">Add a Plan</a></li>
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
			<div class="page-header">
				<%
          String myname = (String) session.getAttribute("username"); 
          if(myname!=null)
          {
            out.println("Welcome  "+myname+", <a href=\"logout.jsp\" >Logout</a>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
          }
          %>
				<h1>Your Plans..!!</h1>
			</div>
			<!--
			<div class="row">
				<div class="span6 offset3">
					<h4 class="widget-header"><i class="icon-gift"></i> Give a Name..!!</h4>
					<div class="widget-body">
						<div class="center-align">
							<form action="planplace.jsp" class="form-horizontal form-signin-signup">
								<input type="text" name="planname" placeholder="Name">
								<div>
									<input type="submit" name="addplanname" value="Give Name" class="btn btn-primary btn-large">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>-->
			
			<%
			String username = (String)session.getAttribute("username");
			team_trawell.trawell l=new team_trawell.trawell();
			l.createConnection();
			String plans = l.getPlanbyUser(username);
			//out.print(plans);
			
			StringTokenizer plantokens = new StringTokenizer(plans, ",");
			while (plantokens.hasMoreElements()) {
				String s = (String)plantokens.nextElement();
				String[] parts = s.split(":");
				s="<h5><a href=\"showplan.jsp?pname=" + parts[1] +"&pid="+parts[0]+ "  \"> "  +parts[1]+"</a><h5>";
				out.println(s);
				out.println("<br>");
			}  
			
			
			%>
			
			<br>
    
			<br>
			<br>
    
   
    
    <footer>
      <hr class="footer-divider">
        <p>
          &copy; 2013-3000 Trawell, Inc. All Rights Reserved.
        </p>

    </footer>
    			
			
			
			
		</div>
	</div>
    </body>
    </html>
