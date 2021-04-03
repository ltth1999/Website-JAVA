
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
<title>Customer</title>
</head>
<body>
	<header><c:import url="header.jsp"></c:import></header>
	<section>
		<div class="container" >
                <div class="row">
                    <ul class="nav nav-tabs"">
                        <li><a href="#ttcn" data-toggle="tab">Thông tin cá nhân</a></li>
                        <li><a href="#dshd" data-toggle="tab">Thông tin hóa đơn</a></li>
                    </ul>
 
                    <div class="tab-content">
                        <div class="tab-pane" id="ttcn">
                        	<div style="padding: 50px; padding-left: 300px;padding-right: 300px;">
								<h1 align="center">Thông tin khách hàng</h1>
								<form method="post" action="${pageContext.request.contextPath}/dangxuat">
									<label>Email:${tk.email}</label> <br>
									<label>Tên:${tk.ten}</label> <br>
									<label>Mật khẩu:********</label><br>
									<label>Địa chỉ: ${tk.diaChi}</label> <br>
									<label>Số điện thoại:${tk.sdt}</label><br>
									<div style="padding-left: 200px;padding-right: 200px;"><input  type="submit" value="Đăng xuất"></div>
									<div style="padding-left: 200px;padding-right: 200px;"><a href="${pageContext.request.contextPath}/updatecustomer">Bạn muốn thay đổi thông tin?</a></div>
								</form>
							</div>
                        </div>
                          	
                        <div class="tab-pane" id="dshd">
                        	<div class="table-responsive">          
								  <table class="table">
								    <thead>
								      <tr>
								        <th>Mã hóa đơn</th>
								        <th>Tổng tiền</th>
								        <th>Ngày thanh toán</th>
								      </tr>
								    </thead>
								    <tbody>
								   <c:forEach var="hd" items="${dshdbytk}">
									      <tr>
									        <td>${hd.maHD}</td>
									        <td>${hd.tongTien}</td>
									        <td>${hd.ngayTT}</td>
									      </tr>   
								   </c:forEach>	
								     </tbody>
								  </table>
							  </div>
                        </div>
                 </div>
               </div>
            </div>  
	</section>
	<footer><c:import url="footer.jsp"></c:import></footer>
</body>
</html>
