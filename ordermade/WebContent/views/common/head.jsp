<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${ctx }/views/layout/styles/layout.css" rel="stylesheet"
	type="text/css" media="all">
<link href="${ctx }/views/css/jquery.bxslider.min.css" rel="stylesheet" />
<link href="${ctx }/views/css/uploadfile.css" rel="stylesheet">
<script src="${ctx }/views/layout/scripts/jquery.min.js"></script>
<script src="${ctx }/views/layout/scripts/jquery.fitvids.min.js"></script>
<script src="${ctx }/views/layout/scripts/jquery.mobilemenu.js"></script>
<script src="${ctx }/views/js/jquery.form.min.js"></script>
<script src="${ctx }/views/js/jquery.blockUI.min.js"></script>
<script src="${ctx }/views/layout/scripts/tabslet/jquery.tabslet.min.js"></script>
<script src="${ctx }/views/js/jquery.bxslider.min.js"></script>
<script src="${ctx }/views/js/jquery.uploadfile.min.js"></script>
<script src="${ctx }/views/vendor/ckeditor/ckeditor.js"></script>
<%-- <script src="${ctx }/views/js/jquery.validate.min.js"></script>
<script src="${ctx }/views/js/additional-methods.min.js"></script>
<script src="${ctx }/views/js/messages_ko.min.js"></script> --%>

<body id="top">
	<div class="wrapper row0">
		<div id="topbar" class="clear">
			<nav>
				<ul>
					<c:choose>
						<c:when test="${loginId eq null }">
							<ul>
								<li><a id="loginBtn" href="${ctx }/member/login.do">Login</a></li>
								<li><a href="${ctx }/member/join.do"
									class="btn btn-success">Sign up</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<span class="glyphicon glyphicon-user"></span>
							<b>${loginId}</b>님 환영합니다. [<a href="${ctx }/member/logout.do">로그아웃</a>]
							<ul>
								<li><a href="${ctx}/member/myPage.do">회원정보</a></li>

							</ul>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>

	<div class="wrapper row1">
		<header id="header" class="clear">
			<div id="logo" class="fl_left">
				<h1>
					<a href="${ctx }/views/index.jsp"><img
						src="${ctx }/views/images/panda4.jpg"
						style="width: 100px; height: 100px"> 판다</a>
				</h1>
				<p>다 판다</p>
				<p>없으면 만들어서 판다</p>
				<p>1:1 매칭 서비스</p>
			</div>

			<div class="fl_right">
				<form class="clear" method="post" action="#">
					<fieldset>
						<legend>Search:</legend>
						<input name="" class="search-box-input" type="text" value=""
							placeholder="Search Here" />
						<button class="fa fa-search" type="submit" title="Search">
							<em>Search</em>
						</button>
					</fieldset>
				</form>
			</div>

		</header>
	</div>

	<div class="wrapper row2">
		<div class="rounded">
			<nav id="mainav" class="clear">
				<ul class="clear">
					<li class=""><a href="${ctx }/views/index.jsp">Main</a></li>
					<li><a class="drop" href="#">Product</a> 
					<ul>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=FUNITURE">Furniture</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=ACCESSORY">Accessory</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=KITCHEN">Kitchen</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=DIGITAL">Digital</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=CLOTHING">Clothing</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=SPORT">Sport </a></li>
					</ul>
					</li>
						
						<%-- <c:forEach items="${products }" var="product">
							<li><a class="btn btn-sm btn-success"
								href="${ctx}/product//ajax/product/productid?productId=${product.id}">${product.title }</a>
							</li>
						</c:forEach> --%>
					<li><a href="${ctx }/portfolio/ui/search.do?type=FUNITURE">Portfolio</a></li>
					<c:if test="${sessionScope.loginId ne null}">
						<li><a href="${ctx}/request/ui/myRequest.do">Request</a></li>
					</c:if>
					<c:if test="${sessionScope.loginId eq null}">
						<li><a href="${ctx}/request/ui/myRequest.do">Request</a></li>
					</c:if>
					<c:choose>
						<c:when test="${sessionScope.memberType eq 'C' }">
							<li>
								<a href="${ctx }/request/ui/consumerInviteList.do?page=1">Invite Request</a>
							</li>
						</c:when>
						<c:when test="${sessionScope.memberType eq 'M' }">
							<li>
								<a href="${ctx }/request/ui/makerInviteList.do?page=1">Invite Request</a>
							</li>
						</c:when>
					</c:choose>
					
					<li><a href="${ctx}/member/myPage.do">my page</a></li>
				</ul>
			</nav>
		</div>
	</div>