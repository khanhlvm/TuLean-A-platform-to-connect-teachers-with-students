package tulearn.dao;



import java.sql.SQLException;

import tulearn.context.DBContext;
import tulearn.dto.AddressUser;
import tulearn.dto.Gender;
import tulearn.dto.Tutor;

public class Main {

	public static void main(String[] args) throws SQLException {
		UserDAO u = new UserDAO();
		Tutor t = new Tutor();
		t = u.getUserTutorByID(1);
		System.out.println(t.toString());
//		Tutor t = new Tutor(2,2,2,2,2,"khanhlvm@gmail.com","0338943886","Minh Khánh","","200.000","FPT University", "124112344", "de130028");
//		if(dao.updateUserOrTutorByID(t)) {
//			System.out.println("Update success");
//		}else {
//			System.out.println("Failed");
//		}

//		dao.getUserTutorByID(1);
//		Tutor t = u.getUserTutorByID(1);
//		System.out.println(t.getName()+"-"+t.getGender().getgName()+"-"+t.getAddress().getProvinceName());
////		System.out.println(t.toString());
//		Gender gender = new Gender();
//		gender = u.getGenderByID(1);
//		System.out.println(gender);
		AddressUser add = new AddressUser();
		add = u .getAddressUserByID(1);
		System.out.println(add);

	}
}
