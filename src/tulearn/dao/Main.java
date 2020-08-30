package tulearn.dao;



import java.sql.SQLException;

import tulearn.context.DBContext;
import tulearn.dto.ListUser;
import tulearn.dto.User;

public class Main {

	public static void main(String[] args) throws SQLException {
		UserDAO u = new UserDAO();
		ListUser list = new ListUser();
		System.out.println(	u.getAllListUser(1));
//		System.out.println(u.updatePassword("Minh Trang", "trangttm"));
//		System.out.println(u.updateUser(1, list("Trang","0796250638","trangttm4@fsoft.com.vn","","","","",6,"QL1A")));
	}

}
