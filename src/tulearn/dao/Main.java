package tulearn.dao;



import java.sql.SQLException;

import tulearn.dto.Tutor;

public class Main {

	public static void main(String[] args) throws SQLException {
		UserDAO dao = new UserDAO();
		Tutor t = new Tutor(2,2,2,2,2,"khanhlvm@gmail.com","0338943886","Minh Khánh","","200.000","FPT University", "124112344", "de130028");
		if(dao.updateUserOrTutorByID(t)) {
			System.out.println("Update success");
		}else {
			System.out.println("Failed");
		}		
	}
}
