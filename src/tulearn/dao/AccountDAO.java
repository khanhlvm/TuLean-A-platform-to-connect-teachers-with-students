package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tulearn.context.DBContext;
import tulearn.dto.User;

public class AccountDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	private void closeConnection() throws SQLException {
		if (rs != null) {
			rs.close();
		}

		if (ps != null) {
			ps.close();
		}

		if (conn != null) {
			conn.close();
		}
	}
	
	//Insert code below
	
	public User checkLogin(String email,String password) throws SQLException {
		User result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT userID FROM UserTB WHERE email = ? AND userPass = ?";				
				ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, password);
				rs = ps.executeQuery();

				if (rs.next()) {
					int id = rs.getInt("userID");
					result = new User(id);
				}
			}
		} finally {
			closeConnection();
		}
		return result;
	}
	public boolean register(String email, String password) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "INSERT INTO UserTB(email, password) VALUES(?,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, password);
				result = (ps.executeUpdate() > 0);
			}
		} finally {
			closeConnection();
		}
		return result;
	}
	
}
