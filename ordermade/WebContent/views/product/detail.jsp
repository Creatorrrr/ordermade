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
			<div class="sdb_holder">
				<h1>상품페이지-${product.title }</h1>

				<c:if test="${sessionScope.loginId ne null}">
					<c:if test="${product.maker.id eq sessionScope.loginId}">
						<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
						<div align="center">
							<%-- <input class="btn btn-warning" type="button" value="삭제"
								onclick="javascript:window.location='${ctx }/product/delete.do?productId=${product.id}'"> --%>
							<input class="btn btn-warning" type="button" value="삭제"
								onclick="javascript:deleteProduct(${product.id})"> <input
								class="btn btn-warning" type="button" value="수정"
								onclick="location.href='${ctx}/product/ui/modify.do?id=${product.id}';">
						</div>
					</c:if>
				</c:if>
				<br>
				<!-- <img class="imgr borderedbox"
				src="images/demo/slider/pp.jpg" alt=""> -->
				<p>Aliquatjusto quisque nam consequat doloreet vest orna partur
					scetur portortis nam. Metadipiscing eget facilis elit sagittis
					felisi eger id justo maurisus convallicitur.</p>
			</div>
			<br>
			<%-- <c:forEach items="${ box_list }" var="literature"> --%>
			<div align="center">
				<img src="${ctx }/product/image.do?img=${product.image}" />
			</div>
			<br>
			<%--  </c:forEach>--%>

			<!-- 확인</main>  -->

			<p>${product.content }</p>

			<div class="scrollable">
				<table>
				</table>
			</div>

			<div id="reviews">
				<h2>상품 후기</h2>
				<form class="clear">
					<div>
						<input type="button" onclick="javascript:Reviews(${product.id})"
							value="전체 댓글"> <input type="button"
							onclick="javascript:myReview(1,${product.id})" value="내가 작성한 댓글">
						<fieldset>
							<select name="type" id="type" class="form-control">
								<option value="id">아이디</option>
								<option value="title">제목</option>
							</select> <input id="searchBar" name="searchBar" class="search-box-input"
								type="text" value="" placeholder="Search Here" /> <input
								type="button" onclick="javascript:TCReview()" value="검색">
						</fieldset>
					</div>
				</form>

				<ul>
					<li>
						<article>
							<header>
								<%--        <c:forEach items="${reviews }" var="review"> --%>
								<figure class="avatar">
									<img src="${ctx }/views/images/img-10.jpg">
								</figure>
								<div class=reviewCotent>
									<p>제목 : ${review.title }testReviewTitle</p>
								</div>
								<div class="comcont">
									<p>This is an example of a comment made on a post. You can
										either edit the comment, delete the comment or reply to the
										comment. Use this as a place to respond to the post or to
										share what you are thinking.</p>
								</div>

								<div class="one_half first">아이디 :${review.consumer.id }</div>
								<div class="one_half">평점 :${review.grade }</div>
								<!-- <time datetime="2045-04-06T08:15+00:00">
									Friday, 6<sup>th</sup> April 2045 @08:15:00
								</time> -->
								<%--	</c:forEach> --%>
							</header>
						</article>
					</li>
				</ul>



				<div id="reiewList">
					<c:forEach items="${product.reviews }" var="review">
						<form id="upDown${review.id }" onsubmit="return false;">
							<input type="hidden" id="productId" name="product.id"
								value="${product.id }"> <input type="hidden" id="id"
								name="id" value="${review.id }"> <input type="hidden"
								id="title" name="title" value="${review.title }"> <input
								type="hidden" id="content" name="content"
								value="${review.content }"> <input type="hidden"
								id="grade" name="grade" value="${review.grade }"> <input
								type="hidden" id="userId" name="consumer.id"
								value="${review.consumer.id }">
							<table class="table" style="font-size: 13px; padding: 20px;">
								<tr>
									<td>작성자 :</td>
									<td>${review.consumer.id }</td>
								</tr>
								<tr>
									<td>제목 :</td>
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
							<c:if test="${sessionScope.loginId ne null }">
								<c:if test="${sessionScope.loginId ne review.consumer.id }">
									<input type="button" value="따봉"
										onclick="javascript:upGrade(${review.id})">
									<input type="button" value="우우"
										onclick="javascript:downGrade(${review.id})">
								</c:if>
							</c:if>
						</form>
					</c:forEach>
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
							rows="7" onclick="javascript:login()"></textarea>
					</div>
					<div>
						<input type="button" onclick="javascript:reviewRegister()"
							value="Submit"> <input name="reset" type="reset"
							value="Reset">
					</div>
				</form>
			</div>
		</div>
		<div class="sidebar one_third">
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

/* if(${sessionScope.loginId} == null){ */
function login(){
	console.log(${sessionScope.loginId})
	console.log(111111111111)
	/* location.href="${ctx}/member/login.do" */
}
/* } */

function upGrade(reviewId) {
	var reviewid = reviewId;
	var up = 1;
	$.ajax({
		url : "${ctx}/product/review/modify.do?updown="+up,
		type : "post", 
		data : $('#upDown'+reviewid).serialize(),
		dataType : "text",
		success : function(check) {
			console.log(check)
			if(check=="true"){
				javascript:Reviews(${product.id})
			}
		}
	});
}
function downGrade(reviewId) {
	var reviewid = reviewId;
	var down = -1;
	$.ajax({
		url : "${ctx}/product/review/modify.do?updown="+down,
		type : "post", 
		data : $('#upDown'+reviewid).serialize(),
		dataType : "text",
		success : function(check) {
			console.log(check)
			if(check=="true"){
				javascript:Reviews(${product.id})
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
			
		console.log(data);
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
				if(userId != null){
				if(userId!=$(">consumer>id",this).text()){
					html += "<input type='button' value='따봉' onclick='javascript:upGrade()'>";
					html += "<input type='button' value='우우' onclick='javascript:downGrade()'>";
				}
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
		
	 	html += '<form id=upDown'+$(">id",this).text()+' onsubmit="return false";>'; 
		html +=		'<input type="hidden" id="productId" name="product.id" value="'+${product.id}+'">'; 
		html +=		"<input type='hidden' id='id' name='id' value="+$(">id",this).text()+">";
		html +=		"<input type='hidden' id='title' name='title' value="+$(">title",this).text()+">";
		html +=		"<input type='hidden' id='content' name='content' value="+$(">content",this).text()+">";
		html +=		"<input type='hidden' id='grade' name='grade' value="+$(">grade",this).text()+">";
		html +=		"<input type='hidden' id='userId' name='consumer.id' value="+$(">consumer>id",this).text()+">";
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
		if(userId != null){
		if(userId===$(">consumer>id",this).text()){
			html += "<input type='button' value='수정' onclick='javascript:beforeUpdateReview("+$(">id",this).text()+")'>";
			html += "<input type='button' value='삭제' onclick='javascript:deleteReview("+$(">id",this).text()+")'>";
		}
		}
		if(userId!=$(">consumer>id",this).text()){
			html += "<input type='button' value='따봉' onclick='javascript:upGrade("+$(">id",this).text()+")'>";
			html += "<input type='button' value='우우' onclick='javascript:downGrade("+$(">id",this).text()+")'>";
		}
		 html += '</form>' 
	});
	$("#reiewList").empty();
	$("#reiewList").append(html);
	$("#title").val("");
	$("#grade").val("");
	$("#content").val("");
}
</script>


<%@ include file="/views/common/footer.jsp"%>