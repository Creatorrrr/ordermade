<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>

		<div id="content" class="two_third">
			<ul class="nospace listing">
				<li class="clear">
					<div class="content" align="center">
						<div class="imgl borderedbox">
							<img src="${ctx }/views/images/img1.jpg" />
						</div>
						<table class="table">
							<tr>
								<td><p>의뢰 명 : ${request.title}</p></td>
							</tr>
							<tr>
								<td><p>의뢰자 : ${request.id }</p></td>
							</tr>
							<tr>
								<td><p>의뢰 내용 : ${request.content }</p></td>
							</tr>
							<tr>
								<td><p>제작 항목 : ${request.category }</p></td>
							</tr>
							<tr>
								<td><p>희망 가격 : ${request.hopePrice }</p></td>
							</tr>
							<tr><td><h3>최신 포트폴리오</h3></td></tr>
							<tr>
								<td>
									<ul id="pfslider">
										<!-- images from ajax (sample under) -->
										<li><img src="${ctx }/member/image.do?img=phonecase4.jpg"></li>
										<li><img src="${ctx }/member/image.do?img=phonecase9.jpg"></li>
									</ul>
						            <a href="#" id="prevPfBtn">
						                <img src="${ctx }/views/images/bul_prev.png" alt="이전">
						            </a>
						            <a href="#" id="nextPfBtn">
						                <img src="${ctx }/views/images/bul_next.png" alt="다음">
						            </a>
					            </td>
							</tr>
							<tr><td><h3>추가 요구 사항</h3></td></tr>
							<tr>
								<td><textarea rows="10" cols="80"></textarea></td>
							</tr>
						</table>
						<div>
							<input class="" name="" type="button" value="등록">
							<input class="" name="" type="reset" value="취소">
						</div>
						<div>
							<p>제작기간 : 일</p>
							<p>결제금액 (배송비 포함): 원</p> 
							<input class=""  type="button" name="" value="결제">
						</div>
					</div>
				</li>
			</ul>
		</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

<!-- bxSlider JavaScript file -->
<script src="${ctx }/views/js/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="${ctx }/views/css/jquery.bxslider.css" rel="stylesheet" />

<script type="text/javascript">
$(document).ready(function() {
//	getPortfolios(1); *****************************************************************
});

// get portfolios with xml
var getPortfolios = function(page) {
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
						contentStr += "<img src='${ctx }/member/image.do?img=" + $(this).find('portfolio>image') + "'>";
						contentStr += "</li>";
					});
					$("#pfslider").append(contentStr);
				}
			}
		});
	};
	
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
</script>

</body>
</html>