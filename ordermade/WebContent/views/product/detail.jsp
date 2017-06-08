<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>상품 상세페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

<style type="text/css">
.productTitle {
	width:80%;
	font-size: 2em;
	margin-top: 15px;
	margin-bottom: 15px;
	display:inline-block;
}
.productSubTitle {
	display:inline-block;
}
.productDetailBox {
	margin: 15px;
}
.productControlBox{
	margin-top: 15px;
	margin-bottom: 15px;
	float:right;
}
.productImageBox img{
	width:50%;
}
.productContentBox {
	margin:30px 0px 30px 0px;
}
.reviewListBox {
	margin: 15px;
}
.reviewBox {
	overflow:hidden;
	height: auto;
}
.reviewContentBox {
	height: 70px;
	width: 80%;
	display: inline-block;
}
.reviewContentBox * {
	color: black;
}
.reviewContentBox h3 {
	display: inline-block;
}
.reviewWriterBox {
  height: auto;
  width: 95px;
  margin: 5px;
  float: left;
}
.reviewControlBox {
  float: right;
}
.reviewControlBox p {
  text-align: right;
}
.reviewTitle {
	font-size: 20px;
	font-weight: 400;
}
.reviewRegisterBox {
	margin: 15px;
}
.reviewRegisterBox * {
	color: black;
}
</style>

<div class="wrapper row3">
	<div class="rounded">
		<div id="contents" class="two_third first">
			<!-- 상품 제목 -->
			<h1 class="productTitle">${product.title }</h1>
			<!-- 수정 삭제 메뉴 -->
			<c:if test="${sessionScope.loginId ne null}">
				<c:if test="${product.maker.id eq sessionScope.loginId}">
					<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
					<div class="productControlBox">
						<input class="btn btn-default" type="button" value="수정"
							onclick="location.href='${ctx}/product/ui/modify.do?id=${product.id}';">
						<input class="btn btn-default" type="button" value="삭제"
							onclick="javascript:deleteProduct(${product.id})">
					</div>
				</c:if>
			</c:if>
			<!-- 상품 설명 시작 -->
			<div class="productDetailBox">
				<h2 class="productSubTitle">상품 상세</h2>
				<hr style="margin:0px 0px 15px 0px;">
				<!-- 상품 이미지  -->
				<div class="productImageBox" align="center">
					<img src="${ctx }/product/image.do?img=${product.image}" />
				</div>
				<!-- 상품 설명 -->
				<p class="productContentBox">${product.content}</p>
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
				<!-- 후기 목록 시작 -->
				<div id="reviewList">
					<!-- reviews from server -->
				</div>
			</div>
			<!-- 후기 목록 종료 -->
			
			<!-- 후기 등록 시작 -->
			<div class="reviewRegisterBox">
				<h2 class="productSubTitle">후기 등록</h2>
				<hr style="margin:0px 0px 15px 0px;">
				<form id="reviewRegisterForm" onsubmit="return false;">
					<input type="hidden" id="productId" name="product.id" value="${product.id }">
					<div class="two_third first">
						<label for="title">제목</label>
						<input class="form-control" type="text" name="title" value="" size="22">
					</div>
					<div class="one_third">
						<label for="reviewSearchType">평점</label>
						<select id="reviewSearchType" class="form-control" style="display: inline-block">
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
					</div>
					<div class="block clear">
						<label for="content">내용</label>
						<textarea class="form-control" name="content" placeholder="댓글쓰기" cols="55"
							rows="7"></textarea>
					</div>
					<div align="right">
						<input class="btn btn-default" type="button" onclick="javascript:reviewController.registerReview()" value="등록">
						<input class="btn btn-default" type="reset" value="취소">
					</div>
				</form>
			</div>
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

