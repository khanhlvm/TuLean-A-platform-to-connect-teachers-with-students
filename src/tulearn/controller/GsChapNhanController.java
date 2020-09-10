package tulearn.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tulearn.dao.RequestDAO;

/**
 * Servlet implementation class GsChapNhanController
 */
@WebServlet("/GsChapNhanController")
public class GsChapNhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GsChapNhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int Tutorid=Integer.parseInt(request.getParameter("btnTutorID"));
		int Postid =Integer.parseInt(request.getParameter("btnPostID"));
		
		RequestDAO dao = new RequestDAO();
		boolean result;
		try {
			
			result = dao.updateSatus(5,Postid,Tutorid);			
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("request-manager-tutor").include(request, response);
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
