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
	<%@ include file="/WEB-INF/resources/component/navbar.jsp"%>
	<div class="container-fluid p-3">
		<h2 class="text-center">All Notes</h2>

		<c:if test="${not empty msg}">
			<p class="fs-5 fw-bold text-danger text-center">"${msg}"</p>
		</c:if>
		<c:remove var="msg" />

		<div class="row">

			<c:forEach items="${list}" var="n">
				<div class="col-md-10 offset-md-1  mt-2	">
					<div class="card ">
						<div class="card-header p-3">
							<div class="text-center">
								<img alt="not available" style="max-width: 100px"
									src="<c:url value="/resources/img/edit.png"  />">
							</div>
							<h4 class="fw-bold">${n.title }</h4>
							<p>${n.description }</p>
							<p class="text-success">publish ${n.date }]</p>

							<div class="text-center">
								<a href="edit?id=${n.id }" class="btn btn-primary mx-3">Update</a> <a
									href="deleteNotes?id=${n.id }" class="btn btn-danger mx-3">Delete</a>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>

</body>
</html>