<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script> -->
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
	<div class="container">
	<!-- menus -->
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
	<!-- end menus -->
      <div class="row">
        <div class="page-header">
  		  <h1>Add Product</h1>
	    </div>
        <form:form class="form-horizontal" role="form" method="post" action="products" modelAttribute="product">
 		  <form:errors path="*" cssClass="errorblock" element="td" />
          <div class="form-group">
   			  <label for="id" class="col-sm-2 control-label">ID:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="id" class="form-control" id="id" placeholder="id" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="productName" class="col-sm-2 control-label">Product Name:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="productName" class="form-control" id="productName" placeholder="Product Name" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="description" class="col-sm-2 control-label">Product Name:</label>
    	    <div class="col-sm-3">
              <form:textarea type="text" rows="4" path="description" class="form-control" id="description" placeholder="Description" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="price" class="col-sm-2 control-label">Price:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="price" class="form-control" id="price" placeholder="" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="productType" class="col-sm-2 control-label">Product Type:</label>
    	    <div class="col-sm-3">
              <form:select path="productType" class="form-control" id="productType">
              				<option value="DINNER">DINNER</option>
							<option value="BREAKFAST" selected>BREAKFAST</option>
							<option value="LUNCH">LUNCH</option>
             </form:select>
            </div>
          </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary" id="register">Add Product</button>
          </div>
       </div>
	
     </form:form>
         
      </div><!-- end for class "row" -->
   </div><!-- end for class "container" -->		
</body>
</html>