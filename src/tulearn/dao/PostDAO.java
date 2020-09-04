package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tulearn.context.DBContext;
import tulearn.dto.Gender;
import tulearn.dto.Post;
import tulearn.dto.Qualificate;
import tulearn.dto.Request;
import tulearn.dto.Subject;
import tulearn.dto.Tutor;
import tulearn.dto.User;

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
	
	//Insert code below
	public List<Post> temp(int userID) throws SQLException {
		List<Post> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Post  " 
						+ "INNER JOIN SubjectTB  ON Post.subjectID = SubjectTB.subjectID\r\n"
						+ "INNER JOIN Qualification ON Qualification.qualificationID=Post.qualificationID \r\n"
						+ "INNER JOIN Gender ON Gender.genderID=Post.genderID \r\n"
						+ "WHERE Post.StatusID = 8 AND Post.typePost=1 AND Post.learnerID ='"
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
