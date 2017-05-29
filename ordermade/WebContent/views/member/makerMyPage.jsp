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
						<img src="${ctx }/member/image.do?img=${member.image}" />
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
								<ul id="pfslider">
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
						<tr><td><h3>최신 상품</h3></td></tr>
						<tr>
							<td>
								<ul id="productslider">
									<li><img src="${ctx }/member/image.do?img=phonecase4.jpg"></li>
									<li><img src="${ctx }/member/image.do?img=phonecase9.jpg"></li>
								</ul>
					            <a href="#" id="prevProductBtn">
					                <img src="${ctx }/views/images/bul_prev.png" alt="이전">
					            </a>
					            <a href="#" id="nextProductBtn">
					                <img src="${ctx }/views/images/bul_next.png" alt="다음">
					            </a>
							</td>
						</tr>
					</table>
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
$( function () {
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
        controls: false    // 이전 다음 버튼 노출 여부
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
        controls: false    // 이전 다음 버튼 노출 여부
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
} );

$(document).ready(function() {
	getPortfolio(1);
});

$("input[name='search']").click(
});

var getPortfolio = function() {
	$.ajax({
		url : "${ctx}/litStorage/search.do",
		data : {type : $("#type option:selected").val(),
				keyword : $("input[name='keyword']").val()},
		type : "post",
		dataType : "xml",
		success : function(xml) {
				var xmlData = $(xml).find("litStorage");
				var listLength = xmlData.length;
				$("#result").empty();			
				if (listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr += "<div class='litStorageBox'><table border='1'><tr><td>이름</td><td><a href='${ctx}/litStorage/profile.do?id="+ $(this).find("id").text() + "'>"+ $(this).find("name:first").text()
								+ "</a></td></tr><tr><td>소개</td><td>"+ $(this).find("introduce").text() + "</td></tr><tr>"
								+"<td>생성자 : </td><td>"+ $(this).find("creator").find("id").text()
								+ "</td></tr></table></div>";
					});
					$("#result").append(contentStr);
				}
			}
		});
	};
</script>

</body>
</html>