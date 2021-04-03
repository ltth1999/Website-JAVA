
<%@page import="se.iuh.edu.entity.SanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi Tiết Sản Phẩm</title>
	<link href="<c:url value="/resources/css/bootstrap.min.css" />"
  rel="stylesheet">
 	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
 	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<link href="<c:url value="/resources/css/thanhsp.css" />"
  rel="stylesheet">

	<link href="<c:url value="/resources/css/etalage.css" />"
	  rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery.etalage.min.js" />"></script>

<script>
	jQuery(document)
			.ready(
					function($) {

						$('#etalage')
								.etalage(
										{
											thumb_image_width : 300,
											thumb_image_height : 400,
											source_image_width : 900,
											source_image_height : 1200,
											show_hint : true,
											click_callback : function(
													image_anchor, instance_id) {
												alert('Callback example:\nYou clicked on an image with the anchor: "'
														+ image_anchor
														+ '"\n(in Etalage instance: "'
														+ instance_id + '")');
											}
										});

					});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close').on('click', function(c) {
			$('.message').fadeOut('slow', function(c) {
				$('.message').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close1').on('click', function(c) {
			$('.message1').fadeOut('slow', function(c) {
				$('.message1').remove();
			});
		});
	});
</script>
</head>
<body>

	
	<header>
	<c:import url="header.jsp"></c:import></header>
	<section>
	<form action="${pageContext.request.contextPath}/themcart/${sp.maSP}">
		<div class="container">
		<div class="single">
			<div class="col-md-9 top-in-single">
				<div class="col-md-5 single-top">
					<ul id="etalage">
						<li><a> <img
								class="etalage_thumb_image img-responsive" src="<c:url value="${sp.image}" />"
								alt=""> <img class="etalage_source_image img-responsive" src="<c:url value="${sp.image}" />" alt="">
						</a></li>

					</ul>

				</div>
				<div class="col-md-7 single-top-in">
					<div class="single-para">
						<h4>${sp.tenSP}</h4>
						<div class="available">
							Số lượng:<select name="soluongmua">
								<c:forEach var="i" begin="1" end="${sp.soLuongTon}">
								<option>${i}</option>
								</c:forEach>
							</select>
						</div>
						<div class="para-grid">
							<span style="padding-right: 100px;" class="add-to">$ ${sp.gia}</span>
							<input type="submit" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2" value="Add to cart"/>
							<div class="clearfix"></div>
							
						</div>
						<p>${sp.moTa}</p>
					</div>
				</div>
				<div class="clearfix"></div>
	</form>
	</section>
	<footer>
	<c:import url="footer.jsp"></c:import></footer>
</body>
</html>