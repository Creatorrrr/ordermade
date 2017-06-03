<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div class="wrapper row0">
		<div id="topbar" class="clear">
			<nav>
				<ul>
					<c:choose>
						<c:when test="${loginId eq null }">
							<ul>
								<li>
									<a id="loginBtn" href="${ctx }/member/login.do">Login</a></li>
								<li>
								<a href="${ctx }/member/join.do" class="btn btn-success">Sign up</a></li>
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
					<a href="${ctx }/">
					<img src="${ctx }/views/images/panda4.jpg" style="width: 100px; height: 100px"> 판다</a>
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
					<li class=""><a href="${ctx }/">메인</a></li>
					<li>
						<a class="drop" href="${ctx }/product/ui/search.do">상품</a> 
						<ul>
						<c:forEach items="${categories}" var="category">
							<li><a href="${ctx }/product/ui/search.do?category=${category.type}">${category.type }</a></li>
						</c:forEach>
						</ul>
					</li>
					<li>
						<a class="drop" href="${ctx }/portfolio/ui/search.do">포트폴리오</a>
						<ul>
						<c:forEach items="${categories }" var="category">
							<li><a href="${ctx }/portfolio/ui/search.do?type=${category.type}">${category.type }</a></li>
						</c:forEach>
						</ul>
					</li>
					<c:if test="${sessionScope.loginId ne null}">
						<li><a href="${ctx}/request/ui/myRequest.do">의뢰서</a></li>
					</c:if>
					<c:choose>
						<c:when test="${sessionScope.memberType eq 'C' }">
							<li><a href="${ctx }/request/ui/consumerInviteList.do?page=1">참가 요청내역</a></li>
						</c:when>
						<c:when test="${sessionScope.memberType eq 'M' }">
							<li><a href="${ctx }/request/ui/makerInviteList.do?page=1">참가 요청내역</a></li>
						</c:when>
					</c:choose>
					<li><a href="${ctx}/member/myPage.do">마이 페이지</a></li>
				</ul>
			</nav>
		</div>
	</div>