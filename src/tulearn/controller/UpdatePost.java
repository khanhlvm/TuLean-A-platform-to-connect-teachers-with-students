package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tulearn.dao.PostDAO;
import tulearn.dao.QualificateDAO;
import tulearn.dto.Post;
import tulearn.dto.Qualificate;
import tulearn.dto.Schedule;

/**
 * Servlet implementation class UpdatePost
 */
@WebServlet("/UpdatePost")
public class UpdatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PostDAO pdao = new PostDAO();
		QualificateDAO q = new QualificateDAO();
		try {
			//int id = Integer.parseInt(request.getParameter("id"));
			//bấm chỉnh sửa tại trang quản lý để truyền tham số
			//Post oldPost = pdao.getPost(Integer.parseInt(request.getParameter("id")));
			Post oldPost = pdao.getPost(6);
			ArrayList<Schedule> oldSche = pdao.getScheduleForOnePost(6);
			request.getSession().setAttribute("oldPost", oldPost);
			request.getSession().setAttribute("oldSche", oldSche);
			ArrayList<Qualificate> qualificates = q.getAllQualificate();
			request.getSession().setAttribute("qualificates", qualificates);
			request.getRequestDispatcher("st-main-post-edit.jsp").forward(request, response);
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
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
