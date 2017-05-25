<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>회원가입</h3>

	<br>
	<form id="registerForm" action="${ctx }/member/join.do" method="post">
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
			<!-- <tr>
				<th><label for="password2">비밀번호 확인</label></th>
				<td><input id="password2" name="password2" class="form-control"
					type="password" value="" placeholder="비밀번호 확인을 입력해주세요."></td>
			</tr> -->
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
			<tr>
				<th><label for="address">주소</label></th>
				<td><input id="address" name="address" class="form-control"
					type="text" value="" placeholder="주소를 입력해주세요."></td>
			</tr>
			<tr>
				<th><label for="introduce">소개글</label></th>
				<td><textarea rows="10" cols="75" id="introduce"
						name="introduce" class="form-control" placeholder="소개"></textarea></td>
			</tr>
			<tr>
				<th><label>고객/사업자</label></th>
				<td><input type="radio" name="memberType" value="customer"
					checked="checked">고객</input> <input type="radio" name="memberType"
					value="buisnessman">사업자</input></td>
			</tr>
			<tr>
				<th><label for="license">사업 번호</label></th>
				<td><input id="licenseNumber" name="licenseNumber"
					class="form-control" type="text" value=""
					placeholder="사업번호을 입력해주세요."></td>
			</tr>
			<tr>
				<th><label>이미지 업로드</label></th>
				<td><input id="image" name="image" class="form-control"
					type="file" value="" placeholder="사진을 등록 하세요."></td>
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