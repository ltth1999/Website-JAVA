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
<title>Đăng Nhập</title>
<script language="javascript">
	function validateForm() {
		var email = document.getElementById('email').value;
	    var password = document.getElementById('password').value;
	    if (email == ''){
	        alert('Bạn chưa nhập email');
	        return false;
	    }
	    else if (password == '')
	    {
	        alert('Bạn chưa nhập mật khẩu');
	        return false;
	    }
	    return true;
	}
</script>
</head>
<body>
	<%
		String kt = (String) session.getAttribute("dn");
		if (kt != null) {
			if (kt.equals("thatbai")) {
	%>
	<script>
		alert("Đăng nhập thất bại!!!");
	</script>
	<%
		}
	%>
	<%
		} session.removeAttribute("dn");
	%>
	<%
		String ktdk = (String) session.getAttribute("dk");
		if (ktdk != null) {
			if (ktdk.equals("thanhcong")) {
	%>
	<script>
		alert("Đăng ký thành công!!!");
	</script>
	<%
		}
	%>
	<%
		}session.removeAttribute("dk");
	%>
	<header> <c:import url="header.jsp"></c:import></header>
	<section>
	<div style="padding: 50px; padding-left: 400px; padding-right: 400px;">
		<h1 align="center">Đăng Nhập</h1>
		<form action="${pageContext.request.contextPath}/dangnhap" method="post" onsubmit="return validateForm()">
			<label for="email">Email</label> 
			<input type="text" id="email" name="email" placeholder="Email của bạn..."> 
			<label for="password">Mật Khẩu</label> 
			<input type="password" id="password" name="password" placeholder="Mật khẩu của bạn...">
			<div style="padding-left: 200px; padding-right: 200px;">
				<input type="submit" value="Đăng nhập">
			</div>
			<a href="${pageContext.request.contextPath}/dangky">Bạn muốn đăng ký?</a><br>
		</form>
	</div>
	</section>
	<footer> <c:import url="footer.jsp"></c:import></footer>
</body>
</html>