<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<script type="text/javascript" src="<c:url value='/static/js/edit.js'/>"></script>

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

				 <%-- <form method="POST" action="/musicstore/admin/updateAlbum" id="form" enctype="multipart/form-data">
					<table>
					<tr>
					<form:hidden path="id" /> 
					</tr>
						 <tr>
							<td><label>Genre</label></td>
							<td><select name="genreId" class="form-control">
									<c:forEach var="in" items="${album}">
										<option value="${albums.getGenre().getId()}">${albums.getGenre().getName()}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td><label>Artist</label></td>
							<td><select name="artistId" class="form-control">
									 <c:forEach var="in" items="${album}">
									 
										<option value="${albums.getArtist().getId()}">${albums.getArtist().getName()}</option>
									</c:forEach> 
							</select></td>
						</tr> 
						<tr>
							<td><label>Title</label></td>
							<td><input name="title" value="${albums.getTitle()}" class="form-control" id="title"/>
							<span id="title_error" style="color:red"></span></td>
						</tr>
						<tr>
							<td><label>Price</label></td>
							<td><input name="price" value="${albums.getPrice()}" class="form-control digits" id="price" type="number"/>
							<span id="price_error" style="color:red"></span>
							</td>
						</tr>
						<tr>
							<td><label>AlbumUrl &nbsp;</label></td>
							<td>
							
							<input name="albumArtUrl" disabled value="${albums.getAlbumArtUrl()}" id="urlFile" class="form-control" />
							 <input type="file" id="file" name="albumArtUrl" onchange="Handlechange();" />
							</td>
							<td><div class="preview-image" style="display:none"></div></td>
						</tr>
						<!-- <tr>
							<td><label>Upload &nbsp;</label></td>
								<input type="file" id="upload"/>
						</tr>
 -->
					</table>
					<br />
					<button class="btn btn-primary " name="submit" type="submit">Update</button>
				</form>   --%>
				
				
				<form:form method="POST" commandName="album"
					action="/musicstore/admin/updateAlbum"
					id="form" enctype="multipart/form-data">
					<form:hidden path="id" />
					<form:hidden path="albumArtUrl" />  
					<div class="form-group">
						<label>Genre</label> <select name="genre.id" class="form-control">
							<c:forEach var="in" items="${listGenre}">
								<option value="${in.getId()}">${in.getName()}</option>
							</c:forEach>
						</select>

					</div>
					<div>
						<label>Artist</label> <select name="artist.id"
							class="form-control">
							<c:forEach var="in" items="${listArtist}">
								<option value="${in.getId()}">${in.getName()}</option>
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
						<form:input type="file" path="albumArtUrl" value="${albums.getAlbumArtUrl()}" accept="image/*"
							class="form-control" />

						<div class="preview-image" style="display: none"></div>
					</div>


					<button type="submit" class="btn btn-primary">Save</button>
				</form:form>
				
				
				<a href="${pageContext.request.contextPath}/admin/album-list">Back</a>
			</div>
		</div>
	</div>

</body>
</html>