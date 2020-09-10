package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import tulearn.dao.AccountDAO;
import tulearn.dao.PostDAO;
import tulearn.dao.RequestDAO;
import tulearn.dto.Post;
import tulearn.dto.Request;
import tulearn.dto.Schedule;
import tulearn.dto.Tutor;
import tulearn.dto.User;

/**
 * Servlet implementation class StMainRequestManagerGlmd
 */
@WebServlet("/request-manager-student")
public class StMainReqMaGlmdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String SUCCESS = "st-main-request-manager.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StMainReqMaGlmdController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			HttpSession hs = request.getSession();
			Tutor user = (Tutor)hs.getAttribute("u");
          	RequestDAO requestDAO = new RequestDAO();
          	PostDAO pdao = new PostDAO();
			List<Request> listRequest = requestDAO.temp(user.getUserID());
			request.setAttribute("LIST_REQ", listRequest);
			List<Request> listRequestS = requestDAO.tempGSGYCau(user.getUserID());
			request.setAttribute("LIST_REQGS", listRequestS);
			PostDAO postDAO = new PostDAO();
			HashMap<Post, ArrayList<Schedule>> hm = pdao.getAllPost();
			hs.setAttribute("hm", hm); 
			List<Post> listpost= postDAO.temp(user.getUserID());
			request.setAttribute("LIST_REQPOST", listpost);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("st-main-request-manager.jsp").include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
	
	
}
