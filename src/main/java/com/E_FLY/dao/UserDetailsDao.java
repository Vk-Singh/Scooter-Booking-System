package com.E_FLY.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.E_FLY.common.InputVariables;
import com.E_FLY.model.Customer;
import com.E_FLY.model.HashingSHA256;

public class UserDetailsDao {
	
	private Connection con;
	
	public UserDetailsDao() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(InputVariables.getInstance().getDbConn(), InputVariables.getInstance().getAppDBUserName(), InputVariables.getInstance().getAppDBPass());
	}
	 
	public String setUser(Customer user) {
		String result = "fail";
		//System.out.println(user.toString());
		//System.out.println(user.getDob());
		String INSERT_USERS_SQL = "INSERT INTO userDetails" +
	            "  ( emailId, firstName, lastName, mobileNumber, dateOfBirth, licenseNum, hashedPassword) VALUES " +
	            " (?, ?, ?, ?, ?,?,?);";
		try 
		{
			Date dateOfBirth=Date.valueOf(user.getDob());
			
			PreparedStatement  st = con.prepareStatement(INSERT_USERS_SQL);	
			
			st.setString(1, user.getEmailId());
			st.setString(2, user.getfName());
			st.setString(3, user.getlName());
			st.setString(4, user.getPhoneNo());	
			st.setDate(5, dateOfBirth);
			st.setString(6, user.getLicenseNum());
			st.setString(7, user.getPassword());
			
			st.executeUpdate();
			result = "pass";
			
		}catch(Exception e) 
		{
			System.out.println(e.getStackTrace());
			result = e.getMessage();
		}
		return result;
	}

	public boolean getUser(String emailID, String password) throws NoSuchAlgorithmException {
		
		boolean result = false;
		try {
		password = new HashingSHA256().hashPassword(password);
		PreparedStatement preparedStatement = con.prepareStatement("select * from userDetails where emailId = ? and hashedPassword = ? ");
		preparedStatement.setString(1, emailID);
		preparedStatement.setString(2, password);

		ResultSet rs = preparedStatement.executeQuery();
		result = rs.next();
				
		return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
			printSQLException(e);
			
		}	
		return false;
	}
	
	public boolean checkEmailId(String emailID) throws SQLException {
		
		boolean result = false;
		PreparedStatement preparedStatement = con.prepareStatement("select * from userDetails where emailId = ?");
		preparedStatement.setString(1, emailID);
		ResultSet rs = preparedStatement.executeQuery();
		result = rs.next();
		return result;
		
	}
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
