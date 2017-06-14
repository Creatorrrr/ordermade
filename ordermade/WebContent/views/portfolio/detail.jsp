<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>포트폴리오 상세페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>


<div class="wrapper row3">
	<div class="rounded">
		<div id="contents" class="two_third first">
			<!-- 상품 제목 -->
			<h1 class="productTitle" align="left">포트폴리오 -[${portfolio.title }]</h1>
			<h2 align="left">카테고리 : ${portfolio.category }</h2>
			<!-- 수정 삭제 메뉴 -->
			<c:if test="${sessionScope.loginId ne null}">
				<c:if test="${portfolio.maker.id eq sessionScope.loginId}">
					<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
					<div class="productControlBox">
						<input class="btn btn-default" type="button" value="수정"
							onclick="location.href='${ctx}/portfolio/ui/modify.do?id=${product.id}';">
						<input class="btn btn-default" type="button" value="삭제"
							onclick="javascript:removePortfolio();">
					</div>
				</c:if>
			</c:if>
			<!-- 상품 설명 시작 -->
			<div class="productDetailBox">
				<!-- 상품 이미지  -->
				<h2 class="productSubTitle">이미지 </h2>
				<hr style="margin:0px 0px 15px 0px;">
				<div class="productImageBox" align="center">
					<img src="${ctx }/main/file/download.do?fileName=${portfolio.image}" />
				</div>
				<!-- 상품 소개 -->
				<h2 class="productSubTitle">설명 </h2>
				<hr style="margin:0px 0px 15px 0px;">
				<div class="productContentBox">
					<div align="center" style="color: #000000">
					 ${portfolio.content}
					</div>
				</div>
			</div>
			<!-- 상품 설명 종료 -->
		</div>
		<!-- 본문 종료 -->

		<div class="sidebar one_third">
			<%@include file="/views/common/portfolioNav.jsp"%>
		</div>

		<!-- / main body -->
		<div class="clear"></div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>