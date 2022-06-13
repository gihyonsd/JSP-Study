package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LoginService;
import vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		request.setCharacterEncoding("UTF-8");
		Cookie[] cookieArray = request.getCookies();
		String id = "";
		String pass = "";
		if (cookieArray != null) {
			for (int i = 0; i < cookieArray.length; i++) {
				if (cookieArray[i].getName().equals("id")) {
					id = cookieArray[i].getValue();
				}  else if(cookieArray[i].getName().equals("pass")) {
					pass = cookieArray[i].getValue();
				}
			}
		}
		LoginService loginService = new LoginService();
		Member loginMember = loginService.getLoginMember(id, pass);
		
		if(loginMember != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginSuccess.jsp");
			request.setAttribute("loginMember", loginMember);
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginForm.html");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String useCookie = request.getParameter("useCookie");
		LoginService loginService = new LoginService();
		Member loginMember = loginService.getLoginMember(id, pass);
		
		if(useCookie != null) {
			Cookie idCookie = new Cookie("id", id);
			idCookie.setMaxAge(60*60*24);
			Cookie passCookie = new Cookie("pass", pass);
			passCookie.setMaxAge(60*60*24);
			response.addCookie(idCookie);
			response.addCookie(passCookie);
		}
		
		if(loginMember != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginSuccess.jsp");
			request.setAttribute("loginMember", loginMember);
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginFail.jsp");
			dispatcher.forward(request, response);
		}
	}

}
