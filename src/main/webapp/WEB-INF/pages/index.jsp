<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/resources/component/base_links.jsp"%>
</head>
<body>
	<!-- <div class="container"> -->
	<%@include file="/WEB-INF/resources/component/navbar.jsp"%>

	<div class="card p-5">

		<img class="img-fluid mx-auto" style="max-width: 400px"
			alt="imge not Available"
			src="<c:url value="/resources/img/edit.png"  />">				<!-- static resource configuration -->


		<br>
		<h2 class="text-primary text-uppercase text-center mt-3">Start
			Talking To Your Notes</h2>
		<br> 
		<a href="index" class="btn btn-outline-primary text-center"
			style="text-decoration: none;">
			<div>
				<h3 class="fw-bold me-3">Start Here</h3>
			</div>
		</a>
	</div>
	<!-- </div> -->
</body>
</html>