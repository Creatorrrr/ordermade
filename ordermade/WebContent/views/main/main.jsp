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
				<select id="selectHit" class="selectpicker" style="float:right">
					<c:forEach items="${categories}" var="category">
						<c:choose>
							<c:when test="${category.type eq 'FUNITURE'}">
								<option selected>${category.type }</option>
							</c:when>
							<c:otherwise>
								<option>${category.type }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<h2 style="line-height:300%">인기 상품</h2>
				<div  id="HitsProductImages"></div>
			</div>
			<p>
			<div>
				<select id="selectNew" class="selectpicker" style="float:right">
					<c:forEach items="${categories}" var="category">
						<c:choose>
							<c:when test="${category.type eq 'FUNITURE'}">
								<option selected>${category.type }</option>
							</c:when>
							<c:otherwise>
								<option>${category.type }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<h2 style="line-height:300%">최신 상품</h2>
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
	getHitsProducts("FUNITURE");
	getBrandNewProducts("FUNITURE");
});

$('#selectHit').change(function() {
	getHitsProducts($("#selectHit option:selected").val());
});

$('#selectNew').change(function() {
	getBrandNewProducts($("#selectNew option:selected").val());
});

var getHitsProducts = function(category) {
	$.ajax({
		type : "get",
		url : "${ctx }/product/xml/main/category/hit.do?category=" + category + "&page=10",
		dataType : "xml",
		success : function(xml) {
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				$("#HitsProductImages").empty();
				if(listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr +=    "<li>";
						contentStr +=	 	"<div class='itemBox' >";
						contentStr += 			"<div class='itemImageBox imgl borderedbox'>";
						contentStr +=	 			"<a href='${ctx}/product/ui/detail.do?id=" + $(this).find("product>id").text() +"'>";
						contentStr += 					'<img class="main-image" src=\"${ctx }/main/file/download.do?fileName=' + $(this).find("product>image").text() +'" />';
						contentStr += 				"</a>";
						contentStr += 			"</div>";
						contentStr +=	 		"<div class='itemExplainBox' align='left' style='margin-left: 15px'>";
						contentStr +=	 			"<a href='${ctx}/product/ui/detail.do?id=" + $(this).find("product>id").text() +"'>";
						contentStr +=	 				"<p class='itemTitleBox'>" + $(this).find("product>title").text() + "</p>";
						contentStr +=	 			"</a>";
						contentStr +=	 		"</div>";
						contentStr +=	 		"<div align='left' style='margin-left: 15px'>";
						contentStr +=	 			"<z class='itemPriceBox'>" + $(this).find("product>price").text() + " 원~</h2>";
						contentStr +=	 		"</div>";
						contentStr +=	 		"<br>";
						contentStr +=	 		"<div align='center'>";
						contentStr +=	 			"<p class='itemHitBox'>" + $(this).find("product>hit").text() + " Hits!!</p>";
						contentStr +=	 		"</div>";
						contentStr +=	 	"</div>";
						contentStr +=	 "</li>";
					});
					
					$("#HitsProductImages").append(contentStr);
					
					//main Hits product slider setting
					if(!hitSlider) {
						hitSlider = $( '#HitsProductImages' ).bxSlider( {
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
					} else {
						hitSlider.reloadSlider();
					}
				};
		}
	});
};

var hitSlider, newSlider;

var getBrandNewProducts	= function(category){
	$.ajax({
		type : "get",
		url : "${ctx }/product/xml/main/category/brandNew.do?category=" + category + "&page=10",
		dataType : "xml",
		success : function(xml) {
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				$("#BrandNewProductImages").empty();
				if(listLength){
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr +=    "<li>";
						contentStr +=	 	"<div class='itemBox'>";
						contentStr += 			"<div class='itemImageBox imgl borderedbox'>";
						contentStr +=	 			"<a href='${ctx}/product/ui/detail.do?id=" + $(this).find("product>id").text() +"'>";
						contentStr += 					'<img class="main-image" src=\"${ctx }/main/file/download.do?fileName=' + $(this).find("product>image").text() +'" />';
						contentStr += 				"</a>";
						contentStr += 			"</div>";
						contentStr +=	 		"<div class='itemExplainBox' align='left' style='margin-left: 15px'>";
						contentStr +=	 			"<a href='${ctx}/product/ui/detail.do?id=" + $(this).find("product>id").text() +"'>";
						contentStr +=	 				"<p class='itemTitleBox'>" + $(this).find("product>title").text() + "</p>";
						contentStr +=	 			"</a>";
						contentStr +=	 		"</div>";
						contentStr +=	 		"<div class='itemExplainBox' align='left' style='margin-left: 15px'>";
						contentStr +=	 			"<span class='itemPriceBox'>" + $(this).find("product>price").text() + " 원 ~</span>";
						contentStr +=	 		"</div>";
						contentStr +=	 		"</br>";
						contentStr +=	 		"<div class='itemExplainBox' align='center'>";
						contentStr +=	 			"<p class='itemHitBox'>" + $(this).find("product>hit").text() + " Hits!!</p>";
						contentStr +=	 		"</div>";
						contentStr +=	 	"</div>";
						contentStr +=	 "</li>";
					});
					
					$("#BrandNewProductImages").append(contentStr);
					
					// main brandNew product slider setting
					if(!newSlider) {
						newSlider = $( '#BrandNewProductImages' ).bxSlider( {
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
					} else {
						newSlider.reloadSlider();
					}
				};
		}
	});
};

</script>


<%@ include file="/views/common/footer.jsp"%>