/* function upGrade(reviewId) {
	console.log(reviewId)
	var reviewid = reviewId;
	$.ajax({
		url : "${ctx}/product/review/modify.do",
		type : "post", 
		data : $('#upDown'+reviewid).serialize(),
		dataType : "text",
		sucess : function(check) {
			if(check=="true"){
				console.log("44444444444444")
			}
		}
	});
}

function deleteProduct(productId) {
	$.ajax({
		url:"${ctx}/product/xml/remove.do?id="+productId,
		type : "get",
		dataType : "text",
		success : function(check) {
			if(check=="true"){
				location.href="${ctx}/product/ui/myProducts.do"
			}
		}
	});
}
function reviewRegister(){
	$.ajax({
		url:"${ctx}/product/review/register.do",
		type:"post",
		data: $('#form2').serialize(),
		dataType : "text",
		success : function(data) {
			if(data=="true"){ 
				javascript:Reviews(${product.id})
			}
		}
	});
}

 function beforeUpdateReview(reviewId) {
	 console.log(reviewId)
	 var updateReview = reviewId;
	 var productid = $("#productId").val();
	 var userId = "${sessionScope.loginId}";
	$.ajax({
		url:"${ctx}/product/ajax/product/productId.do?productId",
		type:"get",
		data:{
			productId : $("#productId").val()
		},
		success : function(xml) {
			console.log(xml);
				var list =  $(xml).find("reviews");
				var listLength = list.length;
				var html = "";
			list.each(function(){
			 	if(updateReview!=$(">id",this).text()) {
				html += '<table>';
				html += 		"<tr>";
				html += 			"<td>작성자 : </td>";
				html += 		     "<td>" +$(">consumer>id",this).text()+ "</td>";
				html += 		"</tr>";
				html += 		"<tr>";
				html += 			"<td>제목 : </td>";
				html += 		     "<td>" +$(">title",this).text()+ "</td>";
				html += 		"</tr>";
				html += 		"<tr>";
				html += 			"<td>내용 : </td>";
				html += 		     "<td>" +$(">content",this).text()+ "</td>";
				html += 		"</tr>";
				html += '</table>';
				if(userId===$(">consumer>id",this).text()){
					html += "<input type='button' value='수정' onclick='javascript:updateReview("+$(">id",this).text()+")'>";
					html += "<input type='button' value='삭제' onclick='javascript:deleteReview("+$(">id",this).text()+")'>";
				}
				if(userId!=$(">consumer>id",this).text()){
					html += "<input type='button' value='따봉' onclick='javascript:upGrade()'>";
					html += "<input type='button' value='우우' onclick='javascript:downGrade()'>";
				}
			 	} else if(updateReview==$(">id",this).text()){
			 	html +=	"<form id='form3' onsubmit='return false;'>";
			 	html +=		"<div class='one_third first'>";
			 	html +=		"<label for='title'>제목 <span>*</span></label> <input type='text' id='title' name='title' value='"+$(">title",this).text()+"' size='22'>";
			 	html +=		"</div>";
				html +=	"<div class='one_third'>";
				html +=		"<label for='grade'>평점<span>*</span></label> <input type='text' id='grade' name='grade' value='"+$(">grade",this).text()+"' size='22'>";
				html +=	"</div>";
				html +=	"<div class='block clear'>";
				html +=	"<label for='content'>후기</label>";
				html +=	"<textarea id='content' name='content'  cols='55' rows='7' >"+$(">content",this).text()+"</textarea>";
				html +=	"</div>";
				html +=	"<div>";
				html += "<input type='hidden' name='product.id' value='"+${product.id}+"'>";
			 	html +=	"<input type='hidden' id='id' name='id' value='"+$(">id",this).text()+"'>";
				html +=	"<input type='button' onclick='javascript:afterUpdateReview("+${product.id}+")' value='수정 확인'>" ;
				html +=	"<input type='button' onclick='javascript:Reviews("+${product.id}+")' value='취소'>"; 
				html +=	"</div>";
				html += "</form>";
			 	}
			});
			$("#reiewList").empty();
			$("#reiewList").append(html);
		}
	});
} 
 
  function afterUpdateReview(productId){
	 console.log(productId+"afterUpdateReview")
	 var productSS = productId;
	 $.ajax({
		 url:"${ctx}/product/review/modify.do",
		 type:"post",
		 data: $('#form3').serialize(),
		 success:function(data){
			 if(data=="true"){
				 javascript:Reviews(productSS);
			 }
		 }
	 });
}  

function Reviews(data){
	$.ajax({
		url:"${ctx}/product/ajax/product/productId.do?productId="+data,
		type:"get",
		success : displayReviews
	});
}


function myReview(page,data ) {
	$.ajax({
		url:"${ctx}/product/ajax/reviews/CP.do?page="+page+ "&productId="+data,
		type:"get",
		success : displayReviews
	});
}

function TCReview() {
	if($("#type").val()=="id"){
		console.log("CCCC")
		$.ajax({
			url:"${ctx}/product/ajax/reviews/CP.do",
			type:"get",
			data:{
				page : $("#page").val(),
				productId : $("#productId").val(),
				consumerId : $("#searchBar").val()
			},
			success : displayReviews
		});
	}
	 else if($("#type").val()=="title"){
	console.log("TTTT")
	$.ajax({
		url:"${ctx}/product/ajax/reviews/TP.do",
		type:"get",
		data:{
			page : $("#page").val(),
			productId : $("#productId").val(),
			title : $("#searchBar").val()
		},
		success : displayReviews
	}); 
}
}
var displayReviews = function(xml) {
	console.log(xml);
	var name = xml.firstChild.tagName;
	var userId = "${sessionScope.loginId}";
	if(name=="product"){
		var list = $(xml).find("product>reviews")
	}else if(name=="reviews"){
		var list =  $(xml).find("reviews>")
	}
	var listLength = list.length;
	console.log(listLength)
	var html = "";
	list.each(function(){
		html += '<table>';
		html += 		"<tr>";
		html += 			"<td>작성자 : </td>";
		html += 		     "<td>" +$(">consumer>id",this).text()+ "</td>";
		html += 		"</tr>";
		html += 		"<tr>";
		html += 			"<td>제목 : </td>";
		html += 		     "<td>" +$(">title",this).text()+ "</td>";
		html += 		"</tr>";
		html += 		"<tr>";
		html += 			"<td>내용 : </td>";
		html += 		     "<td>" +$(">content",this).text()+ "</td>";
		html += 		"</tr>";
		html += '</table>';
		if(userId===$(">consumer>id",this).text()){
		html += "<input type='button' value='수정' onclick='javascript:beforeUpdateReview("+$(">id",this).text()+")'>";
		html += "<input type='button' value='삭제' onclick='javascript:deleteReview("+$(">id",this).text()+")'>";
	}
		if(userId!=$(">consumer>id",this).text()){
			html += "<input type='button' value='따봉' onclick='javascript:upGrade()'>";
			html += "<input type='button' value='우우' onclick='javascript:downGrade()'>";
		}
	});
	$("#reiewList").empty();
	$("#reiewList").append(html);
	$("#title").val("");
	$("#grade").val("");
	$("#content").val("");
} */

