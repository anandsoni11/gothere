<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="team_trawell.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
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
	<script type="text/javascript" src="./js/jquery-2.0.3.js"></script>
  	<script type="text/javascript" src="./js/dropdown.js"></script> 		
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
					session.setAttribute("pid",planid);
					String countries=l.getCountries();
					System.out.println("after addplan\n");
			%>
				
				
			
		
		
		
			<div class="page-header">
				<h1>Add a Plan</h1>
			</div>
			<h4 class="widget-header"><i class="icon-gift"></i> Add a Place now!</h4>
			<form action="planspot.jsp" class="form-horizontal form-signin-signup">
				<h4>Select Date:</h4> <input type="date" name="date" placeholder="Enter Date">
				<div>
				<select name="d1" id="1" onChange="callbackend('1','2')">
          		<%
          		StringTokenizer st = new StringTokenizer(countries, ",");
          		while (st.hasMoreElements()) {
            		String s = (String)st.nextElement();
            		out.println("<option value="+s+">"+s+"</option>");
          		}
          
          		%>
          		</select>
        
      		    <select name="d2" id='2' onChange="callbackend1('2','1','3')">
          		</select>

          		<select name="d3" id='3'>
          		</select>
          	</div>
          	<br>
				<div>
					<input type="submit" name="addplace" value="Add Place" class="btn btn-primary btn-large">
				</div>
			</form>
			<h4><i class="icon-question-sign"></i> Are You Done?</h4>
			<a href="plan.jsp" class="btn btn-large bottom-space">Go to Plans</a>
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
