package tulearn.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dao.RequestDAO;
import tulearn.dto.Request;
import tulearn.dto.Tutor;

/**
 * Servlet implementation class TuMainClassManagerController
 */
@WebServlet("/class-manager-tutor")
public class TuMainClassManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TuMainClassManagerController() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String url = "tu-main-class-manager.jsp";
		try {
			HttpSession hs = request.getSession();
			Tutor user = (Tutor)hs.getAttribute("u");
          	RequestDAO requestDAO = new RequestDAO();
			List<Request> listRequest = requestDAO.tempLopDangChoDuyetGS(user.getUserID());
			request.setAttribute("LIST_REQ", listRequest);
			List<Request> listRequestS = requestDAO.tempLopDangDayGS(user.getUserID());
			request.setAttribute("LIST_REQGS", listRequestS);
			List<Request> listRequestDH = requestDAO.tempLopDaDayGS(user.getUserID());
			request.setAttribute("LIST_REQDH", listRequestDH);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(url).include(request, response);
		}
	}

}
