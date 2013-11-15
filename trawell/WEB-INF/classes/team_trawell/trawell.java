package team_trawell;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.io.FileReader;
import java.util.StringTokenizer;
import java.util.Scanner;
import java.io.File;
import java.util.Scanner;
import java.util.*;
/**
 *
 * @author anandsoni
 */
public class trawell {
	
	public static String str = System.getenv("HOME");
    public static Connection conn=null;
    	
	public void createConnection() {
		
		try{
           Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException cnfe){
           System.out.println("Could not find the JDBC driver!");
           System.exit(1);
		}
	        
		String hostname = "";	// If PostgreSQL is running on some other machine enter the IP address of the machine here
		String username = "trawell"; // Enter your PostgreSQL username
		String password = "trawell"; // Enter your PostgreSQL password
		String dbName = "trawell"; // Enter the name of the database that has the university tables.
		String connectionUrl = "jdbc:postgresql://" + hostname +  "/" + dbName;
		//conn = null;

		//Connect to the database
        try {
			System.out.println("Establishing connection to the server..");
             conn = DriverManager.getConnection(connectionUrl,username, password);
             System.out.println("Connected successfullly");
         } catch (SQLException sqle) {
             System.out.println("Connection failed");
	     System.out.println(sqle);
	         System.exit(1);
         }
	 }

	 public String getCountries() {
	 	String c="";
	 	try {
			PreparedStatement p=conn.prepareStatement("Select countryname from countries");
			//p.setString(1, Movie);
			p.addBatch();
			ResultSet rs= p.executeQuery();
			while(rs.next()) {
          		c+= rs.getString(1);
          		c+=",";
          	}
			
		} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}

