package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tulearn.context.DBContext;
import tulearn.dto.Address;

public class FormItemDAO {
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
	
	public ArrayList<Address> getAllProvinceCity() throws SQLException{
		ArrayList<Address> al = new ArrayList<>();
		try {
			conn = DBContext.getConnection();
			String sql = "SELECT * FROM ProvinceOrCity";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getNString(2);
				al.add(new Address(id,name));
			}
		}finally {
			closeConnection();
		}
		return al;
	}
	
	public ArrayList<Address> findAllDistrictByProvince(int provinceID) throws SQLException {
		ArrayList<Address> al = new ArrayList<>();
		try {
			conn = DBContext.getConnection();
			String sql = "SELECT districtID,districtName FROM District WHERE provinceID = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, provinceID);
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getNString(2);
				al.add(new Address(id,name));
			}
		}finally {
			closeConnection();
		}
		return al;
	}
	
	public ArrayList<Address> findAllCommuneByDistrict(int districtID) throws SQLException {
		ArrayList<Address> al = new ArrayList<>();
		try {
			conn = DBContext.getConnection();
			String sql = "SELECT communeID,communeName FROM CommuneOrWard WHERE districtID = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, districtID);
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getNString(2);
				al.add(new Address(id,name));
			}
		}finally {
			closeConnection();
		}
		return al;
	}
	
}
