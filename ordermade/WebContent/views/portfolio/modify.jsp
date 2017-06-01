<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<!-- Header ========================================================================================== -->
<head>
<%@ include file="/views/common/head.jsp"%>
</head>
<title>포트폴리오 수정 페이지</title>
<!-- Main Body ========================================================================================== -->
<body>
	<div class="wrapper row3">
		<div class="rounded">
			<main class="container clear"> <!-- main body -->
			<div class="sidebar one_third first">
				<%@ include file="/views/common/myPageNav.jsp"%>
			</div>

			<div id="content" class="two_third">
				<h1>포트폴리오 수정 페이지</h1>
				<br>
				<form action="${ctx }/portfolio/xml/modify.do?id=${portfolio.id}"
					method="post" name="pModify" onsubmit="return checkIt()">
			 	<input name="portfolio" type="hidden" value="${portfolio.id}">
					<table class="table">
						<tr>
							<th>제작 항목 <span>*</span></th>
							<td><div id="category"></td>
						</tr>
						<tr>
							<th id="title">포트폴리오 명 <span>*</span></th>
							<td><input id="title" name="title" class="form-control"
								type="text" value="${portfolio.title }"></td>
						<tr>
						<tr>
							<th id="image">표지 이미지</th>
							<td><input id="image" name="image" class="btn btn-success"
								type="file" value="${portfolio.image }"></td>
						<tr>
						<tr>
							<th id="content">포트폴리오 내용 <span>*</span></th>
							<td><textarea id="content" name="content"
									class="form-control" cols="50" rows="10">${portfolio.content }</textarea></td>
						</tr>
					</table>
					<div>
						<input class="btn btn-success" type="submit" value="등록">
						&nbsp; <input type="reset" value="취소">
					</div>
				</form>
				<br>
			</div>
			</main>
		</div>
	</div>

	<%@ include file="/views/common/footer.jsp"%>

	<script type="text/javaScript">
		$(document)
				.ready(
						function() {

							$
									.ajax({
										url : "${ctx}/main/xml/categoryList.do",
										type : "post",
										dataType : "xml",
										success : function(xml) {
											var categoryId = "${categoryId}";
											var rs = '<select name="category" id="category" class="form-control">';
											var list = $(xml).find(
													"category > type");
											console.log(list.size());
											list
													.each(function() {
														rs += '<option value"'
																+ $(this)
																		.text()
																+ '""';
														if (categoryId == $(
																this).text()) {
															rs += 'selected="selected"';
														}
														rs += '>'
																+ $(this)
																		.text()
																+ '</option>';
													});
											rs += '</select>';
											$("#category").html(rs);
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
							/*  $("#registBtn").click(function(){
								console.log("----testing here-------");
								if(checkIt()){
									$.ajax({
										// 보낼 때
										url : "${ctx }/portfolio/xml/modify.do",
										type : "post",
										data : $('#pRegister').serialize(),
										// 받을 때 
										dataType : "text",
										success : function(data) {
											if(data == "true"){
												location.href="/portfolio/detail"; // 성공시 페이지 전환
											}
										},
										error: function(xml){
											console.log("실패 메시지 :\n"+xml.responseText);
										}
									});
								}
							});  */

							//유효성 검사
							function checkIt() {

								var pModify = document.pModify;

								if (!pModify.title.value) {
									alert("제목을 입력하세요");
									return false;
								}

								if (!pModify.content.value) {
									alert("내용을 입력하세요");
									return false;
								}
								return true;
							}

						});
	</script>

	<!-- JAVASCRIPTS -->
	<script src="../layout/scripts/jquery.min.js"></script>
	<script src="../layout/scripts/jquery.fitvids.min.js"></script>
	<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>