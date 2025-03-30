package com.E_FLY.model;

public class Vehicle {

	private String numberPlate;
	private String homeLocation;
	private int availabilityStatus = 1;
	private String lastRepairedDate = "2022-06-22";
	private int vehicleModel = 2;
	private int locationID;


public Vehicle(String numberPlate,String homeLocation) {
	this.numberPlate = numberPlate;
	this.homeLocation = homeLocation;
}


/**
 * @return the numberPlate
 */
public String getNumberPlate() {
	return numberPlate;
}


/**
 * @param numberPlate the numberPlate to set
 */
public void setNumberPlate(String numberPlate) {
	this.numberPlate = numberPlate;
}


/**
 * @return the homeLocation
 */
public String getHomeLocation() {
	return homeLocation;
}


/**
 * @param homeLocation the homeLocation to set
 */
public void setHomeLocation(String homeLocation) {
	this.homeLocation = homeLocation;
}


/**
 * @return the availabilityStatus
 */
public int getAvailabilityStatus() {
	return availabilityStatus;
}


/**
 * @param availabilityStatus the availabilityStatus to set
 */
public void setAvailabilityStatus(int availabilityStatus) {
	this.availabilityStatus = availabilityStatus;
}


/**
 * @return the lastRepairedDate
 */
public String getLastRepairedDate() {
	return lastRepairedDate;
}


/**
 * @param lastRepairedDate the lastRepairedDate to set
 */
public void setLastRepairedDate(String lastRepairedDate) {
	this.lastRepairedDate = lastRepairedDate;
}


/**
 * @return the vehicleModel
 */
public int getVehicleModel() {
	return vehicleModel;
}


/**
 * @param vehicleModel the vehicleModel to set
 */
public void setVehicleModel(int vehicleModel) {
	this.vehicleModel = vehicleModel;
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



}

