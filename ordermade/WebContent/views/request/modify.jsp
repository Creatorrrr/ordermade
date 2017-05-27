<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>
		<div id="content" class="two_third">
			<h1>의뢰서 등록 페이지</h1>
			<br>
			<form action="${ctx }/request/xml/modify.do" method="post" name=""
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
						<th>의뢰 제목</th>
						<td>
							<input id="requestTitle" name="productTitle"
							class="form-control" type="text" value="${request.title }">
						</td>
					<tr>
					<tr>
						<th>의뢰 상세 내용</th>
						<td>
							<textarea id="requestContent" name="productContent"
								class="form-control" rows="7">
								${request.content }
							</textarea>
						</td>
					</tr>
					<tr>
						<th>참고 이미지</th>
						<td><input id="" name="" class="btn btn-success" type="file"
							value="찾아보기"></td>
					<tr>
					<tr>
						<th>희망 금액</th>
						<td><input id="" name="" class="" type="text" value=""></td>
					</tr>

				</table>
				<div align="center">
					<input class="btn" type="reset" value="취소하기"
						onclick="javascript:window.location='${ctx }/post/list.do?boardId=${boardId }'">
					<input class="btn btn-success" type="submit" value="수정"">
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

		var pregister = document.pregister;

		if (!pregister.requestTitle.value) {
			alert("제목을 입력하세요");
			return false;
		}
		if (!pregister.requestContent.value) {
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