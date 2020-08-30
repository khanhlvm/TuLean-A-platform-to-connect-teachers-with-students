package tulearn.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import tulearn.dto.Subject;
import tulearn.dto.User;

public class Main {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {

		AdminDAO dao = new AdminDAO();
//		
//		// Thêm môn học
//		if (dao.insertSubject("Toán")) {
//			System.out.println("Insert Success");	
//		}else {
//			System.out.println("Insert Fail");
//		}
		 //Lấy tất cả các môn học
		ArrayList<Subject> al = dao.getAllSubject();
		for (Subject i: al) {
			System.out.println(i.getSubjectID() +" - "+ i.getSubjectName());
		}
	}
}
