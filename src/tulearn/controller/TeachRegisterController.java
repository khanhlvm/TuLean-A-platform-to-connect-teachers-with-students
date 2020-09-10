package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dao.PostDAO;
import tulearn.dao.RequestDAO;
import tulearn.dto.Post;
import tulearn.dto.Request;
import tulearn.dto.Schedule;
import tulearn.dto.Tutor;

/**
 * Servlet implementation class TeachRegisterController
 */
@WebServlet("/teach-register")
public class TeachRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeachRegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");	
		String success = "Đăng ký dạy học viên thành công.";
		String error = "Đăng ký dạy học viên thất bại !";
		try {
			HttpSession hs = request.getSession();
			Tutor ts = (Tutor)hs.getAttribute("u");
			int postID = Integer.parseInt(request.getParameter("postID"));
			Tutor t = new Tutor();
			t.setUserID(ts.getUserID());
			Post p = new Post();
			p.setPostID(postID);
			Request req = new Request(t,p,4,true);
			RequestDAO rdao = new RequestDAO();
			PostDAO pdao = new PostDAO();
			if(rdao.insertRequestToLearner(req)) {
				HashMap<Post, ArrayList<Schedule>> hm = pdao.getAllPost();
				hs.setAttribute("hm", hm);
				request.getRequestDispatcher("tu-main-home.jsp?success=1&noti="+success).forward(request, response);
			}else {
				request.getRequestDispatcher("tu-main-home.jsp?success=0&noti="+error).forward(request, response);
			}			
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
