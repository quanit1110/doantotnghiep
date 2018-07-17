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
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/Site.css' />" rel="stylesheet"></link>
<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.2.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/js/bootstrap.js'/>"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="col-md-12">
		<jsp:include page="_menu.jsp"></jsp:include>
		<div id="main" class="col-md-10">
			<div class="album-genre">
			<%-- modelAttribute="myCart"  commandName="Cart" --%>
				 <form method="POST" action="/musicstore/shippinginformation" > 
					
				<h4><i>Review your cart</i></h4>
					<input type="submit" value="Check out" class="btn btn-success">
					<table>
						<thead>
							<tr>
								<th>Album Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Sub-Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:set var="s" value="0"></c:set>
							 <c:forEach var="in" items="${sessionScope.cart}" varStatus="i">
							 <c:set var="s" value="${s+in.album.getPrice()*in.getCount() }"></c:set> 
							<tr class="col-in-table">
								<td><a
									href="${pageContext.request.contextPath}/detailMusic?id=${in.album.getId()}">${in.album.getTitle() }</a>
								</td>
								<td class="text-center">${in.album.getPrice()}</td>
								<td style="max-width: 400px">${in.count}</td>
								<td style="max-width: 400px" >${in.album.getPrice()*in.count}</td>
								<td style="max-width: 400px">
								<a href="${pageContext.request.contextPath}/delete/${i.index}">Remove from cart
								</a></td>
							</c:forEach> 
							 <tr>
								<td>Total</td>
								<td></td>
								<td></td>
								<td >${s}</td>
							</tr> 
						</tbody>
					</table>
					<br />
				 </form>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="_footer.jsp"></jsp:include> --%>
</body>
</html>