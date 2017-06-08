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
.reviewBox {
	overflow:hidden;
	height: auto;
}
.reviewContentBox {
	height: 70px;
	width: 80%;
	display: inline-block;
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
h3 {
	font-size: 20px;
	font-weight: 400;
}
p {
	color:black;
}
</style>

<div class="wrapper row3">
	<div class="rounded">
		<!-- 본문 시작 -->
		<div id="contents" class="two_third first">
			<!-- 상품 제목 -->
			<h1 class="productTitle">${product.title }</h1>
			<!-- 수정 삭제 메뉴 -->
			<c:if test="${sessionScope.loginId ne null}">
				<c:if test="${product.maker.id eq sessionScope.loginId}">
					<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
					<div class="productControlBox">
						<input class="btn btn-warning" type="button" value="삭제"
							onclick="javascript:deleteProduct(${product.id})">
						<input class="btn btn-warning" type="button" value="수정"
							onclick="location.href='${ctx}/product/ui/modify.do?id=${product.id}';">
					</div>
				</c:if>
			</c:if>
			<!-- 상품 설명 시작 -->
			<div class="productDetailBox">
				<h2>상품 상세</h2>
				<!-- 상품 이미지  -->
				<div class="productImageBox" align="center">
					<img src="${ctx }/product/image.do?img=${product.image}" />
				</div>
				<!-- 상품 설명 -->
				<p class="productContentBox">${product.content}</p>
			</div>
			<!-- 상품 설명 종료 -->

			<!-- 후기 시작 -->
			<div class="reviewListBox">
				<h2>상품 후기</h2>
				<!-- 후기 목록 시작 -->
				<div id="reviewList">
					<%-- <c:forEach items="${product.reviews }" var="review">
						<form id="upDown${review.id }" onsubmit="return false;">
							<input type="hidden" id="productId" name="product.id" value="${product.id }"> 
							<input type="hidden" id="id" name="id" value="${review.id }">
							<input type="hidden" id="title" name="title" value="${review.title }">
							<input type="hidden" id="content" name="content" value="${review.content }">
							<input type="hidden" id="grade" name="grade" value="${review.grade }">
							<table class="table" style="font-size: 13px; padding: 20px;">
								<tr>
									<td>작성자 : "form${review.id }"</td>
									<td>${review.consumer.id }</td>
								</tr>
								<tr>
									<td>제목 : ${review.id }</td>
									<td>${review.title }</td>
								</tr>
								<tr>
									<td>내용 :</td>
									<td>${review.content }</td>
								</tr>

							</table>
							<c:if test="${sessionScope.loginId eq review.consumer.id }">
								<input type="button" value="수정"
									onclick="javascript:beforeUpdateReview(${review.id})">
								<input type="button" value="삭제"
									onclick="javascript:deleteReview(${review.id})">
							</c:if>
							<c:if test="${sessionScope.loginId ne review.consumer.id }">
								<input type="button" value="따봉"
									onclick="javascript:upGrade(${review.id})">
								<input type="button" value="우우" onclick="javascript:downGrade()">
							</c:if>
						</form>
					</c:forEach> --%>
				</div>
				<!-- 후기 목록 종료 -->
				
				<div>
					<button class="reviewAllListBtn" onclick="javascript:Reviews(${product.id})">전체 댓글</button>
					<button class="reviewMyListBtn" onclick="javascript:myReview(1,${product.id})">내가 작성한 댓글</button>
				</div>

				
				<form id="form2" onsubmit="return false;">
					<input type="hidden" id="productId" name="product.id"
						value="${product.id }">
					<div class="one_third first">
						<label for="title">제목 <span>*</span></label> <input type="text"
							id="title" name="title" value="" size="22">
					</div>

					<div class="one_third">
						<label for="grade">평점<span>*</span></label> <input type="text"
							id="grade" name="grade" value="" size="22">
					</div>

					<div class="block clear">
						<label for="content">후기</label>
						<textarea id="content" name="content" placeholder="댓글쓰기" cols="55"
							rows="7"></textarea>
					</div>
					<div>
						<input type="button" onclick="javascript:reviewRegister()"
							value="Submit"> <input name="reset" type="reset"
							value="Reset">
					</div>
				</form>
			</div>
		</div>
		<!-- 본문 종료 -->
		<div class="sidebar one_third" style="float:right">
			<h6>제작자 정보</h6>
			<nav class="sdb_holder">
				<ul>
					<li><p>가격정보 : ${product.price }원</p></li>
					<li><p>작업기간 : ${product.period }일</p></li>
					<li><img
						src="${ctx }/member/image.do?img=${product.maker.image}" /></li>
					<li><p>제작자 아이디 : ${product.maker.id }</p></li>
					<li><p>제작자 소개 : ${product.maker.introduce }</p></li>
					<li><p></p></li>
					<li><a
						href="${ctx }/member/myPage.do?makerId=${product.maker.id }">프로필
							바로가기</a></li>
				</ul>
			</nav>
		</div>
		<!-- / main body -->
		<div class="clear"></div>
	</div>
</div>



<script type="text/javascript">
$(document).ready(function() {
	reviewController.getReviewsByProductId("${product.id}", 1);
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
 function deleteReview(data) {
	$.ajax({
		url:"${ctx}/product/review/remove.do?id="+data,
		type:"get",
		success :function(data) {
			if(data=="true"){
				javascript:Reviews(${product.id});
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
	getReviewsByProductId : function(productId, page) {
		$.ajax({
			url : "${ctx}/product/ajax/reviews/productid.do?productId=" + productId + "&page=" + page,
			type : "get",
			dataType : "xml",
			success : function(xml) {console.log("asdf");
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
		content += 			"<h3>" + $(xml).find("review>title").text() + "</h3>";
		if($(xml).find("review>consumer>id").text() === "${sessionScope.loginId}") {
			content += "<div class='reviewControlBox'>";
			content += 		"<p>작성자 : " + $(xml).find("review>consumer>id").text() + "</p>";
			content += 		"<button value='수정' onclick='javascript:beforeUpdateReview(" + $(xml).find("review>id").text() + ")'>수정</button>";
			content += 		"<button value='삭제' onclick='javascript:deleteReview(" + $(xml).find("review>id").text() + ")'>삭제</button>";
			content += "</div>";
		}
		content += 			"<p>" + $(xml).find("review>content").text() + "</p>";
		content += 		"</div>";
		content += 		"<div class='reviewWriterBox'><img src='${ctx}/main/file/download.do?fileName=" + $(xml).find("review>consumer>image").text() + "'></div>"
		content += '</div>';
		return content;
	}
};
</script>


<%@ include file="/views/common/footer.jsp"%>