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

<title>Thêm sản phẩm</title>
<script language="javascript">
	function validateForm() {
		var ten = document.getElementById('ten').value;
	    var sl = document.getElementById('sl').value;
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
	    else if (sl == '')
	    {
	        alert('Bạn chưa nhập số lượng');
	        return false;
	    }
	    else if(!slpattern.test(sl)){
	    	 alert('Số lượng là số nguyên dương và nhỏ hơn 100');
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
	<%
		String ktthem =(String)session.getAttribute("addsp");
		if(ktthem!=null){
			if(ktthem.equals("thatbai")){
	%>
	<script>
  		alert("Thêm thất bại!!!");
	</script>
	<%} %>
	<%
		}
		session.removeAttribute("addsp");
	%>
	<header>
	<c:import url="header.jsp"></c:import></header>
	<section>
	<div style="padding: 50px; padding-left: 400px;padding-right: 400px;">
		<h1 align="center">Thêm sản phẩm mới</h1>
		<form action="${pageContext.request.contextPath}/themsanpham" method="post"  onsubmit="return validateForm()">
			<label >Tên sản phẩm</label> 
			<input type="text" id="ten" name="ten" placeholder="Tên của sản phẩm..."> 
			<label>Hãng sản phẩm</label> 
			<select name="loaisp">
				<option value="Canon">Canon</option>
				<option value="Fujifilm">Fujifilm</option>
				<option value="Nikon">Nikon</option>
				<option value="Sony">Sony</option>
			</select>
			<label >Số lượng</label>
			<input type="text" id="sl" name="sl" placeholder="Số lượng của sản phẩm...">
			<label >Đơn giá</label> 
			<input type="text" id="dongia" name="dongia" placeholder="Đơn giá của sản phẩm..."> 
			<label >Mô tả</label> 
			<input type="text" id="mota" name="mota" placeholder="Mô tả của sản phẩm..."> 
			<input type="file" name="image">
			<div style="padding-left: 200px;padding-right: 200px;"><input  type="submit" value="Thêm"></div>
			<a href="${pageContext.request.contextPath}/admin">Danh sách sản phẩm</a>
		</form>
	</div>
	</section>
	<footer>
	<c:import url="footer.jsp"></c:import></footer>
</body>
</html>