package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final int STUDENT_ACCOUNT = 1;
		final int TUTOR_ACCOUNT = 2;
		try {
			String id = request.getParameter("id");
			int idInt = Integer.valueOf(id);
			String roleID = request.getParameter("roleID");
			int RoleID = Integer.valueOf(roleID);
			String statusID = request.getParameter("statusID");
			int StatusID = Integer.valueOf(statusID);
			String gID = request.getParameter("gID");
			int genderID = Integer.valueOf(gID);
			String gName = request.getParameter("gender");
			String qID = request.getParameter("qID");
			int quaID = Integer.valueOf(qID);
			String qName = request.getParameter("qName");
			String communeID = request.getParameter("communeID");
			int CommuneID = Integer.valueOf(communeID);
			String districtName = request.getParameter("district");
			String provinceName = request.getParameter("province");
			String communeName = request.getParameter("commune");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("pass");
			String name = request.getParameter("name");
			String avatar = request.getParameter("avatar");
			String street = request.getParameter("street");
			String salary = request.getParameter("salary");
			String identityCard = request.getParameter("identityCard");
			String studentCard = request.getParameter("studentCard");
			String workAt = request.getParameter("workAt");
			Gender gender = new Gender(genderID, gName);
			Qualificate qualificate = new Qualificate(quaID, qName);
			AddressUser address = new AddressUser(CommuneID, districtName, provinceName, communeName);
			UserDAO userDAO = new UserDAO();
			Tutor tutor = new Tutor();
			HttpSession session = request.getSession();
			if (RoleID == STUDENT_ACCOUNT) {
				tutor = new Tutor(1, RoleID, StatusID, gender, qualificate, address, email,
						phone, password, name, avatar, street);
				tutor = userDAO.getUserTutorByID(1);
				session.setAttribute("tutor", tutor);
				RequestDispatcher rd = request.getRequestDispatcher("cm-main-info-update.jsp");
				rd.forward(request, response);
			}else {
				tutor = new Tutor(1, RoleID, StatusID, gender, qualificate, address, email,
					phone, password, name, avatar, street,salary, workAt,identityCard, studentCard);
				tutor = userDAO.getUserTutorByID(2);
				session.setAttribute("tutor", tutor);
				RequestDispatcher rd = request.getRequestDispatcher("tu-main-info-update.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
