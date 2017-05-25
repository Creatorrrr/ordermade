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

<body>
	<div class="wrapper">
		<div class="top-strip">
			<div class="top-strip-cor1"></div>
			<div class="top-strip-cor2"></div>
			<div class="top-strip-cor3"></div>
			<div class="top-strip-cor4"></div>

			<div class="nav  navbar-right" style="margin-right: 20px;">
				<div class="menu">
					<c:choose>
						<c:when test="${loginId eq null }">
							<ul>
								<li><a id="loginBtn" href="index.jsp">login</a></li>
								<li><a href="register.jsp">sign up</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<span class="glyphicon glyphicon-user"></span>
							<b>${loginId}</b>님!! 환영합니다. [<a href="${ctx }/logout.do">로그아웃</a>]
							<ul>
								<li><a href="${ctx}/member/detail.do">회원정보</a></li>
								<%-- <li><a href="${ctx}/member/inviteList.do">초대 온 목록</a></li> --%>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="logo">
				<h1>
					팝니다
				</h1>
				<h2>1:1매칭 서비스</h2>
			</div>

			<div class="search-panel">
				<div class="search-panel-cor1"></div>
				<div class="search-panel-cor2"></div>
				<div class="search-box">
					<input name="" type="text" class="search-box-input" value=""
						placeholder="search here" />
					<div class="search-icon"></div>
				</div>
			</div>

			<div class="clearing"></div>

			<div class="menu padTop b-top ">
				<ul>
					<li><a href="index.html">home</a></li>
					<li><a href="about.html" class="active">가구</a></li>
					<li><a href="services.html">악세사리</a></li>
					<li><a href="projects.html">의류</a></li>
					<li><a href="#">blog</a></li>
					<li><a href="contact.html">contact</a></li>
				</ul>
			</div>
			<div class="clearing"></div>
		</div>
	</div>