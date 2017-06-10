<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>상품 상세페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<div id="contents" class="two_third first">
			<!-- 상품 제목 -->
			<h1 class="productTitle" align="left">[${product.title }] 상품페이지</h1>
			<h2 align="left">(category - [${product.category }] 상품페이지)</h2>
			<!-- 수정 삭제 메뉴 -->
			<c:if test="${sessionScope.loginId ne null}">
				<c:if test="${product.maker.id eq sessionScope.loginId}">
					<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
					<div class="productControlBox">
						<input class="btn btn-default" type="button" value="수정"
							onclick="location.href='${ctx}/product/ui/modify.do?id=${product.id}';">
						<input class="btn btn-default" type="button" value="삭제"
							onclick="javascript:removeProduct();">
					</div>
				</c:if>
			</c:if>
			<!-- 상품 설명 시작 -->
			<div class="productDetailBox">
				<h2 class="productSubTitle">상품 상세 </h2>
				<hr style="margin:0px 0px 15px 0px;">
				<!-- 상품 이미지  -->
				<div class="productImageBox" align="center">
					<img src="${ctx }/main/file/download.do?fileName=${product.image}" />
				</div>
				<!-- 상품 설명 -->
				<p class="productContentBox">
					<div align="center" style="color: #000000">
					 ${product.content}
					</div>
				</p>
			</div>
			<!-- 상품 설명 종료 -->

			<!-- 후기 목록 시작 -->
			<div class="reviewListBox">
				<h2 class="productSubTitle">상품 후기</h2>
				<hr style="margin:0px">
				<div class="right">
					<form class="navbar-form text-right">
						<select id="reviewSearchType" class="form-control" style="display: inline-block">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
						</select>
						<input id="reviewSearchKeyword" class="form-control" type="text" value=""
							placeholder="Search Here" style="display: inline-block" />
						<button id="reviewSearchBtn" class="fa fa-search btn btn-default" type="button" title="Search">검색</button>
						<button class="fa fa-search btn btn-default" type="button" title="Search" onclick="javascript:reviewController.getReviewsByProductId(1)">후기 전체 보기</button>
					</form>
				</div>
				<div id="reviewList">
					<!-- reviews from server -->
				</div>
			</div>
			<!-- 후기 목록 종료 -->
			
			<!-- 후기 등록 시작 -->
			<c:if test="${sessionScope.memberType eq 'C' }">
				<div class="reviewRegisterBox">
					<h2 class="productSubTitle">후기 등록</h2>
					<hr style="margin:0px 0px 15px 0px;">
					<form id="reviewRegisterForm">
						<input type="hidden" id="productId" name="product.id" value="${product.id }">
						<div class="two_third first">
							<label for="title">제목</label>
							<input class="form-control" type="text" id="reviewRegisterTitle" name="title" value="" size="22">
						</div>
						<div class="one_third">
							<label for="reviewSearchType">평점</label>
							<select id="reviewSearchType" name="grade" class="form-control" style="display: inline-block">
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5" selected>★★★★★</option>
							</select>
						</div>
						<div class="block clear">
							<label for="content">내용</label>
							<textarea class="form-control" id="reviewRegisterContent" name="content" placeholder="댓글쓰기" cols="55"
								rows="7"></textarea>
						</div>
						<div align="right">
							<input class="btn btn-default" type="button" onclick="javascript:reviewController.registerReview()" value="등록">
							<input class="btn btn-default" type="reset" value="취소">
						</div>
					</form>
				</div>
			</c:if>
			<!-- 후기 등록 종료 -->
		</div>
		<!-- 본문 종료 -->

		<div class="sidebar one_third">
			<%@include file="/views/common/productNav.jsp"%>
		</div>

		<!-- / main body -->
		<div class="clear"></div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	reviewController.getReviewsByProductId(1);
});

//검색을 클릭하면 검색된 의뢰서 목록을 가져온다.
$("#reviewSearchBtn").click(function() {
	var type = $("#reviewSearchType option:selected").val();
	var keyword = $("#reviewSearchKeyword");
	if (type === "title") {
		reviewController.getReviewsByTitleAndProductId(keyword.val(), 1);
	} else if (type === "writer") {
		reviewController.getReviewsByConsumerIdAndProductId(keyword.val(), 1);
	}
	keyword.val("");
});

var removeProduct = function() {
	var r = confirm("삭제하시겠습니까?");
	if (r == true) {
	   	location.href="${ctx }/product/xml/remove.do?id=${product.id}";
	   	$.ajax({
			url:"${ctx }/product/xml/remove.do?id=${product.id}",
			type:"get",
			dataType : "text",
			success : function(data) {
				if(data === "true"){
					location.href="${ctx}/product/ui/myProducts.do?page=1";
				} else {
					alert("삭제 실패했습니다.");
				}
			}
		});
	}
}

