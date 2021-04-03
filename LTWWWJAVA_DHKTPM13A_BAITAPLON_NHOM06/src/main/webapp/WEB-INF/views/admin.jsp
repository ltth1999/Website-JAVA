
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
	<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet"/>
<title>Nhân Viên Quản Trị</title>
</head>
<body>
	<%
		String ktup =(String)session.getAttribute("upsp");
		if(ktup!=null){
			if(ktup.equals("thatbai")){
	%>
				<script>
			  		alert("Sản phẩm đang được sử lý trong giỏ hàng không sửa được!!!");
				</script>
	<%		}else if(ktup.equals("thanhcong")){%>
				<script>
			  		alert("Sản phẩm đã được update thành công!!!");
				</script>
	<%
			}	
		}
		session.removeAttribute("upsp");
	%>
	<%
		String addsp =(String)session.getAttribute("addsp");
		if(addsp!=null){
			if(addsp.equals("thatbai")){
	%>
				<script>
			  		alert("Thêm sản phẩm thất bại!!!");
				</script>
	<%		}else if(addsp.equals("thanhcong")){%>
				<script>
			  		alert("Sản phẩm đã được thêm thành công!!!");
				</script>
	<%
			}	
		}
		session.removeAttribute("addsp");
	%>
	<%
		String ktdl =(String)session.getAttribute("dlsp");
		if(ktdl!=null){
			if(ktdl.equals("thatbai")){
	%>
				<script>
			  		alert("Sản phẩm đang được sử lý trong giỏ hàng không xóa được!!!");
				</script>
	<%		}else if(ktdl.equals("thanhcong")){%>
				<script>
			  		alert("Sản phẩm đã được xóa thành công!!!");
				</script>
	<%		}else if(ktdl.equals("dacohd")){%>
				<script>
			  		alert("Sản phẩm đã có trong hóa đơn không xóa được!!!");
				</script>
	<%
			}
		}
		session.removeAttribute("dlsp");
	%>
	<header><c:import url="header.jsp"></c:import></header>
	<section>		
		<div class="container" >
                <div class="row">
                    <ul class="nav nav-tabs"">
                        <li><a href="#ttcn" data-toggle="tab">Thông tin cá nhân</a></li>
                        <li><a href="#dskh" data-toggle="tab">Thông tin khách hàng</a></li>
                        <li><a href="#dssp" data-toggle="tab">Thông tin sản phẩm</a></li>
                        <li><a href="#dshd" data-toggle="tab">Thông tin hóa đơn</a></li>
                        
                    </ul>
 
                    <div class="tab-content">
                        <div class="tab-pane" id="ttcn">
                        	<div style="padding: 50px; padding-left: 300px;padding-right: 300px;">							
								<form method="post" action="${pageContext.request.contextPath}/dangxuat">
									<label>Email:${tk.email}</label> <br>
									<label>Tên:${tk.ten}</label> <br>
									<label>Mật khẩu:********</label><br>
									<label>Địa chỉ:${tk.diaChi}</label> <br>
									<label>Số điện thoại:${tk.sdt}</label><br>
									<div style="padding-left: 200px;padding-right: 200px;"><input  type="submit" value="Đăng xuất"></div>
									<div style="padding-left: 200px;padding-right: 200px;"><a href="${pageContext.request.contextPath}/updatecustomer">Bạn muốn thay đổi thông tin?</a></div>
								</form>
							</div>
                        </div>
                        <div class="tab-pane" id="dskh">
                        	<div class="table-responsive">          
							  <table class="table">
							    <thead>
							      <tr>
							        <th>Mã khách hàng</th>
							        <th>Tên khách hàng</th>
							        <th>Email</th>
							        <th>Địa chỉ</th>
							        <th>Số điện thoại</th>
							      </tr>
							    </thead>
							    <tbody>
							   <c:forEach var="tk" items="${dstk}">
								      <tr>
								        <td>${tk.maTK}</td>
								        <td>${tk.ten}</td>
								        <td>${tk.email}</td>
								        <td>${tk.diaChi}</td>
								        <td>${tk.sdt}</td>
								      </tr>   
							    </c:forEach>
							     </tbody>
							  </table>
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
								   <c:forEach var="hd" items="${dshd}">
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
                        <div class="tab-pane" id="dssp">
                        	<table id="cart" class="table table-hover table-condensed" name="tbsp">
								<thead>
									<tr>
										<th >Tên sản phẩm</th>
										<th >Đơn giá</th>
										<th>Loại Sản Phẩm</th>
										<th >Số lượng</th>
										<th>Mô tả</th>
									</tr>
								</thead>		
								<c:forEach var="sp" items="${listsp}">
									<form name="item" method="post" action="" >
										<tr>
											<td data-th="Product" >
												<div class="row">
													<div class="col-sm-2">
														<img
															src="<c:url value="${sp.image}" />"
															alt="Sản phẩm 1" class="img-responsive" width="300px"/>
													</div>
													<div >
														<h4 class="nomargin">${sp.tenSP}</h4>
													</div>
												</div>
											</td>
											<td data-th="Price">${sp.gia}</td>
											<td>${sp.loaiSP}</td>
											<td data-th="Quantity">${sp.soLuongTon}</td>
											<td data-th="Subtotal">${sp.moTa}</td>
											<td>
												<a href="${pageContext.request.contextPath}/updatesanpham/${sp.maSP}">Update</a><br>
												<a href="${pageContext.request.contextPath}/deletesp/${sp.maSP}">Delete</a>
											</td>
										</tr>
										</form>
								</c:forEach>
										<tfoot>
										<tr>
											<td>
												<form action="Thêm sản phẩm" method="post" name="f2">
													<a  href="${pageContext.request.contextPath}/themsp" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2" >Thêm sản phẩm mới</a>
												</form>
											</td>
										</tr>
									</tfoot> 
							</table>
                        </div>
					</div>
                 </div>
         </div>
		
	</section>
	<c:import url="footer.jsp"></c:import>
</body>
</html>