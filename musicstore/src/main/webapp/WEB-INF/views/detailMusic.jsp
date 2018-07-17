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
<link rel='stylesheet prefetch'
	href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/Site.css' />" rel="stylesheet"></link>
<%-- <link href="<c:url value='/static/css/bootstrap-rating.css' />" rel="stylesheet"></link> --%>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>
<%-- <script type="text/javascript"
	src="<c:url value='/static/js/jquery-2.1.1.js'/>"></script> --%>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
<%-- <script type="text/javascript"
	src="<c:url value='/static/js/bootstrap-rating.js'/>"></script> --%>
<style>


div.stars {
	width: 270px;
	display: inline-block;
}

input.star {
	display: none;
}

label.star {
	float: right;
	padding: 10px;
	font-size: 36px;
	color: #444;
	transition: all .2s;
}

input.star:checked ~ label.star:before {
	content: '\f005';
	color: #FD4;
	transition: all .25s;
}

input.star-5:checked ~ label.star:before {
	color: #FE7;
	text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before {
	color: #F62;
}

label.star:hover {
	transform: rotate(-15deg) scale(1.3);
}

label.star:before {
	content: '\f006';
	font-family: FontAwesome;
}

div.ratinginline {
	float: left;
	margin-left: 100px;
}  
.btn-rating{
	margin-left: 30px;
	margin-top: 20px;
	margin-right:500px;
	margin-bottom:0px;
	float: right;
}
 .star{
	margin-top: 0px;
} 

.clearBoth {
	clear: both;
}
</style>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="_menu.jsp"></jsp:include>
			<div id="main" class="col-md-10">
				<div class="album-genre">
					<b><i>Fresh</i></b> off the grill
					<div class="stars" style="display: inline;">
						<form action="${pageContext.request.contextPath}/rate" method="post">
							<button class="btn btn-primary btn-rating" name="submit"
								type="submit" name="add">Rating</button>
							<input type="hidden" id="${param.id}" name="idAlbum" value="${param.id}">
							<input class="star star-5" id="star-5" type="radio" name="star"
								value="5" /> <label class="star star-5" for="star-5"></label> <input
								class="star star-4" id="star-4" type="radio" name="star"
								value="4" /> <label class="star star-4" for="star-4"></label> <input
								class="star star-3" id="star-3" type="radio" name="star"
								value="3" /> <label class="star star-3" for="star-3"></label> <input
								class="star star-2" id="star-2" type="radio" name="star"
								value="2" /> <label class="star star-2" for="star-2"></label> <input
								class="star star-1" id="star-1" type="radio" name="star"
								value="1" /> <label class="star star-1" for="star-1"></label>
						</form>
					</div>
					<form:form modelAttribute="album" commandName="" method="POST"
						action="/musicstore/review-album?id=${sessionScope.albumId}">
						<table>
							<%-- 
									<tr>
										<td><label></label></td>
										<td><label type="hidden" name="id">${album.getId()}</label></td>
									</tr> --%>
							<tr>
								<td><label>Image</label></td>
								<td><span><img alt="" name="albumArtUrl"
										style="max-width: 150px; max-height: 150px;"
										src="${pageContext.request.contextPath}/static/images/${album.getAlbumArtUrl()}" /></span></td>
							</tr>
							<tr>
								<%-- 							<input name="genre" class="form-control" id="genre" disabled value="${album.getGenre().getName()}"/> --%>
								<td><label>Genre</label></td>
								<td><label name="genre">${album.getGenre().getName()}</label></td>
							</tr>
							<tr>
								<%-- 							<input name="artist" class="form-control" id="artist" disabled value="${album.getArtist().getName()}"/> --%>
								<td><label>Artist</label></td>
								<td><label name="artist">${album.getArtist().getName()}</label></td>
							</tr>
							<tr>
								<%-- 							<input name="price" step="0.001" type="number" disabled class="form-control" value="${album.getPrice()}" id="price" />  --%>
								<td><label>Price</label></td>
								<td><label name="price">${album.getPrice()}</label></td>
							</tr>
						</table>
						<br />
						<div>
							<button class="btn btn-success " name="submit" type="submit"
								name="add">Add to Cart</button>
						</div>
				</div>
				</form:form>
				
			</div>
		</div>
	</div>
	<div class="album-genre">
				<b><i>--------------------------------------------------------------------------------------------------------------Remender product--------------------------------------------------------------------------------------------------------------</i></b>
				<div style="width: 1000px; height: 1000px;">
					<ul id="album-list">
						<c:forEach items="${listAlbum}" var="album">
							<li><a
								href="${pageContext.request.contextPath}/detailMusic?id=${album.id}">
									<img alt=""
									src="${pageContext.request.contextPath}/static/images/${album.getAlbumArtUrl()}"
									style="max-width: 100px; max-height: 100px;" /> <span>${album.title}</span>
							</a></li>
						</c:forEach>
					</ul>

				</div>
			</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>