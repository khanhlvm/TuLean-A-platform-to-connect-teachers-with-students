package tulearn.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tulearn.dao.RequestDAO;
import tulearn.dto.Request;

/**
 * Servlet implementation class StMainClassMaController
 */
@WebServlet("/StMainClassMaController")
public class StMainClassMaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StMainClassMaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		String url = "st-main-class-manager.jsp";
		try {
          	RequestDAO requestDAO = new RequestDAO();
			List<Request> listRequest = requestDAO.tempLopDangChoDuyet(1);
			request.setAttribute("LIST_REQ", listRequest);
			List<Request> listRequestS = requestDAO.tempLopDangHoc(1);
			request.setAttribute("LIST_REQGS", listRequestS);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
