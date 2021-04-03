
<%@page import="se.iuh.edu.entity.SanPham"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="<c:url value="/resources/css/bootstrap.min.css" />"
  rel="stylesheet">
 	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
 	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<link href="<c:url value="/resources/css/thanhsp.css" />"
  rel="stylesheet">
<title>Trang Chủ</title>
</head>
<body>
	<c:import url="header.jsp"></c:import>	
	<section>
		<div class="container">
			<div class="products">
					<h2 class=" products-in">Tất cả sản phẩm</h2>
					<div class=" top-products">	
					<% 
						int i=0; 
					%>
					<c:forEach var="sp" items="${listspbyloai}">
						<div class="col-md-3 md-col">
							<div class="col-md">
								<a href="${pageContext.request.contextPath}/spbyid/${sp.maSP}" class="compare-in"><img  
								src="<c:url value="${sp.image}" />" alt="" />
								</a>	
								<div class="top-content">
									<h5><a href="${pageContext.request.contextPath}/spbyid/${sp.maSP}"></a>${sp.tenSP}</h5>
									<div class="white">
										<a href="${pageContext.request.contextPath}/spbyid/${sp.maSP}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">Add to Cart</a>
										<p class="dollar"><span class="in-dollar">$</span><span>${sp.gia}</span></p>
										<div class="clearfix"></div>
										<%i=i+1;%>
									</div>
								</div>							
							</div>
						</div>
						<%if(i%4==0){ %>
							<div class="clearfix"></div>
							<div style="height: 30px"></div>
						<%} %>
						</c:forEach>
					</div>
			</div>
		</div>
		<%if(i<4|| i%4!=0){ %>
			<div class="clearfix"></div>
			<div style="height: 30px"></div>
		<%} %>
	</section>
	<c:import url="footer.jsp"></c:import>
</body>
</html>