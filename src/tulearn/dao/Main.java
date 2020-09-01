package tulearn.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import tulearn.dto.Request;
import tulearn.dto.User;

public class Main {

	public static void main(String[] args) throws SQLException {
		AccountDAO dao = new AccountDAO();
		User u = dao.checkLogin("hongntx@gmail.com", "012345");
		System.out.println("Successfully login, your id: " + u.getUserID());
		RequestDAO da = new RequestDAO();
		Request dto = new Request(2, 1);

		System.out.println(da.getListRequest(4, false));
		System.out.println(da.deleteRequest(2));
		System.out.println(da.updateSatus(5, 1));
UserDAO ut = new UserDAO();


	}

}
