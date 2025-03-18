<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!-- Nav-bar... -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
	<div class="container-fluid">
		<a class="navbar-brand fw-bold" href=""><i class="fa-solid fa-book-open-reader"></i> Notes</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${pageContext.request.contextPath }/index"><i class="fa-solid fa-house"></i> Home</a></li>
					
				<c:if test="${not empty userObj }">
					<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/user/add_notes"><i class="fa-solid fa-square-plus"></i> Add Notes</a></li>
					<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/user/view_notes"> <i class="fa-solid fa-eye"></i> Show Notes</a></li>
				</c:if>
			</ul>

			<form class="d-flex">
			
			<c:if test="${empty userObj }">
				<a href="${pageContext.request.contextPath }/login" class="btn btn-outline-light fw-bold me-3 " type="submit">Log-In</a>
				<a href="${pageContext.request.contextPath }/register" class="btn btn-outline-light fw-bold" type="submit">Register</a>
			</c:if>
			<c:if test="${not empty userObj }">
				<a href="" class="btn btn-outline-light fw-bold me-3 " type="submit"><i class="fa-regular fa-user"></i> ${userObj.name }</a>
				<a href="${pageContext.request.contextPath }/user/logout" class="btn btn-outline-light fw-bold" type="submit"><i class="fa-solid fa-right-from-bracket"></i></a>
			</c:if>
			
			
			</form>
		</div>
	</div>
</nav>