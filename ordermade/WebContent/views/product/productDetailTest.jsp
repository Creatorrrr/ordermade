<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 정보</title>

<%@ include file="/views/common/common.jsp"%>

<script type="text/javascript">
	var registContents = function() {
		$.ajax({
			url : "${ctx}/product/review/register.do",
			type : "post",
			data : {
				title : $("#title").val(),
				grade : $("#grade").val(),
				content : $("#content").val(),
				product : $("#productId").val()
			},
			success : displayComment,
			error : errorCallback
		});
	}
	var displayComment = function(resultData) {
		var commentHtml = "";
		$
				.each(
						resultData.comments,
						function(index, comment) {
							alert("수행중 성공가 발생했습니다.");
							commentHtml += '<table class="table" style="font-size:13px; padding:20px;">';
							commentHtml += '<tr>';
							commentHtml += '<td><strong>' + comment.authorName
									+ '</strong></td>';
							commentHtml += '<td class="text-right">'
									+ comment.regDate;
							commentHtml += '<a class="glyphicon glyphicon-trash" href="javascript:removeComment('
									+ comment.commentId + ');"></a>';
							commentHtml += '</td></tr>';
							commentHtml += '<tr><td colspan="2">';
							commentHtml += '<p class="txt">' + comment.comment
									+ '</p>';
							commentHtml += '</td></tr></table>';
						});
		$("#commenArea").empty();
		$("#commenArea").append(commentHtml);
		$("#comment").val("");
	};

	var errorCallback = function() {
		alert("수행중 오류가 발생했습니다.");
	}
</script>
</head>
<body>
	<form onsubmit="registContents(); return false;">
		${product.id } <input type="hidden" id="productId" name="product.id"
			value="${product.id }">
		<div>
			<label for="title">제목 <span>*</span></label> <input type="text"
				id="title" name="title" value="" size="22">
		</div>
		<div>
			<label for="grade">평점 <span>*</span></label> <input type="text"
				id="grade" name="grade" value="" size="22">
		</div>
		<div>
			<label for="content">후기 <span>*</span></label>
			<textarea id="content" name="content" placeholder="댓글쓰기" cols="25"
				rows="10"></textarea>
		</div>
		<div>
			<input name="reset" type="reset" value="Reset"> <input
				type="submit" value="서밋">
		</div>
	</form>
	<div>
		<c:forEach items="">




		</c:forEach>
	</div>
</body>
</html>
