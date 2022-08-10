package com.SAS;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TakeAction
 */
@WebServlet("/TakeAction")
public class TakeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeAction() {
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
		Rescue rescue = new Rescue();
		HttpSession session = request.getSession();

		int rescueID = Integer.parseInt(request.getParameter("rescueID"));
		String username = (String) session.getAttribute("username");
		
		rescue.setRescueID(rescueID);
		rescue.setUsername(username);
		
		String location = (String) session.getAttribute("location");
		
		int result = 0;
		try {
			result = userDao.take_action(rescue);
			if(result == 1) {
				System.out.println("User " + username +  " has taken action on Rescue ID : "+ rescueID +" successfully");
				response.sendRedirect("https://www.google.co.in/maps/place/"+location);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
	}

}
