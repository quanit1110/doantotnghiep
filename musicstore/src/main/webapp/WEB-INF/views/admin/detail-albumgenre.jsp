<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SPRING MVC MUSIC STORE ADMIN</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>

<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-2.1.1.js'/>"></script>

</head>
<body>
<div class="container-fluid">
		<div class="row">
			<nav class="navbar navbar-default" role="navigation" id="navbarhead">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#"><span><img
								src="<c:url value='/static/images/logo.png'/>"></span>Spring MVC
							MUSIC STORE</a>
					</div>
					<div class="collapse navbar-collapse navbar-ex1-collapse">
						<ul class="nav navbar-nav navbar-right">

							<li><a href="<c:url value="/logout" />">Logout</a></li>
							<%-- <a href='<spring:url value="/home"/>'>Logout</a> --%>
						</ul>
						
						<ul class="nav navbar-nav navbar-right">

							<li><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						</ul>

					</div>
				</div>
			</nav>
		</div>
	</div>
	<div class="container">
	
	<div id="main" class="col-md-10">
		<div class="detail-album">
			<b><i>Fresh</i></b> off the grill
			<div style="width: 1000px; height: 1000px;">
				<h1>The Best Of Men Off work</h1>
				<span><img
					src="${pageContext.request.contextPath}/images/${url}" style="max-width: 150px;max-height: 150px;"></span>
				 <h4>Title : ${title}</h4>
				<h4>Price : ${price}</h4>
				<%-- <h4>AlumURL : ${url}</h4> --%>
				<h4>Genre : ${genre}</h4>
				<h4>Artist : ${artist}</h4> 
				
				<a href="${pageContext.request.contextPath}/admin/album-list">Back</a> &nbsp; &nbsp;
				<a href="${pageContext.request.contextPath}/admin/edit-album?id=${id}">Edit</a>
			</div>
		</div>
	</div>
	</div>
</body>
</html>