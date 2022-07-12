package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrdersDAO;
import model.Account;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Get user, password from Cookie
		Cookie[] arr = request.getCookies();
		if(arr != null) {
			for(Cookie o: arr) {
				if(o.getName().equals("userC")) {
					request.setAttribute("username", o.getValue());
				}
				if(o.getName().equals("passC")) {
					request.setAttribute("password", o.getValue());
				}
			}
		}
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8"); //vietnamese
		
		try {
			request.getSession(true).invalidate();
			//make sure that email is valid
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			//collect data from login form
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			String remember = request.getParameter("remember");//if checked, then !null
			
			OrdersDAO dao = new OrdersDAO();
			Account acc = dao.getAccount(user, password);
		
			HttpSession session = request.getSession(true);
			if(!password.matches(regex) || !user.matches(regexMail)) {
				acc.setMessage("syntax-error");
				session.setAttribute("error", acc.getMessage());
				response.sendRedirect("login.jsp");
			} 
			if(acc == null) {
				session.setAttribute("error", "usr-pwd");
				response.sendRedirect("login.jsp");
			}
			//check account- use validate code in assignment 1 to valid user			
			else {
				//set session
				session.setAttribute("user", user);
				
				//Create Cookie
				Cookie u = new Cookie("userC", user);
				Cookie p = new Cookie("passC", password);
				u.setMaxAge(60);
				
				if(remember != null) {
					p.setMaxAge(60);
				} else {
					p.setMaxAge(0);
				}
				response.addCookie(u);
				response.addCookie(p);
				
				// login is valid, now redirect to index page of admin	
				if(acc.getRole() == 0) {
					response.sendRedirect("index.jsp");	
				} else {
					response.sendRedirect("admin/admin.jsp");
				}
			}
		} catch(NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} catch(Exception ex) {
			response.getWriter().println(ex);
		}
	}

}
