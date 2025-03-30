<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <link rel="stylesheet" href="css/style.css">
	
	
<jsp:include page="../layout/operatorNavigationBar.html" />
<body>

<%  if (session.getAttribute("sessionId") == null || session.getAttribute("loginAdminStatus") == null)
	{
		response.sendRedirect("MainPage.jsp");
	}
%>
<div class="container" align="left">
		<div >
			<form action="vehicleAdd.jsp" method="post">
			<div class="form-group">
				<h2>Vehicle Addition</h2>
			</div>		
				<div class="form-group">
					<label>Vehicle Number Plate</label>
					<input type="text" id="numberPlate" class="form-control" id= "numberPlate" name="numberPlate" required> 	
				</div>  
  			  
  			 	<div class="form-group">
					<label>Home Location</label>
					<input type="text" id="location" class="form-control" id= "location" name="location" required> 	
				</div>  	  			
 				<div class="form-group">
 				<button type="submit" class="btn btn-success">Submit</button>
 				</div> 
			</form>
		</div>
		
		<div >
			<form action="vehicleRemove.jsp" method="post">
			<div class="form-group">
				<h2>Remove Vehicle</h2>
			</div>		
				<div class="form-group">
					<label>Vehicle ID</label>
					<input type="text" id="vehicleID" class="form-control" id= "vehicleID" name="vehicleID" required> 	
				</div>  
  			  
  			 	<div class="form-group">
 					<button type="submit" class="btn btn-success">Submit</button>
 				</div> 
			</form>
		</div>
</div>
</body>
</html>