		return c;
	
	 }

	 public String addCustomer(String name, String addr, String email, String user, String pass) {
	 	String result="";
	 	try {
	 		PreparedStatement p1=conn.prepareStatement("insert into customer values(?,?,?,?,?)");
			p1.setString(1, name);
			p1.setString(2, addr);
			p1.setString(3, email);
			p1.setString(4, user);
			p1.setString(5, pass);
			p1.executeUpdate();
			result="Congrarulations! You have been signed up successfully!";
			} catch (SQLException sqle) {
				result="User already exists!";
				System.out.println(sqle);
				return result;
				//System.exit(1);
			}
			return result;
				
	 }

	 public String loginVerification(String u, String p) {
	 	String result="";
	 	try {
	 		PreparedStatement p1=conn.prepareStatement("select password from customer where username=?");
	 		p1.setString(1, u);
			ResultSet rs=p1.executeQuery();
			if(!rs.next()) {
				result="Invalid Username!";
			}
			else {
				if(p.equals((String)rs.getString(1))) {
					result="Success!";
				}
			}
		} catch (Exception sqle) {
			result="User already exists!";
			System.out.println(sqle);
			//return result;
			System.exit(1);
		}
			String fin = result;
			return fin;
	 }

	 //Modify this soon!
	 public String searchBySpot(String spot) {
	 	String c="";
	 	try {
			PreparedStatement p=conn.prepareStatement("Select spotname from touristspots where spotname=?");
			p.setString(1, spot);
			p.addBatch();
			ResultSet rs= p.executeQuery();
			while(rs.next()) {
          		c+= rs.getString(1);
          		c+=",";
          	}
			
		} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}

		return c;
	
	 }

	 public String searchStatesforaCountry(String country) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select statename from states where countryname=?");
	 		p.setString(1,country);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c+=rs.getString(1);
	 			c+=",";
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}

		return c;
	 }

	 
	 public String searchCitiesforaState(String state, String country) {
	 	String c="";
	 	System.out.println("Hey! "+country+" "+state);
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select cityname from cities where countryname=? and statename=?");
	 		p.setString(1,country);
	 		p.setString(2,state);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c+=rs.getString(1);
	 			c+=",";
	 		}
	 		System.out.println(c);
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}

		return c;
	 }

	 public int getCityID(String city, String state, String country) {
	 	int c=0;
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select cityid from cities where cityname=? and statename=? and countryname=?");
	 		p.setString(1,city);
	 		p.setString(2,state);
	 		p.setString(3,country);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getInt(1);	
	 		}
	 	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
		System.out.println("Here is c: "+c);
		return c;
	 }

	 public String searchSpotsforaCity(int cityid) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select spotname from touristspots where cityid=?");
	 		p.setInt(1,cityid);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c+=rs.getString(1);
	 			c+=",";
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}

		return c;
	 }

	 public String getSpotDescription(String spot, int id) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select description,rating from touristspots where cityid=? and spotname=?");
	 		p.setInt(1,id);
	 		p.setString(2,spot);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c+=rs.getString(1);
	 			c+=":";
	 			c+=rs.getString(2);
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;
	 }

	 public String getSpotbyName(String spot) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select cityid, spotname from touristspots where spotname=?");
	 		p.setString(1,spot);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c+=rs.getString(1);
	 			c+=",";
	 			c+=rs.getString(2);
	 			c+=":";
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;
	 }

	 public String getNameofUser(String username) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select name from customer where username=?");
	 		p.setString(1,username);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 			
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;		
 	}
	 

	 public String getAddressofUser(String username) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select address from customer where username=?");
	 		p.setString(1,username);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 			
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;		
 	}
	 

	 public String getEmailofUser(String username) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select emailid from customer where username=?");
	 		p.setString(1,username);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 			
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;		
	 }

	public String getPlanbyUser(String username){
		String id="";
		String pname="";
		try {
	 		PreparedStatement p=conn.prepareStatement("Select planid from friends where friend=?");
	 		p.setString(1,username);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			id+=rs.getString(1);
	 			id+=";";
	 			
	 		}
	 		StringTokenizer st = new StringTokenizer(id, ";");
			while (st.hasMoreElements()) {
				String pid = (String)st.nextElement();
				p=conn.prepareStatement("Select planname from plan where planid=?");
				p.setInt(1,Integer.parseInt(pid));
				System.out.println(pid);
				p.addBatch();
				rs = p.executeQuery();
				while(rs.next()) {
					pname+=pid+":"+rs.getString(1)+",";	
				}
			}
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
		System.out.println(pname);
	 	return pname;		
	}
	
	public int checkPlanExists(String user,String pname){
		String query="select count(*) from ((SELECT planid from friends where friend =?) intersect (select planid from plan where planname = ?)) as A;";
		int result=0;
		try {
	 		PreparedStatement p=conn.prepareStatement(query);
	 		p.setString(1,user);
	 		p.setString(2,pname);
	 		p.addBatch();
	 		ResultSet rs = p.executeQuery();
	 		
	 		while(rs.next()){
				if(rs.getString(1).equals("0")){
					result=1;
				}
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
		return result;
	}
	
	public String getlastPid(){
		String pid ="";
		PreparedStatement p;
	 	System.out.println(" addplan sfvsdvsd\n");
		try {
			//System.out.println(" addplan sdfhsjdfhjfdshsfksdfhslfdhlsl\n");
			String Query ="SELECT max(planid) FROM plan;";
			p=conn.prepareStatement(Query);
			p.addBatch();				
			ResultSet rs = p.executeQuery();
			//System.out.println("addplan1\n");
			while(rs.next()){
				pid= rs.getString(1);
			}
			//System.out.println("addplan2\n");
		} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
		return pid;
	}
	
	public String getPlanID(String user, String pname){
		PreparedStatement p;
		String s="";
	 	System.out.println(" addplan sfvsdvsd\n");
		try {
			System.out.println(" addplan sdfhsjdfhjfdshsfksdfhslfdhlsl\n");
			String Query ="((SELECT planid from friends where friend =?) intersect (select planid from plan where planname = ?));";
			p=conn.prepareStatement(Query);
			p.setString(1,user);
			p.setString(2,pname);
			p.addBatch();				
			ResultSet rs = p.executeQuery();
			System.out.println("addplan1\n");
			while(rs.next()){
				s= rs.getString(1);
			}
			System.out.println("addplan2\n");
		} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
		return s;
	}
	
	public void addPlan(String pname, String user){
		try {
			//System.out.println(" addplan insert plan\n");
	 		PreparedStatement p=conn.prepareStatement("Insert into plan(planname) values(?);");
	 		System.out.println(" addplan sfvsdvsd\n");
	 		p.setString(1,pname);
	 		p.addBatch();
	 		p.executeUpdate();
	 		System.out.println(" addplan plan inserted\n");
	 		String pid = getlastPid();
	 		
	 		try {
				//System.out.println(" addplan sdfhsjdfhjfdshsfksdfhslfdhlsl\n");
				String Query ="Insert into friends(planid, friend) values(?,?);";
				p=conn.prepareStatement(Query);
				p.setInt(1,Integer.parseInt(pid));
				p.setString(2,user);
				p.addBatch();				
				p.executeUpdate();
				System.out.println("addplan2\n");
			} 
			
			catch (SQLException sqle) {
				PreparedStatement p1=conn.prepareStatement("Delete from plan where planname =?;");
				System.out.println(" addplan sfvsdvsd\n");
				p1.setString(1,pname);
				p1.addBatch();
				p1.executeUpdate();
				System.out.println(" addplan plan deleted\n");
				System.out.println(sqle);
				System.exit(1);
			}
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
		System.out.println("before addplandfghdfg\n");
	}
	
	public String getFriends(String user, String pid){
		PreparedStatement p;
		String f="";
	 	//System.out.println(" addplan sfvsdvsd\n");
		try {
			//System.out.println(" addplan sdfhsjdfhjfdshsfksdfhslfdhlsl\n");
			String Query ="Select username,name from (select username,name from customer where username <> ?)as B join (SELECT *from friends where planid =?) as A on(A.friend = B.username);";
			p=conn.prepareStatement(Query);
			p.setString(1,user);
			p.setInt(2,Integer.parseInt(pid));
			p.addBatch();				
			ResultSet rs = p.executeQuery();
			System.out.println("addplan1\n");
			while(rs.next()){
				f += rs.getString(1)+":"+rs.getString(2)+",";
			}
			System.out.println("addplan2\n");
		} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
		return f;		
	}

	 public void changePassword(String username, String password) {
	 	try {
	 		PreparedStatement p=conn.prepareStatement("update customer set password=? where username=?");
	 		p.setString(1,password);
	 		p.setString(2,username);
	 		p.addBatch();
	 		p.executeUpdate();
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 }

	 public void changeAddress(String username, String address) {
	 	try {
	 		PreparedStatement p=conn.prepareStatement("update customer set address=? where username=?");
	 		p.setString(1,address);
	 		p.setString(2,username);
	 		p.addBatch();
	 		p.executeUpdate();
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 }

	 public void changeEmail(String username, String email) {
	 	try {
	 		PreparedStatement p=conn.prepareStatement("update customer set emailid=? where username=?");
	 		p.setString(1,email);
	 		p.setString(2,username);
	 		p.addBatch();
	 		p.executeUpdate();
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 }

	 public String getPasswordofUser(String username) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select password from customer where username=?");
	 		p.setString(1,username);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 			
	 		}
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;		
	 }

	 public String addCustomerSpotRating(String username, int cityid, String spotname, int rating) {
	 	String result="rating done!";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select * from spotrating where username=? and cityid=? and spotname=?");
	 		PreparedStatement p1=conn.prepareStatement("insert into spotrating values(?,?,?,?)");
	 		p.setString(1,username);
	 		p.setInt(2,cityid);
	 		p.setString(3,spotname);
	 		ResultSet rs=p.executeQuery();
	 		if(!rs.next()) {
				p1.setString(1, username);
				p1.setInt(2, cityid);
				p1.setString(3, spotname);
				p1.setInt(4, rating);
				p1.executeUpdate();
			}
			else {
				PreparedStatement p2=conn.prepareStatement("update spotrating set srating=? where username=? and cityid=? and spotname=?");
				p2.setInt(1,rating);
				p2.setString(2,username);
				p1.setInt(3, cityid);
				p1.setString(4, spotname);
				p2.addBatch();
				p2.executeUpdate();
			}
			} catch (SQLException sqle) {
				result="Unable to rate!";
				System.out.println(sqle);
				return result;
				//System.exit(1);
			}
			return result;
				
	 }

	 public int getUpdatedSpotRating(int cityid, String spotname) {
	 	int r=0,count=0;
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select srating from spotrating where cityid=? and spotname=?");
	 		p.setInt(1,cityid);
	 		p.setString(2,spotname);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 			int i = Integer.parseInt(c);
	 			r+=i;
	 			count++;
	 			System.out.println(r+" dsfssssssssssssssssRating");
	 			System.out.println(count);	 			
	 		}
	 		r=r/count;
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return r;		
	 }	
	 

	 public void updateSpotRating(int cityid, String spotname, int rating) {
	 	try {
	 		PreparedStatement p1=conn.prepareStatement("update touristspots set rating=? where cityid=? and spotname=?");
			p1.setInt(1, rating);
			p1.setInt(2, cityid);
			p1.setString(3, spotname);
			p1.executeUpdate();
			} catch (SQLException sqle) {
				System.out.println(sqle);
				
				//System.exit(1);
			}
	 }

	 public int getRatingValueinInt(String rating) {
	 	int r=0;
	 	if(rating.equals("one")) {
	 		r=1;
	  	}
	  	else if(rating.equals("two")) {
	 		r=2;
	  	}
	  	else if(rating.equals("three")) {
	 		r=3;
	  	}
	  	else if(rating.equals("four")) {
	 		r=4;
	  	}
	  	else if(rating.equals("five")) {
	 		r=5;
	  	}
	  	else if(rating.equals("six")) {
	 		r=6;
	  	}
	  	else if(rating.equals("seven")) {
	 		r=7;
	  	}
	  	else if(rating.equals("eight")) {
	 		r=8;
	  	}
	  	else if(rating.equals("nine")) {
	 		r=9;
	  	}
	  	else if(rating.equals("ten")) {
	 		r=10;
	  	}
	  	return r;

	 }

	 public String getHotelforaCity(int cityid) {
		String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select hotelname from hotel where cityid=?");
	 		p.setInt(1,cityid);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 		}
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;	 	
	 }

	 public String getHotelAddress(int cityid) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select address from hotel where cityid=?");
	 		p.setInt(1,cityid);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 		}
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;	
	 }

	 public String getHotelPhone(int cityid) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select phone from hotel where cityid=?");
	 		p.setInt(1,cityid);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 		}
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;	
	 }

	 public int getHotelRating(int cityid) {
	 	int c=0;
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select hrating from hotel where cityid=?");
	 		p.setInt(1,cityid);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getInt(1);
	 		}
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;	
	 }

	 public String addCustomerHotelRating(String username, int cityid, String hotelname, int rating) {
	 	String result="rating done!";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select * from hotelrating where username=? and cityid=? and hotelname=?");
	 		PreparedStatement p1=conn.prepareStatement("insert into hotelrating values(?,?,?,?)");
	 		p.setString(1,username);
	 		p.setInt(2,cityid);
	 		p.setString(3,hotelname);
	 		ResultSet rs=p.executeQuery();
	 		if(!rs.next()) {
				p1.setString(1, username);
				p1.setInt(2, cityid);
				p1.setString(3, hotelname);
				p1.setInt(4, rating);
				p1.executeUpdate();
			}
			else {
				PreparedStatement p2=conn.prepareStatement("update hotelrating set hrating=? where username=? and cityid=? and hotelname=?");
				p2.setInt(1,rating);
				p2.setString(2,username);
				p1.setInt(3, cityid);
				p1.setString(4, hotelname);
				p2.addBatch();
				p2.executeUpdate();
			}
			} catch (SQLException sqle) {
				result="Unable to rate!";
				System.out.println(sqle);
				return result;
				//System.exit(1);
			}
			return result;
				
	 }

	 public int getUpdatedHotelRating(int cityid, String hotelname) {
	 	int r=0,count=0;
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select hrating from hotelrating where cityid=? and hotelname=?");
	 		p.setInt(1,cityid);
	 		p.setString(2,hotelname);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			c=rs.getString(1);
	 			int i = Integer.parseInt(c);
	 			r+=i;
	 			count++;
	 		}
	 		r=r/count;
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return r;		
	 }	
	 

	 public void updateHotelRating(int cityid, String hotelname, int rating) {
	 	try {
	 		PreparedStatement p1=conn.prepareStatement("update hotel set hrating=? where cityid=? and hotelname=?");
			p1.setInt(1, rating);
			p1.setInt(2, cityid);
			p1.setString(3, hotelname);
			p1.executeUpdate();
			} catch (SQLException sqle) {
				System.out.println(sqle);
				
				//System.exit(1);
			}
	 }

	 public String getCompleteCityDetails(int cityid) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select countryname,statename,cityname from cities where cityid=?");
	 		p.setInt(1,cityid);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			String co=rs.getString(1);
	 			String st=rs.getString(2);
	 			String ci=rs.getString(3);
	 			c=co;
	 			c+=",";
	 			c+=st;
	 			c+=",";
	 			c+=ci;
	 		}
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return c;		
	 }

	 public HashMap<Integer,String> getSpotsfromWishlistforUser(String username) {
	 	HashMap<Integer,String> hm = new HashMap<Integer,String>();
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select cityid,spotname from wishlist where username=?");
	 		p.setString(1,username);
	 		p.addBatch();
	 		ResultSet rs= p.executeQuery();
	 		while(rs.next()) {
	 			Integer id=rs.getInt(1);
	 			String spot=rs.getString(2);
	 			hm.put(id,spot);
	 		}
	 		
	 	} catch (SQLException sqle) {
			System.out.println(sqle);
			System.exit(1);
		}
	 	return hm;		
	 	
	 }

	 public void addtoWishlist(String username, int cityid, String spotname) {
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select * from wishlist where username=? and cityid=? and spotname=?");
	 		PreparedStatement p1=conn.prepareStatement("insert into wishlist values(?,?,?)");
	 		p.setString(1,username);
	 		p.setInt(2,cityid);
	 		p.setString(3,spotname);
	 		ResultSet rs=p.executeQuery();
	 		if(!rs.next()) {
				p1.setString(1, username);
				p1.setInt(2, cityid);
				p1.setString(3, spotname);
				p1.executeUpdate();
			}
		 } catch (SQLException sqle) {
				System.out.println(sqle);
			}
		
	 }

	 public String selectWishlistSpots(String username) {
	 	String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select spotname from wishlist where username=?");
	 		p.setString(1,username);
	 		ResultSet rs=p.executeQuery();
	 		while(rs.next()) {
				String r=rs.getString(1);
				c+=r;
				c+=",";
			}
		 } catch (SQLException sqle) {
				System.out.println(sqle);
			}
			return c;
			
	 }

	 public void deletefromWishlist(String username, String spotname) {
	 	try {
	 		PreparedStatement p=conn.prepareStatement("delete from wishlist where username=? and spotname=?");
	 		p.setString(1,username);
	 		p.setString(2,spotname);
	 		p.executeUpdate();
	 		
		 } catch (SQLException sqle) {
				System.out.println(sqle);
			}
		
	 }

	 public void insertinToVisit(String username, int planid, int cityid, String spotname, String date) {
	 	try{
	 	PreparedStatement p=conn.prepareStatement("insert into tovisit values(?,?,?,?,to_date(?,'YYYY/MM/DD'))");
	 		p.setString(1,username);
	 		p.setInt(2,planid);
	 		p.setInt(3,cityid);
	 		p.setString(4,spotname);
	 		p.setString(5,date);
	 		p.executeUpdate();
	 		
		 } catch (SQLException sqle) {
				System.out.println(sqle);
			}
	 }

	public String getplanDetails(String user, String pid){
		 String query = "SELECT * from tovisit Where username=? and planid=? order by dateoftravel;";
		 String c ="";
		 try {
	 		PreparedStatement p=conn.prepareStatement(query);
	 		p.setString(1,user);
	 		p.setInt(2,Integer.parseInt(pid));
	 		ResultSet rs=p.executeQuery();
	 		while(rs.next()) {
				//cityid:spotname:date,
				c+=rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+",";
			}
		 } catch (SQLException sqle) {
				System.out.println(sqle);
		}
		return c;
	 }


	 public String getPlanDetails(String username, int planid) {
		String c="";
	 	try {
	 		PreparedStatement p=conn.prepareStatement("Select spotname,dateoftravel from tovisit where username=? and planid=?");
	 		p.setString(1,username);
	 		p.setInt(2,planid);
	 		ResultSet rs=p.executeQuery();
	 		while(rs.next()) {
				String sp=rs.getString(1);
				String da = rs.getString(2);
				c+=sp;
				c+=",";
				c+=da+":";
			}
		 } catch (SQLException sqle) {
				System.out.println(sqle);
			}
			return c;

	 }

	 public String gethistoryDetails(String user){
		 String query = "SELECT j.cityid,j.spotname,j.dateoftravel from (history as h join historyplaces as hp on (h.planid = hp.planid)) as j where j.username =?;";
		 String result ="";
		 try {
	 		PreparedStatement p=conn.prepareStatement(query);
	 		//System.out.println("fgfsdgsdfjtyjty1");
	 		p.setString(1,user);
	 		//System.out.println("fgfsdgsdfjtyjty2");
	 		ResultSet rs=p.executeQuery();
			//System.out.println("fgfsdgsdfjtyjty3");
			while(rs.next()) {
			// Logic to retrieve the data from the resultset.
			// eg: rs.getString("abc");
			//System.out.println("fgfsdgsdfjtyjty4");
				Integer cid = rs.getInt(1);
				int cc = (Integer) cid;
				//System.out.println(cid);
				
				//System.out.println("fgfsdgsdf");
				String cd = getCompleteCityDetails(cc);
				//System.out.println(cd);
				/*if (cd.length() > 0 && cd.charAt(str.length()-1)==',') {
					cd = cd.substring(0, cd.length()-1);
				}*/
				//System.out.println("fgvsvsdvsa");
				//date,spotname,country,state,city,cityid:
				result +=rs.getString(3)+","+rs.getString(2)+"," +cd +","+cid+":";
			} 
		 } catch (SQLException sqle) {
			 //System.out.println("fgfsdgsdfjtyjty1sfa4444");
				System.out.println(sqle);
		}
		//System.out.println(result);
		return result;
	 }
	 /*
	  Debugging function!	
	 */
	 public void checkParam(String s1, String s2) {								
	 	System.out.println(s1+" "+s2+" Param Passed!");
	 }
}

	 


	

