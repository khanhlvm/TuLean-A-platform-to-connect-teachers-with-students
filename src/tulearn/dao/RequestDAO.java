package tulearn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tulearn.context.DBContext;
import tulearn.dto.Post;
import tulearn.dto.Request;
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
	public ArrayList<Request> getListRequest(int statusID,boolean type) throws SQLException {
		ArrayList<Request> list = new ArrayList<Request>();
		try {
			conn = DBContext.getConnection();
			if (conn != null) {
				String sql = "SELECT tutorID,postID FROM  Request WHERE statusID= ? AND typeRequest= ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1,statusID);
				ps.setBoolean(2,type);
				rs = ps.executeQuery();
				
				if (rs.next()) {
					list.add(new Request(rs.getInt(1), rs.getInt(2)));
				}
				return list;
			}

		} finally {
			closeConnection();
		}
		return null;

	}
	
		public boolean updateSatus(int status,int post) throws SQLException {
			boolean result = false;
			try {
				conn=DBContext.getConnection();
				if(conn!=null) {
					String sql="UPDATE Request SET statusID = ? WHERE postID = ?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, status);
					ps.setInt(2, post);
					result = (ps.executeUpdate() > 0);
				}
			
				
			}  finally {
				closeConnection();
			}
			return result;
		}
		public boolean deleteRequest(int postID) throws SQLException {
			boolean result =false;
			try {
				conn=DBContext.getConnection();
				if(conn!=null) {
					String sql ="DELETE FROM Request WHERE postID = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, postID);
					
					result = (ps.executeUpdate() > 0);
				}
			} finally {
				closeConnection();
			}
			return result;
		}
}

