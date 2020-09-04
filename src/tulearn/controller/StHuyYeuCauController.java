package tulearn.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tulearn.dao.RequestDAO;

/**
 * Servlet implementation class StHuyYeuCauController
 */
@WebServlet("/StHuyYeuCauController")
public class StHuyYeuCauController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StHuyYeuCauController() {
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
		try {
			int Tutorid=Integer.parseInt(request.getParameter("btnTutorID"));
			int Postid =Integer.parseInt(request.getParameter("btnPostID"));
			
			RequestDAO dao = new RequestDAO();
			boolean result = dao.updateSatus(7,Postid,Tutorid);			
			if (result) {
				request.getRequestDispatcher("StMainRequestManagerGlmd").include(request, response);
			} 
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("StMainRequestManagerGlmd");
		}
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int Tutorid=Integer.parseInt(request.getParameter("btnTutorID"));
			int Postid =Integer.parseInt(request.getParameter("btnPostID"));
			
			RequestDAO dao = new RequestDAO();
			boolean result = dao.updateSatus(7,Postid,Tutorid);			
			if (result) {
				request.getRequestDispatcher("StMainRequestManagerGlmd").include(request, response);
			} 
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("StMainRequestManagerGlmd");
		}
	}

}
