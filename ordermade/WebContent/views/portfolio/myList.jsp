<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>나의 포트폴리오</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }

<%@ include file="/views/common/myPageNav.jsp"%>

${box2 }


<h1 align="left">나의 포트폴리오</h1>

<div class="fl_left">
	<c:if test="${sessionScope.loginId ne null && makerId ne null}">
		<a class="btn btn-default" href="${ctx}/portfolio/ui/register.do">포트폴리오
			등록</a>
	</c:if>
</div>
<div class="content" align="center">
	<div class="fl_right">
		<form class="navbar-form text-right">
			<select id="portfolioSearchType" class="form-control"
				style="display: inline-block">
				<option value="title">제목</option>
				<!-- <option value="content">내용</option> -->
			</select> <input id="portfolioSearchKeyword" name="portfolioSearchKeyword"
				class="form-control" type="text" value="" placeholder="Search Here"
				style="display: inline-block" />
			<button id="portfolioSearchBtn" class="fa fa-search btn btn-default"
				type="button" title="Search"
				onclick="javascript:portfolioController.getMyPortfoliosByTitle()">검색</button>
		</form>
	</div>
</div>

</br>
</br>
</br>

<ul class="nospace listing" style="margin-top: 20px;">

	<%--  <div id="listSearchResult">
		<c:forEach items="${portfolios }" var="portfolio">
			<div class='listBox'>
				<div class="listExplainBox">
					<img src="${ctx }/portfolio/image.do?img=${portfolio.image}" class="portfolio-image">
					<table>
						<tr>
							<td>포트폴리오 명</td>
							<td><a class="portfolio" id="portfolioTitle"
								href="${ctx }/portfolio/ui/detail.do?id=${portfolio.id}">${portfolio.title }</a>
							</td>
						</tr>
						<tr>
							<td>제작항목 :</td>
							<td>${portfolio.category }</td>
						</tr>
					</table>
				</div>
			</div>
		</c:forEach>
	</div>  --%>
	
	 <div id="listSearchResult">
		 <c:forEach items="${portfolios }" var="portfolio">
			<div style="display:inline-block; padding-right: 10px">
			<!-- <div class="imgl borderedbox"> -->
				<table class="table" style="width:210px;">
					<tr>
						<img src="${ctx }/main/file/download.do?fileName=${portfolio.image}" class="portfolio-image" style="width: 220px; height: 180px">
					</tr>
					<tr>
						<td>포트폴리오 명 : </td>
						<td><a class='portfolio' id='portfolioTitle' href='${ctx }/portfolio/ui/detail.do?id=${portfolio.id}'> ${portfolio.title}</a></td>
					</tr>
					<tr>
						<td>제작항목 : </td>
						<td>${ portfolio.category}</td>
					</tr>
				</table>
			<!-- </div> -->
			</div>
		</c:forEach> 
	</div>
	<!-- 페이지 구현  -->
	<div id = "pagination"></div>
</ul>

${box3 }

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	pagination("search");
});

//검색을 클릭하면 검색된 의뢰서 목록을 가져온다.
$("#portfolioSearchBtn").click(
		function() {
			var type = $("#portfolioSearchType option:selected").val();
			var keyword = $("#portfolioSearchKeyword");
			if (type === "title") {
				portfolioController.getPortfoliosByMakerIdAndTitle(1, keyword.val());
			} 
			keyword.val("");
		});

var portfolioController = {
		getMyPortfolios : function(page) {
			$.ajax({
				url : "${ctx}/portfolio/xml/search.do?page=" + page,
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
		
		getPortfoliosByMakerIdAndTitle : function(page, title) {
			$.ajax({
				url : "${ctx}/portfolio/xml/searchByTitle.do?page=" + page
						+ "&makerId=${makerId}&title=" + title,
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
 		content += '<div style="display:inline-block; padding-right: 10px;">';
		content += '	<table class="table" style="width:210px;">';
		content += '		<tr>';
		content += '			<img src="${ctx }/main/file/download.do?fileName='+ $(xml).find("portfolio>image").text() +'"style="width: 220px; height: 180px" >';
		content += '		</tr>';
		content += "		<tr>";
		content += "			<td>포트폴리오 명 : </td>";
		content += "			<td><a class='portfolio' id='portfolioTitle' href='${ctx }/portfolio/ui/detail.do?id="+ $(xml).find("portfolio>id").text()+ "'>" + $(xml).find("portfolio>title").text()+"</a></td>";
		content += "		</tr>";
		content += "		<tr>";
		content += "			<td>제작항목 : </td>";
		content += "			<td>" + $(xml).find("portfolio>category").text()
				+ "</td>";
		content += "		</tr>";
		content += "	</table>";
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

//페이지 생성 함수
function pagination(doName){
	$.ajax({
		url : "${ctx}/portfolio/pages/" + doName + ".do",
		type : "get",
		dataType : "text",
		success : function(pages) {
		    $('#pagination').pagination({	// 페이지 총 개수를 구한 다음 생성
		        items: pages,
		        itemOnPage: 10,
		        cssStyle: 'light-theme',
		        onPageClick: function (page, evt) {
		        	portfolioController.getMyPortfolios(page);
		        }
		    });
		}
	});
};
</script>