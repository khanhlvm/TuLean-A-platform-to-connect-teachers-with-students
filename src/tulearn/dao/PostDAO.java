package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
	//Insert code below
	
}
