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


.float-container {
    border: 3px solid #fff;
    padding: 20px;
}

.float-container-object {
    width: 50%;
    float: left;
    padding: 20px;
   
}
.myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 20%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 20px;
  margin-up: 20px;
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


<%  if (session.getAttribute("sessionId") == null || session.getAttribute("userLoginStatus") == null)
	{
		response.sendRedirect("MainPage.jsp");
	}
%>
<div class="float-container">
	<div class="float-container-object">
	<table class = "table table-border table-responsive table-striped">
		<thead>
			<tr>
				<th>Booking ID</th>
				<th>Scooter Id</th>
				<th>Pickup Location</th>
				<th>Drop Location</th>
				<th>Total Price</th>
				<th>Date</th>
				<th>Booking Status</th>
			</tr>
		</thead>
		
				<%
			try{
				String PickUplocation ="";
				String Droplocation ="";
				double price = 0.0;
				int model =0;
				
				ResultSet rs = Common.getInstance().getResultSet("SELECT * FROM bookingDetails WHERE regID = " + (String)session.getAttribute("sessionId"));
				while(rs.next()){
					model = rs.getInt("bookingID");
					//System.out.println("Model = " + model);
					ResultSet rsLocation = Common.getInstance().getResultSet("SELECT * FROM locationDetails WHERE locationID = " + rs.getInt("pickUpLocation") );
					while(rsLocation.next()){
						PickUplocation = rsLocation.getString("AddressLine1");
						System.out.println("AddressLine1 = " + PickUplocation);
					}
					
					ResultSet rsLocation2 = Common.getInstance().getResultSet("SELECT * FROM locationDetails WHERE locationID = " + rs.getInt("dropLocation") );
					while(rsLocation2.next()){
						Droplocation = rsLocation2.getString("AddressLine1");
						//System.out.println("DropLocation = " + Droplocation);
					}
					%>
					<tbody>
						<tr>
							<td><%= rs.getInt("BookingID") %>
							<td><%= rs.getInt("vehicleID") %>
							<td>"<%=PickUplocation%>"</td>
							<td>"<%=Droplocation%>"</td>
							<td><%= rs.getDouble("Price") %></td>
							<td><%=rs.getString("bookingDate")%></td>
							<td><%= rs.getString("bookingStatus") %></td>					
						</tr>			
					</tbody>
					<% }
			}catch (Exception e){}
			%>
	
	</table>
	</div>
	
	<div class="float-container-object">
		<form action = "cancelBooking.jsp" method="post">
			<div>
				<h2>Cancel Booking</h2>
				<label>Booking ID</label>
				<input type="number" class = "myInput" id="RemoveBookingID" name="RemoveBookingID" required>
			</div>
			<div>
			<button type="submit" class="btn btn-success">Cancel Booking</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>