package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dao.AccountDAO;
import tulearn.dao.UserDAO;
import tulearn.dto.Tutor;
import tulearn.dto.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int ADMIN_ROLE_ID = 1;
		int TUTOR_ROLE_ID = 2;
		int STUDENT_ROLE_ID = 3;
		String admin = "Đăng nhập trang admin thành công !";
		String success = "Chào mừng bạn đến với TuLearn, hãy cập nhật thông tin đầy đủ để có được kết quả tìm kiếm phù hợp với bạn nhất.";
		String error = "Đăng nhập thất bại, có thể địa chỉ email hoặc mật khẩu không chính xác, thử lại !";
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");		
			AccountDAO adao = new AccountDAO();
			UserDAO udao = new UserDAO(); 
			User us = adao.checkLogin(email, password);
			Tutor tt = udao.getUserTutorByID(us.getUserID());
			// set user into session
			HttpSession hs = request.getSession();
			hs.setAttribute("u", tt); 
			// return page with role
			if(tt.getRoleID() == ADMIN_ROLE_ID) {	
				request.getRequestDispatcher("ad-main-common-manager.jsp?success=1&noti="+admin).forward(request, response);
			}else if(tt.getRoleID() == TUTOR_ROLE_ID) {
				request.getRequestDispatcher("tu-main-home.jsp?success=1&noti="+success).forward(request, response);
			}else if(tt.getRoleID() == STUDENT_ROLE_ID) {
				request.getRequestDispatcher("st-main-home.jsp?success=1&noti="+success).forward(request, response);
			}else {				
				request.getRequestDispatcher("cm-main-login-register.jsp?success=0&noti="+error).forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
