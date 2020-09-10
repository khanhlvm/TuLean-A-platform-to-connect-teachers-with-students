package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dao.RequestDAO;
import tulearn.dao.UserDAO;
import tulearn.dto.Post;
import tulearn.dto.Request;
import tulearn.dto.Schedule;
import tulearn.dto.Tutor;

/**
 * Servlet implementation class LearnRegisterController
 */
@WebServlet("/learn-register-student")
public class LearnRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LearnRegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String success = "Vui lòng điền đầy đủ thông tin bên dưới để tiếp tục.";
		String error = "Đăng ký dạy học viên thất bại !";
		try {	
			UserDAO udao = new UserDAO();
			int tutorID = Integer.parseInt(request.getParameter("tutorID"));
			Tutor reqtt = udao.getUserTutorByID(tutorID);
			ArrayList<Schedule> reqsch = udao.getScheduleForTutor(tutorID);
			HttpSession hs = request.getSession();
			hs.setAttribute("reqtt",reqtt);
			hs.setAttribute("reqsch",reqsch);
			request.getRequestDispatcher("st-main-post-request.jsp?success=1&noti="+success).forward(request, response);		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
