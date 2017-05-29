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
			<h1>포트폴리오 등록 페이지</h1>
			<br>
			<form action="${ctx }/portfolio/xml/register.do" method="post"
				name="pRegister" onsubmit="return checkIt()">
				<input name="portfolioId" type="hidden" value="${portfolioId }">
				<table class="table">
					<tr>
						<th>제작 항목 <span>*</span></th>
						<td><select name="type" id="type" class="form-control">
								<option value="id">가구</option>
								<option value="id">의류</option>
								<option value="id">악세사리</option>
								<option value="id">디지털</option>
								<option value="id">주방</option>
								<option value="id">스포츠</option></td>
					</tr>
					<tr>
						<th>포트폴리오 명 <span>*</span></th>
						<td><input id="portfolioTitle" name="portfolioTitle"
							class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>표지 이미지</th>
						<td><input id="portfolioImg" name="portfolioImg"
							class="btn btn-success" type="file" value="찾아보기"></td>
					<tr>
					<tr>
						<th>포트폴리오 내용 <span>*</span></th>
						<td><textarea id="portfolioContent" name="portfolioContent"
								class="form-control" cols="35" rows="10"></textarea></td>
					</tr>
				</table>
				<div>
					<input name="submit" type="submit" value="등록"> &nbsp; <input
						name="reset" type="reset" value="취소">
				</div>
			</form>
			<br>

			<script type="text/javaScript">
				function checkIt() {

					var pRegister = document.pRegister;

					if (!pRegister.portfolioTitle.value) {
						alert("제목을 입력하세요");
						return false;
					}

					if (!pRegister.portfolioContent.value) {
						alert("내용을 입력하세요");
						return false;
					}
					return true;
				}
			</script>

		</div>
		</main>
	</div>
</div>



<%@ include file="/views/common/footer.jsp"%>


<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>