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
<!-- <script type="text/javascript">
	//html구조가 모두 include된 후 실행

	$(document).ready(function() {

		$("#registReview").click(function() {
			$.ajax({
				url : "${ctx}/product/review/register.do",
				type : "post",
				data : $('#form1').serialize(),
				dataType : "text",
				success : function(data) {
					if (data == "true") {
						displayReview();
					}
				}

			});
		});

		function deleteReview(id) {
			alert("2222");
			$.ajax({
				
				url : "${ctx}/product/review/remove.do?productId=" + id,
				type : "get",
				data : {
					productId : $("#productId").val()
				},
				dataType : "text",
				success : function(data) {
					if (data == "true") {
						alert("삭제되었습니다");
					}
				},
				error : function(xml) {
					console.log("실패 메세지:\n" + xml.responseText);
				}

			});
		};

		function displayReview(productId) {
			$.ajax({
				url : "${ctx}/product/ajax/product/productId.do",
				type : "get",
				data : {
					productId : $("#productId").val()
				},
				dataType : "xml",
				success : function(xml) {
					var xmlData = $(xml).find("product");
					var listLength = xmlData.length;
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += "<div class='requestBox'>";
							contentStr += 	"<table class='request_table'>";
							contentStr +=		"<input id='reviewId' type='hidden' value="+ $(this).find("product>reviews>id").text() +">"
							contentStr += 		"<tr>";
							contentStr += 			"<td>제목 : </td>";
							contentStr += 			 $(this).find("product>reviews>id").text() 
							contentStr += 			"<td>" + $(this).find("product>reviews>title").text() + "</td>";
							contentStr += 		"</tr>";
							contentStr += 		"<tr>";
							contentStr += 			"<td>작성자 : </td>";
							contentStr += 			"<td>" + $(this).find("product>reviews>consumer>id").text() + "</td>";
							contentStr += 		"</tr>";
							contentStr += 		"<tr>";
							contentStr += 			"<td>제작항목 : </td>";
							contentStr += 			"<td>" + $(this).find("product>reviews>content").text() + "</td>";
							contentStr += 		"</tr>";
							contentStr += 	"</table>";
							contentStr += 	"<input name='' type='button' value='수정'>";
							contentStr += 	"<input type='button' value='수정' onclick='deleteReview("+$(this).find("product>reviews>id").text()+")'>";
							contentStr += "</div>";
						});
						$("#reiewList").empty();
						$("#reiewList").append(contentStr);
						$("#title").val("");
					}
				}
			});
		}
	})
</script> -->

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
					dataType : "text",
					success : function(data) {
						if(data=="true"){
							var contentStr = "";
							
								contentStr += "<div class='reviewBox'>";
								contentStr += 	"<table class='reviwe_table'>";
								contentStr += 		"<tr>";
								contentStr += 			"<td>의뢰명 : </td>";
								contentStr += 			"<td>" + $("#title").val() + "</td>";
								contentStr += 		"</tr>";
								contentStr += 		"<tr>";
								contentStr += 			"<td>의뢰자 : </td>";
								contentStr += 			"<td>" + $("#content").val() + "</td>";
								contentStr += 		"</tr>";
								contentStr += 	"</table>";
								/* contentStr += 	'<button class="deleteReview">삭제</button>' */
								contentStr += "<input type='button' id='button1' onclick='javascript:deletReview()' value='삭제' />"
								
								contentStr += "</div>";
							 $("#reiewList").append(contentStr); 
							 $("#title").val("");
							 $("#grade").val("");
							 $("#content").val("");
							 
						}
					}
				});
			});
			
			/* $('reviewBox').on("click",".deleteReview", function(id) { */
				function deletReview() {
				console.log("eeeee");
				$.ajax({
					url:"${ctx}/product/review/remove.do?productId="+id,
					type : "get",
					data : {
						productId : $("#productId").val()
					},
					dataType : "text",
					success : function(data){
						if(data=="true"){
							alert("삭제되었습니다");
						}
					},
					error:function(xml){
						console.log("실패 메세지:\n"+xml.responseText);
					}
					
				});
			}
		});
	</script> 
</body>
</html>

