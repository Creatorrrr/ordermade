<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<div class="content" align="left">
						<h1>${member.id }님의정보</h1>
						
					<div class="imgl borderedbox">
						<img src="${ctx }/main/file/download.do?fileName=${member.image}" />
					</div>
					<table class="table">
						<tr class="nospace btmspace-15">
						<tr>
							<td><p>아이디 : ${member.id}</p></td>
						</tr>
						<tr>
							<td><p>이메일 : ${member.email }</p></td>
						</tr>
						<tr>
							<td><p>주소 : ${member.address }</p></td>
						</tr>
						<tr>
							<td><p>사업자번호 : ${member.licenseNumber}</p></td>
						</tr>
						<tr><td><h3>제작자 소개</h3></td></tr>
						<tr><td><p>${member.introduce }</p></td></tr>
						<tr><td><h3>최신 포트폴리오</h3></td></tr>
						<tr>
							<td>
								<div id="BrandNewPortfolios"></div>
							</td>
						</tr>
						<tr><td><h3>최신 상품</h3></td></tr>
						<tr>
							<td>
								<div id="BrandNewProducts"></div>
							</td>
						</tr>
						</table>
					</div>
				</li>
			</ul>

<script type="text/javascript">
// append portfolio and product on startup
$(document).ready(function() {
	
	$.ajax({
		type : "get",
		url : "${ctx}/portfolio/xml/search.do?page=1",
		dataType : "xml",
		success : function(xml) {
				console.log("------load Success-----")
				var xmlData = $(xml).find("portfolios>portfolio");
				var listLength = xmlData.length;
				console.log(listLength)
				$("#BrandNewPortfolios").empty();
				if(listLength){
					var contentStr = "";
					contentStr += "<ul class='nospace listing'>";
					contentStr +=    "<li class='clear'>";
					contentStr +=			"<table>";
					contentStr +=				"<tr>";
					contentStr += 					"<td style='width : 100px'>";
					$(xmlData).each(function() {
						contentStr += 			"<img src='${ctx }/main/file/download.do?fileName=" + $(this).find('portfolio>image') + "'>";
					});
					contentStr += 					"</td>";
					contentStr +=				"</tr>";
					contentStr += 			"</table>";
					contentStr +=	  "</li>"
					contentStr += "</ul>"
					$("#BrandNewPortfolios").append(contentStr);
				}
				console.log(contentStr)
		}		
	});
	
	$.ajax({
		type : "get",
		url : "${ctx }/product/ajax/products/makerid.do?page=1",
		dataType : "xml",
		success : function(xml) {
				console.log("------load Success-----")
				var xmlData = $(xml).find("products>product");
				var listLength = xmlData.length;
				console.log(listLength)
				$("#BrandNewProducts").empty();
				if(listLength){
					var contentStr = "";
					contentStr += "<ul class='nospace listing'>";
					contentStr +=    "<li class='clear'>";
					contentStr +=			"<table>";
					contentStr +=				"<tr>";
					contentStr += 					"<td style = 'width : 100px'>";
					$(xmlData).each(function() {
						contentStr += 			"<img src='${ctx }/main/file/download.do?fileName=" + $(this).find('product>image') + "'>";
					});
					contentStr += 					"</td>";
					contentStr +=				"</tr>";
					contentStr += 			"</table>";
					contentStr +=	  "</li>"
					contentStr += "</ul>"
					$("#BrandNewProducts").append(contentStr);
				}
				console.log(contentStr)
		}		
	});
});

// get portfolios with xml
/* var getPortfolios = function(page) {
	$.ajax({
		url : "${ctx}/portfolio/xml/search.do?page=" + page,
		type : "get",
		dataType : "xml",
		success : function(xml) {
				var xmlData = $(xml).find("portfolio");
				var listLength = xmlData.length;
				$("#pfslider").empty();
				if (listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr += "<li>";
						contentStr += "<img src='${ctx }/main/file/download.do?fileName=" + $(this).find('portfolio>image') + "'>";
						contentStr += "</li>";
					});
					$("#pfslider").append(contentStr);
				}
			}
		});
	};

// get products with xml
var getProducts = function(page) {
	$.ajax({
		url : "${ctx}/product/ajax/products/makerid.do?page=" + page,
		type : "get",
		dataType : "xml",
		success : function(xml) {
				var xmlData = $(xml).find("products>product");
				var listLength = xmlData.length;
				$("#productslider").empty();
				if (listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr += "<li>";
						contentStr += "<img src='${ctx }/main/file/download.do?fileName=" + $(this).find('product>image') + "'>";
						contentStr += "</li>";
					});
					$("#productslider").append(contentStr);
				}
			}
		});
	}; */

// portfolio slider setting
var pfSlider = $( '#pfslider' ).bxSlider( {
    mode: 'horizontal',// 가로 방향 수평 슬라이드
    speed: 500,        // 이동 속도를 설정
    pager: false,      // 현재 위치 페이징 표시 여부 설정
    moveSlides: 1,     // 슬라이드 이동시 개수
    slideWidth: 200,   // 슬라이드 너비
    minSlides: 4,      // 최소 노출 개수
    maxSlides: 4,      // 최대 노출 개수
    slideMargin: 5,    // 슬라이드간의 간격
    auto: true,        // 자동 실행 여부
    autoHover: true,   // 마우스 호버시 정지 여부
    controls: false,   // 이전 다음 버튼 노출 여부
    captions: true     // 캡션 노출 여부
} );

//이전 버튼을 클릭하면 이전 슬라이드로 전환
$( '#prevPfBtn' ).on( 'click', function () {
	pfSlider.goToPrevSlide();  //이전 슬라이드 배너로 이동
    return false;              //<a>에 링크 차단
} );

//다음 버튼을 클릭하면 다음 슬라이드로 전환
$( '#nextPfBtn' ).on( 'click', function () {
	pfSlider.goToNextSlide();  //다음 슬라이드 배너로 이동
    return false;
} );
 
// portfolio slider setting
var productSlider = $( '#productslider' ).bxSlider( {
    mode: 'horizontal',// 가로 방향 수평 슬라이드
    speed: 500,        // 이동 속도를 설정
    pager: false,      // 현재 위치 페이징 표시 여부 설정
    moveSlides: 1,     // 슬라이드 이동시 개수
    slideWidth: 200,   // 슬라이드 너비
    minSlides: 4,      // 최소 노출 개수
    maxSlides: 4,      // 최대 노출 개수
    slideMargin: 5,    // 슬라이드간의 간격
    auto: true,        // 자동 실행 여부
    autoHover: true,   // 마우스 호버시 정지 여부
    controls: false,   // 이전 다음 버튼 노출 여부
    captions: true     // 캡션 노출 여부
} );

//이전 버튼을 클릭하면 이전 슬라이드로 전환
$( '#prevProductBtn' ).on( 'click', function () {
	productSlider.goToPrevSlide();  //이전 슬라이드 배너로 이동
    return false;              //<a>에 링크 차단
} );

//다음 버튼을 클릭하면 다음 슬라이드로 전환
$( '#nextProductBtn' ).on( 'click', function () {
	productSlider.goToNextSlide();  //다음 슬라이드 배너로 이동
    return false;
} );
</script>

${box3 }

<%@ include file="/views/common/footer.jsp"%>