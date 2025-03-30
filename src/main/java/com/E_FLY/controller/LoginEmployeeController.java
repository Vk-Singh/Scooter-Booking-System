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
import com.E_FLY.dao.EmployeeDetailsDao;


/**
 * Servlet implementation class LoginEmployeeController
 */
@WebServlet("/views/employeeLogin")
public class LoginEmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginEmployeeController() {
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
	boolean result = false;
		HttpSession session = request.getSession();
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		String employeeType = request.getParameter("employeeType");
		
		EmployeeDetailsDao dao;
		try {
			dao = new EmployeeDetailsDao();
			result = dao.getEmployee(emailId, password, employeeType);
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
			ResultSet rs = Common.getInstance().getResultSet("Select * FROM employeedetails WHERE emailId = '" + emailId + "' AND employeeType = '" + employeeType + "'");
			try {
				while(rs.next()) {
					userID = rs.getString("employeeID");
				}
				
				if (employeeType.equals("Manager")) {
				
					session.setAttribute("sessionEmpType", "Manager");
					session.setAttribute("sessionId", userID);
					session.setAttribute("loginEmployeeBanner", "True");
					session.setAttribute("loginEmployeeStatus", "True");
					response.sendRedirect("ManagerView.jsp");
				
				}else if(employeeType.equals("Admin")) {
					
					session.setAttribute("sessionId", userID);
					session.setAttribute("loginEmployeeBanner", "True");
					session.setAttribute("sessionEmpType", "Operator");
					session.setAttribute("loginAdminStatus", "True");
					response.sendRedirect("OperatorView.jsp");
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}		
		
			}else {out.print("Login Failed. Incorrect credentials");
		
			}

	}
}
