
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"/>
 	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
 	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
 	<link href="<c:url value="/resources/css/giohang.css" />" rel="stylesheet"/>
 	<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
	
<title>Giỏ Hàng</title>
</head>
<body>
	<%
		String ktup =(String)session.getAttribute("upsl");
		if(ktup!=null){
			if(ktup.equals("thatbai")){
	%>
				<script>
			  		alert("Bạn đã mua vượt quá số lượng tồn!!!");
				</script>
	<%		} else if(ktup.equals("chuanhap")){%>
				<script>
			  		alert("Bạn chưa nhập số lượng cần update!!!");
				</script>
	<%	
			}
		}session.removeAttribute("upsl");%>
	<%
		String tt =(String)session.getAttribute("thanhtoan");
		if(tt!=null){
			if(tt.equals("thanhcong")){
	%>
	<script>
  		alert("Bạn đã thanh toán thành công!!!");
	</script>
	<% 		}else if(tt.equals("thatbai")){
	%>
			<script>
		  		alert("Giỏ hàng trống!!!");
			</script>
			<%} %>
	<%} 	session.removeAttribute("thanhtoan");
	%>
	<header>
	<c:import url="header.jsp"></c:import></header>
	<section>
	<div class="container">
		<h1>Giỏ Hàng</h1>
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Tên sản phẩm</th>
					<th style="width: 10%">Giá</th>
					<th style="width: 8%">Số lượng</th>
					<th style="width: 22%" class="text-center">Thành tiền</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<c:forEach var="cartItem" items="${cart.getAllCardItem()}">
				<form name="item" method="get" action="${pageContext.request.contextPath}/changecart/${cartItem.maSP}" >
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img
										src="<c:url value="${cartItem.hinhAnh}" />"
										alt="Sản phẩm 1" class="img-responsive" width="300px"/>
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin">${cartItem.ten}</h4>
								</div>
							</div>
						</td>
						<td data-th="Price">${cartItem.dongia}</td>
						<td data-th="Quantity"><input class="form-control text-center" name="soluongmua"
							value="${cartItem.slmua}" type="number"></td>
						<td data-th="Subtotal" class="text-center">${cartItem.tongTien}</td>
						<input type="hidden" name="slton" value="${cartItem.slton}">
						<td >
							<input type="submit" name="action" value="Update">
							 <input type="submit" name="action" value="Delete">
						</td>
					</tr>
					</form>
			</c:forEach>
					<tfoot>
					<tr>
						<td><a href="${pageContext.request.contextPath}/" class="btn btn-warning"><i
								class="fa fa-angle-left"></i> Tiếp tục mua hàng</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Tổng tiền
								${cart.getTongTienHD()} $</strong></td>
						<td>
							<form action="${pageContext.request.contextPath}/thanhtoan" method="post" name="f2">
								<input type="submit" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2" value="Thanh Toán"/>
							</form>
						</td>
					</tr>
				</tfoot> 
		</table>
	</div>
	</section>
	<c:import url="footer.jsp"></c:import>
</body>
</html>