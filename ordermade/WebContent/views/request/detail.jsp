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
					</table>
					<table class="table">
						<tr><td><h3>대화 기록<button onclick="" style="float: right;">파일함</button></h3></td></tr>
						<tr>
							<td>
								<ul id="commentslider">
									<c:forEach items="${request.comments }" var="comment">
										<li><p>${comment.member.memberType } : ${comment.content }</p></li>
									</c:forEach>
								</ul>
					            <%-- <a href="#" id="prevCommentBtn">
					                <img src="${ctx }/views/images/bul_prev.png" alt="이전">
					            </a>
					            <a href="#" id="nextCommentBtn">
					                <img src="${ctx }/views/images/bul_next.png" alt="다음">
					            </a> --%>
				            </td>
						</tr>
					</table>
					<div>
						<c:choose>
							<c:when test="${sessionScope.memberType eq 'C'}">
								<p align="right">제작기간 : 일</p>
								<p align="right">결제금액 (배송비 포함): ${request.price }원</p> 
								<input type="button" name="" onclick="" value="결제" style="float:right">
							</c:when>
							<c:when test="${sessionScope.memberType eq 'M'}">
								<p align="right">제작기간 :<input name="" type="text" value="" style="display:inline-block">일</p>
								<p align="right">결제금액 (배송비 포함): <input name="" type="text" value="" style="display:inline-block">원</p> 
								<input type="button" name="" value="등록" style="float:right">
							</c:when>
						</c:choose>
					</div>
				</div>
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
	
/* 	// portfolio slider setting
	var pfSlider = $( '#commentslider' ).bxSlider( {
	    mode: 'vertical',// 가로 방향 수평 슬라이드
	    speed: 500,         // 이동 속도를 설정
	    pager: true,       // 현재 위치 페이징 표시 여부 설정
	    moveSlides: 5,      // 슬라이드 이동시 개수
	    minSlides: 5,      // 최소 노출 개수
	    maxSlides: 5,      // 최대 노출 개수
	    adaptiveHeight: true, // 높이 자동 조절
	    auto: false,        // 자동 실행 여부
	    controls: false,    // 이전 다음 버튼 노출 여부
	    responsive: true,	// 리사이즈 허용
	    touchEnabled: true,	// 터치 허용
	    infiniteLoop: false	// 무한루프 해제
	} );

	//이전 버튼을 클릭하면 이전 슬라이드로 전환
	$( '#prevCommentBtn' ).on( 'click', function () {
		pfSlider.goToPrevSlide();  //이전 슬라이드 배너로 이동
	    return false;              //<a>에 링크 차단
	} );

	//다음 버튼을 클릭하면 다음 슬라이드로 전환
	$( '#nextCommentBtn' ).on( 'click', function () {
		pfSlider.goToNextSlide();  //다음 슬라이드 배너로 이동
	    return false;
	} ); */
</script>

</body>
</html>