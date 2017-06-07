<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>상품 수정페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }



				<h1>상품 수정페이지</h1>
				<br>
				<form action="${ctx }/product/xml/modify.do" method="post"
					id="productModify" enctype="multipart/form-data"
					name="productModify" onsubmit="return checkIt()">
					<table class="table">
						<tr>

							<th>제작 항목 <span>*</span></th>
							<td><div id="category"></div></td>
						</tr>
						<tr>
							<th>상품명 <span>*</span></th>
							<td><input id="productTitle" name="productTitle"
								class="form-control" type="text" value="${product.title }"></td>
						<tr>
						<tr>
							<th>상품 이미지</th>
							<td><input id="image" name="image" class="btn btn-success"
								type="file" value="${product.image }"></td>
						<tr>
						<tr>
							<th>금액 <span>*</span></th>
							<td><input id="price" name="price" class="form-control"
								type="text" value="${product.price }"></td>
						</tr>
						<tr>
							<th>제작 기간</th>
							<td><input id="period" name="period" class="form-control"
								type="text" value="${product.period }"></td>
						</tr>
						<tr>
							<th>상품 내용 <span>*</span></th>
							<td><textarea id="productContent" name="productContent"
									class="form-control" rows="7" cols="50">${product.content }</textarea>
						</tr>
					</table>
					<div align="center">
						<input type="hidden" name="hit" value="${product.hit }"> 
						<input type="hidden" name="id" value="${product.id }">
						<input class="btn btn-default" type="reset" value="취소하기" onclick="javascript:window.location='${ctx }/post/list.do?boardId=${boardId }'">
						<input id="modifyBtn" class="btn btn-success" type="button" value="수정하기">
					</div>
				</form>
				<br>



	<script type="text/javaScript">
		$(document)
				.ready(
						function() {

							// DB에서 카테고리 리스트 불러오기
							$
									.ajax({
										url : "${ctx}/main/xml/categoryList.do",
										type : "post",
										dataType : "xml",
										success : function(xml) {
											var categoryId = "${product.category}";
											
											{
												var categoryId = "${product.category}";
												
												var rs = '<select name="category" id="category" class="form-control">';
												var list = $(xml).find("category > type");
												
												list.each(function() {
															rs += '<option value="'+ $(this).text()+ '"'
															
															if (categoryId == $(this).text()) {
																rs += 'selected="selected"';
															}
															rs += '>'+ $(this).text()
													+ '</option>';
														});
												rs += '</select>';
												$("#category").html(rs);
											}
										},
										error : function(xml) {
											$("#category")
													.html(
															'<select name="category" id="category" class="form-control">'
																	+ '<option value="가구" selected="selected">가구</option>'
																	+ '<option value="의류">의류</option>'
																	+ '<option value="악세사리">악세사리</option>'
																	+ '<option value="디지털">디지털</option>'
																	+ '<option value="주방">주방</option>'
																	+ '<option value="스포츠">스포츠</optioin>'
																	+ '</select>');
										}
									});

		// 등록버튼 구현
		$("#modifyBtn").click(
				function() {
					var data = new FormData( $('#productModify')[0] );
					if (checkIt()) {
						$.ajax({
							// 보낼 때
							type : "post",
							enctype : 'multipart/form-data',
							url : "${ctx}/product/xml/modify.do",
							data : data,
							processData : false,
							contentType : false,
							cache : false,
							// 받을 때 
							dataType : "text",
							success : function(resultData) {
								if (resultData == "true") {
									location.href = "${ctx}/product/ui/myProducts.do"
								}
							},
							error : function(xml) {
								console.log("실패 메시지 :\n"+ xml.responseText);
							}
						});
					}
				});

			//필수 입력값 체크
			function checkIt() {

				var pModify = document.productModify;

				if (!pModify.productTitle.value) {
					alert("상품명을 입력하세요");
					return false;
				}

				if (!pModify.productContent.value) {
					alert("내용을 입력하세요");
					return false;
				}

				if (!pModify.price.value) {
					alert("금액을 입력하세요");
					return false;
				}

				if (!pModify.period.value) {
					alert("기간을 입력하세요");
					return false;
				}
				return true;
			}
		});
	</script>

${box3 }

<%@ include file="/views/common/footer.jsp"%>