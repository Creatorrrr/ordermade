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
				<h1>팝니다</h1>
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


			<div class="banner-wrapper">

				<div id="carousel">
					<div id="slides">
						<ul>
							<li><img src="${ctx}views/images/banner1.png" alt="Slide 1" /></li>
							<li><img src="${ctx}views/images/banner2.png" alt="Slide 2" /></li>
							<li><img src="${ctx}views/images/banner3.png" alt="Slide 3" /></li>
						</ul>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<div id="buttons">
						<a href="#" id="prev">prev</a> <a href="#" id="next">next</a>
						<div class="clear"></div>
					</div>
				</div>
			</div>
			<div class="menu">
				<ul>
					<li><a class="active" href="index.jsp">home</a></li>
					<li><a href="about.html">가구</a></li>
					<li><a href="services.html">악세사리</a></li>
					<li><a href="projects.html">의류</a></li>
					<li><a href="#">blog</a></li>
					<li><a href="contact.html">contact</a></li>
				</ul>
			</div>
			<div class="clearing"></div>
		</div>
		<div class="clearing"></div>
		<!--- top strip div end -->



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
			<!--- hit div end -->


			<div class="page-wrapper">
				<div class="primary-content marRight40">
					<div class="panel">
						<div class="title">
							<h1>aecenas at arcu</h1>
						</div>
						<div class="left marRight30">
							<div class="imgbg">
								<div class="imgbg-corl"></div>
								<div class="imgbg-cor2"></div>
								<div class="imgbg-cor3"></div>
								<div class="imgbg-cor4"></div>
								<div class="img">
									<img src="images/img3.jpg" />
								</div>
							</div>
						</div>
						<div class="right">
							<p>
								<span>Voluptatem sequi nesciunt</span><br /> Nemo enim ipsam
								voluptatem, quia voluptas sit, aspernatur aut odit aut fugit,
								sed quia consequuntur magni dolores eos, qui ratione voluptatem
								sequi nesciunt.
							</p>
						</div>
					</div>

					<div class="panel bdrBottom">

						<div class="left marRight30">
							<div class="imgbg">
								<div class="imgbg-corl"></div>
								<div class="imgbg-cor2"></div>
								<div class="imgbg-cor3"></div>
								<div class="imgbg-cor4"></div>
								<div class="img">
									<img src="images/img4.jpg" />
								</div>
							</div>
						</div>
						<div class="right">
							<p>
								<span>Voluptatem sequi nesciunt</span><br /> Nemo enim ipsam
								voluptatem, quia voluptas sit, aspernatur aut odit aut fugit,
								sed quia consequuntur magni dolores eos, qui ratione voluptatem
								sequi nesciunt.
							</p>
						</div>
					</div>

				</div>
				<div class="sidebar">
					<div class="title">
						<h1>ellente laoreet sumpric</h1>
					</div>
					<div class="left marRight20">
						<div class="imgbg">
							<div class="imgbg-corl"></div>
							<div class="imgbg-cor2"></div>
							<div class="imgbg-cor3"></div>
							<div class="imgbg-cor4"></div>
							<div class="img">
								<img src="images/img5.jpg" />
							</div>
						</div>

					</div>
					<div class="right">
						<p>
							<span>01. Voluptatem sequi nesciunt</span><br /> Nemo enim ipsam
							voluptatem, quia voluptas sit, aspernatur
						</p>
						<p>
							<span>02. Voluptatem sequi nesciunt</span><br /> Nemo enim ipsam
							voluptatem, quia voluptas sit, aspernatur
						</p>
						<p>
							<span>03. Voluptatem sequi nesciunt</span><br /> Nemo enim ipsam
							voluptatem, quia voluptas sit, aspernatur
						</p>
					</div>
				</div>
			</div>
			<!--- page wrapper div end -->

			<div class="footer-wrapper">
				<div class="sidebar">
					<div class="footer">
						<div class="title">
							<h1>이용 방법</h1>
						</div>
						<div class="left marRight20">
							<div class="img">
								<img src="images/img5.jpg" />
							</div>
						</div>
					</div>
					<div class="right">
						<p>
							<span>01. 상품페이지를 검색한 뒤 주문 제작 버튼을 누릅니다.<br/>
						</p>
						<p>
							<span>02. 의뢰서를 제작합니다.</span><br />
						</p>
						<p>
							<span>03. 의뢰서를 등록면 제작자와 1:1 매칭이 이루어집니다.</span><br/>
						</p>
						<p>
							<span>04. 제작자와 대화를 통해 원하는 물건을 제작할 수 있습니다.</span><br/>
						</p>
					</div>



					<!-- 	<div class="panel marRight30" align="center">
						<div class="title" align="center">
							<h1>이용 방법</h1>
						</div>
						<div class="content" align="center">
							<p>1. 주문 제작 버튼을 누르고</br>
							2. 콘티를 제작하여 </br>
							3. 제작자와 1:1 매칭을 통해서</br>
							4. 자신의 요구사항을 보완하여</br>
							5. 내가 원하는 물건을 만들어보아요</p>
						</div>
					</div> -->
				</div>
			</div>
		</div>
		<!--- footer wrapper div end -->


		<div class="copyright">
			<p>
				Copyright (c) websitename. All rights reserved. <a
					href="http://www.alltemplateneeds.com"> <
					www.alltemplateneeds.com ></a> Images From: <a
					href="http://www.photorack.net">www.photorack.net</a>
			</p>
		</div>
	</div>
	<!--- wrapper div end -->
</body>
</html>
