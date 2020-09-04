package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tulearn.context.DBContext;
import tulearn.dto.Address;
import tulearn.dto.AddressUser;
import tulearn.dto.Post;
import tulearn.dto.Qualificate;
import tulearn.dto.Request;
import tulearn.dto.Subject;
import tulearn.dto.Tutor;
import tulearn.dto.User;

public class RequestDAO {
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

	// lấy tất cả các yêu cầu

	public boolean updateSatus(int status, int post) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE Request SET statusID = ? WHERE postID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, status);
				ps.setInt(2, post);
				result = (ps.executeUpdate() > 0);
			}

		} finally {
			closeConnection();
		}
		return result;
	}

	public boolean deleteRequest(int postID) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "DELETE FROM Request WHERE postID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, postID);

				result = (ps.executeUpdate() > 0);
			}
		} finally {
			closeConnection();
		}
		return result;
	}
//request của học viên
	public List<Request> temp(int userID) throws SQLException {
		List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
						+ "INNER JOIN SubjectTB  ON Post.subjectID = SubjectTB.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Request.tutorID\r\n"
						+ "WHERE Post.StatusID = 8 AND Post.typePost=1 AND Request.StatusID = 4 AND Request.typeRequest=0 AND Post.learnerID ='"
						+ userID + "'";
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
				while (rs.next()) {
					int postID = rs.getInt("postID");
					int learnerID = rs.getInt("learnerID");
					String subjectName = rs.getString("subjectName");
					byte lessonLearn = rs.getByte("lessonLearn");
					float timeLearn = rs.getFloat("timeLearn");
					User u = new User(learnerID);
					Subject s = new Subject(subjectName);

					Post post = new Post(postID, u, s, lessonLearn, timeLearn);

					// Request
					int tutorID = rs.getInt("tutorID");
					String userName = rs.getString("userName");
					Tutor tutor = new Tutor(tutorID, userName);
					Request request = new Request(tutor, post);

					if (result == null) {
						result = new ArrayList<Request>();
					}
					result.add(request);
				}

			}

		} finally {
			closeConnection();
		}
		return result;
	}

	public List<Request> tempGSGYCau(int userID) throws SQLException {
		List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
						+ "INNER JOIN SubjectTutor  ON Request.tutorID = SubjectTutor.tutorID\r\n"
						+ "INNER JOIN SubjectTB ON SubjectTB.subjectID = SubjectTutor.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Request.tutorID\r\n"
						+ "INNER JOIN Qualification ON Qualification.qualificationID=UserTB.qualificationID \r\n"
						+ "INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
						+ "INNER JOIN District  ON District.districtID = CommuneOrWard.districtID\r\n"
						+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID\r\n"
						+ "WHERE Post.StatusID = 8 AND Post.typePost= 0 AND Request.StatusID = 4 AND Request.typeRequest=1 AND Post.learnerID ='"
						+ userID + "'";
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
				while (rs.next()) {
//					post
					int postID = rs.getInt("postID");
					int learnerID = rs.getInt("learnerID");
					String subjectName = rs.getString("subjectName");
					byte lessonLearn = rs.getByte("lessonLearn");
					float timeLearn = rs.getFloat("timeLearn");
					User u = new User(learnerID);
					Subject s = new Subject(subjectName);
					Post post = new Post(postID, u, s, lessonLearn, timeLearn);
					String tinh = rs.getString("provinceName");
					String quan = rs.getString("qualificationName");
					String salary = rs.getNString("salary");
					AddressUser add = new AddressUser(tinh);
					Qualificate qua = new Qualificate(quan);

					// Request
					int tutorID = rs.getInt("tutorID");
					String userName = rs.getString("userName");
					Tutor tutor = new Tutor(userID, qua, add, userName, salary);
					Request request = new Request(tutor, post);
					if (result == null) {
						result = new ArrayList<Request>();
					}
					result.add(request);
				}

			}

		} finally {
			closeConnection();
		}
		return result;
	}
	
	public List<Request> tempLopDangChoDuyet(int userID) throws SQLException {
		List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
						+ "INNER JOIN SubjectTutor  ON Request.tutorID = SubjectTutor.tutorID\r\n"
						+ "INNER JOIN SubjectTB ON SubjectTB.subjectID = SubjectTutor.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Request.tutorID\r\n"
						+ "INNER JOIN Qualification ON Qualification.qualificationID=UserTB.qualificationID \r\n"
						+ "INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
						+ "INNER JOIN District  ON District.districtID = CommuneOrWard.districtID\r\n"
						+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID\r\n"
						+ "WHERE Post.StatusID = 8  AND Request.StatusID = 10  AND Post.learnerID ='"
						+ userID + "'";
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
				while (rs.next()) {
//					post
					int postID = rs.getInt("postID");
					int learnerID = rs.getInt("learnerID");
					String subjectName = rs.getString("subjectName");
					byte lessonLearn = rs.getByte("lessonLearn");
					float timeLearn = rs.getFloat("timeLearn");
					User u = new User(learnerID);
					Subject s = new Subject(subjectName);
					Post post = new Post(postID, u, s, lessonLearn, timeLearn);
					String tinh = rs.getString("provinceName");
					String quan = rs.getString("qualificationName");
					String salary = rs.getNString("salary");
					AddressUser add = new AddressUser(tinh);
					Qualificate qua = new Qualificate(quan);

					
					int tutorID = rs.getInt("tutorID");
					String userName = rs.getString("userName");
					String sdt =rs.getString("phone");
					Tutor tutor = new Tutor(tutorID, qua, add, userName,sdt);
					// Request
					Request request = new Request(tutor, post);
					if (result == null) {
						result = new ArrayList<Request>();
					}
					result.add(request);
				}

			}

		} finally {
			closeConnection();
		}
		return result;
	}

    public List<Request> tempLopDangHoc(int userID) throws SQLException {
	List<Request> result = null;
	try {
		conn = DBContext.getConnection();
		if (conn != null) {
			String sql = "SELECT * FROM Post  " 
		            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
					+ "INNER JOIN SubjectTutor  ON Request.tutorID = SubjectTutor.tutorID\r\n"
					+ "INNER JOIN SubjectTB ON SubjectTB.subjectID = SubjectTutor.subjectID\r\n"
					+ "INNER JOIN UserTB  ON UserTB.userID = Request.tutorID\r\n"
					+ "INNER JOIN Qualification ON Qualification.qualificationID=UserTB.qualificationID \r\n"
					+ "INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
					+ "INNER JOIN District  ON District.districtID = CommuneOrWard.districtID\r\n"
					+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID\r\n"
					+ "WHERE Post.StatusID = 8  AND Request.StatusID = 11  AND Post.learnerID ='"
					+ userID + "'";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			while (rs.next()) {
//				post
				int postID = rs.getInt("postID");
				int learnerID = rs.getInt("learnerID");
				String subjectName = rs.getString("subjectName");
				byte lessonLearn = rs.getByte("lessonLearn");
				float timeLearn = rs.getFloat("timeLearn");
				User u = new User(learnerID);
				Subject s = new Subject(subjectName);
				Post post = new Post(postID, u, s, lessonLearn, timeLearn);
				String tinh = rs.getString("provinceName");
				String quan = rs.getString("qualificationName");
				String salary = rs.getNString("salary");
				AddressUser add = new AddressUser(tinh);
				Qualificate qua = new Qualificate(quan);

				
				int tutorID = rs.getInt("tutorID");
				String userName = rs.getString("userName");
				String sdt =rs.getString("phone");
				Tutor tutor = new Tutor(tutorID, qua, add, userName,sdt);
				// Request
				Request request = new Request(tutor, post);
				if (result == null) {
					result = new ArrayList<Request>();
				}
				result.add(request);
			}

		}

	} finally {
		closeConnection();
	}
	return result;
}
  //request của gia sư
    public List<Request> tempDangKyDay(int userID) throws SQLException {
    	List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
						+ "INNER JOIN SubjectTutor  ON Request.tutorID = SubjectTutor.tutorID\r\n"
						+ "INNER JOIN SubjectTB ON SubjectTB.subjectID = SubjectTutor.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Post.learnerID\r\n"
						
						+ "WHERE Post.StatusID = 8 AND Post.typePost= 0 AND Request.StatusID = 4 AND Request.typeRequest=1 AND Request.tutorID ='"
						+ userID + "'";
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
				while (rs.next()) {
//					post
					int postID = rs.getInt("postID");
					int learnerID = rs.getInt("learnerID");
					String userName = rs.getString("userName");
					String subjectName = rs.getString("subjectName");
					byte lessonLearn = rs.getByte("lessonLearn");
					float timeLearn = rs.getFloat("timeLearn");
					String fee =rs.getString("fee");
					User u = new User(learnerID, userName);
					Subject s = new Subject(subjectName);
					Post post = new Post(postID, u, s, lessonLearn, timeLearn,fee);
					// Request
					Request request = new Request( post);
					if (result == null) {
						result = new ArrayList<Request>();
					}
					result.add(request);
				}

			}

		} finally {
			closeConnection();
		}
		return result;
	} 
    
    
    public List<Request> tempLoiMoiTuHocVien(int userID) throws SQLException {
    	List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
						+ "INNER JOIN SubjectTutor  ON Request.tutorID = SubjectTutor.tutorID\r\n"
						+ "INNER JOIN SubjectTB ON SubjectTB.subjectID = SubjectTutor.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Post.learnerID\r\n"
						+ "INNER JOIN Qualification ON Qualification.qualificationID=UserTB.qualificationID \r\n"
						+ "INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
						+ "INNER JOIN District  ON District.districtID = CommuneOrWard.districtID\r\n"
						+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID\r\n"
						+ "WHERE Post.StatusID = 8 AND Post.typePost= 0 AND Request.StatusID = 4 AND Request.typeRequest=1 AND Request.tutorID ='"
						+ userID + "'";
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
				while (rs.next()) {
//					post
					int postID = rs.getInt("postID");
					int learnerID = rs.getInt("learnerID");
					String subjectName = rs.getString("subjectName");
					byte lessonLearn = rs.getByte("lessonLearn");
					float timeLearn = rs.getFloat("timeLearn");
					User u = new User(learnerID);
					Subject s = new Subject(subjectName);
					Post post = new Post(postID, u, s, lessonLearn, timeLearn);
					String tinh = rs.getString("provinceName");
					String quan = rs.getString("qualificationName");
					String salary = rs.getNString("salary");
					AddressUser add = new AddressUser(tinh);
					Qualificate qua = new Qualificate(quan);

					// Request
					int tutorID = rs.getInt("tutorID");
					String userName = rs.getString("userName");
					Tutor tutor = new Tutor(userID, qua, add, userName, salary);
					Request request = new Request(tutor, post);
					if (result == null) {
						result = new ArrayList<Request>();
					}
					result.add(request);
				}

			}

		} finally {
			closeConnection();
		}
		return result;
	} 
}