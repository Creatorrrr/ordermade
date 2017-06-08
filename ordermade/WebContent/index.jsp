<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>1:1 매칭 서비스</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>


<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="group btmspace-30">

			<!-- Middle Column -->
			<div>

				<h2>인기 상품</h2>
				<div  id="HitsProductImages"></div>
				<p>
				<h3>최신 상품</h3>
					<div  id="BrandNewProductImages"></div>
			</div>
			<!-- / Middle Column -->
		</div>


		<div id="twitter" class="group btmspace-30">
			<div class="one_quarter first center">
				<a href="#"><i class="fa fa-twitter fa-3x"></i><br>Instruction</a>
			</div>
			<div class="three_quarter bold">
				<p>
					01. 상품페이지를 검색한 뒤 주문 제작 버튼을 누릅니다.<br /> 02. 의뢰서를 제작합니다.<br /> 03.
					의뢰서를 등록면 제작자와 1:1 매칭이 이루어집니다.<br /> 04. 제작자와 대화를 통해 원하는 물건을 제작할 수
					있습니다.<br />
				</p>
			</div>
		</div>
		</main>
	</div>
</div>



<script type="text/javascript">
$(document).ready(function(){
	getHitsProducts();
	getBrandNewProducts();
});

var getHitsProducts = function() {
	$.ajax({
		type : "get",
		url : "${ctx }/product/xml/main/category/hit.do?category=FUNITURE&page=4",
		dataType : "xml",
		success : function(xml) {
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				console.log(listLength)
				console.log($(xml).find("product>image").text());
				$("#HitsProductImages").empty();
				if(listLength){
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr +=    "<li>";
						contentStr += 		"<img src=\"${ctx }/product/image.do?img=" + $(this).find("product>image").text() +"\">";
						contentStr +=	  "</li>";
					});
					
					$("#HitsProductImages").append(contentStr);
					
					//main Hits product slider setting
					$( '#HitsProductImages' ).bxSlider( {
					    mode: 'horizontal',// 가로 방향 수평 슬라이드
					    speed: 500,        // 이동 속도를 설정
					    pager: false,      // 현재 위치 페이징 표시 여부 설정
					    moveSlides: 1,     // 슬라이드 이동시 개수
					    slideWidth: 300,   // 슬라이드 너비
					    minSlides: 3,      // 최소 노출 개수
					    maxSlides: 4,      // 최대 노출 개수
					    slideMargin: 5,    // 슬라이드간의 간격
					    auto: false,        // 자동 실행 여부
					    autoHover: true,   // 마우스 호버시 정지 여부
					    controls: true,   // 이전 다음 버튼 노출 여부
					    captions: true     // 캡션 노출 여부
					} );
				}
				console.log(contentStr)
		}		
	});
};

var getBrandNewProducts	= function(){
	$.ajax({
		type : "get",
		url : "${ctx }/product/xml/main/category/brandNew.do?category=FUNITURE&page=4",
		dataType : "xml",
		success : function(xml) {
				console.log("------load Success-----")
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				console.log(listLength)
				$("#BrandNewProductImages").empty();
				if(listLength){
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr +=    "<li>";
						contentStr += 		"<img src=\"${ctx }/product/image.do?img=" + $(this).find("product>image").text() +"\">";
						contentStr +=	  "</li>";
					});
					
					$("#BrandNewProductImages").append(contentStr);
					
					// main brandNew product slider setting
					$( '#BrandNewProductImages' ).bxSlider( {
					    mode: 'horizontal',// 가로 방향 수평 슬라이드
					    useCSS: false,
					    speed: 500,        // 이동 속도를 설정
					    pager: false,      // 현재 위치 페이징 표시 여부 설정
					    moveSlides: 1,     // 슬라이드 이동시 개수
					    slideWidth: 300,   // 슬라이드 너비
					    minSlides: 3,      // 최소 노출 개수
					    maxSlides: 5,      // 최대 노출 개수
					    slideMargin: 3,    // 슬라이드간의 간격
					    auto: true,        // 자동 실행 여부
					    autoHover: true,   // 마우스 호버시 정지 여부
					    controls: true,	   // 이전 다음 버튼 노출 여부
					    captions: false     // 캡션 노출 여부
					});
					
				}
				console.log(contentStr)
		}		
	});
};

</script>


<%@ include file="/views/common/footer.jsp"%>