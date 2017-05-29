<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="wrapper row0">
		<div id="topbar" class="clear">
			<nav>
				<ul>
					<c:choose>
						<c:when test="${loginId eq null }">
							<ul>
								<li><a id="loginBtn" href="${ctx }/views/login.jsp">Login</a></li>
								<li><a href="${ctx }/views/memberRegister.jsp" class="btn btn-success">Sign up</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<span class="glyphicon glyphicon-user"></span>
							<b>${loginId}</b>님 환영합니다. [<a href="${ctx }/logout.do">로그아웃</a>]
							<ul>
								<li><a href="${ctx}/member//modifyMember.do">회원정보</a></li>

							</ul>
						</c:otherwise>
					</c:choose>
					<!-- <li><a href="#">Home</a></li>
					<li><a href="#">Login</a></li>
					<li><a href="#">Sign up</a></li> -->
				</ul>
			</nav>
		</div>
	</div>



	<div class="wrapper row1">
		<header id="header" class="clear">
			<div id="logo" class="fl_left">
				<h1>
					<a href="${ctx }/views/index.jsp"><img src="${ctx }/views/images/panda4.jpg" style="width:100px;height:100px"> 판다</a>
				</h1>
				<p>다 판다</p>
				<p>없으면 만들어서 판다</p>
				<p>1:1 매칭 서비스</p>
			</div>
			<div class="fl_right">
				<form class="clear" method="post" action="#">
					<fieldset>
						<legend>Search:</legend>
						<input input name="" class="search-box-input" type="text" value=""
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
					<li class="active"><a href="${ctx }/views/index.jsp">Home</a></li>
					<li><a class="drop" href="#">Category</a>
						<ul>
							<li><a href="${ctx }/views/productList.jsp">Furniture</a></li>
							<li><a href="${ctx }/pages/portfolio.html">Accessory</a></li>
							<li><a href="${ctx }/pages/full-width.html">Kitchen</a></li>
							<li><a href="${ctx }/pages/sidebar-left.html">Digital</a></li>
							<li><a href="${ctx }/pages/sidebar-left-2.html">Clothing</a></li>
							<li><a href="${ctx }/pages/sidebar-right.html">Sport</a></li>
						</ul></li>

					<!-- <li><a class="drop" href="#">Dropdown</a>
						<ul>
							<li><a href="#">Level 2</a></li>
							<li><a class="drop" href="#">Level 2 + Drop</a>
								<ul>
									<li><a href="#">Level 3</a></li>
									<li><a href="#">Level 3</a></li>
								</ul></li>
						</ul>
					</li> -->
					<li><a href="#">Link Text</a></li>
					<li><a href="#">Another Link Text</a></li>
					<li><a href="#">This a very long link</a></li>
					<li><a href="#">This is the last</a></li>
				</ul>
			</nav>
		</div>
	</div>
