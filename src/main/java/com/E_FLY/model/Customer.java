package com.E_FLY.model;

import java.security.NoSuchAlgorithmException;

public class Customer {

	private String userId;
	private String lName;
	private String fName;
	private String emailId;
	private String phoneNum;
	private String licenseNum;
	private String dob;
	private String password;

	
	public Customer(String lName, String fName, String emailId, String phoneNum, String licenseNum, String dob, String password) throws NoSuchAlgorithmException 
	{
		this.emailId = emailId;
		this.fName = fName;
		this.lName = lName;
		this.dob = dob;
		this.licenseNum = licenseNum;
		this.setPassword(password);
		this.phoneNum  = phoneNum;
		
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

	public void setPhoneNo(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getLicenseNum() {
		return licenseNum;
	}

	public void setLicenseNum(String licenseNum) {
		this.licenseNum = licenseNum;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	
}