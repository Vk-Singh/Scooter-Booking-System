<!-- GUI Reference: https://github.com/fajarnurwahid/adminhub/blob/master/index.html-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.E_FLY.dao.Common" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../style.css">
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
   
	<title>AdminPage</title>
</head>

<jsp:include page="../layout/operatorNavigationBar.html" />

<body>


<%  if (session.getAttribute("sessionId") == null || session.getAttribute("loginAdminStatus") == null)
	{
		response.sendRedirect("MainPage.jsp");
	}
%>

	<!-- CONTENT -->
	<section id="content">
		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Operator Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Operator Dashboard</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Home</a>
						</li>
					</ul>
				</div>
			</div>

			<ul class="box-info">
				<li>
					<i class='bx bxs-calendar-check' ></i>
					<span class="text">
					<% int numberOfEmployees = 0;
							try{
								ResultSet rsEmployee = Common.getInstance().getResultSet("SELECT COUNT(*) FROM employeeDetails");
							
							while(rsEmployee.next()){
								numberOfEmployees = rsEmployee.getInt(1);
								}
							}catch (Exception e){}%>
							
						<h3><%= numberOfEmployees%></h3>
						<p>Total Employees</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<% int numberOfCustomers = 0;
							try{
								ResultSet rsCustomer = Common.getInstance().getResultSet("SELECT COUNT(*) FROM userdetails");
							
							while(rsCustomer.next()){
								numberOfCustomers = rsCustomer.getInt(1);
								}
							}catch (Exception e){}%>
							
					
						<h3><%=numberOfCustomers %></h3>
						<p>Total Customers</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle' ></i>
					<span class="text">
					<% int numberOfVehicles = 0;
							try{
								ResultSet rsVehicle = Common.getInstance().getResultSet("SELECT COUNT(*) FROM vehicleDetails");
							
							while(rsVehicle.next()){
								numberOfVehicles = rsVehicle.getInt(1);
								}
							}catch (Exception e){}%>
							
						<h3><%= numberOfVehicles%></h3>
						<p>Total Vehicles</p>
					</span>
				</li>
			</ul>

			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Vehicles</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>Vehicle ID</th>
								<th>Number Plate</th>
								<th>Vehicle Home Base</th>
								<th>Pickup Location</th>
								<th>Vehicle Status</th>
                                </tr>
						</thead>
						<tbody>
							<% 
							try{
								String PickUplocation ="";
								ResultSet rs = Common.getInstance().getResultSet("SELECT * FROM vehicleDetails ");
							
							while(rs.next()){
								ResultSet rsLocation = Common.getInstance().getResultSet("SELECT * FROM locationDetails WHERE locationID = " + rs.getInt("LocationID") );
								while(rsLocation.next()){
									PickUplocation = rsLocation.getString("AddressLine1");
									System.out.println("AddressLine1 = " + PickUplocation);
								}
								
								%>
							<tr>
								<td><%= rs.getInt("vehicleID") %>
								<td><%= rs.getString("numberPlate") %></td>
								<td><%= rs.getString("homeLocation") %></td>
								<td>"<%=PickUplocation%>"</td>
								<td><%= rs.getInt("AvailabilityStatus") %></td>
							</tr>
							<%} 
							
							}catch (Exception e){}
							%>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Recent Bookings</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>Booking ID</th>
								<th>Vehicle ID</th>
								<th>Pickup Location</th>
                                <th>Drop Location</th>
							</tr>
						</thead>
						<tbody>
							<% 
							try{
								String PickUplocation ="";
								String Droplocation ="";
								ResultSet rs = Common.getInstance().getResultSet("SELECT * FROM bookingDetails ");
							
							while(rs.next()){
								ResultSet rsLocation = Common.getInstance().getResultSet("SELECT * FROM locationDetails WHERE locationID = " + rs.getInt("pickUpLocation") );
								while(rsLocation.next()){
									PickUplocation = rsLocation.getString("AddressLine1");
									System.out.println("AddressLine1 = " + PickUplocation);
								}
								
								ResultSet rsLocation2 = Common.getInstance().getResultSet("SELECT * FROM locationDetails WHERE locationID = " + rs.getInt("dropLocation") );
								while(rsLocation2.next()){
									Droplocation = rsLocation2.getString("AddressLine1");
									System.out.println("DropLocation = " + Droplocation);
								}
							%>
							<tr>
								<td><%= rs.getInt("BookingID") %>
								<td><%= rs.getInt("vehicleID") %>
								<td>"<%=PickUplocation%>"</td>
								<td>"<%=Droplocation%>"</td>				
							</tr>
							<%} 
							
							}catch (Exception e){}
							%>
						</tbody>
					</table>
				</div>
			</div>
		
</body>
</html>