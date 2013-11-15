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
              <li><a href="planname.jsp">Add Plan</a></li>
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
          String user = (String)session.getAttribute("username");
          if(user!=null)
          {
            out.println("Welcome  "+user+", <a href=\"logout.jsp\" >Logout</a>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
          }
          %>
        <%
			String pid = request.getParameter("pid");
			String pname = request.getParameter("pname");
			//String user = (String)session.getAttribute("username");
        %>
        
        
          <h1>Plan: <%=pname%></h1><br>
          
          </div>
          
          <div>
               <h3> Your Friends..!!</h3>   
		<%
			team_trawell.trawell l=new team_trawell.trawell();
			l.createConnection();
			String friends = l.getFriends(user,pid);

			StringTokenizer friendtokens = new StringTokenizer(friends, ",");
			
			while (friendtokens.hasMoreElements()) {
				String s = (String)friendtokens.nextElement();
				String[] parts = s.split(":");
				s="<a href=\"showfriendprofile.jsp?user=" + parts[0] +"&name="+parts[1]+ "  \"> "  +parts[1]+"</a>";
				out.print(s);
			}		
		%>
		

        </div>
        
        <div>
               <h3>Your Plan Details..!!</h3>  
               <table class="table table-hover"> 
		<%
			
			String table = l.getplanDetails(user,pid);
		%>
					<thead>
						<td>Place to visit</td>
						<td>Date of visit</td>
					</thead>
					<tbody>
		<%
			StringTokenizer tabletokens = new StringTokenizer(table, ",");
			while (tabletokens.hasMoreElements()) {
				String s = (String)tabletokens.nextElement();
				String[] parts = s.split(":");
				String spotlink = "<a href=\"spotresults_loggedin.jsp?name="+parts[1]+ "&id="+parts[0]+"  \"> "  +parts[1]+"</a>";
				String data = "<tr><td>"+spotlink+"</td><td>"+parts[2]+"</td></tr>";
				out.print(data);
			}
		%>
				</tbody>
			</table>
        </div>
        
        
	<br>
    <footer>
      <hr class="footer-divider">
      <div class="container">
        <p>
          &copy; 2013-3000 Trawell, Inc. All Rights Reserved.
        </p>
      </div>
    </footer>
     </div>
    </div>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/boot-business.js"></script>
  </body>
</html>

      

