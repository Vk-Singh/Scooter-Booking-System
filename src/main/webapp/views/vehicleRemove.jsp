<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.E_FLY.dao.Common" %>
<%@ page import = "com.E_FLY.dao.ScooterDetailsDao" %>
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

	int vehicleID = Integer.parseInt(request.getParameter("vehicleID"));
	ScooterDetailsDao sc1 = new ScooterDetailsDao();
	sc1.removeVehicle(vehicleID);
	response.sendRedirect("OperatorView.jsp");
	}
	%>
</body>
</html>