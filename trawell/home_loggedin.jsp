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
              <li><a href="history.jsp">History</a></li>
              <li><a href="wishlist.jsp">Wishlist</a></li>
              <!--<li><a href="dropdown.jsp">Dropdown</a></li>-->
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
                <li><a href="home_logged_in.jsp">Home</a></li>
                
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
          String myname =  (String)session.getAttribute("username");
        
          if(myname!=null)
          {
            out.println("Welcome  "+myname+", <a href=\"logout.jsp\" >Logout</a>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
          }
          %>
          <h1>You dream of skies, we get you wings!</h1>
          <br>
          <br>

          <h4>Search your dream spot here :</h4>
          <form action="searchresults_loggedin.jsp" class="form-horizontal form-signin-signup">
            <input type="text" name="spotsearchbyname" placeholder="Your dream destination">
            <input type="submit" name="getdetails" value="Take a tour!" class="btn btn-primary btn-large">
          </form>
          <h4>Search your destination by Country here!</h4>
        </div>
        
        
        
        <%
        team_trawell.trawell l = new team_trawell.trawell();
        l.createConnection();  
        String c= l.getCountries();
        StringTokenizer st = new StringTokenizer(c, ",");
        while (st.hasMoreElements()) {
          String s = (String)st.nextElement();
          //session.setAttribute("country",s);
          s="<a href=\"countryresults_loggedin.jsp?name=" + s + "  \"> "  +s+"</a>";
          out.println(s);
          out.println("<br>");
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

      
