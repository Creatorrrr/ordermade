<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>포트폴리오</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<h6>포트폴리오 카테고리</h6>
			<nav class="sdb_holder">
				<ul>
					<c:forEach items="${categories}" var="category">
						<li><a href="${ctx }/portfolio/ui/search.do?category=${category.type}">${category.type }</a></li>
					</c:forEach>
				</ul>
			</nav>
		</div>

		<div id="content" class="two_third">
			<div class="content" align="center">
				<h1>[${category }] 포트폴리오 페이지</h1>

				<div class="right">
					<form class="navbar-form text-right" id="">
						<select id="portfolioSearchType" class="form-control"
							style="display: inline-block">
							<option value="title">제목</option>
							<option value="makerName">제작자</option>
						</select> 
						<input id="portfolioSearchKeyword" name="portfolioSearchKeyword"
							class="form-control" type="text" value=""
							placeholder="Search Here" style="display: inline-block" />
						<button id="portfolioSearchBtn" class="fa fa-search btn btn-default" type="button" title="Search">검색</button>
						<!-- <button id="imageSearchBtn" class="fa fa-search btn btn-default"
							type="button" title="Search"
							onclick="javascript:createImageSearchModal();">이미지 검색</button> -->
					</form>
				</div>
			</div>

			<div id="listSearchResult">
				<c:forEach items="${portfolios }" var="portfolio">
					<div class='listBox'>
						<div class="listExplainBox">
							<img src="${ctx }/main/file/download.do?fileName=${portfolio.image}">
							<table>
								<tr>
									<td>포트폴리오 명 :</td>
									<td>${portfolio.title }</td>
								</tr>
								<tr>
									<td>제작자 :</td>
									<td>${portfolio.maker.name }</td>
								</tr>
								<tr>
									<td>제작항목 :</td>
									<td>${portfolio.category.type }</td>
								</tr>
							</table>
						</div>
						<div class="detailBtnBox" align="right">
							<input type='button' value='자세히보기' class="btn btn-success"
								onclick="javascript:location.href='${ctx}/portfolio/ui/detail.do?id=${portfolio.id}'">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</main>
	</div>
</div>
${box3} 

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javascript">
  $(document).ready(function(){
	 
	  portfolioController.getPortfoliosByCategory("FUNITURE",1);
	
 });
	//검색을 클릭하면 검색된 의뢰서 목록을 가져온다.
	$("#portfolioSearchBtn").click(
			function() {
				var type = $("#portfolioSearchType option:selected").val();
				var keyword = $("#portfolioSearchKeyword");
				if (type === "title") {
					portfolioController.getPortfoliosByCategoryAndTitle(1, keyword.val());
				} else if (type === "makerName") {
					portfolioController.getPortfoliosByCategoryAndMakerName(1, keyword.val());
				} else if(type === "category"){
					portfolioController.getPortfoliosByCategory(1, keyword.val());
				}
				keyword.val("");
			});


	var portfolioController = {
		getPortfoliosByCategoryAndTitle : function(page, title) {
			$.ajax({
				url : "${ctx}/portfolio/ajax/portfolios/CT.do?page=" + page
						+ "&category=${category}&title=" + title,
				type : "get",
				dataType : "xml",
				success : function(xml) {
					var xmlData = $(xml).find("portfolio");
					var listLength = xmlData.length;
					$("#listSearchResult").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += portfolioController.makeContent(this);
						});
						$("#listSearchResult").append(contentStr);
					} else {
						$("#listSearchResult").append(
								portfolioController.makeContentForEmpty());
					}
				}
			});
		},

		getPortfoliosByCategoryAndMakerName : function(page, makerName) {
			$.ajax({
				url : "${ctx}/portfolio/ajax/portfolios/CM.do?page=" + page
						+ "&category=${category}&makerName=" + makerName,
				type : "get",
				dataType : "xml",
				success : function(xml) {
					var xmlData = $(xml).find("portfolio");
					var listLength = xmlData.length;
					$("#listSearchResult").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += portfolioController.makeContent(this);
						});
						$("#listSearchResult").append(contentStr);
					} else {
						$("#listSearchResult").append(
								portfolioController.makeContentForEmpty());
					}
				}
			});
		},

 		getPortfoliosByCategory : function(category, page) {
			$.ajax({
				url : "${ctx}/portfolio/ajax/portfolios/category.do?category=" + category + "&page="+page,
				type : "get",
				dataType : "xml",
				success : function(xml) {
					var xmlData = $(xml).find("portfolio");
					var listLength = xmlData.length;
					$("#listSearchResult").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += portfolioController.makeContent(this);
						});
						$("#listSearchResult").append(contentStr);
					} else {
						$("#listSearchResult").append(
								portfolioController.makeContentForEmpty());
					}
				}
			});
		},

		
		makeContent : function(xml) {
			var content = "";

			content += "<div class='listBox'>";
			content += "	<div class='listExplainBox'  align='right'>";
			content += '		<img src="${ctx }/main/file/download.do?fileName='+ $(xml).find("portfolio>image").text() + '"style="width:120px;height: 100px";>';
			content += "		<table>";
			content += "			<tr>";
			content += "				<td>포트폴리오 명 : </td>";
			content += "				<td>" + $(xml).find("portfolio>title").text()
					+ "</td>";
			content += "			</tr>";
			content += "			<tr>";
			content += "				<td>제작자 : </td>";
			content += "				<td>" + $(xml).find("portfolio>maker>name").text()
					+ "</td>";
			content += "			</tr>";
			content += "			<tr>";
			content += "				<td>제작항목 : </td>";
			content += "				<td>" + $(xml).find("portfolio>category").text()
					+ "</td>";
			content += "			</tr>";
			content += "		</table>";
			content += "	</div>";
			content += "	<div class='detailBtnBox'>";
			content += "		<input type='button' value='자세히보기' onclick=\"javascript:location.href='${ctx}/portfolio/ui/detail.do?id="+ $(xml).find("portfolio>id").text() + "'\">";
			content += "	</div>";
			content += "</div>";

			return content;
		},

		makeContentForEmpty : function() {
			var content = "";

			content += "<div class='portfolioBox'>";
			content += "<table>";
			content += "<tr>";
			content += "<td>조건에 해당하는 상품이 없습니다.</td>";
			content += "</tr>";
			content += "</table>";
			content += "</div>";

			return content;
		}
	};

</script>



${box3 }

