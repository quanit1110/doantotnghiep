
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
</head>
<div id="main">
	<div class="album-genre">
		<b><i>Fresh</i></b> off the grill
		<div style="width: 1000px; height: 1000px;">
			<ul id="album-list" style="width: 200px; display: inline;">
				<c:forEach items="${listAlbum}" var="album">
					<li style="display: inline;"><a
						href="${pageContext.request.contextPath}/detailMusic?id=${album.id}"
						class="col-md-2"> <img alt=""
							src="${pageContext.request.contextPath}/images/${album.getAlbumArtUrl()}" />
							<span>${album.title}</span></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
</html>