var reviewController = {
	modifyFormFlag : false,
	
	registerReview : function() {
		if($("#reviewRegisterTitle").val() === "") {
			alert("제목을 입력해주세요");
			return false;
		}
		if($("#reviewRegisterContent").val() === "" ) {
			alert("내용을 입력해주세요");
			return false;
		}
		$.ajax({
			url:"${ctx}/product/review/register.do",
			type:"post",
			data: $('#reviewRegisterForm').serialize(),
			dataType : "text",
			success : function(data) {
				if(data === "true"){
					reviewController.getReviewsByProductId(1);
				}
			}
		});
		$("#reviewRegisterTitle").val("");
		$("#reviewRegisterContent").val("");
	},
	
	modifyReviewForm : function(reviewId) {
		var review = $("#reviewContentBox-" + reviewId);
		var content = "";

		content += '<form id="reviewModifyForm-' + reviewId + '">';
		content += '	<input name="product.id" type="hidden" value="${product.id}">';
		content += '	<input name="id" type="hidden" value="' + reviewId + '">';
		content += '	<div class="two_third first">';
		content += '		<label for="title">제목</label>';
		content += '		<input class="form-control" type="text" name="title" value="' + review.children(".reviewTitle").text() + '" size="22">';
		content += '	</div>';
		content += '	<div class="one_third">';
		content += '		<label for="reviewSearchType">평점</label>';
		content += '		<select id="reviewSearchType" name="grade" class="form-control" style="display: inline-block">';
		var grade = parseInt(review.children(".reviewGrade").val());
		for(var i = 1 ; i <= 5 ; i++) {
			if(i === grade) {
				content += '			<option value="' + i + '" selected>';
			} else {
				content += '			<option value="' + i + '">';
			}
			for(var j = 0 ; j < i ; j++) {
				content += '★';
			}
			content += '</option>';
		}
		content += '		</select>';
		content += '	</div>';
		content += '	<div class="block clear">';
		content += '		<label for="content">내용</label>';
		content += '		<textarea class="form-control" name="content" placeholder="댓글쓰기" cols="55" rows="7">' + review.children(".reviewContent").text() + '</textarea>';
		content += '	</div>';
		content += '	<div align="right">';
		content += '		<input class="btn btn-default" type="button" onclick="javascript:reviewController.modifyReview(' + reviewId + ')" value="수정">';
		content += '		<input class="btn btn-default" type="button" onclick="javascript:reviewController.getReviewsByProductId(1);reviewController.modifyFormFlag=false;" value="취소">';
		content += '	</div>';
		content += '</form>	';

		review.empty().append(content);
	},
	
	modifyReview : function(reviewId) {console.log($('#reviewModifyForm-' + reviewId));console.log('#reviewModifyForm-' + reviewId);
		$.ajax({
			url:"${ctx}/product/review/modify.do",
			type:"post",
			data: $('#reviewModifyForm-' + reviewId).serialize(),
			dataType : "text",
			success : function(data) {
				if(data === "true"){
					reviewController.getReviewsByProductId(1);
				}
			}
		});
	},
		
	deleteReview : function(reviewId) {
		$.ajax({
			url : "${ctx}/product/review/remove.do?id=" + reviewId,
			type : "get",
			success : function(data) {
				if(data === "true"){
					reviewController.getReviewsByProductId(1);
				}
			}
		});
	},
		 
	getReviewsByProductId : function(page) {
		reviewController.modifyFormFlag = false;
		$.ajax({
			url : "${ctx}/product/ajax/reviews/productid.do?productId=${product.id}&page=" + page,
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("review");
					var listLength = xmlData.length;
					$("#reviewList").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += reviewController.makeContent(this);
						});
						$("#reviewList").append(contentStr);
					}
			}
		});
	},
	
	getReviewsByTitleAndProductId : function(title, page) {
		reviewController.modifyFormFlag = false;
		$.ajax({
			url : "${ctx}/product/ajax/reviews/TP.do?productId=${product.id}&title=" + title + "&page=" + page,
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("review");
					var listLength = xmlData.length;
					$("#reviewList").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += reviewController.makeContent(this);
						});
						$("#reviewList").append(contentStr);
					}
			}
		});
	},
	
	getReviewsByConsumerIdAndProductId : function(consumerId, page) {
		reviewController.modifyFormFlag = false;
		$.ajax({
			url : "${ctx}/product/ajax/reviews/CP.do?productId=${product.id}&consumerId=" + consumerId + "&page=" + page,
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("review");
					var listLength = xmlData.length;
					$("#reviewList").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += reviewController.makeContent(this);
						});
						$("#reviewList").append(contentStr);
					}
			}
		});
	},
	
	makeContent : function(xml) {
		var content = "";

		content += "<div class='reviewBox'>";
		content += 		"<div id='reviewContentBox-" + $(xml).find("review>id").text() + "' class='reviewContentBox'>";
		content +=			"<input class='reviewGrade' type='hidden' value='" + $(xml).find("review>grade").text() + "'>";
		content += 			"<h3 class='reviewTitle'>" + $(xml).find("review>title").text() + "</h3>";
		content += 			"<div class='reviewControlBox'>";
		content += 				"<p>작성자 : " + $(xml).find("review>consumer>id").text() + "</p>";
		content += 				"<p>점수 : ";
		var grade = parseInt($(xml).find("review>grade").text());
		for(var i = 0 ; i < 5 ; i++) {
			if(grade > 0) {
				content += 	"★";
			} else {
				content += "☆";
			}
			grade--;
		}	
		content += 				"</p>";
		if($(xml).find("review>consumer>id").text() === "${sessionScope.loginId}") {
			content += 			"<button class='btn btn-default' onclick='javascript:if(reviewController.modifyFormFlag===true)return false;reviewController.modifyReviewForm(" + $(xml).find("review>id").text() + ");reviewController.modifyFormFlag=true;'>수정</button>";
			content += 			"<button class='btn btn-default' onclick='javascript:reviewController.deleteReview(" + $(xml).find("review>id").text() + ")'>삭제</button>";
		}
		content += 			"</div>";
		content += 			"<p class='reviewContent'>" + $(xml).find("review>content").text() + "</p>";
		content += 		"</div>";
		content += 		"<div class='reviewWriterBox'><img src='${ctx}/main/file/download.do?fileName=" + $(xml).find("review>consumer>image").text() + "'></div>"
		content += '</div>';
		return content;
	}
};
</script>