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

import tulearn.context.DBContext;
import tulearn.dto.Post;
import tulearn.dto.Schedule;

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
	
	
	//function lưu một bài đăng mới vào db (lưu vào bản Post và bản ScheduleLearner)
	public int upPost(Post newPost, ArrayList<Schedule> newSchedule) throws SQLException, ParseException {
		 int n[] = null;
		 int pid = 0;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				conn.setAutoCommit(false);
				//Lưu vào bản Post và lấy PostID
				String sql = "Insert into Post(learnerID,subjectID,communeID,genderID,qualificationID,statusID,typePost,lessonLearn,timeLearn, fee,startDay,postDes) output inserted.postID " + 
						"values (?,?,?,?,?,?,?,?,?,?,?,?)";				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, newPost.getLearnerID());
				ps.setInt(2, newPost.getSubjectID());
				ps.setInt(3, newPost.getCommuneID());
				ps.setInt(4, newPost.getGenderID());
				ps.setInt(5, newPost.getQualificateID());
				ps.setInt(6, newPost.getStatusPostID());
				if(newPost.isTypePost()) {
					ps.setInt(7, 1);
				}else {
					ps.setInt(7, 0);
				}
				ps.setByte(8, newPost.getLessonLearn());
				ps.setFloat(9, newPost.getTimeLearn());
				ps.setString(10, newPost.getFee());
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String pDate = newPost.getStartDay();
				java.util.Date date = formatter.parse(pDate);
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				ps.setDate(11, sqlDate);
				ps.setString(12, newPost.getPostDes());
				
				rs = ps.executeQuery();

				rs.next();
	            pid = rs.getInt(1);
	            ps.close();
	            //Lưu vào bản ScheduleLearner với ID của Post vừa lấy được
	            String sql2 = "Insert into ScheduleLearner(postID, dayWeek,startTime,endTime) "+
	            		"values (?,?,?,?)";
	            ps = conn.prepareStatement(sql2);
	            for(Schedule sche : newSchedule){
	                ps.setInt(1, pid);
	                int daytime = Integer.parseInt(sche.getDayTime());
	                ps.setInt(2, daytime);
	                Time sTime = Time.valueOf(sche.getStartTime());
	                Time eTime = Time.valueOf(sche.getEndTime());
	                ps.setTime(3, sTime);
	                ps.setTime(4, eTime);
	                ps.addBatch();
	            }
	            n=ps.executeBatch();
	            if(n.length==newSchedule.size()) 
	            	conn.commit();
	            else conn.rollback();
	            
			}
		} finally {
			closeConnection();
		}
		return pid;
	}
	
	//Xóa 1 post (chuyển đổi status)
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
	
	
	//Update post 
	public void updatePost(Post updatePost, ArrayList<Schedule> updateSchedule, ArrayList<Schedule> oldSchedule) throws SQLException, ParseException {
		int n[] = null;
		
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				conn.setAutoCommit(false);
				String sql = "UPDATE Post SET subjectID = ?, communeID = ? ,genderID = ?,qualificationID = ?, "
						+ "lessonLearn = ? ,timeLearn =? , fee = ?, startDay = ?,postDes = ? WHERE postID = ? ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, updatePost.getSubjectID());
				ps.setInt(2, updatePost.getCommuneID());
				ps.setInt(3, updatePost.getGenderID());
				ps.setInt(4, updatePost.getQualificateID());
				ps.setByte(5, updatePost.getLessonLearn());
				ps.setFloat(6, updatePost.getTimeLearn());
				ps.setString(7, updatePost.getFee());
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String pDate = updatePost.getStartDay();
				java.util.Date date = formatter.parse(pDate);
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				ps.setDate(8, sqlDate);
				ps.setString(9, updatePost.getPostDes());
				ps.setInt(10, updatePost.getPostID());
				int rs2 = ps.executeUpdate();
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
					Time sTime = Time.valueOf(sche.getStartTime());
					Time eTime = Time.valueOf(sche.getEndTime());
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

	//lấy ra 1 post dựa vào id
	public Post getPost(int id) throws SQLException {
		Post result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "  SELECT learnerID,subjectID,communeID,genderID,qualificationID,statusID,"
						+ "typePost,lessonLearn,timeLearn,fee, startDay,postDes FROM Post WHERE postID =?";				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();

				if (rs.next()) {
					int learnerId = rs.getInt("learnerID");
					int subjectID = rs.getInt("subjectID");
					int communeID = rs.getInt("communeID");
					int genderID = rs.getInt("genderID");
					int qualificationID = rs.getInt("qualificationID");
					int statusID = rs.getInt("statusID");
					boolean typePost = rs.getBoolean("typePost");
					byte lessonLearn = rs.getByte("lessonLearn");
					float timeLearn = rs.getFloat("timeLearn");
					String fee = rs.getString("fee");
					
					SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
					Date startDay = rs.getDate("startDay");
					String dateFormat = formatter.format(startDay);
					String postDes = rs.getString("postDes");
					result = new Post(id, learnerId, communeID, genderID, qualificationID, subjectID, statusID, typePost, lessonLearn, timeLearn, fee, dateFormat, postDes);
				}
			}
		} finally {
			closeConnection();
		}
		return result;
	}
	
	
	//lấy ra lịch học của 1 post
	public ArrayList<Schedule> getScheduleForOnePost(int postID) throws SQLException{
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
					String startTime = sTime.toString();
					Time eTime = rs.getTime("endTime");
					String endTime = eTime.toString();
					Schedule s = new Schedule(postID, dayWeek, startTime, endTime);
					scheList.add(s);
				}
			}
		} finally {
			closeConnection();
		}
		return scheList;
	}
	
	
	//lấy ra toàn bộ bài đăng kèm lịch học tương ứng
	public HashMap<Post, ArrayList<Schedule>> getAllPost() throws SQLException {
		HashMap<Post, ArrayList<Schedule>> allPost = new HashMap<Post, ArrayList<Schedule>>();
		PostDAO pdao = new PostDAO();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT postID FROM Post where typePost = 1";				
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

	//Insert code below
	
}
