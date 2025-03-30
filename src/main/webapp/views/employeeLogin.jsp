<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<script src="https://ajax.google.apis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"></script>
</head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<jsp:include page="../layout/employeeNavigationBar.html" />

<body>
<div class="container">
	<div class ="row">
		<div>
		<form action="employeeLogin" method="post">
			<div class="form-group">
				<h2>Employee Login</h2>
			</div>			
			<div class="form-group">
				<label>EMAIL ID</label>
				<input type="email" id="email" class="form-control" id= "emailId" name="emailId" placeholder="EMAIL ID" required> 	
			</div>  
  			  
  			<div class="form-group">
				<label>PASSWORD</label>
				<input type="password" id="password" class="form-control" id= "password" name="password" placeholder="Password" required> 	
			</div>
			
 			<div class="form-group">
				<label>Employee Type</label>
				<input type="text" id="employeeType" class="form-control" id= "employeeType" name="employeeType" required> 	
			</div>
			
 			<div class="form-group">
 			<button type="submit" class="btn btn-success">Submit</button>
 			</div> 
  
		</form>
		</div>
	</div>
</div>
</body>
</html>