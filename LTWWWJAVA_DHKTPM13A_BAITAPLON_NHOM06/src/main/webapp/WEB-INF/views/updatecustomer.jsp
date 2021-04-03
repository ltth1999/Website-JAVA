
<%@page import="se.iuh.edu.entity.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"/>
 	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
 	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet"/>
<title>Thay Đổi Thông Tin</title>
<script language="javascript">
	function validateForm() {
	    var ten = document.getElementById('ten').value;
	    var password = document.getElementById('pass').value;
	    var diachi = document.getElementById('diachi').value;
	    var sdt = document.getElementById('sdt').value;
		var lengthmk = new RegExp ("^[A-Za-z0-9]{8,}");
		var sdtpattern = new RegExp ("^[0-9]{10}$")
		var diachireg = new RegExp ("^[^ ].{0,255}$")
		var tenpattern = new RegExp ("^[^ ].{0,255}$")
		if(!tenpattern.test(ten)){
	    	 alert('Tên có từ 1-255 ký tự');
		     return false;
	    }
	    else if(!lengthmk.test(password)){
	    	 alert('Mật khẩu có ít nhất 8 ký tự');
		     return false;
	    }
	    else if (!diachireg.test(diachi))
	    {
	        alert('Địa chỉ gồm 1-255 ký tự');
	        return false;
	    }
	    else if(!sdtpattern.test(sdt)){
	    	 alert('Số điện thoại bao gồm 10 ký tự số');
	   		 return false;
	    }
	    return true;
	}
</script>
</head>
<body>
	<%
		String x="customer";
		TaiKhoan tk = (TaiKhoan)session.getAttribute("tk");
		if(tk.getLoaiTK().trim().equals("Nhan Vien")) x="admin";
	%>
		
	<header><c:import url="header.jsp"></c:import></header>
	<section>
		<div style="padding: 50px; padding-left: 300px;padding-right: 300px;">
		<h1 align="center">Thông tin cá nhân</h1>
		<form action="${pageContext.request.contextPath}/updatett" method="post" onsubmit="return validateForm()">
		<label for="fname">Email</label> 
			<input type="text" disabled="true" value="${tk.email}"> 
			<label>Tên</label> 
			<input type="text" id="ten" name="ten" value="${tk.ten}">
			<label for="lname">Mật khẩu</label>
			<input type="password" id="pass" name="password" value="${tk.matKhau}">
			<label>Địa chỉ</label> 
			<input type="text" id="diachi" name="diachi" value="${tk.diaChi}"> 
			<label>Số điện thoại</label> 
			<input type="text" id="sdt" name="sdt" value="${tk.sdt}"> 
			<div style="padding-left: 200px;padding-right: 200px;"><input  type="submit" value="Lưu thay đổi"></div>
			<div style="padding-left: 200px;padding-right: 200px;"><a href="${pageContext.request.contextPath}/<%=x%>">Quay lại</a>
		</form>
	</div>
		
	</section>
	<footer><c:import url="footer.jsp"></c:import></footer>
</body>
</html>