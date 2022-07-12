<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="model.*" %>
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
	<section>
		<div class="container p-3">
			<table border="0">
				<tr>
					<td><img alt="cart-logo" src="./assets/yuki-logo.webp" style="width:150px"></td>
					<td><h2> Shopping Cart</h2></td>
				</tr>
			</table>
			
			<form action="PayController" method="post">
				<div class="row">
					<table class="table">
						<thead>
							<tr class="border-1 text-center">
								<td>Product in cart: ${cart.getItems().size()}</td>
								<td>Price</td>
								<td>Quantity</td>
								<td>Action</td>
								<td>Amount</td>
							</tr>
						</thead>
						<tbody class="border-0">
							<c:forEach items="${cart.getItems()}" var="o">
								<tr class="text-center">
								<td><p>Product name: ${o.getName()} <p/><p>ID: ${o.getId()}</p></td>
								<td>
									<input type="hidden" value="${o.getPrice()}">
									<span>
										<fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber type="currency" value="${o.getPrice()}"></fmt:formatNumber>
									</span>
								</td>
								<td>
								<input type="hidden" value="0" name="number">
								<input type="number" onchange="add(this)" style="width: 40px" value="${o.getNumber()}" min= "0">
									<span class="addtt" data-bs-placement="right" title="add"><a href="AddToCartController?id=${product.id}&action=add&number"><i class="bi bi-bag-plus-fill"></i> </a></span>
								</td>
								<td style="cursor: pointer">
									<a href="AddToCartController?id=${o.getId()}&action=delete&number=1" class="btn btn-link text-danger"><span class="deltt" data-bs-placement="right" title="delete"><i class="bi bi-archive"></i></span></a>
								</td>
								<td>
									<fmt:setLocale value="vi_VN"/>
									<fmt:formatNumber type="currency" value="${o.getPrice() * o.getNumber()}"></fmt:formatNumber>
								</td>
							</tr>
							</c:forEach>
						
							<tr>
								<td colspan="5" class="text-end"> Total: 
									<fmt:setLocale value="vi_VN"/>
									<fmt:formatNumber type="currency" value="${cart.getAmount()}"></fmt:formatNumber>
								</td>						
							</tr>
						</tbody>
					</table>
				</div>
			
				<div class="d-flex col-10 mt-5">
					<label class="col-4 form-label">Customer name</label>
					<input type="text" class="form-control" name="name">
				</div>
				<div class="d-flex col-10">
					<label class="col-4 form-label">Customer address</label>
					<input type="text" class="form-control" name="address">
				</div>
				<div class="d-flex col-10">
					<label class="col-4 form-label">Discount code(if any)</label>
					<input type="text" class="form-control" name="discount">
				</div>
			
				<button type="submit" class="btn btn-warning">Submit</button>
			</form>
		</div>
	</section>
	
	<%@ include file='footer.jsp' %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script>
		const addTooltips = document.querySelectorAll('.addtt');
		addTooltips.forEach(t => {
		new bootstrap.Tooltip(t)
		})
	</script>
	<script>
	const delTooltips = document.querySelectorAll('.deltt');
	delTooltips.forEach(t => {
	new bootstrap.Tooltip(t)
	})
	</script>
	
	<script>
		function add(x) {
			var tr = x.parentElement.parentElement;
			var td = tr.children;
			var qty = td[2].children[1].value;
			var num = td[2].children[0].value;
			num = qty;
		}
	</script>	
</body>
</html>