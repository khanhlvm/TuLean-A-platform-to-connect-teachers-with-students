package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tulearn.context.DBContext;
import tulearn.dto.Post;
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
	
	public Post getPostByPostID(int postID) throws SQLException {
		Post result = null;
		try {
			conn = DBContext.getConnection();
			if(conn!=null) {
				String sql="SELECT * FROM Post WHERE postID='"+ postID +"'";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next()) {
					result = new Post(rs.getInt(1),rs.getInt(2),rs.getInt(3), rs.getInt(4),rs.getInt(5), rs.getInt(6), rs.getBoolean(7), rs.getByte(8), rs.getFloat(9), rs.getString(10),rs.getString(11), rs.getString(12));
				}
			}
		} finally {
			closeConnection();
		}
		return result;
	}
	
}
