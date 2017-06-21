<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>

<html lang="en">
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<head>
<title>Welcome page</title>
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
	<br />
	<br />
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

		<h1 align="center">Product List</h1>

		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<th>Product Name</th>
				<th>Description</th>
				<th>Price</th>
				<th>Product Type</th>
				<th>Action</th>
			</tr>
			<c:forEach var="product" items="${products}">
				<tr>
					<td>${product.id}</td>
					<td>${product.productName}</td>
					<td>${product.description}</td>
					<td>${product.price}</td>
					<td>${product.productType}</td>
					<td>
						<%-- <security:authorize access="hasRole('ADMIN')">	
						<form action="/deleteproduct/${product.id}" method="post">
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<a href="${path}/products/${product.id}"> <input
										type="button" class="btn btn-primary" id="edit" value="Edit"></a>
									<input type="submit" class="btn btn-danger" id="delete"
										value="Delete" />
								</div>
							</div>
						</form>
						</security:authorize> --%>
					<%-- <security:authorize access="hasRole('USER')">	 --%>
					<form action="/deleteproduct/${product.id}" method="post">
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<a href="${path}/products/${product.id}"> <input
										type="button" class="btn btn-primary" id="edit" value="Order Now"></a>
								</div>
							</div>
						</form>
						<%-- </security:authorize> --%>
					</td>
				</tr>
			</c:forEach>
		</table>
		<a href="${path}/addProduct"> Add Product</a>
	</div>
</body>
</html>