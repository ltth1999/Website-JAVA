
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"/>
 	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
 	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<link href="<c:url value="/resources/css/thanhsp.css" />" rel="stylesheet"/>
	<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet"/>

<title>Đăng ký</title>
<script language="javascript">
	function validateForm() {
		var email = document.getElementById('email').value;
	    var ten = document.getElementById('ten').value;
	    var password = document.getElementById('password').value;
	    var diachi = document.getElementById('diachi').value;
	    var sdt = document.getElementById('sdt').value;
	    var emailpattern = new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$");
		var lengthmk = new RegExp ("^[A-Za-z0-9]{8,}$");
		var tenpattern = new RegExp ("^[^ ].{0,255}$")
		var sdtpattern = new RegExp ("^[0-9]{10}$")
		var diachireg = new RegExp ("^[^ ].{0,255}$")
	    if(!emailpattern.test(email)){
	    	 alert('Vui lòng nhập đúng email abc@gmail.com');
		     return false;
	    }
	    else  if(!tenpattern.test(ten)){
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
		String ktdn =(String)session.getAttribute("dk");
		if(ktdn!=null){
			if(ktdn.equals("thatbai")){
	%>
	<script>
  		alert("Đăng ký thất bại!!!");
	</script>
	<%} %>
	<%
		}
		session.removeAttribute("dk");
	%>
	<header>
	<c:import url="header.jsp"></c:import></header>
	<section>
	<div style="padding: 50px; padding-left: 400px;padding-right: 400px;">
		<h1 align="center">Đăng ký</h1>
		<form action="${pageContext.request.contextPath}/dangkytaikhoan" method="post" onsubmit="return validateForm()">
			<label for="email">Email</label> 
			<input type="text" id="email" name="email" placeholder="Email của bạn..."> 
			<label>Tên</label> 
			<input type="text" id="ten" name="ten" placeholder="Tên của bạn...">
			<label for="lname">Mật khẩu</label>
			<input type="password" id="password" name="password" placeholder="Mật khẩu của bạn...">
			<label >Địa chỉ</label> 
			<input type="text" id="diachi" name="diachi" placeholder="Địa chỉ của bạn..."> 
			<label >Số điện thoại</label> 
			<input type="text" id="sdt" name="sdt" placeholder="Số điện thoại của bạn..."> 
			<div style="padding-left: 200px;padding-right: 200px;"><input  type="submit" value="Đăng ký" ></div>
			<a href="${pageContext.request.contextPath}/login">Đăng nhập?</a>
		</form>
	</div>
	</section>
	<footer>
	<c:import url="footer.jsp"></c:import></footer>
</body>
</html>