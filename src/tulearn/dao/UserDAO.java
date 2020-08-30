package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import tulearn.context.DBContext;
import tulearn.dto.ListUser;
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

	// Get list user
	public ArrayList<ListUser> getAllListUser(int userID) throws SQLException {
		ArrayList<ListUser> listUser = new ArrayList<>();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT UserTB.userName, UserTB.phone, UserTB.email,UserTB.workAt,UserTB.salary,UserTB.identityCard, UserTB.studentCard, ProvinceOrCity.provinceName, District.districtName, CommuneOrWard.communeName, UserTB.streetName FROM UserTB \r\n"
						+ " INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
						+ "INNER JOIN District  ON CommuneOrWard.districtID = District.districtID\r\n"
						+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID WHERE userID=?";
				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, userID);
				rs = ps.executeQuery();
				if (rs.next()) {
					ListUser lu = new ListUser(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5), rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9), rs.getString(10), rs.getString(11));
					listUser.add(lu);
				}
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return listUser;
	}
	

//	// Change Pass
	public boolean updatePassword(String username, String userpass) throws SQLException {
		try {
			conn = DBContext.getConnection();
			String sql = "UPDATE UserTB SET userPass=? WHERE userName = ?";
			ps = conn.prepareStatement(sql);
			if (conn != null) {
				ps.setString(1, userpass);
				ps.setString(2, username);
				ps.executeUpdate();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return false;
	}

	//Update User
	public boolean updateUser(int userID, ListUser ud) throws SQLException {
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE UserTB SET userName=?,phone=?,email=?,workAt=?,salary=?,identityCard=?,studentCard=?,communeID=?,streetName=?  WHERE userID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, userID);
				ps.setString(2, ud.getName());
				ps.setString(3,ud.getPhone());
				ps.setString(4, ud.getEmail());
				ps.setString(5,ud.getWorkAt());
				ps.setString(6,ud.getSalary() );
				ps.setString(7, ud.getIdentityCard());
				ps.setString(8, ud.getStudentCard());
				ps.setInt(9,ud.getCommuneID());
				ps.setString(10, ud.getStreetName());
				ps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return false;
	}
}
