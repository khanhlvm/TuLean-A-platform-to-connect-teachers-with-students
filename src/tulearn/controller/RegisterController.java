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
import tulearn.dto.User;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");	
		String success = "Đăng ký tài khoản thành công";
		try {			
			String vEmail = request.getParameter("verifyEmail").trim();
			AccountDAO adao = new AccountDAO();
			HttpSession hs = request.getSession();
			User us = (User)hs.getAttribute("ur");
			String vCode = (String)hs.getAttribute("vCode");
			
			if(vEmail.equals(vCode)&& adao.insertRegister(us)) {				
				request.getRequestDispatcher("cm-main-login-register.jsp?success=1&noti="+success).forward(request, response);;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			String error = "Đăng ký tài khoản thất bại !";
			request.getRequestDispatcher("cm-main-login-register.jsp?success=0&noti="+error).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				      
	}

}
