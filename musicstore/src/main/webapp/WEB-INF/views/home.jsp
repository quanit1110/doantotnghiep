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

<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/Site.css' />" rel="stylesheet"></link>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>

<style>
#text {
	display: inline;
}

h5 {
	color: red;
	display: inline;
}

#navbarhead {
	height: 60px;
}
</style>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="_menu.jsp"></jsp:include>
			<jsp:include page="_body.jsp"></jsp:include>
		</div>
		<div id="main">
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
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>
