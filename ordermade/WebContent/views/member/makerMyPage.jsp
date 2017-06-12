<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>마이 페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }

<%@ include file="/views/common/myPageNav.jsp"%>

${box2 }

<ul class="nospace listing">
	<li class="clear">
		<div class="content" align="center">
			<h1>${member.id }님의정보</h1>

			<div class="imgl borderedbox" align="center" >
				<img src="${ctx }/main/file/download.do?fileName=${member.image}"  style="width:200px;height: 150px" />
			</div>
			<table class="table">
<!-- 			<tr class="nospace btmspace-15">-->				
				<tr>
					<td><p>아이디&nbsp;:&nbsp; ${member.id}</p></td>
				</tr>
				<tr>
					<td><p>이메일 &nbsp; :&nbsp; ${member.email }</p></td>
				</tr>
				<tr>
					<td><p>주소&nbsp; :&nbsp; ${member.address }</p></td>
				</tr>
				<tr>
					<td><p>사업자번호&nbsp; :&nbsp; ${member.licenseNumber}</p></td>
				</tr>
				<tr>
					<td><h4>[제작자 소개]</h4>${member.introduce }</td>
				</tr>
				<tr>
					<td><h4>[최신 포트폴리오]</h4><div id="BrandNewPortfolios"></div></td>
				</tr>
				<tr>
					<td><h4>[최신 상품]</h4><div id="BrandNewProducts"></div></td>
				</tr>
			</table>
		</div>
	</li>
</ul>

<script type="text/javascript">
	// append portfolio and product on startup
	$(document).ready(function() {

		getPortfolios(1);
		getProducts(1);

	});

	// get portfolios with xml
	var getPortfolios = function(page) {

		$.ajax({
					url : "${ctx}/portfolio/xml/search.do?page=" + page,
					type : "get",
					dataType : "xml",
					success : function(xml) {
						var xmlData = $(xml).find("portfolios>portfolio");
						var listLength = xmlData.length;
						$("#BrandNewPortfolios").empty();
						if (listLength) {
							var contentStr = "";
							$(xmlData)
									.each(
											function() {
												contentStr += "<li>";
												contentStr += "<a href='${ctx}/portfolio/ui/detail.do?id="
														+ $(this).find(
																'portfolio>id')
																.text() + "'>"
												contentStr += "<img src='${ctx }/main/file/download.do?fileName="+ $(this).find('portfolio>image').text() + "'style='width:155px;height:120px';>";
												contentStr += "</a>";
												contentStr += "</li>";
											}); 					 
							$("#BrandNewPortfolios").append(contentStr);

							$('#BrandNewPortfolios').bxSlider({
								mode : 'horizontal',// 가로 방향 수평 슬라이드
								speed : 500, // 이동 속도를 설정
								pager : false, // 현재 위치 페이징 표시 여부 설정
								moveSlides : 1, // 슬라이드 이동시 개수
								slideWidth : 200, // 슬라이드 너비
								minSlides : 4, // 최소 노출 개수
								maxSlides : 4, // 최대 노출 개수
								slideMargin : 5, // 슬라이드간의 간격
								auto : true, // 자동 실행 여부
								autoHover : true, // 마우스 호버시 정지 여부
								controls : true, // 이전 다음 버튼 노출 여부
								captions : true
							// 캡션 노출 여부
							});
						}
					}
				});

	};

	// get products with xml
	var getProducts = function(page) {

		$.ajax({
					url : "${ctx}/product/ajax/products/makerid.do?page="
							+ page,
					type : "get",
					dataType : "xml",
					success : function(xml) {
						var xmlData = $(xml).find("products>product");
						var listLength = xmlData.length;
						$("#BrandNewProducts").empty();
						if (listLength) {
							var contentStr = "";
							$(xmlData)
									.each(
											function() {
												contentStr += "<li>";
												contentStr += "<a href='${ctx}/product/ui/detail.do?id="
														+ $(this).find(
																'product>id')
																.text() + "'>"
												contentStr += "<img src='${ctx }/main/file/download.do?fileName="
														+ $(this)
																.find(
																		'product>image')
																.text() + "'style='width:155px;height:120px';>";
												contentStr += "</a>"
												contentStr += "</li>";
											});
							$("#BrandNewProducts").append(contentStr);

							$('#BrandNewProducts').bxSlider({
								mode : 'horizontal',// 가로 방향 수평 슬라이드
								speed : 500, // 이동 속도를 설정
								pager : false, // 현재 위치 페이징 표시 여부 설정
								moveSlides : 1, // 슬라이드 이동시 개수
								slideWidth : 200, // 슬라이드 너비
								minSlides : 4, // 최소 노출 개수
								maxSlides : 4, // 최대 노출 개수
								slideMargin : 5, // 슬라이드간의 간격
								auto : true, // 자동 실행 여부
								autoHover : true, // 마우스 호버시 정지 여부
								controls : true, // 이전 다음 버튼 노출 여부
								captions : true
							// 캡션 노출 여부
							});
						}
					}
				});
	};
</script>

${box3 }

<%@ include file="/views/common/footer.jsp"%>