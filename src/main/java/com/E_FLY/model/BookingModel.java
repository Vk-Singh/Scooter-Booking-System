package com.E_FLY.model;

public class BookingModel {

	private String dropLocation;
	private String pickUpLocation;
	private double price;
	private String bookingDate;
	private String bookingStatus;
	private int userId;
	private int vehicleID;

public BookingModel(String dropLocation, String pickUpLocation,
		double price,
		String userId,
		String vehicleID,
		String bookingDate) {
	
	this.dropLocation = dropLocation;
	this.pickUpLocation = pickUpLocation;
	this.price = price;
	this.userId = Integer.parseInt(userId);
	this.vehicleID = Integer.parseInt(vehicleID);
	this.bookingDate = bookingDate;
}


/**
 * @return the dropLocation
 */
public String getDropLocation() {
	return dropLocation;
}

/**
 * @param dropLocation the dropLocation to set
 */
public void setDropLocation(String dropLocation) {
	this.dropLocation = dropLocation;
}

/**
 * @return the pickUpLocation
 */
public String getPickUpLocation() {
	return pickUpLocation;
}

/**
 * @param pickUpLocation the pickUpLocation to set
 */
public void setPickUpLocation(String pickUpLocation) {
	this.pickUpLocation = pickUpLocation;
}

/**
 * @return the price
 */
public double getPrice() {
	return price;
}

/**
 * @param price the price to set
 */
public void setPrice(double price) {
	this.price = price;
}

/**
 * @return the bookingDate
 */
public String getBookingDate() {
	return bookingDate;
}

/**
 * @param bookingDate the bookingDate to set
 */
public void setBookingDate(String bookingDate) {
	this.bookingDate = bookingDate;
}

/**
 * @return the bookingStatus
 */
public String getBookingStatus() {
	return bookingStatus;
}

/**
 * @param bookingStatus the bookingStatus to set
 */
public void setBookingStatus(String bookingStatus) {
	this.bookingStatus = bookingStatus;
}

/**
 * @return the userId
 */
public int getUserId() {
	return userId;
}

/**
 * @param userId the userId to set
 */
public void setUserId(int userId) {
	this.userId = userId;
}

/**
 * @return the vehicleID
 */
public int getVehicleID() {
	return vehicleID;
}

/**
 * @param vehicleID the vehicleID to set
 */
public void setVehicleID(int vehicleID) {
	this.vehicleID = vehicleID;
}

@Override
public String toString() {
	return "Booking [dropLocation=" + dropLocation + ", pickUpLocation=" + pickUpLocation + ", price=" + price
			+ ", bookingDate=" + bookingDate + ", bookingStatus=" + bookingStatus + ", userId=" + userId
			+ ", vehicleID=" + vehicleID + "]";
}

}