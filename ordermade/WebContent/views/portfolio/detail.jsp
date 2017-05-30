<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<%@ include file="/views/common/head.jsp"%>

	<div class="wrapper row3">
		<div class="rounded">
			<main class="container clear"> <!-- main body -->
			<div class="sidebar one_third first">
				<%@ include file="/views/common/myPageNav.jsp"%>
			</div>

			<div id="content" class="two_third">
				<h1>나의 포트폴리오 -${portfolio.title }</h1>
				<c:if test="${sessionScope.loginId ne null }">
					<c:if test="${portfolio.maker.Id eq sessionScope.loginId}">
						<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
						<div align="center">
							<input class="btn btn-warning" type="button" value="삭제"
								onclick="javascript:window.location='${ctx }/portfolio/xml/remove.do?portfolioId=${portfolio.id}'">
							<input class="btn btn-success" type="button" value="수정"
								onclick="javascript:window.location='${ctx}/portfolio/ui/modify.do?portfolioId=${portfolio.id }'">
						</div>
					</c:if>
				</c:if>

				<div>
					<p>제작항목 : ${portfolio.category }</p>
					<p>포트폴리오 명 : ${portfolio.title }</p>
					<p>
						등록일자 :
						<time datetime="2045-04-06T08:15+00:00">
							Friday, 6<sup>th</sup> April 2045 @08:15:00
						</time>
					</p>
				</div>

				<br>
				<c:forEach items="${ portfolio }" var="portfolio">
					<img class="imgr borderedbox"
						src="${ctx }/portfolio/image.do?img=${portfolio.image}" >
					<br>
				 </c:forEach> 
				<p>포트폴리오 내용 : <br></p>
				<p>${portfolio.content }</p>
			</div>
			<br>
		</div>
		</main>
	</div>
	

	<%@ include file="/views/common/footer.jsp"%>
	<!-- JAVASCRIPTS -->

</body>
</html>