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

<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/Site.css' />" rel="stylesheet"></link>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="row">
		<div class="col-md-12">
			<%-- <jsp:include page="_menu.jsp"></jsp:include> --%>
			<div class="panel-group">
				<div class="panel panel-info">
					<div class="panel panel-heading ">

						<p>
						<h2>Shipping Information</h2>
						<label for="">Please enter information below . 
						</label>
						</p>
					</div>
					<div class="panel "></div>
					<div class="panel panel-body ">

						<form:form commandName="order" 
							action="${pageContext.request.contextPath}/addShippinginfo"
							class="col-md-12" method="POST">
							<div class="form-group row">
								<label class="col-md-2">Username </label>
								<div class="col-md-6">
									<form:input path="userName" class="form-control" style="width: 300px" value ="${user}"/>
									<%-- <form:input path="userName" class="form-control" style="width: 300px"></form:label> --%>
									<%-- <form:input class="form-control" 
										 path="userName" placeholder="Enter Username"/> --%>
										 <form:errors path="userName" style="color:red;"></form:errors>
								</div>
							</div>

								<div class="form-group row">
									<label for="address" class="col-md-2">Address</label>
									<div class="col-md-4">
										<form:input path="address" class="form-control" placeholder="Enter Address" />
										<form:errors path="address" style="color:red;"></form:errors>
									</div>
								</div>
							<div class="form-group row">
								<label for="phone" class="col-md-2">Phone</label>
								<div class="col-md-4">
									<form:input type="number" class="form-control" id="phone" style="width: 300px"
										path="phone" placeholder="Enter Phone"/>
										<form:errors path="phone" style="color:red;"></form:errors>
								</div>
							</div>
							<div class="form-group row">
								<label for="email" class="col-md-2">Email Address</label>
								<div class="col-md-4">
									<form:input type="email" class="form-control" id="email" style="width: 300px"
										path="email" placeholder="Enter Email Address"/>
										<form:errors path="email" style="color:red;"></form:errors>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="" class="col-md-2">Total</label>
								<div class="col-md-4">
								<c:set var="s" value="0"></c:set>
								<c:forEach var="in" items="${sessionScope.cart}">
							 <c:set var="s" value="${s+in.album.getPrice()*in.getCount() }"></c:set>
							 </c:forEach>
							 		<form:label path="total" class="form-control" style="width: 300px">${s}</form:label>
									<%-- <form:lable class="form-control"  style="width: 300px"
										path="total" value="${s}"/> --%>
										<%-- <form:errors path="total"></form:errors> --%>
								</div>
							</div>
							
							<!-- <div class=""> -->
								<button type="submit" class="btn btn-primary">Submit
									Order</button>
							<!-- </div> -->
							<!--<div class="panel panel-group">
								<legend>Payment</legend>
								
							</div>
							 <div class="panel panel-body">

								<p>We're running a promotion: all music is free with the
									promo code "FREE"</p>
								<label for="phone" class="col-md-2">Phone</label>
								<div class="col-md-4">
									<input type="number" class="form-control" id="phone"
										placeholder="Enter Phone">
								</div> -->


							<!-- </div> -->
						</form:form>

					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</body>
</html>