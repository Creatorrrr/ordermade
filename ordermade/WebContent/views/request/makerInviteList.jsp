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
			<h1>참가요청내역</h1>
			<div class="">
				<table>
					<tr>
						<td>번호</td>
						<td>소비자</td>
						<td>메시지</td>
						<td>요청시간</td>
						<td>참가요청</td>
					</tr>

					<%-- <c:forEach items="${ }" var=""> --%>
					<tr>
						<td><p>1</p></td>
						<td><p>1</p></td>
						<td><p>1</p></td>
						<td><p>1</p></td>
						<td><input type="button" value="수락"><input
							type="button" value="거절"></td>
					</tr>
					<%-- </c:forEach> --%>

				</table>
			</div>
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