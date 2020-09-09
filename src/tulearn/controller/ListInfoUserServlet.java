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
 * Servlet implementation class ListInfoUserServlet
 */
@WebServlet("/ListInfoUserServlet")
public class ListInfoUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListInfoUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		int ADMIN_ROLE_ID = 1;
		int TUTOR_ROLE_ID = 2;
		int STUDENT_ROLE_ID = 3;
		String success = "Hãy cập nhật thông tin đầy đủ để có được kết quả tìm kiếm phù hợp với bạn nhất.";
		String error = "Lỗi hệ thống ! Truy cập trang cá nhân thất bại, chúng tôi sẽ cố gắng khắc phục sớm !";
		try {						
			HttpSession hs = request.getSession();
			Tutor user = (Tutor)hs.getAttribute("u");
			if(user.getRoleID() == TUTOR_ROLE_ID) {
				request.getRequestDispatcher("tu-main-info.jsp?success=1&noti="+success).forward(request, response);
			}else if(user.getRoleID() == ADMIN_ROLE_ID || user.getRoleID() == STUDENT_ROLE_ID){
				request.getRequestDispatcher("cm-main-info.jsp?success=1&noti="+success).forward(request, response);
			}else { 				
				request.getRequestDispatcher("cm-main-login-register.jsp?success=0&noti="+error).forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
