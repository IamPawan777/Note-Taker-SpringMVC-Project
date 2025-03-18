<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page isELIgnored="false" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/resources/component/base_links.jsp"%>
</head>
<body style="background-color: #f0f0f0">
	<%@ include file="/WEB-INF/resources/component/navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-header text-center">
						<h2>Please Add Your Notes</h2>

						<c:if test="${not empty msg}">
							<p class="fs-5 fw-bold text-success">"${msg}"</p>
						</c:if>
						<c:remove var="msg" />

					</div>
					<div class="card-body p-5">
						<form action="saveNotes" method="post">
							<div class="mb-3">
								<label>Enter Title:</label> <input type="text" name="title"
									class="form-control">
							</div>
							<div class="mb-3">
								<label>Enter Content:</label>
								<textarea rows="7" cols="" class="form-control" name="description"></textarea>
							</div>

							<button class="btn btn-primary mt-4">Add Notes</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>