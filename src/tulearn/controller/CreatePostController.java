package tulearn.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreatePostController
 */
@WebServlet("/CreatePostController")
public class CreatePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8");//Dòng này nè a :D nảy a cũng có thêm =)))) Xui :v Thử add cái khác coi a =)))
//		request.getCharacterEncoding(); hình như nảy a add them dong response nưa thư
    response.setCharacterEncoding("UTF-8"); 
//	    request.getContentType();Mà tại sao có response lại lõi nhỉ
//	    response.setContentType("text/html;charset=UTF-8");
	String[] dayTime = request.getParameterValues("NgayRanh");
        String[] startTime = request.getParameterValues("GioBatDau");
        String[] endTime = request.getParameterValues("GioKetThuc");
        try (PrintWriter out = response.getWriter()) {        	
            for(int i=0; i<dayTime.length; i++){
                out.println("<h1>xin chào"+dayTime[i]+" - start: "+ startTime[i] +" - end: "+ endTime[i]+"</h1>");                    
            }  
        }
	}

}
