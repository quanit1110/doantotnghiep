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
	<div class="container">
		<div class="panel">
			<div class="panel panel-body">
				<h3>Create new album</h3>

				<form:form method="POST" commandName="album"
					action="${pageContext.request.contextPath}/admin/createnewsuccess"
					id="form" enctype="multipart/form-data">
					<div class="form-group">
						<label>Genre</label> <select name="genre.id" class="form-control">
							<c:forEach var="in" items="${listGenre}">
								<option value="${in.id}">${in.name}</option>
							</c:forEach>
						</select>

					</div>
					<div>
						<label>Artist</label> <select name="artist.id"
							class="form-control">
							<c:forEach var="in" items="${listArtist}">
								<option value="${in.id}">${in.name}</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<label>Title</label>
						<form:input path="title" class="form-control" id="title" />
						<form:errors path="title" style="color: red"></form:errors>
						<span id="title_error" style="color: red"> </span>
					</div>
					<div class="form-group">
						<label>Price</label>
						<form:input path="price" id="price" class="form-control" />
						<span id="price_error" style="color: red"></span>
						<form:errors path="price" style="color: red"></form:errors>
					</div>

					<div class="form-group">
						<label>AlbumUrl &nbsp;</label>
						<form:input type="file" path="albumArtUrl" accept="image/*"
							class="form-control" />

						<div class="preview-image" style="display: none"></div>
					</div>


					<button type="submit" class="btn btn-primary">Save</button>
				</form:form>
				<%-- <c:if test="${not empty error}">
					<div class="error" style="color: red">${error}</div>
				</c:if> --%>
				<a href="${pageContext.request.contextPath}/admin/album-list">Back</a>
			</div>
		</div>
	</div>

</body>
</html>