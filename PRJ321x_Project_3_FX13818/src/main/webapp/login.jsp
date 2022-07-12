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
</head>
<body>
	<div class="container mt-5 px-0 shadow-lg">
		<div class="row ">								
			<div class="row">
				<div class="col my-3 p-5">
					<div class="text-center text-bold my-3">				
						<h1>Sign in</h1>						
					</div>	
					
					<form action="LoginServlet" method="post">
					
						<!-- Show error message here -->
						<span style="color: red">${error}</span>
					
						<div class="form-floating my-2">				
							<input type="email" class="form-control" id="username" placeholder="" name="username" value="${username}"required>
							<label for="username">Username</label>
							<div class="valid-feedback">Valid.</div>
						</div>
													
						<div class="form-floating my-1">
							<input type="password" class="form-control" id="pwd" placeholder="" name="password" value="${password}" required>
							<label for="pwd">Password</label>
							<div class="valid-feedback">Valid.</div>
						</div>
						
						<div class="form-check mt-1">
							<input class="form-check-input" type="checkbox" id="checkme" name="remember">
							<label class="form-check-label" for="checkme">Remember me</label>			
						</div>		
													
						<div class="text-center">
							<p><a href="#">Forgot password?</a></p>
							<button type="submit" class="btn btn-danger btn-lg rounded-pill">Submit</button>													
						</div>
					</form>	
				</div>
				
				<div class="col bg-dark d-flex text-light justify-content-center align-items-center" style="height: 445px">
					<div class="" >											
						<h3>Welcome Back</h3>
						<p>To keep connected with us <br/> please log in with your personal info</p>
					</div>				
				</div>
			</div>														
		</div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</body>
</html>