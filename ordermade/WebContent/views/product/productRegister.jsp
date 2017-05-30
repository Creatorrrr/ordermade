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
<!-- Main Body ========================================================================================== -->
<body>
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>

		<div id="content" class="two_third">

			<h1>상품 등록 페이지</h1>
			<br>
			<form action="${ctx }/product/register.do" method="post"
				name="pRegister" onsubmit="return checkIt()"
				enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>제작 항목 <span>*</span></th>
						<td><select id="type" name="category" class="form-control">
								<c:forEach items="${categorys }" var="category">
									<option value="${category.type }">${category.type }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th>상품명 <span>*</span></th>
						<td><input id="productTitle" name="productTitle"
							class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>상품 이미지</th>
						<td><input id="image" name="image" class="btn btn-success"
							type="file" value="찾아보기"></td>
					<tr>
					<tr>
						<th>금액 <span>*</span></th>
						<td><input id="price" name="price" class="form-control"
							type="text" value=""></td>
					</tr>
					<tr>
						<th>제작 기간</th>
						<td><input id="period" name="period" class="form-control"
							type="text" value=""></td>
					</tr>
					<tr>
						<th>상품 내용 <span>*</span></th>
						<td><textarea id="productContent" name="productContent"
								class="form-control" rows="7" cols="50"></textarea>
					</tr>
				</table>
				<div align="center">
					<input class="btn" type="reset" value="취소하기"
						onclick="javascript:window.location='${ctx }/post/list.do?boardId=${boardId }'">
					<input class="btn btn-success" type="submit" value="등록하기"">
				</div>
			</form>
			<br>

		</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javaScript">
	function checkIt() {

		var pRegister = document.pRegister;

		if (!pRegister.productTitle.value) {
			alert("제목을 입력하세요");
			return false;
		}

		if (!pRegister.productContent.value) {
			alert("내용을 입력하세요");
			return false;
		}
		
		if(!pRegister.price.value){
			alert("금액을 입력하세요");
			return false;
		}
		
		if(!pRegister.period.value){
			alert("기간을 입력하세요");
			return false;
		}
		return true;
	}
</script>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>