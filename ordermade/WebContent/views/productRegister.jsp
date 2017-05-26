<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="myPageNav.jsp"%>
		</div>

		<div id="content" class="two_third">

			<h1>상품 등록 페이지</h1>
			<br>
			<form action="${ctx }//register.do" method="post" name=""
				onsubmit="return checkIt()">
				<input name="" type="hidden" value="${categoryId }">
				<table class="table">
					<tr>
						<th>제작 항목</th>
						<td><select name="type" id="type" class="form-control">
								<option value="id">가구</option>
								<option value="id">의류</option>
								<option value="id">악세사리</option>
								<option value="id">디지털</option>
								<option value="id">주방</option>
								<option value="id">스포츠</option></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input id="productTitle" name="productTitle"
							class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>상품 이미지</th>
						<td><img alt="" src=""></td>
						<td><input id="" name="" class="btn btn-success"
							type="submit" value="찾아보기"></td>
					<tr>
					<tr>
						<th>상품 내용</th>
						<td><textarea id="productContent" name="productContent"
								class="form-control" rows="7"></textarea>
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



<div class="wrapper row5">
	<div id="copyright" class="clear">
		<p class="fl_left">
			Copyright &copy; 2014 - All Rights Reserved - <a href="#">Domain
				Name</a>
		</p>
		<p class="fl_right">
			Template by <a target="_blank" href="http://www.os-templates.com/"
				title="Free Website Templates">OS Templates</a>
		</p>
	</div>
</div>

<script type="text/javaScript">
	function checkIt() {

		var pregister = document.pregister;

		if (!pregister.productTitle.value) {
			alert("제목을 입력하세요");
			return false;
		}

		if (!pregister.productContent.value) {
			alert("내용을 입력하세요");
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