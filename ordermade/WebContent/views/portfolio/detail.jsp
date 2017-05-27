<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">

			<%@ include file="/views/common/myPageNav.jsp"%>

		</div>

		<div id="content" class="two_third">
			<h1>나의 포트폴리오 - 제목나올 수 있도록</h1>
			<div>
				<p>제작항목 :</p>
				<p>등록일자 :</p>
			</div>
			
			<c:if test="${sessionScope.loginId ne null}">
				<c:if test="${product.writer.id eq sessionScope.loginId}">
					<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
					<div align="center">
						<input class="btn btn-warning" type="button" value="삭제"
							onclick="javascript:window.location='${ctx }/portfolio/delete.do?portfolioId=${portfolio.id}'">
						<input class="btn btn-success" type="button" value="수정"
							onclick="javascript:window.location='${ctx}/portfolio/modify.do?portfolioId=${portfolio.id }'">
					</div>
				</c:if>
			</c:if>
			
			<br> 
			<%-- <c:forEach items="${ box_list }" var="literature"> --%>
			<img class="imgr borderedbox"
				src="images/demo/slider/pp.jpg" alt="">
			<br>
			<%--  </c:forEach>--%>
			<p>Aliquatjusto quisque nam consequat doloreet vest orna partur
				scetur portortis nam. Metadipiscing eget facilis elit sagittis
				felisi eger id justo maurisus convallicitur.</p>
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