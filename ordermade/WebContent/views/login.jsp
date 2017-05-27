<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="common/head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear">
		<h1>로그인</h1>
		<form action="${ctx }/member/login.do" method="post">
			<table class="table">
				<tr>
					<th>ID</th>
					<td><input id="loginId" name="id" class="form-control"
						type="text" value="" placeholder="ID를 입력해주세요."></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input id="password" name="password" class="form-control"
						type="password" value="" placeholder="비밀번호를 입력해주세요."></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<input class="btn" type="reset" value="취소"> <input
					class="btn btn-success" type="submit" value="로그인">
			</div>
		</form>
		</main>
	</div>
</div>
</body>
</html>