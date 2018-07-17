<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SPRING MVC MUSIC STORE</title>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/Site.css' />" rel="stylesheet"></link>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="col-md-12">
		<jsp:include page="_menu.jsp"></jsp:include>
		<div id="main" class="col-md-10">
			<div class="album-genre">
			<%-- modelAttribute="myCart"  commandName="Cart" --%>
				 <form method="POST" action="/musicstore/shippinginformation" > 
					
				<h4><i>Review your cart</i></h4>
				<a href="${pageContext.request.contextPath}" class="btn btn-primary">Back Home</a>
					<table>
						<tbody>
						<h2>The Cart of you is empty . Please add new product to checkout . </h2>
						</tbody>
					</table>
					<br />
				 </form>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="_footer.jsp"></jsp:include> --%>
</body>
</html>