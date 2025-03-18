<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h2>Update Notes</h2>
					</div>
					<div class="card-body p-5">
						<form action="update_notes" method="post">
							<div class="mb-3">
								<label>Enter Title:</label>
								<input type="text" name="title" class="form-control" value="${notes.title }">
							</div>
							<div class="mb-3">
								<label>Enter Content:</label>
								<textarea rows="7" cols="" class="form-control" name="description">${notes.description }</textarea>
							</div>
							<input type="hidden" name="id" value="${notes.id }">
							<button class="btn btn-primary mt-4">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>