var reviewController = {
	
	registerReview : function() {
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
	},
	
	modifyReview : function() {
		$.ajax({
			url:"${ctx}/product/review/modify.do",
			type:"post",
			data: $('#reviewModifyForm').serialize(),
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
		content += 		"<div class='reviewContentBox'>";
		content += 			"<h3 class='reviewTitle'>" + $(xml).find("review>title").text() + "</h3>";
		content += 			"<div class='reviewControlBox'>";
		content += 				"<p>작성자 : " + $(xml).find("review>consumer>id").text() + "</p>";
		if($(xml).find("review>consumer>id").text() === "${sessionScope.loginId}") {
			content += 			"<button class='btn btn-default' onclick='javascript:beforeUpdateReview(" + $(xml).find("review>id").text() + ")'>수정</button>";
			content += 			"<button class='btn btn-default' onclick='javascript:reviewController.deleteReview(" + $(xml).find("review>id").text() + ")'>삭제</button>";
		}
		content += 				"</div>";
		content += 			"<p>" + $(xml).find("review>content").text() + "</p>";
		content += 		"</div>";
		content += 		"<div class='reviewWriterBox'><img src='${ctx}/main/file/download.do?fileName=" + $(xml).find("review>consumer>image").text() + "'></div>"
		content += '</div>';
		return content;
	}
};
</script>


<%@ include file="/views/common/footer.jsp"%>