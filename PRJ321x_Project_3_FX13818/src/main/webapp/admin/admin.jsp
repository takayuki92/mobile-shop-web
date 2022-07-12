<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YukiFone</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css"
  rel="stylesheet"
/>
</head>
<body>
	<div class="contanier">
		<div class="row g-0">
			<div class="col-sm-4 col-md-3 col-lg-2 bg-image text-nowrap">
				<img src="${pageContext.request.contextPath}/assets/ad-bg-1.jpeg" style="height:100vh"/>
			 	<div class="mask" style="background: rgba(18, 102, 241, 0.5)">					
			 		<div class="mt-5">
			 			<h2 class="text-center text-warning border-bottom pb-2">1849 TEAM</h2>
						<div class="mt-3 d-flex flex-wrap align-content-start">
							<p><a class="btn text-light btn-block" href="#"><i class="bi bi-microsoft pe-2"></i> DashBoard</a></p>
							<p><a class="btn text-light btn-block" href="#"><i class="bi bi-person pe-2"></i> Staff Manager</a></p>
						</div>					
					</div>
			 	</div>					
			</div>
			<div class="col-sm-8 col-md-9 col-lg-10">		
				<div class="bg-image hover-overlay" style="background-image: url('${pageContext.request.contextPath}/assets/ad-bg-2.jpeg'); background-size:cover; height: 50vh">
					<div  class="p-3">
						<h1 class="text-end"><a class="text-light btn btn-primary btn-lg" href="${pageContext.request.contextPath}/logout">Log out</a></h1>
					</div>
					
					<div class="d-flex align-items-center justify-content-center" style="height:200px">
						<div class="bg-info text-light">
							<h3>
								<% //get username from session
								String username = (String)session.getAttribute("user");
								if(username != null) {
									out.println("Welcome " + username);
								} else { //still welcome if never login in before
									out.println("welcome guest");
								} %>
							</h3>
						</div>
					</div>
				</div>					
				<div class="p-1 bg-dark bg-gradient" style="height:50vh" >
					<div style="width: 70vh" class="bg-primary bg-gradient">
						<p class="lead p-2 text-light m-0" >Members of the team</p>
					</div>
					<table class="table table-hover table-info p-2" style="width:70vh">

						<thead>
							<tr>
								<td>
									ID
								</td>
								<td>
									Name
								</td>
								<td>
									Student ID
								</td>
								<td>
									Class
								</td>
							<tr>
						<thead>
						<tbody>
							<tr>
								<td>
									1
								</td>
								<td>
									Mentor 1
								</td>
								<td>
									Member Code 1
								</td>
								<td>
									Class 1
								</td>
							<tr>
							<tr>
								<td>
									2
								</td>
								<td>
									Mentor 2
								</td>
								<td>
									Member Code 2
								</td>
								<td>
									Class 2
								</td>
							<tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</body>
</html>