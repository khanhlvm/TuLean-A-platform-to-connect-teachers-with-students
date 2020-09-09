package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tulearn.dao.RequestDAO;
import tulearn.dto.Request;

/**
 * Servlet implementation class GsCapNhatTrangThaiController
 */
@WebServlet("/GsCapNhatTrangThaiController" )
public class GsCapNhatTrangThaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GsCapNhatTrangThaiController() {
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
		    int id = Integer.parseInt(request.getParameter("tutorID"));
            
			try {
				RequestDAO dao = new RequestDAO();
	            List<Request> listRequest;
				listRequest = dao.tempLopDangChoDuyetGS(id);
				request.setAttribute("LIST_REQ", listRequest);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	        RequestDispatcher dis = request.getRequestDispatcher("tu-main-class-update.jsp");
	        dis.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int Tutorid=Integer.parseInt(request.getParameter("btnTutorID"));
		int Postid =Integer.parseInt(request.getParameter("btnPostID"));
		int status =Integer.parseInt(request.getParameter("tt_category"));
		RequestDAO dao = new RequestDAO();
		boolean result;
		try {
			
			 result = dao.updateSatus(status,Postid,Tutorid);			
			if (result) {
				request.getRequestDispatcher("tu-main-class-manager.jsp").include(request, response);
			} 
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("tu-main-class-manager.jsp").include(request, response);
		}
	}

}
