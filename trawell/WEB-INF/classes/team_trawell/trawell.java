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
	 		PreparedStatement p1=conn.prepareStatement("insert into customer_dummy values(?,?,?,?,?)");
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
	 		PreparedStatement p1=conn.prepareStatement("select password from customer_dummy where username=?");
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
	 


	
}
