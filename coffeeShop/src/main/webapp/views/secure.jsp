<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>You are in!</title>
</head>
<body><h1>You made it!</h1>
<security:authorize access="hasRole('ADMIN')">
<a href="<c:url value="/persons" />"> Person </a> |
<a href="<c:url value="/products" />"> Product </a> |
<a href="<c:url value="/orders" />"> Orders </a> |
</security:authorize>
<security:authorize access="hasRole('USER')">
<a href="<c:url value="/products" />"> Product </a> |
<a href="<c:url value="/orders" />"> Orders </a> |
</security:authorize>
<a href="<c:url value="/logout" />"> Now logout </a>


</body>
</html>