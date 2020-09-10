package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dao.PostDAO;
import tulearn.dao.UserDAO;
import tulearn.dto.Gender;
import tulearn.dto.Post;
import tulearn.dto.Qualificate;
import tulearn.dto.Schedule;
import tulearn.dto.Subject;
import tulearn.dto.Tutor;

/**
 * Servlet implementation class CreatePostController
 */
@WebServlet("/CreatePostController")
public class CreatePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreatePostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String success = "Tạo yêu cầu thành công";
		String error = "Tạo yêu cầu thất bại";
		try {			
			UserDAO udao = new UserDAO();		
			HttpSession ss = request.getSession();
			Tutor us = (Tutor)ss.getAttribute("u");
			Tutor u = udao.getUserTutorByID(us.getUserID());			
			int monhoc = Integer.parseInt(request.getParameter("MonHoc"));
			Subject s = new Subject();
			s.setsID(monhoc);
			int gtGiaSu = Integer.parseInt(request.getParameter("GioiTinhGiaSu"));
			Gender gd = new Gender();
			gd.setgID(gtGiaSu);
			int trinhDoGiaSu = Integer.parseInt(request.getParameter("TrinhDoGiaSu"));
			Qualificate q = new Qualificate();
			q.setqID(trinhDoGiaSu);
			byte soBuoiMotTuan = Byte.parseByte(request.getParameter("SoBuoiMotTuan"));
			float soGioMotBuoi = Float.parseFloat(request.getParameter("SoGioMotBuoi"));
			String ngayBatDau = request.getParameter("Date");
			String hocPhiDeXuat = request.getParameter("HocPhiDeXuat");
			String mongMuon = request.getParameter("MongMuon");
			ArrayList<Schedule> sche = new ArrayList<Schedule>(); 
			String[] dayTime = request.getParameterValues("NgayRanh");
			String[] startTime = request.getParameterValues("GioBatDau");
			String[] endTime = request.getParameterValues("GioKetThuc");  
			for (int i = 0; i < dayTime.length; i++) {
				sche.add(new Schedule(dayTime[i], startTime[i], endTime[i]));
			}			
			PostDAO pdao = new PostDAO();
			Post p = new Post(u,u.getAddress(),gd,q,s,8,false,soBuoiMotTuan,soGioMotBuoi,hocPhiDeXuat,ngayBatDau,mongMuon);
			if(pdao.upPost(p, sche)) {
				request.getRequestDispatcher("st-main-home.jsp?success=1&?noti="+success).forward(request, response);
			}
		} catch (SQLException | ParseException e) {
			e.printStackTrace();
		}finally {
			request.getRequestDispatcher("st-main-post-create.jsp?success=0&?noti="+error).forward(request, response);; 
		}
		
	}

}
