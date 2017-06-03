<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>의뢰서 등록</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>


<!--Main Image-->
<div class="wrapper">
	<div id="slider">
		<div id="slide-wrapper" class="rounded clear">
			<figure id="slide-1">
				<a class="view" href="#"><img
					src="${ctx }/views/images/demo/slider/pp.jpg" alt=""></a>
			</figure>
			<figure id="slide-2">
				<a class="view" href="#"><img
					src="${ctx }/views/images/demo/slider/2.png" alt=""></a>
			</figure>
			<figure id="slide-3">
				<a class="view" href="#"><img
					src="${ctx }/views/images/demo/slider/3.png" alt=""></a>
			</figure>
			<figure id="slide-4">
				<a class="view" href="#"><img
					src="${ctx }/views/images/demo/slider/4.png" alt=""></a>
			</figure>
			<figure id="slide-5">
				<a class="view" href="#"><img
					src="${ctx }/views/images/demo/slider/5.png" alt=""></a>
			</figure>
			<ul id="slide-tabs">
				<li><a href="${ctx }#slide-1">A</a></li>
				<li><a href="${ctx }#slide-2">B</a></li>
				<li><a href="${ctx }#slide-3">C</a></li>
				<li><a href="${ctx }#slide-4">D</a></li>
				<li><a href="${ctx }#slide-5">E</a></li>
			</ul>
		</div>
	</div>
</div>
<!--Main Image End  -->



<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="group btmspace-30">

			<!-- Middle Column -->
			<div class="one_half">

				<h2>인기 상품</h2>
				<ul class="nospace listing" style="width: 195%;">
					<li class="clear">
						<div class="content" align="center">
							<ul id="HitsProductSlider">
								<!-- images from ajax (sample under) -->
								<li><img src="${ctx }/views/images/image/cat1.jpg"></li>
								<li><img src="${ctx }/views/images/image/cat1.jpg"></li>
								<li><img src="${ctx }/views/images/image/cat1.jpg"></li>
								<li><img src="${ctx }/views/images/image/cat1.jpg"></li>
								<li><img src="${ctx }/views/images/image/cat1.jpg"></li>
								<li><img src="${ctx }/views/images/image/cat1.jpg"></li>
							</ul>
							<%-- <a href="#" id="prevPfBtn">
				                <img src="${ctx }/views/images/bul_prev.png" alt="이전">
				            </a>
				            <a href="#" id="nextPfBtn">
				                <img src="${ctx }/views/images/bul_next.png" alt="다음">
				            </a> --%>
						</div> 
					</li>
				</ul>
				<p>
				<h3>최신 상품</h3>
				<ul class="nospace listing" style="width: 195%;">
					<li class="clear">
							<ul id="BrandNewProductSlider">
								<!-- images from ajax (sample under) -->
								<li><img src="${ctx }/product/image.do?img=baduk.jpg"></li>
								<li><img src="${ctx }/product/image.do?img=error4.PNG"></li>
								<li><img src="${ctx }/product/image.do?img=baduk1.jpg"></li>
								<li><img src="${ctx }/product/image.do?img=error4.PNG"></li>
								<li><img src="${ctx }/product/image.do?img=baduk2.jpg"></li>
							</ul>
							<%-- <a href="#" id="prevPfBtn">
				                <img src="${ctx }/views/images/bul_prev.png" alt="이전">
				            </a>
				            <a href="#" id="nextPfBtn">
				                <img src="${ctx }/views/images/bul_next.png" alt="다음">
				            </a> --%>
					</li>
				</ul>
				<!-- <div id="HitsProductImages">
				</div> -->
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
	$.ajax({
		type : "get",
		url : "${ctx }/product/xml/main/category/hit.do?category=Digital&page=5",
		dataType : "xml",
		success : function(xml) {
				console.log("------load Success-----")
				var xmlData = $(xml).find("products>product");
				var listLength = xmlData.length;
				console.log(listLength)
				$("#HitsProductImages").empty();
				if(listLength){
					var contentStr = "";
					contentStr += "<ul class='nospace listing' style='width: 195%;'>";
					contentStr +=    "<li class='clear'>";
					contentStr +=			"<ul id='BrandNewProductSlider'>";
					$(xmlData).each(function() {
						contentStr += mainImageController.makeImage(this);
					});
					contentStr += 			"</ul>";
					contentStr +=	  "</li>"
					contentStr += "</ul>"
					$("#HitsProductImages").append(contentStr);
				}
				console.log(contentStr)
		}		
	});
	
});

var mainImageController = {
		makeImage : function(xml) {
			var content = "";
			
			content += "<li><img src=\"${ctx }/product/image.do?img=";
			content += 		$(xml).find("product>image").text() +"\"></li>";
			
			return content;
		}

};

//main slider setting
var pfSlider = $( '#HitsProductSlider' ).bxSlider( {
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

//product slider setting
var productSlider = $( '#BrandNewProductSlider' ).bxSlider( {
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

</script>


<%@ include file="/views/common/footer.jsp"%>