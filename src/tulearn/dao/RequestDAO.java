package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tulearn.context.DBContext;
import tulearn.dto.AddressUser;
import tulearn.dto.Post;
import tulearn.dto.Qualificate;
import tulearn.dto.Request;
import tulearn.dto.Subject;
import tulearn.dto.Tutor;

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


	public boolean updateSatus(int status, int post,int tutorID) throws SQLException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE Request SET statusID = ? WHERE postID = ? AND tutorID= ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, status);
				ps.setInt(2, post);
				ps.setInt(3,tutorID );
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
//request cá»§a há»�c viÃªn
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
					Tutor u = new Tutor(learnerID);
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
					Tutor u = new Tutor(learnerID);
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
					Tutor tutor = new Tutor(tutorID, qua, add, userName, salary);
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
			            + " INNER JOIN StatusTB  ON StatusTB.statusID = Request.statusID\r\n"
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
					Tutor u = new Tutor(learnerID);
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
					String status = rs.getString("statusName");
					Request request = new Request(tutor, post,status);
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
				Tutor u = new Tutor(learnerID);
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

    public List<Request> tempDaHoc(int userID) throws SQLException {
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
    					+ "WHERE Post.StatusID = 8  AND Request.StatusID = 16  AND Post.learnerID ='"
    					+ userID + "'";
    			ps = conn.prepareStatement(sql);

    			rs = ps.executeQuery();
    			while (rs.next()) {
//    				post
    				int postID = rs.getInt("postID");
    				int learnerID = rs.getInt("learnerID");
    				String subjectName = rs.getString("subjectName");
    				byte lessonLearn = rs.getByte("lessonLearn");
    				float timeLearn = rs.getFloat("timeLearn");
    				Tutor u = new Tutor(learnerID);
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
    
    
    //request cá»§a gia sÆ°
    public List<Request> tempDangKyDay(int tutorID) throws SQLException {
    	List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
			            + "INNER JOIN SubjectTB  ON Post.subjectID = SubjectTB.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Post.learnerID\r\n"
						
						+ "WHERE Post.StatusID = 8 AND Post.typePost= 0 AND Request.StatusID = 4 AND Request.typeRequest=1 AND Request.tutorID ='"
						+ tutorID + "'";
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
					Tutor u = new Tutor(learnerID, userName);
					Subject s = new Subject(subjectName);
					Post post = new Post(postID, u, s, lessonLearn, timeLearn,fee);
					// Request
					int tutorid =rs.getInt("tutorID");
					Tutor tu =new Tutor(tutorid);
					Request request = new Request(tu, post);
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
    
    
    public List<Request> tempLoiMoiTuHocVien(int tutorID) throws SQLException {
    	List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
			            + "INNER JOIN SubjectTB  ON Post.subjectID = SubjectTB.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Post.learnerID\r\n"
						+ "INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
						+ "INNER JOIN District  ON District.districtID = CommuneOrWard.districtID\r\n"
						+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID\r\n"
						+ "WHERE Post.StatusID = 8 AND Post.typePost= 1 AND Request.StatusID = 4 AND Request.typeRequest=0 AND Request.tutorID ='"
						+ tutorID + "'";
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
					Tutor u = new Tutor(learnerID, userName);
					Subject s = new Subject(subjectName);
					String postDes= rs.getString("postDes");
					String province = rs.getString("provinceName");
					AddressUser add = new AddressUser(province);
					Post post = new Post(postID, u, add, s, lessonLearn, timeLearn, postDes);
					// Request
					int tutorid =rs.getInt("tutorID");
					Tutor tu =new Tutor(tutorid);
					Request request = new Request(tu, post);
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
   
    
    
    public List<Request> tempLopDangChoDuyetGS(int userID) throws SQLException {
    	List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
			            + "INNER JOIN SubjectTB  ON Post.subjectID = SubjectTB.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Post.learnerID\r\n"
						+ "INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
						+ "INNER JOIN District  ON District.districtID = CommuneOrWard.districtID\r\n"
						+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID\r\n"
						+ "WHERE Post.StatusID = 8  AND Request.StatusID = 10 AND Request.tutorID ='"
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
					String phone =rs.getString("phone");
					String street =rs.getString("streetName");
					Tutor u = new Tutor(learnerID, phone, userName, street);
					Subject s = new Subject(subjectName);
					String postDes= rs.getString("postDes");
					String province = rs.getString("provinceName");
					String districtName=rs.getString("districtName");
					String communeName=rs.getString("communeName");
					AddressUser add = new AddressUser(province, districtName, communeName);
					Post post = new Post(postID, u, add, s, lessonLearn, timeLearn, postDes);
					// Request
					int tutorid =rs.getInt("tutorID");
					Tutor tu =new Tutor(tutorid);
					Request request = new Request(tu, post);
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
    
    public List<Request> tempLopDangDayGS(int userID) throws SQLException {
    	List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
			            + "INNER JOIN SubjectTB  ON Post.subjectID = SubjectTB.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Post.learnerID\r\n"
						+ "INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
						+ "INNER JOIN District  ON District.districtID = CommuneOrWard.districtID\r\n"
						+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID\r\n"
						+ "WHERE Post.StatusID = 8  AND Request.StatusID = 11 AND Request.tutorID ='"
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
					String phone =rs.getString("phone");
					String street =rs.getString("streetName");
					Tutor u = new Tutor(learnerID, phone, userName, street);
					Subject s = new Subject(subjectName);
					String postDes= rs.getString("postDes");
					String province = rs.getString("provinceName");
					String districtName=rs.getString("districtName");
					String communeName=rs.getString("communeName");
					AddressUser add = new AddressUser(province, districtName, communeName);
					Post post = new Post(postID, u, add, s, lessonLearn, timeLearn, postDes);
					// Request
					int tutorid =rs.getInt("tutorID");
					Tutor tu =new Tutor(tutorid);
					Request request = new Request(tu, post);
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
    
    public List<Request> tempLopDaDayGS(int tutorID) throws SQLException {
    	List<Request> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
			            + " INNER JOIN Request  ON Post.postID = Request.postID\r\n"
			            + "INNER JOIN SubjectTB  ON Post.subjectID = SubjectTB.subjectID\r\n"
						+ "INNER JOIN UserTB  ON UserTB.userID = Post.learnerID\r\n"
						+ "INNER JOIN CommuneOrWard  ON UserTB.communeID = CommuneOrWard.communeID\r\n"
						+ "INNER JOIN District  ON District.districtID = CommuneOrWard.districtID\r\n"
						+ "INNER JOIN ProvinceOrCity  ON District.provinceID = ProvinceOrCity.provinceID\r\n"
						+ "WHERE Post.StatusID = 8  AND Request.StatusID = 16 AND Request.tutorID ='"
						+ tutorID + "'";
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
					String phone =rs.getString("phone");
					String street =rs.getString("streetName");
					Tutor u = new Tutor(learnerID, phone, userName, street);
					Subject s = new Subject(subjectName);
					String postDes= rs.getString("postDes");
					String province = rs.getString("provinceName");
					String districtName=rs.getString("districtName");
					String communeName=rs.getString("communeName");
					AddressUser add = new AddressUser(province, districtName, communeName);
					Post post = new Post(postID, u, add, s, lessonLearn, timeLearn, postDes);
					// Request
					int tutorid =rs.getInt("tutorID");
					Tutor tu =new Tutor(tutorid);
					Request request = new Request(tu, post);
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
    
    public boolean insertRequestToLearner(Request req) throws SQLException {
    	boolean result = false;
    	try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "INSERT INTO Request(tutorID,postID,typeRequest,statusID) VALUES (?,?,?,?)";
				ps = conn.prepareStatement(sql);	
				ps.setInt(1, req.getTutor().getUserID());		
				ps.setInt(2, req.getPost().getPostID());
				ps.setInt(3, req.isTypeRequest());
				ps.setInt(4, req.getStatusID());
				result = ps.executeUpdate() > 0;
			}
			result = true;
		}finally {
			closeConnection();
		}
		return result;
    }

}