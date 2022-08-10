package com.SAS;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DonationController
 */
@WebServlet("/DonationController")
public class DonationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationController() {
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
		
		Donation donate = new Donation();
		UserDAO userDao = new UserDAO();
		Random r = new Random();

		HttpSession session = request.getSession();
		
		String username = (String) session.getAttribute("username");
		String donatedBy = (String) session.getAttribute("name");
		String donateTo = request.getParameter("donateto");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String message = request.getParameter("message");
		String isAnonymous = request.getParameter("anonymous");
		int donationID = Math.abs(r.nextInt());
		
		if(isAnonymous != null) {
			donatedBy = "Anonymous";
		}
		
		donate.setDonatedBy(donatedBy);
		donate.setAmount(amount);
		donate.setDonatedTo(donateTo);
		donate.setMessage(message);
		donate.setDonationID(donationID);
		donate.setUsername(username);
		
		try {
			int result = userDao.donate(donate);
			if (result == 1) {
				System.out.println(donatedBy + " Donated Successfully to " + donateTo);
				response.sendRedirect("https://www.jdoodle.com/online-java-compiler/");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
