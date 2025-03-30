package com.E_FLY.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.E_FLY.common.InputVariables;
import com.E_FLY.model.Employee;
import com.E_FLY.model.HashingSHA256;

public class EmployeeDetailsDao {
	
	private Connection con;
	
	public EmployeeDetailsDao() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(InputVariables.getInstance().getDbConn(), InputVariables.getInstance().getAppDBUserName(), InputVariables.getInstance().getAppDBPass());
	}
	 
	public String setEmployee(Employee user) {
		String result = "fail";
		//System.out.println(user.toString());
		String INSERT_USERS_SQL = "INSERT INTO employeedetails" +
	            "  ( emailId, firstName, lastName, employeeType, phoneNum, hashedPassword, locationId) VALUES " +
	            " (?, ?, ?, ?, ?,?,?);";
		try 
		{
						
			PreparedStatement  st = con.prepareStatement(INSERT_USERS_SQL);	
			
			st.setString(1, user.getEmailId());
			st.setString(2, user.getfName());
			st.setString(3, user.getlName());
			st.setString(4, user.getEmployeeType());
			st.setString(5, user.getPhoneNo());	
			st.setString(6, user.getPassword());
			st.setInt(7, user.getLocationID());
			
			st.executeUpdate();
			result = "pass";
			
		}catch(Exception e) 
		{
			System.out.println(e.getStackTrace());
			result = e.getMessage();
		}
		return result;
	}

	public boolean getEmployee(String emailID, String password, String employeeType) throws NoSuchAlgorithmException {
		
		boolean result = false;
		try {
		password = new HashingSHA256().hashPassword(password);
		PreparedStatement preparedStatement = con.prepareStatement("select * from employeeDetails where emailId = ? and hashedPassword = ? and employeeType = ? ");
		preparedStatement.setString(1, emailID);
		preparedStatement.setString(2, password);
		preparedStatement.setString(3, employeeType);

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
		PreparedStatement preparedStatement = con.prepareStatement("select * from employeeDetails where emailId = ?");
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
