<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>회원가입</h3>

	<br>
	<form id="registerForm" action="${ctx }/member/join"
		method="post">
		<table class="table">
			<tr>
				<th><label for="id">ID</label></th>
				<td><input id="id" name="id" class="form-control" type="text"
					value="" placeholder="ID를 입력해주세요."></td>
			</tr>
			<tr>
				<th><label for="password">비밀번호</label></th>
				<td><input id="password" name="password" class="form-control"
					type="password" value="" placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<th><label for="password2">비밀번호 확인</label></th>
				<td><input id="password2" name="password2" class="form-control"
					type="password" value="" placeholder="비밀번호 확인을 입력해주세요."></td>
			</tr>
			<tr>
				<th><label for="name">이름</label></th>
				<td><input id="name" name="name" class="form-control"
					type="text" value="" placeholder="이름을 입력해주세요."></td>
			</tr>
			<tr>
				<th><label for="email">이메일</label></th>
				<td><input id="email" name="email" class="form-control"
					type="email" value="" placeholder="이메일을 입력해주세요."></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<input class="btn" type="reset" value="취소"> <input
				class="btn btn-success" type="submit" value="회원가입">
		</div>
	</form>


</body>
</html>