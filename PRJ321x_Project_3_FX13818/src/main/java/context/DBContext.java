package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	/*Use below method for your database connection for both single and multiple sql server instance(s)*/
	/*Do not edit the below method, you must use this one for your database connection*/
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:sqlserver://" + serverName+":" + portNumber+"\\" + instance + ";databaseName=" + dbName;
		if(instance == null || instance.trim().isEmpty()) {
			url = "jdbc:sqlserver://" + serverName+ ":" +portNumber + ";databaseName=" + dbName + "; encrypt=false";			
		}
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}
		
		//Insert your code right after this comment
		/*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
		
		private final String serverName = "localhost";
		private final String dbName = "ShoppingDB";
		private final String portNumber = "1433";
		private final String instance = "";//Leave this one empty if your sql is single
		private final String userID = "sa";
		private final String password = "Password.1";
		
//		public static void main(String[] args) {
//			try {
//				System.out.println(new DBContext().getConnection());
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
}
