package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import tulearn.context.DBContext;
import tulearn.dto.AddressUser;
import tulearn.dto.Gender;
import tulearn.dto.Qualificate;
import tulearn.dto.Tutor;
import tulearn.dto.User;

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
					Gender gender = null;
					String sql1 = "SELECT UserTB.genderID, Gender.genderType FROM UserTB INNER JOIN Gender \r\n"
							+ "ON UserTB.genderID = Gender.genderID \r\n" + "WHERE UserTB.userID = ? ";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, id);
					rs = ps.executeQuery();
					if (rs.next()) {
						int genderID = rs.getInt(1);
						String genderName = rs.getString(2);
						gender = new Gender(genderID, genderName);
					}
					Qualificate qualificate = null;

					String sql2 = "SELECT UserTB.qualificationID, Qualification.qualificationName FROM UserTB INNER JOIN Qualification\r\n"
							+ "ON UserTB.qualificationID = Qualification.qualificationID\r\n"
							+ "WHERE UserTB.userID = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, id);
					rs = ps.executeQuery();
					if (rs.next()) {
						int qID = rs.getInt(1);
						String qName = rs.getString(2);
						qualificate = new Qualificate(qID, qName);
					}
					AddressUser addressUser = null;
					if (conn != null) {
						String sql3 = "SELECT UserTB.communeID, ProvinceOrCity.provinceName,District.districtName,CommuneOrWard.communeName\r\n"
								+ "FROM UserTB INNER JOIN CommuneOrWard ON UserTB.communeID = CommuneOrWard.communeID\r\n"
								+ "INNER JOIN District ON CommuneOrWard.districtID = District.districtID\r\n"
								+ "INNER JOIN ProvinceOrCity ON District.provinceID = CommuneOrWard.districtID\r\n"
								+ "WHERE UserTB.userID = ?";
						ps = conn.prepareStatement(sql);
						ps.setInt(1, id);
						rs = ps.executeQuery();
						if (rs.next()) {
							int communeID = rs.getInt(1);
							String provinceName = rs.getString(2);
							String districtName = rs.getString(3);
							String communeName = rs.getString(4);
							addressUser = new AddressUser(communeID, provinceName, districtName, communeName);
						}
					}
					String email = rs.getString(7);
					String password = rs.getString(8);
					String street = rs.getNString(9);
					String name = rs.getNString(10);
					String avatar = rs.getNString(11);
					String phone = rs.getString(12);
					t = new Tutor(userID, roleID, statusUserID, gender, qualificate, addressUser, email, phone,
							password, name, avatar, street);
					if (roleID == 2) {
						String query = "SELECT salary,workAt,identityCard,studentCard FROM UserTB WHERE userID = ?";
						ps = conn.prepareStatement(query);
						ps.setInt(1, id);
						rs = ps.executeQuery();
						if (rs.next()) {
							String salary = rs.getString(1);
							String workAt = rs.getNString(2);
							String identityCard = rs.getString(3);
							String studentCard = rs.getString(4);
							t = new Tutor(userID, roleID, statusUserID, gender, qualificate, addressUser, email, phone,
									password, name, avatar, street, salary, workAt, identityCard, studentCard);
						}
					}
				}
			}
		} finally

		{
			closeConnection();
		}
		return t;
	}

	public Tutor getTutorByRole(int rID) throws SQLException {
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
					t = new Tutor(salary, workAt, identityCard, studentCard);
				}
			}
		} finally {
			closeConnection();
		}
		return t;
	}

	public User getGenderByID(int gTD) {

		return null;

	}

//	public boolean updateUserOrTutorByID(Tutor t) throws SQLException {
//		boolean result = false;	
//		try {
//			conn = DBContext.getConnection();
//			if (conn != null) {
//				String sql = "UPDATE UserTB SET userName=?, email=?, phone=?, genderID=?, qualificationID=?, communeID=?, streetName=?  WHERE userID = ?";
//				ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
//				ps.setNString(1, t.getName());
//				ps.setNString(2, t.getEmail());
//				ps.setString(3, t.getPhone());
//				ps.setInt(4, t.getGenderID());
//				ps.setInt(5, t.getQualificationID());
//				ps.setInt(6, t.getCommuneID());
//				ps.setNString(7, t.getStreet());
//				ps.setInt(8, t.getUserID());
//				result = ps.executeUpdate() > 0;
//				if(t.getRoleID()==2 && result) {
//					String query = "UPDATE UserTB SET salary=?, workAt=?, identityCard=?, studentCard=?  WHERE userID = ?";
//					ps = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
//					ps.setString(1, t.getSalary());
//					ps.setString(2, t.getWorkAt());
//					ps.setString(3, t.getIdentityCard());
//					ps.setString(4, t.getStudentCard());
//					ps.setInt(5, t.getUserID());
//					result = ps.executeUpdate() > 0;
//				}
//			}
//		}finally {
//			closeConnection();
//		}
//		return result;
//	}

	public boolean updatePassword(int userID, String newPass) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE UserTB SET userPass=? WHERE userID=?";
				ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, newPass);
				ps.setInt(2, userID);
				result = ps.executeUpdate() > 0;
			}
		} finally {
			closeConnection();
		}
		return result;
	}

}
