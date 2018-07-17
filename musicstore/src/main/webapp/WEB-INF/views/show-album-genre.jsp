<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	src="<c:url value='/static/js/jquery-2.1.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
<style>
/* #text {
	display: inline;
} */
a.text-title {
    text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="row">
		<!-- <div class="">
			<div class=""> -->
				<div class="col-md-12">
					<jsp:include page="_menu.jsp"></jsp:include>
					<div id="main" class="col-md-10">
						<div class="album-genre">
							<b><i>Fresh</i></b> off the grill
							<div style="max-width: 1000px; max-height: 1000px;">
								<ul id="album-list" >
									<c:forEach items="${albumid}" var="album">
										<li>
										<a
											href="${pageContext.request.contextPath}/detailMusic?id=${album.id}"
											class="col-md-2 text-title">
												<span><img alt="" 
												src="${pageContext.request.contextPath}/static/images/${album.getAlbumArtUrl()}" 
												style="max-width: 100px;max-height: 100px;"/>${album.title}</span>
												</a></li>
									</c:forEach>
								</ul>

							</div>
						</div>
					</div>

				</div>
			</div>
	<!-- 	</div>
	</div> -->
</body>
</html>