package com.SAS;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
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
		
		UserDAO userDao = new UserDAO();
		User user = new User();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String phone = request.getParameter("phone");
		int zipcode = Integer.parseInt( request.getParameter("zipcode"));
		
		user.setName(name);
		user.setEmail(email);
		user.setUsername(username);
		user.setPassword(password);
		user.setUsertype(userType);
		user.setState(state);
		user.setCity(city);
		user.setPhone(phone);
		user.setZipcode(zipcode);
		
		try {
			int result = userDao.register(user);
			
			if(result == 1) {
				System.out.println("User " + name +  " Registered successfully");
				response.sendRedirect("Login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
