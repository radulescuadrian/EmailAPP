package randStuff;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection {
	
	public static void main(String[] args) {
		dbConnection ob_DB_Connection = new dbConnection();
		System.out.println(ob_DB_Connection.getConnection());
	}
	
	//return connection
	public Connection getConnection() {
		Connection con = null;
		System.out.println("connection called");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/email","root","");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}