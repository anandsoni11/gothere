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
			PreparedStatement p=conn.prepareStatement("Select country from dummy");
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


	
}
