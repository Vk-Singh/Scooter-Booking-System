package com.E_FLY.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.E_FLY.dao.Common;
import com.E_FLY.dao.UserDetailsDao;
/**
 * Servlet implementation class LoginUserController
 */
@WebServlet("/views/login")
public class LoginUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		boolean result = false;
		
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		
		UserDetailsDao dao;
		try {
			dao = new UserDetailsDao();
			result = dao.getUser(emailId, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.println("Result = " + result);
		PrintWriter out = response.getWriter();
		String userID = "";
		if  (result) {
			ResultSet rs = Common.getInstance().getResultSet("Select * FROM userDetails WHERE emailId = '" + emailId + "'");
			try {
				while(rs.next()) {
					userID = rs.getString("regID");
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			//System.out.println("USER ID = " + userID);
			
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", userID);
			session.setAttribute("BookingStatus", "2");
			session.setAttribute("userLoginStatus", "True");
			session.setAttribute("loginBanner", "True");
			response.sendRedirect("homePage.jsp");
			}else {out.print("Login Failed. Incorrect credentials");
		}
	}

}
