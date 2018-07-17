<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SPRING MVC MUSIC STORE ADMIN</title>

<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
 <script type="text/javascript"
	src="<c:url value='/static/js/upload.js'/>"></script> 
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>
<h1>Thank you for using our product, your product code is ${id} </h1>
</body>
</html>