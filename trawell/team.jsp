<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <%
				String myname =  (String)session.getAttribute("username");
        		if(myname!=null) {	
				out.println("<ul class=\"nav pull-left\">");
					out.println("<li><a href=\"profile.jsp\">Profile</a></li>");
					out.println("<li><a href=\"plan.jsp\">Plan</a></li>");
					out.println("<li><a href=\"history.jsp\">History</a></li>");
					out.println("<li><a href=\"wishlist.jsp\">Wishlist</a></li>");
				out.println("</ul>");
				}
			%>        
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
                <%
                if(myname!=null) {
					out.println("<li><a href=\"home_loggedin.jsp\">Home</a></li>");
				}
				else {
					out.println("<li><a href=\"signup.jsp\">Sign up</a></li>");
				}
				%>
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
            	<%
				//String myname =  (String)session.getAttribute("username");
        
				if(myname!=null)
				{
					out.println("Welcome  "+myname+"  , <a href=\"logout.jsp\" >Logout</a>");
				}
				%>
				<h3>Want to know more about us, the members of the crazy quartet? Here is the place to be. </h3>
				<h4>The founders of Trawell Inc. are four extremely crazy undergraduates from IIT Bombay. Catch a glimpse of each of
				them here :</h4>
				<h3>Sanchit Garg</h3>
				<br>
				<br>
				<br>
				<br>
				<h3>Anand Soni</h3>
				<br>
				<br>
				<br>
				<br>
				<h3>Mridul Garg</h3>
				<br>
				<br>
				<br>
				<br>
				<h3>Himanshu Roy</h3>
				<br>
				<br>
				<br>
				<br>
				
				</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

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

