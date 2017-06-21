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
	<h1 align="center">Edit Product!</h1>
	<form:form action="/products/update/${product.id}" method="post" modelAttribute="product">
	<form:errors path="*" cssClass="errorblock" element="td" />
	<table class="table table-striped">
		<tr>
			<td>ID:</td>
			<td><form:input type="text" path="id" value="${product.id}" /> </td>
			<td><form:errors path="id" cssClass="error" /></td>
		</tr>
		<tr>
			<td>Product Name:</td>
			<td><form:input type="text" path="productName" value="${product.productName}" /> </td>
			<td><form:errors path="productName" cssClass="error" /></td>
		</tr>
		<tr>
			<td>Description:</td>
			<td><form:textarea rows="3" cols="30" path="description" value="${product.description}" /> </td>
			<td><form:errors path="description" cssClass="error" /></td>
		</tr>
		<tr>
			<td>Price:</td>
			<td><form:input type="text" path="price" value="${product.price}" /> </td>
			<td><form:errors path="price" cssClass="error" /></td>
		</tr>
		<tr>
			<td>Product Type:</td>
			<td><form:select path="productType" value="${product.productType}">
							<option value="DINNER">DINNER</option>
							<option value="BREAKFAST" selected>BREAKFAST</option>
							<option value="LUNCH">LUNCH</option>
						</form:select></td>
			<%-- <td><form:input type="text" path="productType" value="${product.productType}" /> </td> --%>
			<td><form:errors path="productType" cssClass="error" /></td>
		</tr>
	</table>
	<input type="submit" value="update"/>
	</form:form>
	<%-- <form action="products/delete/${person.id}" method="post">
		<button type="submit" class="btn btn-primary">Delete</button>
	</form> --%>
	</div>
</body>
</html>