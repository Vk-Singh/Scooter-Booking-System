package com.E_FLY.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.E_FLY.common.InputVariables;
import com.E_FLY.model.Vehicle;

public class ScooterDetailsDao {
	
	private Connection con;
	
	public ScooterDetailsDao() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(InputVariables.getInstance().getDbConn(), InputVariables.getInstance().getAppDBUserName(), InputVariables.getInstance().getAppDBPass());
	}
	 
	public String addVehicle(Vehicle vehicle) {
		String result = "fail";
		Date bookingDate = new Date(System.currentTimeMillis());
		String INSERT_USERS_SQL = "INSERT INTO vehicleDetails (numberPlate, homeLocation, availabilityStatus,lastRepairedDate,vehicleModel,locationID) VALUES " +
	            " (?, ?, ?, ?, ?,?);";
		try 
		{
						
			PreparedStatement  st = con.prepareStatement(INSERT_USERS_SQL);	
			
			st.setString(1, vehicle.getNumberPlate());
			st.setString(2, vehicle.getHomeLocation());
			st.setInt(3, vehicle.getAvailabilityStatus());
			st.setDate(4, bookingDate);
			st.setInt(5, vehicle.getVehicleModel());	
			st.setInt(6, getLocationID(vehicle.getHomeLocation()));

			
			st.executeUpdate();
			result = "pass";
			
		}catch(Exception e) 
		{
			System.out.println(e.getStackTrace());
			result = e.getMessage();
		}
		return result;
	}
	
	public int getLocationID(String location) {
		int locationID = 0;
		ResultSet rsLocation = Common.getInstance().getResultSet("SELECT * FROM locationDetails WHERE addressLine1 = '" + location + "'");
		try {
			while(rsLocation.next()){
				locationID = rsLocation.getInt("locationID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return locationID;	
	}

	public void removeVehicle(int vehicleID) {
		
		System.out.println("VEHICLE IDDDD = " + vehicleID);
		try {
			PreparedStatement  st1 = con.prepareStatement("UPDATE vehicleDetails SET availabilityStatus = 3 WHERE vehicleID = " + "?");
			st1.setInt(1, vehicleID );
			st1.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
