<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YukiFone</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row bg-dark text-light p-3">
			<div class="col-3 text-center">
				<h2>YukiFone </h2>
				<small class="text-info">Welcome to our website</small>
			</div>
			<div class="col-9 py-3 d-flex g-0">					
				<div class="col-2 btn-group">
					<button type="button" class="btn bg-light dropdown-toggle rounded-0" data-bs-toggle="dropdown">Categories</button>
					<ul class="dropdown-menu">
						<li><a href="#" class="dropdown-item">IPhone</a></li>
						<li><a href="#" class="dropdown-item">Samsung</a></li>
						<li><a href="#" class="dropdown-item">Vivo</a></li>
					</ul>			
				</div>
				<div class="col-10 ">
					<form action="SearchController2?index=1" method="post" class="form container-fluid">
						<div class="d-flex">
							<input class="form-control rounded-0" oninput="searchByName(this)" type="text" name="txtSearch" value="${txtSearch}"placeholder="What are you looking for...">																		
							<button type="submit" class="btn btn-light rounded-0"><i class="bi bi-search"></i></button>
						</div>
					</form>		
				</div>
			</div>
		</div>
		
		<div class="row bg-info">
			<div class="col-2"></div>
			<div class="col-10">
				<nav class= "navbar navbar-expand-sm">
					<div class="container-fluid border-0">
						<a class="navbar-brand" href="#">
							<img src="${pageContext.request.contextPath}/assets/yuki-logo.webp" class="rounded-circle" style="width:40px" alt="logo" >
						</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar"
					aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>				
						</button>
						<div class="collapse navbar-collapse" id="collapsibleNavbar">
							<ul class="navbar-nav nav-tabs me-auto">
								<li class="nav-item">
									<a class="nav-link text-dark" href="index.jsp">Home</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-dark" href="#products">Products</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-dark" href="#about-us">About Us</a>
								</li>
							</ul>										
						</div>
						
						<!-- Links to open to login and register-->
						<form class="d-flex">
							<a href="cart.jsp" class="btn btn-sm my-auto border border-danger">Cart <i class="bi bi-cart-fill"></i></a>
							<c:if test="${sessionScope.user == null}">
								<a href="${pageContext.request.contextPath}/login" class="btn text-dark">Log in</a>
								<a href="${pageContext.request.contextPath}/register" class="btn text-dark">Register</a>
							</c:if>
							<c:if test="${sessionScope.user != null}">
								<a class="nav-link my-auto text-danger">Hello ${sessionScope.user}</a>
								<a href="logout" class="btn border text-dark ms-3 ps-3">Log out</a>
							</c:if>	
						</form>
												
					</div>
				</nav>
			</div>						
		</div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>

 </body>
</html>