package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import tulearn.context.DBContext;
import tulearn.dto.Tutor;

public class UserDAO {
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

	public Tutor getUserTutorByID(int id) throws SQLException {
		Tutor t = new Tutor();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM UserTB WHERE userID = ?";				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					int userID = rs.getInt(1);
					int roleID = rs.getInt(2);
					int statusUserID = rs.getInt(3);
					int genderID = rs.getInt(4);
					int qualificationID = rs.getInt(5);
					int communeID = rs.getInt(6);
					String email = rs.getString(7);				
					String password = rs.getString(8);					
					String street = rs.getNString(9);
					String name = rs.getNString(10);
					String avatar = rs.getNString(11);
					String phone = rs.getString(12);
					t = new Tutor(userID,roleID,statusUserID,genderID,qualificationID,communeID,email,phone,password,name,avatar,street);
					if(roleID==2) {
						String query = "SELECT salary,workAt,identityCard,studentCard FROM UserTB WHERE userID = ?";				
						ps = conn.prepareStatement(query);
						ps.setInt(1, id);
						rs = ps.executeQuery();
						if (rs.next()) {
							String salary = rs.getString(1);
							String workAt = rs.getNString(2);
							String identityCard = rs.getString(3);
							String studentCard = rs.getString(4);
							t = new Tutor(userID,roleID,statusUserID,genderID,qualificationID,communeID,email,
									phone,password,name,avatar,street,salary,workAt,identityCard,studentCard);
						}
					}
				}
			}
		}finally {
			closeConnection();
		}
		return t;
	}
	
	public Tutor getTutorByRole(int rID) throws SQLException{
		Tutor t = new Tutor();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT salary,workAt,identityCard,studentCard FROM UserTB WHERE roleID = ?";				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, rID);
				rs = ps.executeQuery();
				if (rs.next()) {
					String salary = rs.getString(1);
					String workAt = rs.getNString(2);
					String identityCard = rs.getString(3);
					String studentCard = rs.getString(4);
					t = new Tutor(salary,workAt,identityCard,studentCard);
				}
			}
		}finally {
			closeConnection();
		}
		return t;
	}
	
	public boolean updateUserOrTutorByID(Tutor t) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE UserTB SET userName=?, email=?, phone=?, genderID=?, qualificationID=?, communeID=?, streetName=?  WHERE userID = ?";
				ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				ps.setNString(1, t.getName());
				ps.setNString(2, t.getEmail());
				ps.setString(3, t.getPhone());
				ps.setInt(4, t.getGenderID());
				ps.setInt(5, t.getQualificationID());
				ps.setInt(6, t.getCommuneID());
				ps.setNString(7, t.getStreet());
				ps.setInt(8, t.getUserID());
				result = ps.executeUpdate() > 0;
				if(t.getRoleID()==2 && result) {
					String query = "UPDATE UserTB SET salary=?, workAt=?, identityCard=?, studentCard=?  WHERE userID = ?";
					ps = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, t.getSalary());
					ps.setString(2, t.getWorkAt());
					ps.setString(3, t.getIdentityCard());
					ps.setString(4, t.getStudentCard());
					ps.setInt(5, t.getUserID());
					result = ps.executeUpdate() > 0;
				}
			}
		}finally {
			closeConnection();
		}
		return result;
	}
	
	public boolean updatePassword(int userID, String newPass) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE UserTB SET userPass=? WHERE userID=?";
				ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);			
				ps.setString(1, newPass);
				ps.setInt(2, userID);
				result = ps.executeUpdate()>0;
			}
		}finally {
			closeConnection();
		}
		return result;
	}
	
}
