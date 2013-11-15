<%@ page import="team_trawell.*" %>
<%@ page import="java.util.*" %>
<%
System.out.println("------------------ entered");
	
	System.out.println("------------------ entered");
	team_trawell.trawell l = new team_trawell.trawell();
	l.createConnection();
	
	String type=request.getParameter("type");
	String name=request.getParameter("name");
	
	
	int flag=Integer.parseInt(type);
	System.out.println("type : " + type);
	System.out.println("flag : " + flag);
	String t="";
	/*String states=l.searchStatesforaCountry(name);
		String tag1="<option value=";
		String tag2=">";
		String tag3="</option>";
		StringTokenizer st = new StringTokenizer(states, ",");
        while (st.hasMoreElements()) {
           String s = (String)st.nextElement();
           t+=tag1;
           t+=s;
           t+=tag2;
           t+=s;
           t+=tag3;
       	}*/
	String tag1="<option value=";
		String tag2=">";
		String tag3="</option>";
	switch (flag) 
	{
		case 1: 
		System.out.println("calling........ 11");
		String states=l.searchStatesforaCountry(name);
		StringTokenizer st = new StringTokenizer(states, ",");
        while (st.hasMoreElements()) {
           String s = (String)st.nextElement();
           t+=tag1;
           t+=s;
           t+=tag2;
           t+=s;
           t+=tag3;
       	}
       	break;
		
 		case 2: 
 		String coun=request.getParameter("cast");
		String cities=l.searchCitiesforaState(name,coun);
		
		StringTokenizer st1 = new StringTokenizer(cities, ",");
        while (st1.hasMoreElements()) {
           String s = (String)st1.nextElement();
           t+=tag1;
           t+=s;
           t+=tag2;
           t+=s;
           t+=tag3;
       }
		break;

}	


System.out.println(t);
%>


<%=t%>
