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

import com.E_FLY.dao.UserDetailsDao;
import com.E_FLY.model.Customer;

@SuppressWarnings("serial")
@WebServlet("/views/register")
public class RegisterUserController extends HttpServlet
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
		String licenseNum = req.getParameter("licenseNum");
		String dob = req.getParameter("dob");
		String password = req.getParameter("password");
		
		
		PrintWriter out = res.getWriter();
		
		Customer user1;
		try {
			user1 = new Customer(lName, fName, emailId, phoneNum, licenseNum, dob, password);
			emailAlreadyExist = new UserDetailsDao().checkEmailId(emailId);
			if (!emailAlreadyExist)
			{
				result = new UserDetailsDao().setUser(user1);
			}else { result = "Email Already Registered." ;}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}   		
		if  (result.equals("pass")) {
		res.sendRedirect("customerLogin.jsp");
		}else {out.print("Registration Failed. " + result);
		}
	}
}
