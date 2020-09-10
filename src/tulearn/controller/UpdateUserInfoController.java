package tulearn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tulearn.dao.UserDAO;
import tulearn.dto.AddressUser;
import tulearn.dto.Gender;
import tulearn.dto.Qualificate;
import tulearn.dto.Tutor;

/**
 * Servlet implementation class UpdateUserInfoController
 */
@WebServlet("/update-info")
public class UpdateUserInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		updateUserInfo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		updateUserInfo(request, response);
	}
	
	protected void updateUserInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int ADMIN_ROLE_ID = 1;
		int TUTOR_ROLE_ID = 2;
		int STUDENT_ROLE_ID = 3;
		String success = "Cập nhật thông tin thành công";
		String error = "Cập nhật thông tin thất bại";
		try {						
			String formHovaTen = request.getParameter("formHovaTen");			
			String formEmail = request.getParameter("formEmail");			
			String formSDT = request.getParameter("formSDT");												
			String qualification = request.getParameter("qualification");
			String gender = request.getParameter("gender");
			String commune = request.getParameter("commune");
			Qualificate q = new Qualificate();
			q.setqID(Integer.parseInt(qualification));
			Gender g = new Gender();
			AddressUser a = new AddressUser();
			if(gender.isEmpty() || commune.isEmpty()) {
				g.setgID(3);
				a.setCommuneID(455);
			}else {
				g.setgID(Integer.parseInt(gender));
				a.setCommuneID(Integer.parseInt(commune));
			}			
			String formSoNha = request.getParameter("formSoNha");
			HttpSession hs = request.getSession();
			Tutor user = (Tutor)hs.getAttribute("u");
			UserDAO udao = new UserDAO();
			Tutor t;			
			if(user.getRoleID() == TUTOR_ROLE_ID) {
				String formMSSV = request.getParameter("formMSSV");			
				String formCMND = request.getParameter("formCMND");			
				String formLuong = request.getParameter("formLuong");
				String formNoiLamViec = request.getParameter("formNoiLamViec");
				t = new Tutor(user.getUserID(),g,q,a,formEmail,formSDT,formHovaTen,formSoNha,formLuong,formNoiLamViec,formCMND,formMSSV);
				if(udao.updateUserOrTutor(t)) {		
					Tutor tt = udao.getUserTutorByID(user.getUserID());
					hs.setAttribute("u", tt);
					request.getRequestDispatcher("tu-main-info-update.jsp?success=1&noti="+success).forward(request, response);
				}else {				
					request.getRequestDispatcher("tu-main-info-update.jsp?success=0&noti="+error).forward(request, response);
				}		
			}else if(user.getRoleID() == ADMIN_ROLE_ID || user.getRoleID() == STUDENT_ROLE_ID){
				t = new Tutor(user.getUserID(),g,q,a,formEmail,formSDT,formHovaTen,formSoNha);
				if(udao.updateUserOrTutor(t)) {
					Tutor tt = udao.getUserTutorByID(user.getUserID());
					hs.setAttribute("u", tt); 
					request.getRequestDispatcher("cm-main-info-update.jsp?success=1&noti="+success).forward(request, response);
				}else {				
					request.getRequestDispatcher("cm-main-info-update.jsp?success=0&noti="+error).forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
