<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.E_FLY.dao.Common" %>
<!DOCTYPE html>

<html>

<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<style>
.alert {
  padding: 20px;
  background-color: #008000;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
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
}
</style>
</head>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<jsp:include page="../layout/navigationBar.html" />



<body>

<%-- --%>

<%  if (session.getAttribute("sessionId") == null)
	{
		response.sendRedirect("MainPage.jsp");
	}else if (null !=  session.getAttribute("loginBanner")){
		String loginBanner= (String)session.getAttribute("loginBanner");
		if (loginBanner.compareTo("True") == 0){
			%>
				<div class="alert">
		 		<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
		  		<strong>Congratulations!</strong> Login Successful.
				</div>
		<%
		}session.setAttribute("loginBanner", "FALSE");
	}else{response.sendRedirect("MainPage.jsp");}
%>


<% 
if (session.getAttribute("BookingStatus") != null){
	String bookingStatus = (String)session.getAttribute("BookingStatus");
	System.out.println("IN IFFFF = " + bookingStatus.compareTo("booked"));
	if (bookingStatus.compareTo("booked") == 0)
		{System.out.println("IN ");
		
		%>
		<div class="alert">
	  	<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
	  	<strong>Congratulations!</strong> Booking Successful.
		</div>

		<% session.setAttribute("BookingStatus", "2");
		}
	} 
%>



<div class="float-container">
	<div class="float-container-object">
		<p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2233.8484841947898!2d-3.192174884216924!3d55.951997980607075!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4887c78fbc266833%3A0x9947329ba2a64fe4!2sEdinburgh%20Waverley!5e0!3m2!1sen!2suk!4v1653509441632!5m2!1sen!2suk" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</p>
	</div>
	
	<div class="float-container-object">
	<form action = "booking.jsp?" method="post">
		<h2>Select Location</h2>
		<div>
		<label>Pick Up Location</label>
		<select name = "InitialLocation">
			<option>Pick Up Location</option>
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
		</div>
		<div>
		<label>Drop Off ID</label>
		<select name = "FinalLocation">
			<option>Drop Location</option>
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
		</div>
			<div>
				<label>number of Hours</label>
				<input type="number" id="numberOfHours" name="numberOfHours" min="1" max="6" required>
 			</div>
 			<div>
 				<label>Booking Start Time</label>
 				<input type="datetime-local" id="timeapt"
       name="timeapt"
       min="2022-08-01T00:00" max="2025-06-14T00:00">
 			</div>
 			<div>
 			<button type="submit" class="btn btn-success">Submit</button>
 			</div>
	</form>
	</div>
</div>

</body>

</html>