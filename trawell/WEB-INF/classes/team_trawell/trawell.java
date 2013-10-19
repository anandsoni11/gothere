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
	
}
