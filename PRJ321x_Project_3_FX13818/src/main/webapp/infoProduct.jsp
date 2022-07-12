<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="t" class="dao.ListProductDAO" scope="request"/>
<meta charset="UTF-8">
<title>YukiFone</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
	<%@ include file='header.jsp' %>
				
		<div class="container p-1">
			<div class="row ">
				<div class=" d-flex justify-content-center border-bottom p-2 mb-3">
					<h4>${product.getName()}</h4>
				</div>
				<div class="row d-flex justify-content-center align-items-center">
					<div class="col-3">
						<img alt="product ${product.id}" src="${pageContext.request.contextPath}/assets/${product.getSrc()}" class="img-fluid" style="width:450px">																
					</div>
					<div class="col-3">
						<div class="card">
						<div class="card-body">
							<div class="card-header text-danger text-center m-1 p-2">
								<fmt:setLocale value="vi_VN"/>
								<fmt:formatNumber type="currency" value="${product.getPrice()}"></fmt:formatNumber>
							</div>							
							<small class="card-subtitle lead p-2 m-3">${product.getDescription()}</small>		
							<div class="p-3">
								<a href="AddToCartController?id=${product.id}&action=add&number=1" class="btn btn-warning">Add to Cart</a>
							</div>
													
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	
	<%@ include file='footer.jsp' %>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</body>
</html>