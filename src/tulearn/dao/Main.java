package tulearn.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import tulearn.context.DBContext;
import tulearn.dto.AddressUser;

import tulearn.dto.Gender;
import tulearn.dto.Post;
import tulearn.dto.Report;
import tulearn.dto.ReportFeedback;
import tulearn.dto.Tutor;
import tulearn.dto.User;

public class Main {

	public static void main(String[] args) throws SQLException {
//		UserDAO u = new UserDAO();
//		Tutor t = new Tutor();
//		t = u.getUserTutorByID(2);
//		System.out.println(t.toString());
//		Tutor t = new Tutor(2,2,2,2,2,"khanhlvm@gmail.com","0338943886","Minh Khánh","","200.000","FPT University", "124112344", "de130028");
//		if(dao.updateUserOrTutorByID(t)) {
//			System.out.println("Update success");
//		}else {
//			System.out.println("Failed");
//		}

//		ReportFeedback fb = new ReportFeedback(ud.getUserTutorByID(1),3,"2020-05-06", (byte) 5,"Good!");
//		FeedbackDAO dao = new FeedbackDAO();
//		if (dao.setFeedback(fb)) {
//			System.out.println("Update success");
//		} else {
//			System.out.println("Failed");
//		}

		FeedbackDAO fe = new FeedbackDAO();
		System.out.println(fe.getReportFeedback(1));
		int size = 5;
		// Convert size int to binary
		String sizeStr = Integer.toString(size);
		byte binaryByte = Byte.valueOf(sizeStr);
		Tutor t = new Tutor(2);
		Post p = new Post(1);

		
		
		ReportFeedback re = new ReportFeedback(t, p, "2020-02-02", "Good", binaryByte);
		try {
			System.out.println(fe.setFeedback(re));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
