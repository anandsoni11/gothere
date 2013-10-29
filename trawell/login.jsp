<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="team_trawell.*" %>

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
                <li><a href="signup.jsp">Sign up</a></li>
                <li><a href="home.jsp">Home</a></li>
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
          <h1>You dream of skies, we get you wings!</h1>
        </div>
        <div class="row">
          <div class="span6 offset3">
            <h4 class="widget-header"><i class="icon-lock"></i> Sign In to Trawell</h4>
            <div class="widget-body">
              <div class="center-align">
				<%
				String myname =  (String)session.getAttribute("username");
        
				if(myname!=null)
				{
					out.println("Welcome  "+myname+"  , <a href=\"logout.jsp\" >Sign Out!</a>");
				}
				else 
				{
				%>
 
                <form action="checkLogin.jsp" class="form-horizontal form-signin-signup">
                  <input type="text" name="username" placeholder="Username">
                  <input type="password" name="password" placeholder="Password">
                  <div class="remember-me">
                    <div class="pull-left">
                      <label class="checkbox">
                        <input type="checkbox"> Remember me
                      </label>
                    </div>
                    <div class="pull-right">
                      <a href="#">Forgot password?</a>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <input type="submit" value="Sign In" class="btn btn-primary btn-large">
                </form>
			   <% 
				}
               %>
         		
                <h4><i class="icon-question-sign"></i> Not started trawelling yet?</h4>
                <a href="signup.jsp" class="btn btn-large bottom-space">Well, Signup Now!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <footer>
      <hr class="footer-divider">
      <div class="container">
        <p>
          &copy; 2013-3000 Trawell, Inc. All Rights Reserved.
        </p>
      </div>
    </footer>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/boot-business.js"></script>
  </body>
</html>
