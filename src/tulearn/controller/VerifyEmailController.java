package tulearn.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dto.User;
import tulearn.support.SendMailSSL;

/**
 * Servlet implementation class VerifyEmailController
 */
@WebServlet("/VerifyEmailController")
public class VerifyEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyEmailController() {
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
		response.setContentType("text/html;charset=UTF-8");
		try {
			HttpSession hs = request.getSession();
			int role = Integer.parseInt(request.getParameter("role"));
			String email = request.getParameter("email");
			String password = request.getParameter("password"); 
			User ur = new User();
			ur.setStatusUserID(2);
			ur.setRoleID(role);
			ur.setEmail(email);
			ur.setPassword(password);
			hs.setAttribute("ur", ur);
			Random rand = new Random(); 
			int rCode = rand.nextInt(100000);
			String vCode = String.format("%06d", rCode);
			hs.setAttribute("vCode", vCode);
			if(SendMailSSL.sendVerificationCode(email, vCode)) {
				request.getRequestDispatcher("cm-main-verify-email.jsp").forward(request, response);
			}			
		}finally {
			request.getRequestDispatcher("cm-main-login-register.jsp").include(request, response);
		}
				
	}

}
