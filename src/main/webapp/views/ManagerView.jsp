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

	
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	
	<link rel="stylesheet" href="../style.css">
    

     <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
     rel="stylesheet">
 	<title>ManagerPage</title>
</head>
<jsp:include page="../layout/employeeNavigationBar.html" />

<body>

<%  if (session.getAttribute("sessionId") == null || session.getAttribute("loginEmployeeStatus") == null)
	{
		response.sendRedirect("MainPage.jsp");
	}
%>

	
	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Dashboard</a>
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
					<% int income = 0;
							try{
								ResultSet rsIncome = Common.getInstance().getResultSet("SELECT SUM(Price) FROM bookingDetails");
							
							while(rsIncome.next()){
								income = rsIncome.getInt(1);
								}
							}catch (Exception e){}%>	
						<h3>£ <%=income %></h3>
						<p>Total Income</p>
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
						<h3>£ <%=income/6 %></h3>
						<p>Profit</p>
					</span>
				</li>
			</ul>


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
								<th>Price (£)</th>
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
								<td><%= rs.getDouble("Price") %></td>					
							</tr>
							<%} 
							
							}catch (Exception e){}
							%>
						</tbody>
					</table>
				</div>
</body>
</html>