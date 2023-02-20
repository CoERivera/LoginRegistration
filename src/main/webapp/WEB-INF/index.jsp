<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login & Registration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center text-primary">Welcome!</h1>
		<h5 class="text-center text-muted">Join our growing community.</h5>
		<div class="row mt-5">
			<div class="col mx-1">
				<h2>Register</h2>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<div>
						<div class="form-group mt-4">
							<form:label path="userName">Username:</form:label>
							<form:input class="form-control mt-1" path="userName" />
							<form:errors style="color:red;" path="userName" />
						</div>
						<div class="form-group mt-2">
							<form:label path="email">Email address:</form:label>
							<form:input class="form-control mt-1" path="email" />
							<form:errors style="color:red;" path="email" />
						</div>
						<div class="form-group mt-2">
							<form:label path="password">Password:</form:label>
							<form:password class="form-control mt-1" path="password" />
							<form:errors style="color:red;" path="password" />
						</div>
						<div class="form-group mt-2">
							<form:label path="confirm">Confirm your password:</form:label>
							<form:password class="form-control mt-1" path="confirm" />
							<form:errors style="color:red;" path="confirm" />
						</div>
					</div>
					<div class="d-flex justify-content-end">
						<input class="btn btn-success mt-4" type="submit" value="Register">
					</div>
				</form:form>
			</div>
			<div class="col mx-1">
				<h2>Login</h2>
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="form-group mt-4">
						<form:label path="email">Email address:</form:label>
						<form:input class="form-control mt-1" path="email" />
						<form:errors style="color:red;" path="email" />
					</div>
					<div class="form-group mt-2">
						<form:label path="password">Password:</form:label>
						<form:password class="form-control mt-1" path="password" />
						<form:errors style="color:red;" path="password" />
					</div>
					<div class="d-flex justify-content-end">
						<input class="btn btn-primary mt-4" type="submit" value="Log In">
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>