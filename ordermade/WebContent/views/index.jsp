<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<!-- bxSlider CSS file -->
<link href="${ctx }/views/css/jquery.bxslider.css" rel="stylesheet" />
<head>
<%@ include file="/views/common/head.jsp"%>
</head>
<body>	
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
				<li><a href="${ctx }/views/images/image/cat1.jpg">A</a></li>
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
				<ul class="nospace listing">
					<li class="clear">
						<%-- <c:forEach items="${ box_list }" var="literature"> --%>
						<div class="content" align="center">
							<table class="table">
								<tr>
									<td>
										<ul id="pfslider">
											<!-- images from ajax (sample under) -->
											<li><img src="${ctx }/views/images/img1.jpg"></li>
											<li><img src="${ctx }/views/images/img1.jpg"></li>
										</ul>
							            <a href="#" id="prevPfBtn">
							                <img src="${ctx }/views/images/bul_prev.png" alt="이전">
							            </a>
							            <a href="#" id="nextPfBtn">
							                <img src="${ctx }/views/images/bul_next.png" alt="다음">
							            </a>
						            </td>
					            </tr>
								<%-- <tr>
									<td>
										<img src="${ctx }/views/images/img1.jpg" />
									</td>
								</tr>
								<tr class="nospace btmspace-15">
									<td>상품 이름</td>
									<td><a class="literature" href="${ctx}/#/#.do?#=${asf }">${asf  }
											rkrkrk</a></td>
								</tr>
								<tr class="nospace btmspace-15">
									<td>가격</td>
									<td class="creatorId">${asf}10000000원</td>
								</tr> --%>
							</table>
						</div> <%-- </c:forEach> --%>
					</li>
				</ul>
				
				<h3>최신 상품</h3>
				<ul class="nospace listing">
					<li class="clear">
						<%-- <c:forEach items="${ box_list }" var="literature"> --%>
						<div class="content" align="center">
							<table class="table">
								<tr>
									<td>
										<ul id="productslider">
											<!-- images from ajax (sample under) -->
											<li><img src="${ctx }/views/images/img1.jpg"></li>
											<li><img src="${ctx }/views/images/img1.jpg"></li>
										</ul>
							            <a href="#" id="prevProductBtn">
							                <img src="${ctx }/views/images/bul_prev.png" alt="이전">
							            </a>
							            <a href="#" id="nextProductBtn">
							                <img src="${ctx }/views/images/bul_next.png" alt="다음">
							            </a>
						            </td>
					            </tr>
								<%-- <tr>
									<div class="imgl borderedbox">
										<img src="${ctx }/views/images/img1.jpg" />
									</div>
								</tr>
								<tr class="nospace btmspace-15">
									<td>상품 이름</td>
									<td><a class="literature" href="${ctx}/#/#.do?#=${asf }">${asf  }
											rkrkrk</a></td>
								</tr>
								<tr class="nospace btmspace-15">
									<td>가격</td>
									<td class="creatorId">${asf}10000000원</td>
								</tr> --%>
							</table>
						</div> <%-- </c:forEach> --%>
					</li>
				</ul>
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

<div class="wrapper row4">
	<div class="rounded">
		<footer id="footer" class="clear">
			<div class="one_third first">
				<figure class="center">
					<img class="btmspace-15" src="${stx }images/demo/worldmap.png"
						alt="">
					<figcaption>
						<a href="#">Find Us With Google Maps &raquo;</a>
					</figcaption>
				</figure>
			</div>
			<div class="one_third">
				<address>
					Long Educational Facility Name<br> Address Line 2<br>
					Town/City<br> Postcode/Zip<br> <br> <i
						class="fa fa-phone pright-10"></i> xxxx xxxx xxxxxx<br> <i
						class="fa fa-envelope-o pright-10"></i> <a href="#">contact@domain.com</a>
				</address>
			</div>
			<div class="one_third">
				<p class="nospace btmspace-10">Stay Up to Date With What's
					Happening</p>
				<ul class="faico clear">
					<li><a class="faicon-twitter" href="#"><i
							class="fa fa-twitter"></i></a></li>
					<li><a class="faicon-linkedin" href="#"><i
							class="fa fa-linkedin"></i></a></li>
					<li><a class="faicon-facebook" href="#"><i
							class="fa fa-facebook"></i></a></li>
					<li><a class="faicon-flickr" href="#"><i
							class="fa fa-flickr"></i></a></li>
					<li><a class="faicon-rss" href="#"><i class="fa fa-rss"></i></a></li>
				</ul>
				<form class="clear" method="post" action="#">
					<fieldset>
						<legend>Subscribe To Our Newsletter:</legend>
						<input type="text" value="" placeholder="Enter Email Here&hellip;">
						<button class="fa fa-sign-in" type="submit" title="Sign Up">
							<em>Sign Up</em>
						</button>
					</fieldset>
				</form>
			</div>
		</footer>
	</div>
</div>

<%@ include file="common/footer.jsp"%>

<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.fitvids.min.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<script src="layout/scripts/tabslet/jquery.tabslet.min.js"></script>
<!-- bxSlider JavaScript file -->
<script src="${ctx }/views/js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
//portfolio slider setting
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

//portfolio slider setting
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
</body>
</html>