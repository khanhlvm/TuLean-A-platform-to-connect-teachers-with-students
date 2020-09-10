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

import tulearn.dao.UserDAO;
import tulearn.dto.Schedule;
import tulearn.dto.Tutor;

/**
 * Servlet implementation class AddTutorScheduleController
 */
@WebServlet("/add-schedule-tutor")
public class AddTutorScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTutorScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		String success = "Thêm lịch dạy thành công";
		String error = "Thêm lịch dạy thất bại";
		try {
			UserDAO udao = new UserDAO();
			HttpSession hs = request.getSession();
			Tutor user = (Tutor)hs.getAttribute("u");
			ArrayList<Schedule> sche = new ArrayList<Schedule>(); 
			String[] dayTime = request.getParameterValues("NgayRanh");
			String[] startTime = request.getParameterValues("GioBatDau");
			String[] endTime = request.getParameterValues("GioKetThuc");			
			for (int i = 0; i < dayTime.length; i++) {
				sche.add(new Schedule(user.getUserID(),dayTime[i], startTime[i], endTime[i]));
			}
			if(udao.addTutorSchedule(sche)) {
				ArrayList<Schedule> reqsch = udao.getScheduleForTutor(user.getUserID());
				hs.setAttribute("reqsch",reqsch);
				request.getRequestDispatcher("tu-main-info.jsp?success=1&noti="+success).forward(request, response);
			}else { 				
				request.getRequestDispatcher("tu-main-info.jsp?success=0&noti="+error).forward(request, response);
			}
		}catch (SQLException | ParseException e) {
			e.printStackTrace();
		}
	}

}
