package tulearn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dao.UserDAO;
import tulearn.dto.Tutor;

/**
 * Servlet implementation class ChangePassServlet
 */
@WebServlet("/change-password")
public class ChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String success = "Mật khẩu của bạn đã được cập nhật, Hãy đăng nhập lại !";
		String error = "Cập nhật mật khẩu thất bại, kiểm tra lại quy tắc đặt mật khẩu hoặc mật khẩu hiện tại !";
		try {
			String oldPass = request.getParameter("oldPass");
			String newPass = request.getParameter("newPass");
			String confirmPass = request.getParameter("confirmPass");
			HttpSession hs = request.getSession();
			Tutor user = (Tutor)hs.getAttribute("u");
			UserDAO uDAO = new UserDAO();			
			if(user.getPassword().equals(oldPass) && newPass.equals(confirmPass) && uDAO.updatePassword(user.getUserID(), newPass)) {							
				request.getRequestDispatcher("cm-main-login-register.jsp?success=1&noti="+success).forward(request, response);		
			}else{				
				request.getRequestDispatcher("cm-main-change-pass.jsp?success=0&noti="+error).forward(request, response);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
