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

import tulearn.dao.PostDAO;
import tulearn.dao.QualificateDAO;
import tulearn.dto.Gender;
import tulearn.dto.Post;
import tulearn.dto.Qualificate;
import tulearn.dto.Schedule;
import tulearn.dto.Subject;

/**
 * Servlet implementation class UpdatePost
 */
@WebServlet("/UpdatePost")
public class UpdatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePost() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PostDAO pdao = new PostDAO();
		QualificateDAO q = new QualificateDAO();
		try {
			Post oldPost = pdao.getPost(Integer.parseInt(request.getParameter("id")));
//			Post oldPost = pdao.getPost(9);
			ArrayList<Schedule> oldSche = pdao.getScheduleForOnePost(oldPost.getPostID());
			request.getSession().setAttribute("oldPost", oldPost);
			request.getSession().setAttribute("oldSche", oldSche);
			ArrayList<Qualificate> qualificates = q.getAllQualificate();
			request.getSession().setAttribute("qualificates", qualificates);
			request.getRequestDispatcher("st-main-post-edit.jsp").forward(request, response);
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PostDAO pdao = new PostDAO();
		////
		Post newPost = (Post) request.getSession().getAttribute("oldPost");
		ArrayList<Schedule> oldSche = (ArrayList<Schedule>)request.getSession().getAttribute("oldSche");
		/////
		try {
			ArrayList<Schedule> sche = new ArrayList<Schedule>();
			String[] dayTime = request.getParameterValues("NgayRanh");
			String[] startTime = request.getParameterValues("GioBatDau");
			String[] endTime = request.getParameterValues("GioKetThuc");
			for (int i = 0; i < dayTime.length; i++) {
				sche.add(new Schedule(dayTime[i], startTime[i], endTime[i]));
			}
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

			newPost.setSubject(s);
			newPost.setGender(gd);
			newPost.setQualificate(q);
			newPost.setTimeLearn(soGioMotBuoi);
			newPost.setLessonLearn(soBuoiMotTuan);
			newPost.setStartDay(ngayBatDau);
			newPost.setFee(hocPhiDeXuat);
			newPost.setPostDes(mongMuon);

			pdao.updatePost(newPost, sche, oldSche);

		} catch (SQLException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}

}
