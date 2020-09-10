package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tulearn.context.DBContext;
import tulearn.dto.Qualificate;

public class QualificateDAO {
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
	
	public ArrayList<Qualificate> getAllQualificate() throws SQLException{
		ArrayList<Qualificate> qualificates = new ArrayList<>();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = " select qualificationID ,qualificationName from Qualification";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					int qualificationID = rs.getInt("qualificationID");
					String qualificationName = rs.getString("qualificationName");
					Qualificate s = new Qualificate(qualificationID, qualificationName);
					qualificates.add(s);
				}
			}
		} finally {
			closeConnection();
		}
		return qualificates;
	}
}
