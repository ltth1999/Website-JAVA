
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
<title>Thay Đổi Thông Tin Sản Phẩm</title>
<script language="javascript">
	function validateForm() {
	    var ten = document.getElementById('ten').value;
	    var sl = document.getElementById('soluong').value;
	    var dg = document.getElementById('dongia').value;
	    var mt = document.getElementById('mota').value;
		var slpattern = new RegExp ("^([0-9]{1,2})$");
		var dgpattern = new RegExp ("^([0-9_\.]{1,10})$");
		var mtpattern = new RegExp ("^[^ ].{1,255}$");
		var tenpattern = new RegExp("^[^ ].{1,255}$");
	    if (ten == '')
	    {
	        alert('Bạn chưa nhập tên');
	        return false;
	    }
	    else if (!tenpattern.test(ten))
	    {
	        alert('Tên không hợp lệ');
	        return false;
	    }
	    else if (dg == '')
	    {
	        alert('Bạn chưa nhập đơn giá');
	        return false;
	    }
	    else if (!dgpattern.test(dg))
	    {
	        alert('Đơn giá phải là số dương và không quá 6 ký tự');
	        return false;
	    }
	    else if (sl == '')
		    {
		        alert('Bạn chưa nhập số lượng');
		        return false;
		    }
	    else if(!slpattern.test(sl)){
	    	 alert('Số lượng là số nguyên dương và nhỏ hơn 100');
		     return false;
	    }
	    
	    else if(mt == ''){
	    	 alert('Bạn chưa nhập mô tả');
	   		 return false;
	    }
	    else if(!mtpattern.test(mt)){
	    	alert('Mô tả quá dài');
	   		return false;
	    }
	    return true;
	}
</script>
</head>
<body>
		
	<header><c:import url="header.jsp"></c:import></header>
	<section>
		<div style="padding: 50px; padding-left: 300px;padding-right: 300px;">
		<h1 align="center">Thông tin sản phẩm</h1>
		<div align="center"><img style="width:300px;" alt="" src="<c:url value="${sp.image}" />"/></div>
		<form action="${pageContext.request.contextPath}/updatesp/${sp.maSP}" method="post" onsubmit="return validateForm()">
		<label for="fname">Mã Sản Phẩm</label> 
			<input type="text" disabled="true" value="${sp.maSP}"> 
			<label>Tên sản phẩm</label> 
			<input type="text" id="ten" name="ten" value="${sp.tenSP}">
			<label for="lname">Đơn giá</label>
			<input type="text" id="dongia" name="dongia" value="${sp.gia}">
			<label>Số lượng</label> 
			<input type="text" id="soluong" name="soluong" value="${sp.soLuongTon}"> 
			<label>Mô tả</label> 
			<input type="text" id="mota" name="mota" value="${sp.moTa}"> 
			<label>Image</label> 
			<input type="file" id="image" name="image" value="${sp.image}">
			<input type="hidden" name="imagecu" value="${sp.image}"/> 
			<input type="hidden" name="loaisp" value="${sp.loaiSP}"/> 
			<div style="padding-left: 200px;padding-right: 200px;"><input  type="submit" value="Lưu thay đổi"></div>
			<div style="padding-left: 200px;padding-right: 200px;"><a href="${pageContext.request.contextPath}/admin">Quay lại</a>
		</form>
	</div>
		
	</section>
	<footer><c:import url="footer.jsp"></c:import></footer>
</body>
</html>