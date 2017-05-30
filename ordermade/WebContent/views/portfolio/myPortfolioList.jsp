<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/views/common/head.jsp"%>
</head>
<body>
	<div class="wrapper row3">
		<div class="rounded">
			<main class="container clear"> <!-- main body -->
			<div class="sidebar one_third first">

				<%@ include file="/views/common/myPageNav.jsp"%>

			</div>

			<div id="content" class="two_third">
				<h1>나의 포트폴리오</h1>

				<div class="fl_right">
					<form method="portfolio" action="${ctx}/portfolio/ui/search.do">
						<div>
							<select name="selectPortfolio">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> <input name="search" class="search-box-input" type="text"
								placeholder="Search Here" />
							<button class="fa fa-search" type="submit" title="검색">
								<em>Search</em>
							</button>
						</div>
					</form>

					<div style="float: right;">
						<%-- 	<c:if test="${sessionScope.loginId ne null && portfolio.maker.Id ne null}">  --%>
						<a class="btn btn-sm btn-success"
							href="${ctx}/portfolio/ui/register.do">포트폴리오 등록</a>
						<%-- </c:if>  --%>
					</div>

					<!-- test -->
					<br>
					<div style="float: right;">
						<c:if test="${sessionScope.loginId ne null}">
							<a class="btn btn-sm btn-success"
								href="${ctx}/portfolio/ui/register.do">등록</a>
						</c:if>
					</div>
					<!-- /test -->
					
					
					<%-- 	<c:if test="${sessionScope.loginId ne null}">
				<c:if test="${portfolio.maker.id eq sessionScope.loginId}"> 
						<div align="center">
							<input class="btn btn-success" type="button" value=" 등록"
								onclick="javascript:window.location='${ctx}/portfolio/ui/register.do?portfolioId=${portfolio.Id}'">
						</div>
					</c:if>
				</c:if> --%>
				</div>

				<br>

				<ul class="nospace listing">
					<li class="clear"><c:forEach items="${portfolios }"
							var="portfolio">
							<div class="content" align="center">
								<table class="table">
									<tr>
										<div class="imgl borderedbox">
											<img src="${ctx }/portfolio/image.do?img=${portfolio.image}" />
										</div>
									</tr>
									<tr class="nospace btmspace-15">
										<td>포트폴리오 명</td>
										<td><a class="portfolio"
											href="${ctx }/portfolio/ui/detail.do?portfolioId=${portfolio.id}">${portfolio.title }
										</a></td>
									</tr>
								</table>
							</div>
						</c:forEach></li>
				</ul>
			</div>
			</main>
		</div>
	</div>

	<%@ include file="/views/common/footer.jsp"%>
	<!-- JAVASCRIPTS -->

</body>
</html>