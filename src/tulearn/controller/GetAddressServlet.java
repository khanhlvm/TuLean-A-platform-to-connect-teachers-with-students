package tulearn.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import tulearn.dao.FormItemDAO;
import tulearn.dto.Address;

/**
 * Servlet implementation class GetAddressServlet
 */
@WebServlet("/GetAddressServlet")
public class GetAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			FormItemDAO dao = new FormItemDAO();
			String param = request.getParameter("parameter");
			if(param.equals("province")) {				
				ArrayList<Address> pList = dao.getAllProvinceCity();
				Gson json = new Gson();
				String provinceList = json.toJson(pList);
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write(provinceList);
			}			
			if(param.equals("district")) {
				int id = Integer.parseInt(request.getParameter("id"));
				ArrayList<Address> dList = dao.findAllDistrictByProvince(id);
				Gson json = new Gson();
				String provinceList = json.toJson(dList);
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write(provinceList);
			}		
			if(param.equals("commune")) {
				int id = Integer.parseInt(request.getParameter("id"));
				ArrayList<Address> cList = dao.findAllCommuneByDistrict(id);
				Gson json = new Gson();
				String provinceList = json.toJson(cList);
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write(provinceList);
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
