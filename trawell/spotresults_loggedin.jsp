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
  <script src="./js/bootstrap-rating-input.min.js" type="text/javascript"></script>	
	<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css" />
  <link type="text/css" rel="stylesheet" href="./css/rating.css" />
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
          <br>
          <br>
          <%
        String myname =  (String)session.getAttribute("username");
        
        if(myname!=null)
        {
          out.println("Welcome  "+myname+"  , <a href=\"logout.jsp\" >Not "+myname+"? Logout, then!</a>");
        }
        %>
          <h4>Search your dream spot here :</h4>
          <form action="searchresults_loggedin.jsp" class="form-horizontal form-signin-signup">
            <input type="text" name="spotsearchbyname" placeholder="Your dream destination">
            <input type="submit" name="getdetails" value="Take a tour!" class="btn btn-primary btn-large">
          </form>
          <h4>And we are there!</h4>
        </div>
          <%
          //Insert java code here.
          String country = request.getParameter("country");
          String state = request.getParameter("state");
          String city = request.getParameter("city");
          String id = request.getParameter("id");
          String spot = request.getParameter("name");

          session.setAttribute("spotname",spot);
          session.setAttribute("cid",id);
          int ids = Integer.parseInt(id);

          team_trawell.trawell l = new team_trawell.trawell();
          l.createConnection();
          out.println("<h4>Exlpore this magical place through these words and your imagination!</h4> ");
          String tag1="<h4>";
          String tag2="</h4>";
          String s="";  
          String c= l.getSpotDescription(spot,ids);
          StringTokenizer st = new StringTokenizer(c, ":");
          while (st.hasMoreElements()) {
            s = (String)st.nextElement();
            //session.setAttribute("country",s);
            //s="<a href=\"countryresults.jsp?name=" + s + "  \"> "  +s+"</a>";
            //tag1 ="<h4>";
            String tag ="";
            tag+=tag1;
            tag+=s;
            tag+=tag2;
            out.println(tag);
            out.println("<br>");
            out.println("<h5>Overall rating for this spot :</h5>");
            }
            //out.println("<h5>Overall rating for this spot :</h5>");
            //out.println("<h5>"+s+"</h5>");
                              
          %>
          
          <h5>Rate Now!</h5>
          <form action="ratingsuccess.jsp" class="form-horizontal form-signin-signup">
          <select class="form-control" name="ratedrop">
            <option value="one">1</option>
            <option value="two">2</option>
            <option value="three">3</option>
           <option value="four">4</option>
            <option value="five">5</option>
            <option value="six">6</option>
            <option value="seven">7</option>
            <option value="eight">8</option>
           <option value="nine">9</option>
            <option value="ten">10</option>
          </select>
          
            <input type="submit" name="rate" value="Rate Now" class="btn btn-primary btn-large">
          </form>
        
          <br>
          <br>
          <h4> Residence and Food Soultions! </h4>
          <%
          String hotel = request.getParameter("hotel");
          String address = l.getHotelAddress(ids);
          String phone = l.getHotelPhone(ids);
          session.setAttribute("hotname",hotel);
          int rah = l.getHotelRating(ids);
          %>
          <table class="table">
          <thead>
            <td>Hotel Name</td>
            <td>Address</td>
            <td>Phone</td>
            <td>Rating</td>
          </thead>
          <tbody>
          <tr>
            <td><%=hotel%></td>
            <td><%=address%></td>
            <td><%=phone%></td>
            <td><%=rah%></td>
          </tr>
        </tbody>
        </table>
        <br>
        <h5>Rate Now!</h5>
          <form action="ratingsuccess.jsp" class="form-horizontal form-signin-signup">
          <select class="form-control" name="ratedrop1">
            <option value="one">1</option>
            <option value="two">2</option>
            <option value="three">3</option>
           <option value="four">4</option>
            <option value="five">5</option>
            <option value="six">6</option>
            <option value="seven">7</option>
            <option value="eight">8</option>
           <option value="nine">9</option>
            <option value="ten">10</option>
          </select>
          
            <input type="submit" name="rateh" value="Rate Now" class="btn btn-primary btn-large">
          </form>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
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

      
  