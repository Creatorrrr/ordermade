<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<a class="btn btn-success"
							href="${ctx}/portfolio/ui/register.do">포트폴리오 등록</a>
					</c:if>
				</div>
				
				<div class="fl_right" >
					<form class="navbar-form text-center" id="portfolioSearch"  method="post" action="#" role="search">
						<select id="selectPortfolio" class="form-control" style="display: inline-block">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> 
						<input id="portfolioSearch" name="portfolioSearch" class="form-control"  type="text" value=""
							placeholder="Search Here" style="display: inline-block" />
						<button id="portfolioSearchBtn" class="btn btn-default" type="button" onclick="javascript:portfolioController.getMyPortfoliosByTitle()">검색</button>
					</form>
				</div>
				</br></br></br>

				<ul class="nospace listing" style="margin-top:20px; ">

					<div id="portfolioResult">
						<c:forEach items="${portfolios }" var="portfolio">
							<div class="portfolioList" style="display:inline-block; padding-right: 10px;">
								<table class="table" style="width:210px;">
									<tr>
										<div class="imgl borderedbox">
											<img src="${ctx }/portfolio/image.do?img=${portfolio.image}" style="width:100px;"  />
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
						</c:forEach>
					</div>
				</ul>


	
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
				content += "	<table class='table'>";
				content += "		<tr>";
				content += "			<td>조건에 해당하는 상품이 없습니다.</td>";
				content += "		</tr>";
				content += "	</table>";
				content += "</div>";

				return content;
			}
	};

</script>

${box3 }

<%@ include file="/views/common/footer.jsp"%>