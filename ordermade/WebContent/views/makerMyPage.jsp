<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">

			<%@ include file="myPageNav.jsp"%>

		</div>

		<div id="content" class="two_third">

			<ul class="nospace listing">
				<li class="clear">

					<div class="content" align="center">
						<table class="table">
							<tr>
								<div class="imgl borderedbox">
									<img src="${ctx }/views/images/img1.jpg" />
								</div>
							</tr>
							<tr class="nospace btmspace-15">
							<tr>
								<p>아이디 : ${id}</p>
							</tr>
							<tr>
								<p>가입일자 : ${date }</p>
							</tr>
							<tr>
								<p>이메일 : ${email }</p>
							</tr>
							<tr>
								<p>주소 : ${address }</p>
							</tr>
							<tr>
								<p>사업자번호 : ${license }</p>
							</tr>
							</tr>

							<tr>
							<tr>
								<h3>제작자 소개</h3>
							</tr>
							</tr>
							<tr>
								<p>내용나와야 함@@@</p>
							</tr>
							<br>
						</table>
						<div>
							<tr>
								<h3>최신 포트폴리오</h3>
							</tr>

						<tr class="nospace btmspace-15">
							<td><img src="${ctx }/views/images/bul_prev.png" /></td>
						</tr>
						<tr>
							<%-- <c:forEach items="${ box_list }" var="literature"> --%>
							<div class="imgl borderedbox">
								<img src="${ctx }/views/images/img1.jpg" />
							</div>
							<%-- </c:forEach> --%>
						</tr>
						<tr class="nospace btmspace-15">
						<tr>
							<img src="${ctx }/views/images/bul_next.png" />
						</tr>
						<br> <br>
					</div>


					<div>
						<tr>
							<h3>최신 상품</h3>
						</tr>
						<tr class="nospace btmspace-15">
							<td><img src="${ctx }/views/images/bul_prev.png" /></td>
						</tr>
						<tr>
							<div class="imgl borderedbox">
								<%-- <c:forEach items="${ box_list }" var="literature"> --%>
								<img src="${ctx }/views/images/img1.jpg" />
								<%-- </c:forEach> --%>
							</div>
						</tr>
					<tr class="nospace btmspace-15">
					<tr>
						<img src="${ctx }/views/images/bul_next.png" />
					</tr>
		</div>
	</div>
	</li>
	</ul>
</div>
</main>
</div>
</div>

<div class="wrapper row5">
	<div id="copyright" class="clear">
		<p class="fl_left">
			Copyright &copy; 2014 - All Rights Reserved - <a href="#">Domain
				Name</a>
		</p>
		<p class="fl_right">
			Template by <a target="_blank" href="http://www.os-templates.com/"
				title="Free Website Templates">OS Templates</a>
		</p>
	</div>
</div>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>