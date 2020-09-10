package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import tulearn.context.DBContext;
import tulearn.dto.AddressUser;
import tulearn.dto.Gender;
import tulearn.dto.Post;
import tulearn.dto.Qualificate;
import tulearn.dto.Schedule;
import tulearn.dto.Subject;
import tulearn.dto.Tutor;

public class PostDAO {
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

	// function lưu một bài đăng mới vào db (lưu vào bản Post và bản
	// ScheduleLearner)
	public boolean upPost(Post newPost, ArrayList<Schedule> newSchedule) throws SQLException, ParseException {
		int n[] = null;
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				conn.setAutoCommit(false);
				// Lưu vào bản Post và lấy PostID
				String sql = "Insert into Post(learnerID,subjectID,communeID,genderID,qualificationID,statusID,typePost,lessonLearn,timeLearn, fee,startDay,postDes) output inserted.postID "
						+ "values (?,?,?,?,?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, newPost.getLearner().getUserID());
				ps.setInt(2, newPost.getSubject().getsID());
				ps.setInt(3, newPost.getAddress().getCommuneID());
				ps.setInt(4, newPost.getGender().getgID());
				ps.setInt(5, newPost.getQualificate().getqID());
				ps.setInt(6, newPost.getStatusPostID());
				if (newPost.isTypePost()) {
					ps.setInt(7, 1);
				} else {
					ps.setInt(7, 0);
				}
				ps.setByte(8, newPost.getLessonLearn());
				ps.setFloat(9, newPost.getTimeLearn());
				ps.setString(10, newPost.getFee());
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				String pDate = newPost.getStartDay();
				java.util.Date date = formatter.parse(pDate);
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				ps.setDate(11, sqlDate);
				ps.setString(12, newPost.getPostDes());
				rs = ps.executeQuery();
				rs.next();
				int pid = rs.getInt(1);
				ps.close();
				// Lưu vào bản ScheduleLearner với ID của Post vừa lấy được
				String sql2 = "Insert into ScheduleLearner(postID, dayWeek,startTime,endTime) " + "values (?,?,?,?)";
				ps = conn.prepareStatement(sql2);
				for (Schedule sche : newSchedule) {
					ps.setInt(1, pid);
					int daytime = Integer.parseInt(sche.getDayTime());
					ps.setInt(2, daytime);
					String startTime = sche.getStartTime().concat(":00");
					Time sTime = Time.valueOf(startTime);
					String endTime = sche.getEndTime().concat(":00");
					Time eTime = Time.valueOf(endTime);
					ps.setTime(3, sTime);
					ps.setTime(4, eTime);
					ps.addBatch();
				}
				n = ps.executeBatch();
				if (n.length == newSchedule.size())
					conn.commit();
				else
					conn.rollback();
				}
				result = true;
		} finally {
			closeConnection();
		}
		return result;
	}

	// Xóa 1 post (chuyển đổi status)
	public int deletePost(int postID) throws SQLException {
		int rs1 = 0;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "UPDATE Post SET statusID = 9 WHERE postID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, postID);
				rs1 = ps.executeUpdate();
			}
		} finally {
			closeConnection();
		}
		return rs1;

	}

	// Update post
	public void updatePost(Post updatePost, ArrayList<Schedule> updateSchedule, ArrayList<Schedule> oldSchedule)
			throws SQLException, ParseException {
		int n[] = null;

		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				conn.setAutoCommit(false);
				String sql = "UPDATE Post SET subjectID = ?, communeID = ? ,genderID = ?,qualificationID = ?, "
						+ "lessonLearn = ? ,timeLearn =? , fee = ?, startDay = ?,postDes = ? WHERE postID = ? ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, updatePost.getSubject().getsID());
				ps.setInt(2, updatePost.getAddress().getCommuneID());
				ps.setInt(3, updatePost.getGender().getgID());
				ps.setInt(4, updatePost.getQualificate().getqID());
				ps.setByte(5, updatePost.getLessonLearn());
				ps.setFloat(6, updatePost.getTimeLearn());
				ps.setString(7, updatePost.getFee());
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				String pDate = updatePost.getStartDay();
				java.util.Date date = formatter.parse(pDate);
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				ps.setDate(8, sqlDate);
				ps.setString(9, updatePost.getPostDes());
				ps.setInt(10, updatePost.getPostID());
				ps.close();

				String sql2 = "delete from ScheduleLearner where postID = ?";
				ps = conn.prepareStatement(sql2);
				ps.setInt(1, updatePost.getPostID());
				int oldSche = ps.executeUpdate();
				if (oldSchedule.size() != oldSche) {
					conn.rollback();
				}
				ps.close();

				String sql3 = "Insert into ScheduleLearner(postID, dayWeek,startTime,endTime) " + "values (?,?,?,?)";
				ps = conn.prepareStatement(sql3);
				for (Schedule sche : updateSchedule) {
					ps.setInt(1, updatePost.getPostID());
					int daytime = Integer.parseInt(sche.getDayTime());
					ps.setInt(2, daytime);
					Time sTime = Time.valueOf(sche.getStartTime().concat(":00"));
					Time eTime = Time.valueOf(sche.getEndTime().concat(":00"));
					ps.setTime(3, sTime);
					ps.setTime(4, eTime);
					ps.addBatch();
				}
				n = ps.executeBatch();
				if (n.length == updateSchedule.size())
					conn.commit();
				else
					conn.rollback();

			}
		} finally {
			closeConnection();
		}
	}

	// lấy ra 1 post dựa vào id
	public Post getPost(int id) throws SQLException {
		Post result = null;

		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT learnerID,statusID,typePost,lessonLearn,timeLearn,fee, startDay,postDes FROM Post WHERE postID =?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();

				if (rs.next()) {
					UserDAO udao = new UserDAO();
					int learnerId = rs.getInt("learnerID");
					int statusID = rs.getInt("statusID");
					boolean typePost = rs.getBoolean("typePost");
					byte lessonLearn = rs.getByte("lessonLearn");
					float timeLearn = rs.getFloat("timeLearn");
					String fee = rs.getString("fee");

					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					Date startDay = rs.getDate("startDay");
					String dateFormat = formatter.format(startDay);
					String postDes = rs.getString("postDes");
					
					
					Tutor learner = udao.getUserTutorByID(learnerId);
					AddressUser addUser = udao.getAddressUserByID(learnerId);
					Gender gender = getGenderInPostByIDt(id);
					Qualificate quatificate = getQualificateInPostByID(id);
					Subject subject = getSubjectInPostByID(id);	

					result = new Post(id,learner,addUser,gender,quatificate,subject,statusID,typePost,lessonLearn,timeLearn,fee,dateFormat,postDes);
				}
			}
		} finally {
			closeConnection();
		}
		return result;
	}

	// lấy ra lịch học của 1 post
	public ArrayList<Schedule> getScheduleForOnePost(int postID) throws SQLException {
		ArrayList<Schedule> scheList = new ArrayList<>();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "select dayWeek,startTime,endTime from ScheduleLearner where postID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, postID);
				rs = ps.executeQuery();
				while (rs.next()) {
					String dayWeek = rs.getString("dayWeek");
					Time sTime = rs.getTime("startTime");
					String startTime = sTime.toString().substring(0, 5);
					Time eTime = rs.getTime("endTime");
					String endTime = eTime.toString().substring(0, 5);
					Schedule s = new Schedule(postID, dayWeek, startTime, endTime);
					scheList.add(s);
				}
			}
		} finally {
			closeConnection();
		}
		return scheList;
	}

	// lấy ra toàn bộ bài đăng kèm lịch học tương ứng
	public HashMap<Post, ArrayList<Schedule>> getAllPost() throws SQLException {
		HashMap<Post, ArrayList<Schedule>> allPost = new HashMap<Post, ArrayList<Schedule>>();
		PostDAO pdao = new PostDAO();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT Post.postID FROM Post WHERE NOT EXISTS (SELECT * FROM Request WHERE Post.postID=Request.postID) AND Post.typePost=0";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					int id = rs.getInt("postID");
					allPost.put(pdao.getPost(id), pdao.getScheduleForOnePost(id));
				}
			}
		} finally {
			closeConnection();
		}
		return allPost;
	}

	
	public Subject getSubjectInPostByID(int id) throws SQLException {
		Subject s = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT Post.subjectID, SubjectTB.subjectName from Post INNER JOIN SubjectTB ON Post.subjectID = SubjectTB.subjectID where Post.postID =?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					int sID = rs.getInt(1);
					String sName = rs.getString(2);
					s = new Subject(sID, sName);
				}
			}
		}finally{
			closeConnection();
		}
		return s;
	}
	
	public Qualificate getQualificateInPostByID(int id) throws SQLException{
		Qualificate qualificate = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT Post.qualificationID, Qualification.qualificationName FROM Post "
						+ "INNER JOIN Qualification ON Post.qualificationID = Qualification.qualificationID where Post.postID =?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					int qID = rs.getInt(1);
					String qName = rs.getString(2);
					qualificate = new Qualificate(qID, qName);
				}
			}
		}finally{
			closeConnection();
		}
		return qualificate;
	}
	
	public Gender getGenderInPostByIDt(int id) throws SQLException{
		Gender gender = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT Post.genderID, Gender.genderType FROM Post INNER JOIN Gender ON Post.genderID = Gender.genderID WHERE Post.postID = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					int genderID = rs.getInt(1);
					String genderName = rs.getString(2);
					gender = new Gender(genderID, genderName);
				}
			}
		}finally{
			closeConnection();
		}
		return gender;
	}
	
	public List<Post> temp(int userID) throws SQLException {
		List<Post> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
						+ "INNER JOIN SubjectTB  ON Post.subjectID = SubjectTB.subjectID\r\n"
						+ "INNER JOIN Qualification ON Qualification.qualificationID=Post.qualificationID \r\n"
						+ "INNER JOIN Gender ON Gender.genderID=Post.genderID \r\n"
						+ "WHERE Post.StatusID = 8 AND Post.typePost=0 AND Post.learnerID ='"
						+ userID + "'";
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
				while (rs.next()) {
					int postID = rs.getInt("postID");
					String subjectName = rs.getString("subjectName");
					byte lessonLearn = rs.getByte("lessonLearn");
					float timeLearn = rs.getFloat("timeLearn");
					Subject s = new Subject(subjectName);
					String qua =rs.getString("qualificationName");
					Qualificate quali= new Qualificate(qua);
					String fee =rs.getString("fee");
					String postDes= rs.getString("postDes");
					String day=rs.getString("startDay");
					String sex= rs.getString("genderType");
					Gender gen = new Gender(sex);

					Post post = new Post(postID, gen,quali, s, lessonLearn, timeLearn, fee, day, postDes);

			

					if (result == null) {
						result = new ArrayList<Post>();
					}
					result.add(post);
				}

			}

		} finally {
			closeConnection();
		}
		return result;
	}
		
	
	}



