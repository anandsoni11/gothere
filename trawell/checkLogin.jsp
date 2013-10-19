<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Trawell | Fly the adventurous skies!">
    <meta name="Anand Soni" content="Trawell">
    <title>Trawell Inc. | Fly the adventurous skies! </title>
	
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
        

	<%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            //String role = request.getParameter("role");
           //out.println("Performing Authentication..<br>");
            if (username == null || password == null) {
				out.print("Invalid paramters ");
            }
 
            else if (username.toLowerCase().trim().equals("anand") && password.toLowerCase().trim().equals("soni")) {
                out.println("                                          Welcome " + username + " <a href=\"login.jsp\">Back to Login</a>");
                session.setAttribute("username", username);
                //response.sendRedirect("home.jsp");
            }
            else if (username.toLowerCase().trim().equals("sanchit") && password.toLowerCase().trim().equals("garg")) {
                out.println("                                          Welcome " + username + " <a href=\"login.jsp\">Back to Login</a>");
                session.setAttribute("username", username);
                response.sendRedirect("home.jsp");
            }
            
           else 
               {
                out.println("Invalid username and password!");
                out.println(" <a href=\"login.jsp\">Back to Login</a>");
           }
  
	%>
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

