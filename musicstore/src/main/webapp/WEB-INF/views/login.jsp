<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

<script type="text/javascript">
	$(document).ready(function() {
		//global vars
		var form = $("#form");
		var username = $("#username");
		var password = $("#password");

		//On Submitting
		form.submit(function() {
			if (username.val().length == 0 && password.val().length == 0) {
				// alert('Please enter the username');
				$('#user_error').text('Please enter the username');
				$('#pass_error').text('Please enter the password');
				return false;
			} else {
				if (password.val().length == 0) {
					$('#pass_error').text('Please enter the password');
					return false;
				}
				if (username.val().length == 0) {
					$('#user_error').text('Please enter the username');
				} else
					return true;
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="Absolute-Center is-Responsive">
				<div id="logo-container"></div>
				<div class="col-sm-12 col-md-10 col-md-offset-1">
					<div class="logo"><h1 style="color: #5cb85c;"> <strong> Login  </strong></h2><hr /></div>
					<form class="form-horizontal" id="form" action="/musicstore/login"
						method="POST">
						<div class="form-group">
							<label for="username">Username</label> <input type="hidden"
								class="form-control" id="id" name="id" value="${user.id}">
							<input type="text" class="form-control " id="username"
								name="username" placeholder="Enter Username"> <span
								id="user_error" style="color: red"> </span>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="Enter Password"> <span id="pass_error"
								style="color: red"> <c:if test="${not empty error}">
									<div class="error" style="color: red">${error}</div>
								</c:if> <%-- <c:if test="${not empty msg}">
									<div class="msg" style="color: red">${msg}</div>
								</c:if> --%>
							</span>
						</div>
						<!-- <div class="checkbox">
							<label><input type="checkbox"> Remember me</label>
						</div> -->
						<button type="submit" class="btn btn-primary">Submit</button>
					</form><br>
					<div><a href="${pageContext.request.contextPath}/register" style="color:blue;">Register Account User</a></div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>