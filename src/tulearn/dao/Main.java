package tulearn.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tulearn.dto.Request;
import tulearn.dto.User;

public class Main {

	public static void main(String[] args) throws SQLException {
		AccountDAO dao = new AccountDAO();
		User u = dao.checkLogin("hongntx@gmail.com", "012345");
		System.out.println("Successfully login, your id: " + u.getUserID());
		RequestDAO da = new RequestDAO();
		PostDAO d= new PostDAO();
		System.out.println(da.temp(1));
		
	  System.out.println(da.tempGSGYCau(1));
	  System.out.println(da.tempLopDangChoDuyet(1));
	  System.out.println(da.tempDangKyDay(2));
System.out.println(da.tempLoiMoiTuHocVien(2));
System.out.println(da.tempLopDangChoDuyetGS(2));
System.out.println(d.temp(1));
System.out.println(da.updateSatus(4,1, 2));
System.out.println(da.updateSatus(4,4, 2));
System.out.println(da.updateSatus(4,5, 2));
	}

}
