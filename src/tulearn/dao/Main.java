package tulearn.dao;

import java.sql.SQLException;

import tulearn.dto.User;

public class Main {

	public static void main(String[] args) throws SQLException {
		AccountDAO dao = new AccountDAO();
		User u = dao.checkLogin("khanhlvm98@gmail.com", "khanh123456");
		System.out.println("Successfully login, your id: " + u.getUserID());
	}

}
