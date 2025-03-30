<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.E_FLY.dao.Common" %>
<%@ page import = "com.E_FLY.model.BookingModel" %>
<%@ page import = "com.E_FLY.dao.BookingDetailsDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<jsp:include page="../layout/navigationBar.html" />

<body>

<%  if (session.getAttribute("sessionId") == null || session.getAttribute("userLoginStatus") == null)
	{
		response.sendRedirect("MainPage.jsp");
	}else{
	
		//System.out.println("BOOKING TIME" + request.getParameter("vehicleBookingTime"));
	double price = Float.parseFloat(request.getParameter("numberOfHours"))*Float.parseFloat(request.getParameter("pricePerHour"));
	String userID = (String)session.getAttribute("sessionId");
	String vehicleBookId= request.getParameter("vehicleBookid");
	
	BookingModel bm = new BookingModel(request.getParameter("vehicleDropLocation"), request.getParameter("vehiclePickUpLocation"),
			price, userID, vehicleBookId, request.getParameter("vehicleBookingTime"));
	
	
	BookingDetailsDao dao = new BookingDetailsDao();
	dao.addBooking(bm);
	
	session.setAttribute("BookingStatus", "booked");
	response.sendRedirect("homePage.jsp");
	}
%>
</body>
</html>