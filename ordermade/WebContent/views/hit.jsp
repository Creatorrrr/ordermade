<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>1:1매칭 서비스</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/carouselScript.js"></script>
<link href="css/carousel.css" rel="stylesheet" type="text/css">
</head>

<div class="panel-wrapper">
	<div class="panel marRight40">
		<div class="title">
			<h1>인기 상품</h1>
		</div>
		<%-- <div class="imgbg">
					<div class="imgbg-corl"></div>
					<div class="imgbg-cor2"></div>
					<div class="imgbg-cor3"></div>
					<div class="imgbg-cor4"></div>
					<div class="img">
						<img src="${ctx }/views/images/img1.jpg" />
					</div>
				</div> --%>

		<%-- <c:forEach items="${ box_list }" var="literature"> --%>
		<div class="content" align="center">
			<table class="table table-striped table-hover ">

				<tr>
					<div class="imgbg">
						<div class="imgbg-corl"></div>
						<div class="imgbg-cor2"></div>
						<div class="imgbg-cor3"></div>
						<div class="imgbg-cor4"></div>
						<div class="img">
							<img src="${ctx }/views/images/img1.jpg" />
						</div>
					</div>
				</tr>
				<tr>
					<td>상품 이름</td>
					<td><a class="literature" href="${ctx}/#/#.do?#=${asf }">${asf  }</a></td>
				</tr>
				<tr>
					<td>가격</td>
					<td class="creatorId">${asf}</td>
				</tr>
			</table>
		</div>
		<%-- </c:forEach> --%>
	</div>
</div>