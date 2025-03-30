<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.E_FLY.dao.Common" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
	    
<title>Main Page</title>

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

<jsp:include page="../layout/loginNavigationBar.html" />



<body>


<div class="float-container">
	<div class="float-container-object">
		<p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2233.8484841947898!2d-3.192174884216924!3d55.951997980607075!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4887c78fbc266833%3A0x9947329ba2a64fe4!2sEdinburgh%20Waverley!5e0!3m2!1sen!2suk!4v1653509441632!5m2!1sen!2suk" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</p>
	</div>
	
	<div class="float-container-object">
		<div class="form-group">
 			<a class="btn btn-success" href= "registrationCustomer.jsp">User Registration</a>
 		</div>
		<div class="form-group">
 			<a  class="btn btn-success" href = customerLogin.jsp>User Login</a>
 		</div> 
 		<div class="form-group">
 			<a class="btn btn-success" href= "employeeLogin.jsp">Employee Login</a>
 		</div>		 
	</div>
</div>

</body>

</html>