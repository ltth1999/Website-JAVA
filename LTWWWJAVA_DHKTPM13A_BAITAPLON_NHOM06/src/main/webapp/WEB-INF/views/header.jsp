
<%@page import="se.iuh.edu.entity.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h:head>
	<title>header</title>
	<link href="<c:url value="/resources/css/header.css" />"
  rel="stylesheet"/>
</h:head>
<body>
	<%
		String x="login";
		TaiKhoan tk = (TaiKhoan)session.getAttribute("tk");
		if(tk!=null){
			if(tk.getLoaiTK().trim().equals("Nhan Vien"))x="admin";
			else x="customer";
		}
	%>
	<nav class="navbar  navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<ul>
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/"> <img
						alt="logo" src="<c:url value="/resources/images/logo3.png" />">
				</a></li>
			</ul>
		</div>
		<ul class="nav navbar-nav navbar-right"
			style="padding-top: 70px; margin-right: 50px; margin-bottom: 50px;">
				<li class="submenu"><a class="suba" href="${pageContext.request.contextPath}">Tất cả máy ảnh</a></li>
  				<li class="submenu"><a class="suba" href="${pageContext.request.contextPath}/dssanpham/Canon">Canon</a></li>
  				<li class="submenu"><a class="suba" href="${pageContext.request.contextPath}/dssanpham/Fujifilm">Fujifilm</a></li>
  				<li class="submenu"><a class="suba" href="${pageContext.request.contextPath}/dssanpham/Nikon">Nikon</a></li>
 				<li class="submenu"><a class="suba" href="${pageContext.request.contextPath}/dssanpham/Sony">Sony</a></li>
			
			<li>
				<form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/findsp" method="">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							name="tim">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</li>
			<li><a class="suba" href="${pageContext.request.contextPath}/<%=x%>">Tài khoản</a></li>
			<li><a class="suba" href="${pageContext.request.contextPath}/giohang">
					<div class="cart">
						<img src="<c:url value="/resources/images/cart1.png" />" alt="giohang"></img> <span>
							${cart.getSLLoaiSPMua()}</span>
					</div>
			</a></li>
		</ul>

	</div>
	</nav>
	<div style="height: 200px">
	</div>
</body>
</html>
