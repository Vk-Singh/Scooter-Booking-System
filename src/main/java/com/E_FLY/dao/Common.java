package com.E_FLY.dao;
import java.sql.*;


public class Common {
	
	private Connection con;
	private static Common instance = new Common();
	
	public Common() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/efly", "root", "root");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ResultSet getResultSet(String query) {
		
		ResultSet rs = null;
		Statement st;
		
		//System.out.println("Query = " + query);
		try {
		st = con.createStatement();
	
		rs = st.executeQuery(query);
		return rs;
		
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return rs;
	}
	/**
	 * @return the instance
	 */
	public synchronized static Common getInstance() {
		return instance;
	}
}
