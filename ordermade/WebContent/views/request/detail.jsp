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
					<div class="imgl borderedbox">
						<img src="${ctx }/views/images/img1.jpg" />
					</div>
					<table class="table" style="color:black">
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
					<table class="table" style="color:black">
						<tr><td><h3>대화 기록<button style="float: right;">파일함</button></h3></td></tr>
						<tr>
							<td>
								<ul id="commentList">
									<c:forEach items="${request.comments }" var="comment">
										<li>
											<p style="display:inline-block">${comment.member.memberType } : ${comment.content }</p>
											<c:if test="${comment.member.id eq sessionScope.loginId}">
												<button>수정</button>
												<button onclick="searchComment.removeComment(${comment.id});">삭제</button>
											</c:if>
										</li>
									</c:forEach>
								</ul>
				            </td>
						</tr>
						<tr><td><h3>추가 요구 사항</h3></td></tr>
						<tr>
							<td>
								<textarea id="commentContent" rows="5" style="width:100%"></textarea>
								<div style="float:right">
									<button id="commentRegister">코멘트 등록</button>
								</div>
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

<script type="text/javascript">
$("#commentRegister").click(function() {
	searchComment.registerComment();
	$("#commentContent").val("");
});

$("#commentRemove").click(function() {
	searchComment.removeComment();
	$("#commentContent").val("");
});

// get portfolios with xml
var searchComment = {
	registerComment : function() {
		$.ajax({
			url : "${ctx }/comment/xml/register.do",
			data : {'request.id' : "${request.id}",
					content : $("#commentContent").val()},
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						searchComment.getCommentsByRequestId("${request.id}", 1);
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
						searchComment.getCommentsByRequestId("${request.id}", 1);
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
							contentStr += "<li>";
							contentStr += "<p style='display:inline-block'>" + $(this).find("comment>member>memberType").text() + " : " + $(this).find("comment>content").text() + "</p>"
							if($(this).find("comment>member>id").text() === "${sessionScope.loginId}") {
								contentStr += "<button class='commentModify'>수정</button>"
								contentStr += "<button onclick='searchComment.removeComment(" + $(this).find("comment>id").text() + ");'>삭제</button>";
							}
							contentStr += "</li>";
						});
						$("#commentList").append(contentStr);
					}
			}
		});
	}
};
</script>

</body>
</html>