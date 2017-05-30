<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<!-- Header ========================================================================================== -->
<head>
<%@ include file="/views/common/head.jsp"%>
</head>
<!-- Main Body ========================================================================================== -->
<body>
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">

			<%@ include file="/views/common/myPageNav.jsp"%>

		</div>

		<div id="content" class="two_third">
			<h1>나의 포트폴리오 -${portfolio.title }</h1>

			<c:if test="${sessionScope.loginId ne null }">
				<%-- <c:if test="${portfolio.makerId eq sessionScope.loginId}"> --%>
				<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
				<div align="center">
					<input class="btn btn-warning" type="button" value="삭제"
						onclick="javascript:window.location='${ctx }/portfolio/xml/remove.do?portfolioId=${portfolio.id}'">
					<input class="btn btn-success" type="button" value="수정"
						onclick="javascript:window.location='${ctx}/portfolio/ui/modify.do?portfolioId=${portfolio.id }'">
				</div>
				<%-- 	</c:if> --%>
			</c:if>

			<div>
				<p>제작항목 : ${portfolio.category }</p>
				<p>등록일자 :</p>
			</div>

			<br>
			<%-- <c:forEach items="${ portfolios }" var="portfolio"> --%>
			<img class="imgr borderedbox"
				src="${ctx }/portfolio/image.do?img=${portfolio.image}" alt="">
			<br>
			<%--  </c:forEach>--%>
			<div>
			<p>포트폴리오 내용 : <br></p>
			<p>${portfolio.content }</p>
			</div>
			<br>
		</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>