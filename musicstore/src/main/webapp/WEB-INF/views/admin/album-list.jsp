<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SPRING MVC MUSIC STORE ADMIN</title>

<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>

<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar navbar-inverse" role="navigation" id="navbarhead">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#"><span><img
								src="<c:url value='/static/images/logo.png'/>"></span>Spring MVC
							MUSIC STORE</a>
					</div>
					<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">

							<li><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">

							<li><a href="<c:url value="/logout" />">Logout</a></li>
						</ul>

					</div>
				</div>
			</nav>
		</div>
	</div>
	<div class="container">
		<h1>Manager Album</h1>
		<a href="${pageContext.request.contextPath}/admin/create-new" class="btn btn-success">Create
			new album</a>
		<div class="row">
			<table class="table">
				<thead>
					<tr style="text-align: center;">
						<th style="text-align: center;">Custom</th>
						<th style="text-align: center;">Title</th>
						<th style="text-align: center;">Artist</th>
						<th style="text-align: center;">Price</th>
						<th style="text-align: center;">Genre</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="in" items="${listAlbum1}">
						<tr class="col-in-table" style="text-align: center;">
							<td><a
								href="${pageContext.request.contextPath}/admin/edit-album?id=${in.id}" class="btn btn-primary">Edit</a>
								| <a onclick="return confirm('Are you sure to delete this record?')"
								href="${pageContext.request.contextPath}/admin/deleteAlbum?id=${in.id}" class="btn btn-primary">Delete</a>|
								<a
								href="${pageContext.request.contextPath}/admin/detail-albumgenre?id=${in.id}" class="btn btn-primary">Detail</a>
							</td>
							<td class="text-center">${in.getTitle()}</td>
							<td style="max-width: 400px">${in.getArtist().getName()}</td>
							<td style="max-width: 400px">${in.getPrice()}</td>
							<td style="max-width: 400px">${in.getGenre().getName()}</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>
