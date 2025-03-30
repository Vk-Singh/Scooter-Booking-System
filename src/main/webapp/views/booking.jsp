<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "com.E_FLY.dao.Common" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
}

.myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 18%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>

</head>

<jsp:include page="../layout/navigationBar.html" />
<body>

<%-- --%>

<%  if (session.getAttribute("sessionId") == null || session.getAttribute("userLoginStatus") == null)
	{
		response.sendRedirect("MainPage.jsp");
	}
%>

	
	
	<h2>Bookings</h2>
	<form method="POST" action="booking.jsp">
	
 				<label>Booking Start Time</label>
 				<input type="datetime-local" id="timeapt"
       name="timeapt" class="myInput"
    	   min="2022-08-01T00:00" max="2025-06-14T00:00">
 	
		<select name = "InitialLocation" id = "InitialLocation" class = "myInput" required>
			<option>Pick up Location</option>
			<%
			try{
				ResultSet rs = Common.getInstance().getResultSet("SELECT * FROM locationDetails");
				while(rs.next()){
			%>
				<option value="<%=rs.getString("addressLine1")%>"><%=rs.getString("addressLine1")%></option>	
			<% }
			}catch (Exception e){}
			%>
		</select>
 	
		<select name = "FinalLocation" id = "FinalLocation" class="myInput" required>
			<option>Drop Location</option>
			<%
			try{
			
				ResultSet rs = Common.getInstance().getResultSet("SELECT * FROM locationDetails");
				while(rs.next()){
					%>
					<option id = "FinalLoc" value="<%=rs.getString("addressLine1")%>"><%=rs.getString("addressLine1")%></option>
				<% }
			}catch (Exception e){}
			%>
		</select>
		<input type="number" class = "myInput" id="numberOfHours" name="numberOfHours" min="1" max="6" required>
		<input type="submit" value="Submit" />
	</form>
	
	<table class = "table table-border table-responsive table-striped">
		<thead>
			<tr>
				<th>E-Scooter Id</th>
				<th>Pickup Location</th>
				<th>Drop Location</th>
				<th>Scooter Number Plate</th>
				<th>Price Per Hour</th>
				<th>Number Of hours</th>
				<th>Book</th>
			</tr>
		</thead>
		
				<%
			try{
				int locationID =-1;
				double price = 0.0;
				int model =0;
				ResultSet rsLocation = Common.getInstance().getResultSet("SELECT * FROM locationDetails WHERE addressLine1 = '" + request.getParameter("InitialLocation") + "'");
				while(rsLocation.next()){
					locationID = rsLocation.getInt("locationID");
				}
				//System.out.println("Location ID = " + locationID);
				ResultSet rs = Common.getInstance().getResultSet("SELECT * FROM vehicleDetails WHERE locationID = " + locationID + " && availabilityStatus = 1");
				while(rs.next()){
					model = rs.getInt("vehicleModel");
					//System.out.println("Model = " + model);
					ResultSet rsModel = Common.getInstance().getResultSet("SELECT * FROM vehicleModel WHERE vehicleModelID = " + model);
					while(rsModel.next()){
						//System.out.println("PRICE = " + price );
						price = rsModel.getDouble("pricePerHour");	
					}
					%>
					<tbody>
						<tr>
							<td><%= rs.getInt("vehicleID") %>
							<td>"<%=request.getParameter("InitialLocation")%>"</td>
							<td>"<%=request.getParameter("FinalLocation")%>"</td>
							<td><%= rs.getString("numberPlate") %></td>
							<td><%= price %></td>
							<td><%= request.getParameter("numberOfHours") %></td>
							<td>
								<a href="BookingSuccess.jsp?vehicleBookid=<%=rs.getInt("vehicleID")%>&vehicleDropLocation=<%=request.getParameter("FinalLocation")%>
								&vehicleBookingTime=<%=request.getParameter("timeapt")%>&numberOfHours=<%=request.getParameter("numberOfHours") %>
								&pricePerHour=<%=price%>&vehiclePickUpLocation=<%=request.getParameter("InitialLocation")%>">
									<button class="bookbtn" >book</button>
								</a>
							</td>
							
						</tr>			
					</tbody>
					<% }
			}catch (Exception e){}
			%>
			<tr>
	
			</tr>
		</thead>
	</table>
</body>
</html>