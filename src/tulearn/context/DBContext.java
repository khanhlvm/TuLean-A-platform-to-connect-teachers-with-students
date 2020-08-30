package tulearn.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	public static Connection getConnection() throws SQLException {
		try {
			Connection con = null;
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost:1433; databaseName=TuLearn; user = trang; password = de130021";
			con = DriverManager.getConnection(url);
//			System.out.println("Success!");
			return con;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
}
