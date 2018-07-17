<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SPRING MVC MUSIC STORE</title>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/Site.css' />" rel="stylesheet"></link>
<script type="text/javascript" src="<c:url value='/static/js/register.js'/>"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="row">
		<div class="panel panel-primary">
			<legend style="text-align:center;color: blue;">Register</legend>
			<p>
				<label for="" style="color: green;">Please enter your information below !. </label>
			</p>
			<div class="panel-body"  style="text-align:center;">

				<form:form class="col-md-12" modelAttribute="user"
					action="${pageContext.servletContext.contextPath}/registeruser"
					method="POST" id="form">
					<div class="form-group row"  >
						<label for="" class="col-md-2">Username</label>
						<div class="col-md-6" >
							<form:input class="form-control" path="username"
								placeholder="Enter Username" />
								<c:if
									test="${not empty error_username}">
									<div class="error" style="color: red">${error_username}</div>
								</c:if>
							<span id="username_error" style="color: red"></span>
							<form:errors path="username" style="color: red"></form:errors>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-2">Email Address</label>
						<div class="col-md-6">
							<form:input type="email" class="form-control" path="email"
								id="email" style="width: 300px" placeholder="Enter Address" />
							<span id="email_error" style="color: red"></span>
							<form:errors path="email" style="color: red"></form:errors>
						</div>
					</div>
					<div class="form-group row">
						<label for="" class="col-md-2">Password</label>
						<div class="col-md-6">
							<form:input type="password" class="form-control" path="password"
								id="password" placeholder="Enter Password" />
							<span id="password_error" style="color: red"></span>
							<form:errors path="password" style="color: red"></form:errors>
						</div>
					</div>
					<div class="form-group row">
						<label for="" class="col-md-2">Confirm Password</label>
						<div class="col-md-6">
							<form:input type="password" class="form-control"
								path="confirmpassword" id="confirmpassword"
								placeholder="Enter Confirm Password" />
							<span id="confirmpassword_error" style="color: red"> <c:if
									test="${not empty confirmpass}">
									<div class="error" style="color: red">${confirmpass}</div>
								</c:if>
							</span>
							<form:errors path="confirmpassword" style="color: red"></form:errors>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Register</button>
				</form:form>

			</div>
		</div>
	</div>
</body>
</html>