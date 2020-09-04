package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
import tulearn.dto.User;

/**
 * Servlet implementation class StMainRequestManagerGlmd
 */
@WebServlet("/StMainRequestManagerGlmd")
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
		String url = "st-main-request-manager.jsp";
		try {
          	RequestDAO requestDAO = new RequestDAO();
			List<Request> listRequest = requestDAO.temp(1);
			request.setAttribute("LIST_REQ", listRequest);
			List<Request> listRequestS = requestDAO.tempGSGYCau(1);
			request.setAttribute("LIST_REQGS", listRequestS);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(url).forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		

	}

}
