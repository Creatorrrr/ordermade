<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<!-- bxSlider CSS file -->
<link href="${ctx }/views/css/jquery.bxslider.css" rel="stylesheet" />
<!-- Header ========================================================================================== -->
<head>
<%@ include file="/views/common/head.jsp"%>

	<style type="text/css">
		.commentListStyle li p {
			margin: 5px 0 5px 0;
		}
	</style>
</head>
<title>의뢰서</title>
<!-- Main Body ========================================================================================== -->
<body>
	<div class="wrapper row3">
		<div class="rounded">
			<main class="container clear"> <!-- main body -->
			<div class="sidebar one_third first">
				<%@ include file="/views/common/myPageNav.jsp"%>
			</div>

			<div id="content" class="two_third">
				<div class="content" align="center">
					<h1 align="left">의뢰서</h1>
					<tr>
						<td><button id="btn1">의뢰서 수정</button></td>
						<td><button id="btn2">삭제</button></td>
					</tr>
					<div class="imgl borderedbox">
						<img src="${ctx }/views/images/img1.jpg" />
					</div>
					<table class="table" style="color: black">
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
					<table class="table" style="color: black">
						<tr>
							<td><h3>
									대화 기록
									<button style="float: right;">파일함</button>
								</h3></td>
						</tr>
						<tr>
							<td>
								<ul id="commentList" class="commentListStyle">
									<c:forEach items="${request.comments }" var="comment">
										<li id="commentContent-${comment.id }">
												<p class="commentWriter"><strong>${comment.member.id }</strong></p>
												<p class="commentContent" style="display:inline-block">${comment.content }</p>
											<c:if test="${comment.member.id eq sessionScope.loginId}">
												<button onclick="javascript:commentController.modifyCommentForm(${comment.id});">수정</button>
												<button onclick="javascript:commentController.removeComment(${comment.id});">삭제</button>
											</c:if>
										</li>
									</c:forEach>
								</ul>
				            </td>
						</tr>
						<tr><td><h3>추가 요구 사항</h3></td></tr>
						<tr>
							<td>
								<textarea id="commentRegisterContent" rows="5" style="width:100%"></textarea>
								<div style="float:right">
									<button id="commentRegister">코멘트 등록</button>
								</div>
							</td>
						</tr>
						<tr>
							<td><h3>추가 요구 사항</h3></td>
						</tr>
						<tr>
							<td><textarea id="commentContent" rows="5"
									style="width: 100%"></textarea>
								<div style="float: right">
									<button id="commentRegister">코멘트 등록</button>
								</div></td>
						</tr>
					</table>
					<div>
						<c:choose>
							<c:when test="${sessionScope.memberType eq 'C'}">
								<p align="right">제작기간 : 일</p>
								<p align="right">결제금액 (배송비 포함): ${request.price }원</p> 
								<input type="button" name=""
									onclick="setPurchaseHistory.registerPurchaseHistory();" 
									value="결제" style="float:right">
							</c:when>
							<c:when test="${sessionScope.memberType eq 'M'}">
								<p align="right">
									제작기간 :<input name="" type="text" value=""
										style="display: inline-block">일
								</p>
								<p align="right">
									결제금액 (배송비 포함): <input name="" type="text" value=""
										style="display: inline-block">원
								</p>
								<input type="button" name="" value="등록" style="float: right">
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

	<script type="text/javascript">
$("#commentRegister").click(function() {
	commentController.registerComment();
	$("#commentRegisterContent").val("");
});

$("#paymentButton").click(function(){
	setPurchaseHistory.registerPurchaseHistory();
});

// get comments with xml
var commentController = {
	registerComment : function() {
		$.ajax({
			url : "${ctx }/comment/xml/register.do",
			data : {'request.id' : "${request.id}",
					content : $("#commentRegisterContent").val()},
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						commentController.getCommentsByRequestId("${request.id}", 1);
					}
			}
		});
	},
	
	modifyCommentForm : function(commentId) {
		var comment = $("#commentContent-" + commentId);
		var contentStr = "";
		
		contentStr += "<p class='commentWriter'><strong>" + comment.children(".commentWriter").text() + "</strong></p>"
		contentStr += "<textarea class='commentModifyContent' rows='5' style='width:100%'>" + comment.children(".commentContent").text() + "</textarea>";
		contentStr += "<div style='float:right'>";
		contentStr += 	"<button onclick='javascript:commentController.modifyComment(" + commentId + ")'>코멘트 수정</button>";
		contentStr += 	"<button onclick='javascript:commentController.getCommentsByRequestId(\"${request.id}\", 1)'>취소</button>";
		contentStr += "</div>";

		comment.empty().append(contentStr);
	},
	
	modifyComment : function(commentId) {
		$.ajax({
			url : "${ctx }/comment/xml/modify.do",
			data : {id : commentId,
					'request.id' : "${request.id}",
					content : $("#commentContent-" + commentId + ">.commentModifyContent").val()},
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						commentController.getCommentsByRequestId("${request.id}", 1);
					}
			}
		});
	},
	
	removeComment : function(id) {
		$.ajax({
			url : "${ctx }/comment/xml/remove.do?id=" + id,
			type : "get",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						commentController.getCommentsByRequestId("${request.id}", 1);
					}
			}
		});
	},
	
	getCommentsByRequestId : function(requestId, page) {
		$.ajax({
			url : "${ctx}/comment/xml/searchRequestId.do?requestId=" + requestId + "&page=" + page,
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("comment");
					var listLength = xmlData.length;
					$("#commentList").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += commentController.makeContent(this);
						});
						$("#commentList").append(contentStr);
					}
			}
		});
	},
	
	makeContent : function(xml) {
		var content = "";

		content += "<li id='commentContent-" + $(xml).find("comment>id").text() + "'>";
		content += "<p class='commentWriter'><strong>" + $(xml).find("comment>member>id").text() + "</strong></p>";
		content += "<p class='commentContent' style='display:inline-block'>" + $(xml).find("comment>content").text() + "</p>";
		if($(xml).find("comment>member>id").text() === "${sessionScope.loginId}") {
			content += "<button onclick='javascript:commentController.modifyCommentForm(" + $(xml).find("comment>id").text() + ");'>수정</button>";
			content += "<button onclick='javascript:commentController.removeComment(" + $(xml).find("comment>id").text() + ");'>삭제</button>";
		}
		content += "</li>";
		
		return content;
	}
};

// set purchaseHistory with xml
var setPurchaseHistory = {
		registerPurchaseHistory : function(){
			$.ajax({
				type: "post",
				url: "${ctx }/deal/xml/account/consumerMoney.do",
				data: {"request.id" : "${request.id}",
						"consumer.id" : "${request.consumer.id}",
						"maker.id" : "${request.maker.id}",
						"invoiceNumber":"0",
						"deliveryStatus":"no",
						"payment" : "${sessionScope.memberType}"},
				dataType: "text",
				success: function(text){
							if(text === "true") {
								// 성공시 purchaseHistory UI 페이지 전환
								location.href="${ctx }/deal/ui/transaction.do?page=" + "1";										
							}
				},
				error: function(xml){
					console.log("실패 메시지 : \n" + xml.responseText)
				}
			});
		}
};
</script>

</body>
</html>