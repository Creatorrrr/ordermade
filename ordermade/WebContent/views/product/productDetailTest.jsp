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


</head>
<body>
	<form id="form1" name="form1" onsubmit="return false;">
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
				type="button" id="registReview" value="서밋">
		</div>
	</form>
	<div id="reiewList"></div>

	<script type="text/javascript">
		//html구조가 모두 include된 후 실행
		$(document).ready(function() {

			$("#registReview").click(function() {
				$.ajax({
					url : "${ctx}/product/review/register.do",
					type : "post",
					data : $('#form1').serialize(),
					success : displayComment,
					error : errorCallback
				});
			
		};
				var displayReview = function(resultData) {
					var reviewHtml = "";
					var xmlData = $(resultData).find("product.reviews")
					$(xmlData).each(function() {
										reviewHtml += "<div class='requestBox'>"
										reviewHtml += 	"<table class='request_table'>";
										reviewHtml +=		"<tr>";
										reviewHtml +=			"<td>의뢰명 : </td>";
										reviewHtml +=			"<td>" + $(this).find("request>title").text() + "</td>";
										reviewHtml += 		"</tr>";
										reviewHtml +=		"<tr>";
										reviewHtml +=			"<td>의뢰명 : </td>";
										reviewHtml +=			"<td>" + $(this).find("request>title").text() + "</td>";
										reviewHtml += 		"</tr>";
										reviewHtml +=		"<tr>";
										reviewHtml +=			"<td>의뢰명 : </td>";
										reviewHtml +=			"<td>" + $(this).find("request>title").text() + "</td>";
										reviewHtml += 		"</tr>";
										reviewHtml += 	"</table>";
										reviewHtml += 	"<input name='' type='button' value='참가'>";
										reviewHtml += "</div>";
									});

					$("#reiewList").append(commentHtml);
					$("#content").val("");
				};

				var errorCallback = function() {
					alert("수행중 오류가 발생했습니다.");
				};
		})
	</script>
</body>
</html>
