<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.E_FLY.dao.Common" %>
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
		response.sendRedirect("loginPage.html");
	}
%>
<%
BookingDetailsDao dao = new BookingDetailsDao();
if (request.getParameter("RemoveBookingID") != null){
	int bookingID = Integer.parseInt(request.getParameter("RemoveBookingID"));
	//System.out.println("CANCEL BOOKING ID = " + bookingID);
	dao.cancelBooking(bookingID);
	response.sendRedirect("viewBooking.jsp");

}%>



</body>
</html>