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
                <li><a href="signup.jsp">Sign Up</a></li>
                <li><a href="login.jsp">Sign In</a></li>
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
          <ol class="breadcrumb">
            <li><a href="home_loggedin.jsp">Home</a></li>
            <li class="active">Profile</li>
          </ol>
     
          <h1>You dream of skies, we get you wings!</h1>
          <br>
          <br>
          <%
         String user = (String) session.getAttribute("username");
         team_trawell.trawell l = new team_trawell.trawell();
          
        l.createConnection();  
        String name= l.getNameofUser(user);
        String addr= l.getAddressofUser(user);
        String email= l.getEmailofUser(user);

        %>
        <h2>Your Profile Information</h2>
        <table class="table">
          <thead>
            <td>Username</td>
            <td>Name</td>
            <td>Address</td>
            <td>Email</td>
          </thead>
          <tbody>
          <tr>
            <td><%=user%></td>
            <td><%=name%></td>
            <td><%=addr%></td>
            <td><%=email%></td>
          </tr>
        </tbody>
        </table>
        <form action="changepassword.jsp" class="form-horizontal form-signin-signup">
            <input type="submit" name="editprofile" value="Edit Profile" class="btn btn-primary btn-large">
        </form>
        </div>
      </div>
    </div>
    <br>
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
 


