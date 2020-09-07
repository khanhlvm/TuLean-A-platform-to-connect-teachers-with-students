package tulearn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dao.UserDAO;
import tulearn.dto.AddressUser;
import tulearn.dto.Gender;
import tulearn.dto.Qualificate;
import tulearn.dto.Tutor;

/**
 * Servlet implementation class ListInfoUserServlet
 */
@WebServlet("/ListInfoUserServlet")
public class ListInfoUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListInfoUserServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		final int STUDENT_ACCOUNT = 3;
		final int TUTOR_ACCOUNT = 2;
		PrintWriter out = response.getWriter();
            
		try {
			UserDAO udao = new UserDAO();
			Tutor tu = udao.getUserTutorByID(1); 			
			HttpSession session = request.getSession();
			if (tu.getRoleID() == STUDENT_ACCOUNT) {					
				request.setAttribute("tu", tu);
				request.getRequestDispatcher("cm-main-info.jsp").include(request, response);;
			}else {
				request.setAttribute("tu", tu);
				request.getRequestDispatcher("tu-main-info.jsp").include(request, response);;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
