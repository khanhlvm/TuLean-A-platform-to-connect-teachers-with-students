package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
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
		User u = new User();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT userID FROM UserTB WHERE NOT statusID=3 AND (email = ? AND userPass = ?)";				
				ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, password);
				rs = ps.executeQuery();

				if (rs.next()) {
					int id = rs.getInt("userID");
					u.setUserID(id);
				}
			}
		} finally {
			closeConnection();
		}
		return u;
	}
	
	public boolean insertRegister(User u) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "INSERT INTO UserTB(roleID,statusID,email,userPass) VALUES (?,?,?,?)";
				ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, u.getRoleID());
				ps.setInt(2, u.getStatusUserID());
				ps.setString(3, u.getEmail());
				ps.setString(4, u.getPassword());
				result = (ps.executeUpdate() > 0);
			}
		} finally {
			closeConnection();
		}
		return result;
	}
	
	public ArrayList<String> getAllEmail() throws SQLException {
		ArrayList<String> al = new ArrayList<String>();

		try {
			conn = DBContext.getConnection();
			String sql = "SELECT email FROM UserTB";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String email = rs.getString(1);
				al.add(email);
			}
		}finally {
			closeConnection();
		}
		return al;
	}
}
