package com.E_FLY.common;

public class InputVariables {
	private static InputVariables instance = new InputVariables();
	String appDBUserName = "root";
	String appDBPass = "root";
	String dbConn = "jdbc:mysql://localhost:3306/efly";

	
	
	/**
	 * @return the dbConn
	 */
	public String getDbConn() {
		return dbConn;
	}
	/**
	 * @return the appDBUserName
	 */
	public String getAppDBUserName() {
		return appDBUserName;
	}
	/**
	 * @return the aapDBPass
	 */
	public String getAppDBPass() {
		return appDBPass;
	}
	
	/**
	 * @return the instance
	 */
	public synchronized static InputVariables getInstance() {
		return instance;
	}
}
