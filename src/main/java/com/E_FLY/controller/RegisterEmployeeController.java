package com.E_FLY.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.E_FLY.dao.EmployeeDetailsDao;
import com.E_FLY.model.Employee;

@SuppressWarnings("serial")
@WebServlet("/views/registerEmployee")
public class RegisterEmployeeController extends HttpServlet
{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res ) throws ServletException,IOException
	{
		String result = "";
		boolean emailAlreadyExist = false;
		
		//System.out.println("Clicked Button");
		String fName = req.getParameter("fName");
		String lName = req.getParameter("lName");
		String emailId = req.getParameter("emailId");
		String phoneNum = req.getParameter("phoneNum");
		String password = req.getParameter("password");
		String employeeType = req.getParameter("employeeType");
		
		
		PrintWriter out = res.getWriter();
		
		Employee user1;
		try {
			user1 = new Employee(lName, fName, emailId, employeeType, phoneNum,password);
			emailAlreadyExist = new EmployeeDetailsDao().checkEmailId(emailId);
			//System.out.println("USER 1" + user1);
			if (!emailAlreadyExist)
			{
				result = new EmployeeDetailsDao().setEmployee(user1);
			}else { result = "Email Already Registered." ;}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}   		
		if  (result.equals("pass")) {
			res.sendRedirect("employeeLogin.jsp");
		}else {out.print("Registration Failed. " + result);
		}
	}
}
