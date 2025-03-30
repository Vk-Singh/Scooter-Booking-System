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
	    

<jsp:include page="../layout/employeeNavigationBar.html" />
<body>


  <div class="container" align="Left">
	<div class ="row" align="center">
		   
    	<div class="column">
      			
		<form action="registerEmployee" method="post">
			<div class="form-group">
				<h2>Employee Registration</h2>
			</div>		
			<div class="form-group">
				<label>First Name</label>
				<input type="text" id="fName" class="form-control" id= "fName" name="fName" required> 	
			</div>  
  			  
  			 <div class="form-group">
				<label>Last Name</label>
				<input type="text" id="lName" class="form-control" id= "lName" name="lName" required> 	
			</div>  
			
			<div class="form-group">
				<label>EMAIL ID</label>
				<input type="email" id="email" class="form-control" id= "emailId" name="emailId"  required> 	
			</div>  
			 
  			<div class="form-group">
				<label>PASSWORD</label>
				<input type="password" id="password" class="form-control" id= "password" name="password" required> 	
			</div>
			
			 <div class="form-group">
				<label>Employee Type (Use "Admin" or "Manager")</label>
				<input type="text" id="employeeType" class="form-control" id= "employeeType" name="employeeType" placeholder = "Admin/Manager" required> 	
			</div>  
			
			
			<div class="form-group">
				<label>Contact Number</label>
				<input type="tel" id="phoneNum" class="form-control" id= "phoneNum" name="phoneNum"  maxlength="10"required>
			</div>
			  			
 			<div class="form-group">
 			<button type="submit" class="btn btn-success">Submit</button>
 			</div> 
		</form>
		</div>
		 <div class="column">
      			<img src="../escoot.png"  alt="Test" style="width:80%">
    	</div>
	</div>
</div>

</body>
</html>