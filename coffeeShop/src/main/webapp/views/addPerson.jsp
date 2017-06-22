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
					<li> <a href="<c:url value="/logout" />"> Now logout </a> </li>
				</ul>
			</div>
		</nav>
	<!-- end menus -->
      <div class="row">
        <div class="page-header">
  		  <h1>Add Person</h1>
	    </div>
        <form:form class="form-horizontal" role="form" method="post" action="persons" modelAttribute="person">
 		  <form:errors path="*" cssClass="errorblock" element="td" />
          <div class="form-group">
   			  <label for="firstName" class="col-sm-2 control-label">First Name:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="firstName" class="form-control" id="firstName" placeholder="First Name" />
              <form:errors path="firstName" cssClass="error" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="lastName" class="col-sm-2 control-label">Last Name:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="lastName" class="form-control" id="lastName" placeholder="Last Name" />
            	<form:errors path="lastName" cssClass="error" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="email" class="col-sm-2 control-label">Email:</label>
    	    <div class="col-sm-3">
              <form:input type="email" path="email" class="form-control" id="email" placeholder="Email" />
            	<form:errors path="email" cssClass="error" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="phone" class="col-sm-2 control-label">Phone:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="phone" class="form-control" id="phone" placeholder="Phone" />
            	<form:errors path="phone" cssClass="error" />
            </div>
          </div>
          
           <div class="form-group">
   			  <label for="city" class="col-sm-2 control-label">City:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="address.city" class="form-control" id="city" placeholder="City" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="state" class="col-sm-2 control-label">State:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="address.state" class="form-control" id="state" placeholder="State" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="country" class="col-sm-2 control-label">Country:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="address.country" class="form-control" id="country" placeholder="Country" />
            </div>
          </div>
          
          <div class="form-group">
   			  <label for="zipcode" class="col-sm-2 control-label">City:</label>
    	    <div class="col-sm-3">
              <form:input type="text" path="address.zipcode" class="form-control" id="zipcode" placeholder="Zipcode" />
            </div>
          </div>
          
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" id="register" value="Add Person" />
          </div>
       </div>
	
     </form:form>
         
      </div><!-- end for class "row" -->
   </div><!-- end for class "container" -->		
</body>
</html>