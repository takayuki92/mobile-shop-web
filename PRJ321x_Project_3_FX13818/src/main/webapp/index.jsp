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
	<section id="products" class="bg-light align-items-center">
		<div class="container">
			<div class="row" id="content">
				<c:if test="${param.index == null}">
					<c:forEach items="${t.top4}" var="o">
					<div class="col-sm-6 justify-content-center text-center">
						<div class="card">
							<div class="card-body">
								<a href="InformationProductController?id=${o.id}"><img alt="product 1" src="${pageContext.request.contextPath}/assets/${o.getSrc()}" class="img-fluid" style="width:350px"></a>							
								<h4 class="card-title">${o.getName()}</h4>
								<p class="card-subtitle lead"><span class="badge bg-danger bg-opacity-75 rounded-circle">-25%</span>
									<fmt:setLocale value="vi_VN"/>
									<fmt:formatNumber type="currency" value="${o.getPrice()}"></fmt:formatNumber>
								</p>								
							</div> 
						</div>
					</div>	
					</c:forEach>	
				</c:if>
				<c:if test="${param.index != null}">
					<c:forEach items="${listA}" var="o">
					<div class="col-sm-6 justify-content-center text-center">
						<div class="card">
							<div class="card-body">
								<a href="InformationProductController?id=${o.id}"><img alt="product 1" src="${pageContext.request.contextPath}/assets/${o.getSrc()}" class="img-fluid" style="width:350px"></a>							
								<h4 class="card-title">${o.getName()}</h4>
								<p class="card-subtitle lead"><span class="badge bg-danger bg-opacity-75 rounded-circle">-25%</span>
									<fmt:setLocale value="vi_VN"/>
									<fmt:formatNumber type="currency" value="${o.getPrice()}"></fmt:formatNumber>
								</p>								
							</div>
						</div>
					</div>	
					</c:forEach>		
				</c:if>				
			</div>															
		</div>
		
		<!-- Pagination -->
		<div class="container my-3 p-3">
			<ul class="pagination pagination-lg justify-content-center">
				<li class="page-item"><a class="page-link" href="Pagination?index=${param.index -1}"><i class="bi bi-arrow-left"></i></a></li>
				<c:forEach begin="1" end ="${t.totalProduct/3}" var="i">
					<li class="page-item"><a class="page-link" href="Pagination?index=${i}">${i}</a></li>
				</c:forEach> 
				<li class="page-item"><a class="page-link" href="Pagination?index=${param.index +1}"><i class="bi bi-arrow-right"></i></a></li>				
			</ul>
		</div>
	</section>
	
	<%@ include file='footer.jsp' %>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	function searchByName(param) {
		var txtSearch = param.value;
		$.ajax({url: "/PRJ321x_Project_3_FX13818/SearchByAjax", 
			type: "get",
			data: {
				txtSearch: txtSearch
			},
			success: function(data) {
				var row = document.getElementById("content");
				row.innerHTML = data;
			},
			error: function(xhr) {
				
			}
			
			});
	}
</script>
	
</body>
</html>