
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemRegServlet
 */
@WebServlet("/memReg")
public class MemRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemRegServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); /*post방식 한글 인코딩*/
		response.setContentType("text/html;charset=UTF-8"); /*get방식 한글 인코딩*/
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String hobby = request.getParameter("hobby");

		out.println("이름 = " + name + "<br>");
		out.println("주소 = " + addr + "<br>");
		out.println("전화번호 = " + tel + "<br>");
		out.println("취미 = " + hobby + "<br>");
	}

}
