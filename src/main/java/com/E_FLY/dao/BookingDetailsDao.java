package com.E_FLY.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.E_FLY.common.InputVariables;
import com.E_FLY.model.BookingModel;

public class BookingDetailsDao {

private Connection con;
	
	public BookingDetailsDao() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(InputVariables.getInstance().getDbConn(), InputVariables.getInstance().getAppDBUserName(), InputVariables.getInstance().getAppDBPass());
	}

public void addBooking(BookingModel booking) {
		
	
	java.util.Date d = null;
	try {
		d = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm").parse(booking.getBookingDate());
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} // This throws a ParseException
	
	// Rest everything stays pretty much the same
	Timestamp d1 = new java.sql.Timestamp(d.getTime());
	int pickUpLoc = getLocationID(booking.getPickUpLocation());
	int dropOffLoc = getLocationID(booking.getDropLocation());
	
	
	String INSERT_Booking_SQL = "INSERT INTO bookingDetails" + 
					" (dropLocation, pickUpLocation, Price, bookingDate, bookingStatus, RegId, VehicleID) VALUES "
					+ "(?, ?, ?, ?, ?, ?, ?)";
	try {
	PreparedStatement  st = con.prepareStatement(INSERT_Booking_SQL);	
		
		st.setInt(1, dropOffLoc);
		st.setInt(2, pickUpLoc);
		st.setDouble(3, booking.getPrice());
		st.setTimestamp(4, d1);	
		st.setString(5, "Booked");
		st.setInt(6, booking.getUserId());
		st.setInt(7, booking.getVehicleID());
		System.out.println("STATEMENT = " + st);
		st.executeUpdate();
		}catch(Exception e) 
		{	e.printStackTrace();
			System.out.println(e.getStackTrace());
		}
	
	try {
		PreparedStatement  st1 = con.prepareStatement("UPDATE vehicleDetails SET availabilityStatus = 2 WHERE vehicleID = " + "?");
		st1.setInt(1, booking.getVehicleID());
		st1.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
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

public int getvehicleID(int bookingID) {
	int vehicleID = 0;
	ResultSet rsLocation = Common.getInstance().getResultSet("SELECT * FROM bookingDetails WHERE bookingID = " + bookingID );
	try {
		while(rsLocation.next()){
			vehicleID = rsLocation.getInt("vehicleID");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return vehicleID;	
}
public void cancelBooking(int bookingID) {
	int vehicleID = getvehicleID(bookingID);
	//System.out.println("VEHICLE IDDDD = " + vehicleID);
	try {
		PreparedStatement  st1 = con.prepareStatement("UPDATE vehicleDetails SET availabilityStatus = 1 WHERE vehicleID = " + "?");
		st1.setInt(1, vehicleID );
		st1.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	try {
		PreparedStatement  st1 = con.prepareStatement("UPDATE bookingDetails SET bookingStatus = 'Cancelled' WHERE bookingID = " + "?" 
	+"&& bookingStatus = 'Booked'");
		st1.setInt(1, bookingID );
		st1.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

}
