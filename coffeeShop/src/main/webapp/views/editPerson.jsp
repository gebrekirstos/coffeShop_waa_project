<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a Book</title>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<br/> <br/>
	<div class="container">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">CoffeShope</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Persons</a></li>
				<li><a href="#">Products</a></li>
				<li><a href="#">Orders</a></li>
			</ul>
		</div>
	</nav>
	<h1 align="center">Edit Persons!</h1>
	<form action="/persons/update/${person.id}" method="post">
	<table class="table table-striped">
		<tr>
			<td>ID:</td>
			<td><input type="text" name="id" value="${person.id}" /> </td>
		</tr>
		<tr>
			<td>First Name:</td>
			<td><input type="text" name="firstName" value="${person.firstName}" /> </td>
		</tr>
		<tr>
			<td>Last Name:</td>
			<td><input type="text" name="lastName" value="${person.lastName}" /> </td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><input type="text" name="email" value="${person.email}" /> </td>
		</tr>
		<tr>
			<td>Phone:</td>
			<td><input type="text" name="phone" value="${person.phone}" /> </td>
		</tr>
		<tr>
			<td>Enable:</td>
			<td><input type="text" name="enable" value="${person.enable}" /> </td>
		</tr>
	</table>
	<input type="submit" value="update"/>
	</form>
	<form action="persons/delete/${person.id}" method="post">
		<button type="submit" class="btn btn-primary">Delete</button>
	</form>
	</div>
</body>
</html>