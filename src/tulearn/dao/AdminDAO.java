package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import tulearn.context.DBContext;
import tulearn.dto.Subject;

public class AdminDAO {
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

	// Insert code below
	public boolean insertSubject(String subjectName) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "INSERT INTO SubjectTB(subjectName) VALUES (?)";
				ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, subjectName);
				result = ps.executeUpdate() > 0;
			}
		} finally {
			closeConnection();
		}
		return result;
	}
// show list subject
	public ArrayList<Subject> getAllSubject() throws SQLException {
		ArrayList<Subject> al = new ArrayList<>();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM SubjectTB";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					al.add(new Subject(id, name));
				}
			}
		} finally {
			closeConnection();
		}
		return al;
	}
	//update status User
	public boolean updateStatus(int statusID, String statusName) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE StatusTB SET statusID=? WHERE statusName = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, statusName);
				ps.executeUpdate();
			}
		} finally {
			closeConnection();
		}
		return result;
	}

}
