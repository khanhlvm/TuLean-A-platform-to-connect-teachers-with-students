package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import tulearn.context.DBContext;
import tulearn.dto.Post;
import tulearn.dto.Report;
import tulearn.dto.ReportFeedback;
import tulearn.dto.Tutor;
import tulearn.dto.User;

public class FeedbackDAO {
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

	public boolean setFeedback(ReportFeedback rf) throws SQLException, ParseException {
		boolean result = false;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "INSERT INTO Feedback(tutorID, postID, dateTimeFB,gradeFB,contentFB)output inserted.postID VALUES (?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, rf.getTutor().getUserID());
				ps.setInt(2, rf.getPost().getPostID());
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				String dateTimeFB = rf.getDateTime();
				java.util.Date date = formatter.parse(dateTimeFB);
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				ps.setDate(3, sqlDate);
				ps.setByte(4, rf.getGrade());
				ps.setNString(5, rf.getContent());
				ps.executeUpdate();
			}
		} finally {
			closeConnection();
		}
		return result;
	}

	public List<ReportFeedback> getReportFeedback(int tutorid) throws SQLException {
		List<ReportFeedback> result = null;
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT * FROM Feedback WHERE tutorID =?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, tutorid);
				rs = ps.executeQuery();
				while (rs.next()) {

					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					Date dateTimeRP = rs.getDate("dateTimeFB");
					String datetime = formatter.format(dateTimeRP);
					Byte grade = rs.getByte("gradeFB");
					String content = rs.getNString("contentFB");
					int Id = rs.getInt("postID");
					Post post = new Post(Id);
					ReportFeedback re = new ReportFeedback(post, datetime, content, grade);
					if (result == null) {
						result = new ArrayList<ReportFeedback>();
					}
					result.add(re);
				}
			}
		} finally {
			closeConnection();
		}
		return result;
	}
}
