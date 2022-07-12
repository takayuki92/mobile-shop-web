<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YukiFone</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
	<div class="container-fluid mt-3">
		<div class="d-flex ">
			<div class="flex-fill bg-info text-center ">
				<a href="#" class="btn"><span><i class="bi bi-twitter text-light"></i></span></a>
			</div>
			<div class="flex-fill bg-primary text-center">
				<a href="#" class="btn"><span><i class="bi bi-facebook text-light"></i></span></a>
			</div>
			<div class="flex-fill bg-danger text-center">
				<a href="#" class="btn"><span><i class="bi bi-youtube text-light"></i></span></a>
			</div>
			<div class="flex-fill bg-warning bg-opacity-75 text-center">
				<a href="#" class="btn"><span><i class="bi bi-instagram text-light"></i></span></a>
			</div>
			<div class="flex-fill bg-primary bg-opacity-75 text-center">
				<a href="#" class="btn"><span><i class="bi bi-linkedin text-light"></i></span></a>
			</div>
		</div>
	</div>
	
	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<h5 class="border-bottom border-3 border-success text-center py-2">Contact Info</h3>
				<div class="card border-0">
					<div class="card-body">
						<div class="card-title">Head Office</div>
						<p class="card-subtitle py-2"><span><i class="bi bi-geo-alt"></i></span>  Tokyo, Japan</p>
						<p class="card-subtitle py-2"><span><i class="bi bi-envelope"></i></span>  Email: yukifone@yahoo.com</p>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-3">
				<h5 class="border-bottom border-3 border-success text-center py-2">Support</h3>
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action border-0">Customer Care</a>
					<a href="#" class="list-group-item list-group-item-action border-0">Site Map</a>
					<a href="#" class="list-group-item list-group-item-action border-0">Blog</a>
					<a href="#" class="list-group-item list-group-item-action border-0">Contact us</a>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-3">
				<h5 class="border-bottom border-3 border-success text-center py-2">Policies</h3>
				<div class="list-group">
					<a href="#" class="list-group-item border-0">Cancellation Policy</a>
					<a href="#" class="list-group-item border-0">Return and Refund Policy</a>
					<a href="#" class="list-group-item border-0">Shipping Policy</a>
					<a href="#" class="list-group-item border-0">Disclaimer</a>
					<a href="#" class="list-group-item border-0">Orders- Terms and Conditions</a>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-3">
				<h5 class="border-bottom border-3 border-success text-center py-2">Payment Options</h3>
				<div class="d-flex py-3">
					<div>
						<a href="#"><img src="${pageContext.request.contextPath}/assets/p-mastercard.jpeg" class="img-fluid" style="width:70px" alt="mastercard"></a>
					</div>
					<div>
						<a href="#"><img src="${pageContext.request.contextPath}/assets/p-paypal.jpeg" class="img-fluid" style="width:70px" alt="paypal"></a>
					</div>
					<div>
						<a href="#"><img src="${pageContext.request.contextPath}/assets/p-visa.png" class="img-fluid" style="width:70px" alt="visa"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="bg-dark bg-opacity-75 border border-top p-2 mt-2" style="height:30px"></div>
		
	<div class="bg-dark text-light">
		<div class="text-center py-2">
			<p class="text-warning"> Copyright &copy 2019 JavaWeb 1849 TEAM</p>
			<p class="text-warning"> Contact Us: Member 1 | Member 2 | Member 3 | Member 4</p>
		</div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	
</body>
</html>