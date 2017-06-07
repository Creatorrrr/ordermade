<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper row0">
	<div id="topbar" class="clear" style="padding-top: 10px;">

		<div id="logo" class="fl_left heading"
			style="line-height: 70px; font-size: 70px; margin: 0px;">
			<a href="${ctx }/"><img src="${ctx }/views/images/panda4.jpg"
				style="width: 80px; height: 80px"><b>판다</b></a>


			<div class="text-center"
				style="line-height: 10px; font-size: 15px; margin: 0px;">
				<p>1:1 매칭 서비스</p>
			</div>
		</div>


		<nav style="margin-top: 20px; font-size: 20px;">
			<c:choose>
				<c:when test="${loginId eq null }">

					<li><a href="${ctx }/member/login.do">Login</a></li>
					<li><a href="${ctx }/member/join.do">sign up</a></li>
					<%-- <a id="loginBtn" href="${ctx }/member/login.do"
						class="btn btn-success">로그인</a>
					<a href="${ctx }/member/join.do" class="btn btn-success">회원가입</a> --%>
				</c:when>
				<c:otherwise>

					<b>${loginId}</b>님 환영합니다. &nbsp;
					<li><a href="${ctx }/member/logout.do">Logout</a></li>
					<li><a href="${ctx}/member/myPage.do">my page</a></li>
						<%-- 	<a href="${ctx }/member/logout.do" class="btn btn-success">로그아웃</a>
					<a href="${ctx}/member/myPage.do" class="btn btn-success">회원정보</a> --%>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>
</div>

<div class="wrapper row2">
	<div
		style="padding:160px 10px 30px 10px;background-image: url('${ctx}/resources/imgs/pp.jpg'); background-position:center center"">

		<div>
			<form class="navbar-form text-center" method="post" action="#"
				role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="어떤 주문을 원하십니까?"
						style="width: 220px">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
		</div>

		<!-- <div class="text-center">
				<h1>다 판다. 없으면 만들어서 판다. 1:1 매칭 서비스</h1>
			</div> -->
	</div>
</div>



<div class="wrapper row2">
	<div class="rounded">
		<nav id="mainav" class="clear">
			<ul class="clear">

				<li class=""><a href="${ctx }/">Main</a></li>
				<li><a class="drop" href="${ctx }/product/ui/search.do">Category</a>

					<ul>
						<c:forEach items="${categories}" var="category">
							<li><a
								href="${ctx }/product/ui/search.do?category=${category.type}">${category.type }</a></li>
						</c:forEach>
					</ul></li>

				<li><a class="drop" href="${ctx }/portfolio/ui/search.do">Portfolio
						List</a>

					<ul>
						<c:forEach items="${categories }" var="category">
							<li><a
								href="${ctx }/portfolio/ui/search.do?type=${category.type}">${category.type }</a></li>
						</c:forEach>
					</ul></li>
				<c:if test="${sessionScope.loginId ne null}">

					<li><a href="${ctx}/request/ui/myRequest.do">Request List</a></li>
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.memberType eq 'C' }">
						<li><a href="${ctx }/request/ui/consumerInviteList.do?page=1">Invite
								List</a></li>
					</c:when>
					<c:when test="${sessionScope.memberType eq 'M' }">
						<li><a href="${ctx }/request/ui/makerInviteList.do?page=1">Invite
								List</a></li>
					</c:when>
				</c:choose>
				<li><a href="${ctx}/member/myPage.do">My Page</a></li>

			</ul>
		</nav>
	</div>
</div>


