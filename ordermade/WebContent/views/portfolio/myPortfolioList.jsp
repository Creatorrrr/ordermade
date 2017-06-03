<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/views/common/head.jsp"%>
</head>
<title>나의 포트폴리오</title>
<body>
	<div class="wrapper row3">
		<div class="rounded">
			<main class="container clear"> <!-- main body -->
			<div class="sidebar one_third first">
				<%@ include file="/views/common/myPageNav.jsp"%>
			</div>

			<div id="content" class="two_third">
				<h1 align="left">나의 포트폴리오</h1>
				<!-- <div class="content" align="center"> -->
				<div style="float: right">
					<!-- <form id="portfolioSearch" > -->
						<select id="selectPortfolio" class="form-control"
							style="display: inline-block">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> <input id="portfolioSearch" name="portfolioSearch"
							class="search-box-input" type="text" value=""
							placeholder="Search Here" style="display: inline-block" />
						<button id="portfolioSearchBtn" class="fa fa-search" type="button"
							title="검색" onclick="javascript:portfolioController.getMyPortfoliosByTitle()">
							<em>Search</em>
						</button>
					<!-- </form> -->
				
					<br>
					<div style="float: right;">
						<c:if test="${sessionScope.loginId ne null && makerId ne null}">
							<a class="btn btn-sm btn-success"
								href="${ctx}/portfolio/ui/register.do">포트폴리오 등록</a>
						</c:if>
					</div>
				</div>
				<br>

				<ul class="nospace listing">
					<li class="clear">
					<div id="portfolioResult">
					<c:forEach items="${portfolios }" var="portfolio">
							<div class="portfolioList">
								<table class="table">
									<tr>
										<div class="imgl borderedbox">
											<img src="${ctx }/portfolio/image.do?img=${portfolio.image}" />
										</div>
									</tr>
									<tr class="nospace btmspace-15">
										<td>포트폴리오 명</td>
										<td><a class="portfolio" id="portfolioTitle"
											href="${ctx }/portfolio/ui/detail.do?id=${portfolio.id}">${portfolio.title }</a>
										</td>
									</tr>
								</table>
							</div>
						</c:forEach></div></li>
				</ul>
			</div>
			</main>
		</div>
	</div>

	<%@ include file="/views/common/footer.jsp"%>
	<!-- JAVASCRIPTS -->
	
<script type="text/javascript">	

$("#portfolioSearchBtn").click(function() {
	var type = $("#selectPortfolio option:selected").val();
	var keyword = $("#portfolioSearch");
	if(type === "title") {
		portfolioController.getMyPortfoliosByTitle(1, keyword.val());
	} 
	keyword.val("");
});

	var portfolioController = {				
			getMyPortfoliosByTitle : function(page) {
				$.ajax({
					url : "${ctx}/portfolio/xml/searchByTitle.do?page=" + page + "&title=" + $("#portfolioSearch").val(),
					type : "get",
					dataType : "xml",
					success : function(xml) {
							var xmlData = $(xml).find("portfolio");
							var listLength = xmlData.length;
							$("#portfolioResult").empty();
							if (listLength) {
								var contentStr = "";
								$(xmlData).each(function(){
									contentStr += portfolioController.makeContent(this);
								});
								$("#portfolioResult").append(contentStr);
							} else {
								$("#portfolioResult").append(portfolioController.makeContentForEmpty());
							}
					}
				});
			},

			makeContent : function(xml) {
				var content = "";
				
				content += "<div class='portfolioList'>";
				content += "	<table class='table'>";
				content += "		<tr>";
				content += "			<div class='imgl borderedbox'>";
				content += "			<img src='${ctx }/portfolio/image.do?img=" + $(xml).find("portfolio>image").text() + "'>";
				content += "			</div>";
				content += "		</tr>";
				content += "		<tr class='nospace btmspace-15'>";
				content += "			<td>포트폴리오 명</td>";
				content += "			<td><a class='portfolio' id='portfolioTitle' href='${ctx }/portfolio/ui/detail.do?id="+$(xml).find("portfolio>id").text()+"'>"+$(xml).find("portfolio>title").text()+"</a>";
				content += "			</td>";
				content += "		</tr>";
				content += "	</table>";
				content += "</div>";
				
				return content;
			},
			
			makeContentForEmpty : function() {
				var content = "";
				
				content += "<div class='portfolioList'>";
				content += 	"<table>";
				content += 		"<tr>";
				content += 			"<td>조건에 해당하는 상품이 없습니다.</td>";
				content += 		"</tr>";
				content += 	"</table>";
				content += "</div>";

				return content;
			}
	};

</script>
</body>
</html>