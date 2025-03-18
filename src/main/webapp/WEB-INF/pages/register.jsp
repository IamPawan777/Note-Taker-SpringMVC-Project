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
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center">
						<h2>Register page</h2>
						
						  	<c:if test="${not empty msg}">
        						<p class="fs-5 fw-bold text-success">"${msg}"</p>
    						</c:if>
    						<c:remove var="msg" />
						
					</div>
					<div class="card-body p-5">
						
						<form action="registerUser" method="Post">
							<div class="mb-3">
								<label>Enter Full Name:</label>
								<input type="text" name="name" class="form-control">
							</div>
							<div class="mb-3">
								<label>Enter Qualification Name:</label>
								<input type="text" name="qualification" class="form-control">
							</div>
							<div class="mb-3">
								<label>Enter Email:</label>
								<input type="email" name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label>Enter Password:</label>
								<input type="password" name="password" class="form-control">
							</div>
							<button class="btn btn-primary col-md-12">Register</button>
						</form>
					</div>
					<div class="card-footer text-center">
						<p>Already have an account <a href="login" class="text-decoration-none">Login</a></p> 
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>