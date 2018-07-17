
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
<link href="<c:url value='/static/css/Site.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
</head>
<body class="no-skin">
	<div class="row">
		<nav class="navbar navbar-inverse" role="navigation" id="navbarhead">
			<div>
				<div class="navbar-header">
					<a class="navbar-brand"
						href="${pageContext.servletContext.contextPath}"><span><img
							src="<c:url value='/static/images/logo.png'/>"></span>Spring MVC
						MUSIC STORE</a>
				</div>

				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${pageContext.servletContext.contextPath}">Home</a></li>


						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/admin/album-list">Manager
							</a></li>
						</sec:authorize>

						<sec:authorize access="isAnonymous()">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value='/login'/>">Login </a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/register">Register
							</a></li>
						</sec:authorize>
						<!-- style="display: none" -->
						<li><a href="${pageContext.request.contextPath}/review-album">Cart(<strong
								value="0">${sessionScope.cart!=null?sessionScope.cart.size():0}</strong>)
						</a></li>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/logout">Logout </a></li>

						</sec:authorize>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
		</nav>
	</div>
</body>
</html>
