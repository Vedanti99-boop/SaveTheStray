package com.SAS;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		User user = new User();
		UserDAO userDao = new UserDAO();
		
		Cookie cookie = new Cookie("isLoggedIn","no");
		response.addCookie(cookie);
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		user.setUsername(username);
		user.setPassword(password);
		
		try {
			ResultSet rs = userDao.verifyLogin(user);
			
			while(rs.next()) {
				String SQL_OUTPUT_PASSWORD = rs.getString(1);
				if(SQL_OUTPUT_PASSWORD.equals(password)) {
					System.out.println("User " + username + " Successfully Verified");
					
					cookie = new Cookie("isLoggedIn","yes");
					response.addCookie(cookie);
					
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					
					
					Cookie userCookie = new Cookie("username",username);
					response.addCookie(userCookie);
					
					//System.out.println("Is Logged In : " + cookie + "\nUsername : " + userCookie );
					
					response.sendRedirect("Home.jsp");
				}else {
					System.out.println("Invalid Username or password");
					response.sendRedirect("Login.jsp");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
