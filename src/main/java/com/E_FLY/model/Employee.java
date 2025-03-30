package com.E_FLY.model;


import java.security.NoSuchAlgorithmException;

public class Employee {

	private String userId;
	private String lName;
	private String fName;
	private String emailId;
	private String phoneNum;
	private String EmployeeType;
	private String password;
	private int locationID =1;

	
	
	public Employee(String lName, String fName, String emailId, String employeeType, String phoneNum, String password) throws NoSuchAlgorithmException 
	{
		this.emailId = emailId;
		this.fName = fName;
		this.lName = lName;
		this.setPassword(password);
		this.phoneNum  = phoneNum;
		this.EmployeeType = employeeType;
		
	}
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) throws NoSuchAlgorithmException { 
		this.password = new HashingSHA256().hashPassword(password);
	}

	public String getUserID() {
		return userId;
	}

	public void setUserID(String userID) {
		this.userId = userID;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailID) {
		this.emailId = emailID;
	}

	public String getPhoneNo() {
		return phoneNum;
	}

	/**
	 * @return the employeeType
	 */
	public String getEmployeeType() {
		return EmployeeType;
	}
	/**
	 * @param employeeType the employeeType to set
	 */
	public void setEmployeeType(String employeeType) {
		EmployeeType = employeeType;
	}
	
	/**
	 * @return the locationID
	 */
	public int getLocationID() {
		return locationID;
	}
	/**
	 * @param locationID the locationID to set
	 */
	public void setLocationID(int locationID) {
		this.locationID = locationID;
	}
	
	public void setPhoneNo(String phoneNum) {
		this.phoneNum = phoneNum;
	}
}