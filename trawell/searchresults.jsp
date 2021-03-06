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
                <li><a href="login.jsp">Sign In</a></li>
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
          <br>
          <br>
          
          <%
        out.println("<br>");
        out.println("<h3>The following places match your search request. Please let us know your choice.</h3>");
        
        String searchvalue = request.getParameter("spotsearchbyname");
        team_trawell.trawell l = new team_trawell.trawell();
        l.createConnection();
        String s1="",s2="";  
        String c= l.getSpotbyName(searchvalue);
        StringTokenizer st = new StringTokenizer(c, ":");
        while (st.hasMoreElements()) {
          String s = (String)st.nextElement();
          StringTokenizer st1 = new StringTokenizer(s, ",");
          while(st1.hasMoreElements()) {
            s1 = (String)st1.nextElement();
            s2 = (String)st1.nextElement();
          }
          //session.setAttribute("country",s);
          s="<a href=\"searchresultsfinal.jsp?sid=" + s1 +"&spotn="+s2+ "  \"> "  +s+"</a>";
          out.println(s);
          out.println("<br>");
          }
          out.println("<br>");
          out.println("<br>");
          out.println("<br>");
          out.println("<br>");
          out.println("<br>");
          out.println("<br>");
          out.println("<br>");
          out.println("<br>");
          out.println("<br>");
          out.println("<br>");
        

         %>
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

      

