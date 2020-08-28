package tulearn.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	public static Connection getConnection() throws SQLException {
		try {
			Connection con = null;
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://DESKTOP-DBIA495:1433; databaseName=TuLearn; user = sa; password = 123456";
			con = DriverManager.getConnection(url);
			return con;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
}
