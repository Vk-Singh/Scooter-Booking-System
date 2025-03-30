<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.E_FLY.dao.Common" %>
<%@ page import = "com.E_FLY.dao.ScooterDetailsDao" %>
<%@ page import = "com.E_FLY.model.Vehicle" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%  if (session.getAttribute("sessionId") == null || session.getAttribute("loginAdminStatus") == null)
	{
		response.sendRedirect("MainPage.jsp");
	}else{


	String numberPlate = request.getParameter("numberPlate");
	String location = request.getParameter("location");
	
	Vehicle vh1 = new Vehicle(numberPlate, location);
	ScooterDetailsDao sc1 = new ScooterDetailsDao();
	sc1.addVehicle(vh1);
	response.sendRedirect("OperatorView.jsp");
	}

%>
</body>
</html>