<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear">
			<div class="sidebar one_third first">
				<%@ include file="/views/common/myPageNav.jsp"%>
			</div>
			<div id="content" class="two_third">
				<h3>회원 정보 수정</h3>
				<br>
				<form id="registerForm" action="${ctx }/member/modifyMember.do" method="post">
					<table class="table">
						<tr>
							<th><label for="id">ID</label></th>
							<td><input id="id" name="id" class="form-control" type="text"
								value="${member.id }"></td>
						</tr>
						<tr>
							<th><label for="password">비밀번호</label></th>
							<td><input id="password" name="password" class="form-control"
								type="password" value="${member.password }"></td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input id="name" name="name" class="form-control"
								type="text" value="${member.name }"></td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td><input id="email" name="email" class="form-control"
								type="email" value="${member.email }"></td>
						</tr>
						<tr>
							<th><label for="address">주소</label></th>
							<td><input id="address" name="address" class="form-control"
								type="text" value="${member.address }"></td>
						</tr>
						<tr>
							<th><label for="introduce">소개글</label></th>
							<td><textarea rows="10" cols="75" id="introduce"
									name="introduce" class="form-control">${member.introduce }</textarea></td>
						</tr>
						<tr>
							<th><label>고객/사업자</label></th>
							<td>
								<input type="radio" name="memberType" id="memberTypeC" value="C" 
								<c:if test="${member.memberType eq 'C'}">checked="checked"</c:if>>
								<label for="memberTypeC">고객</label>
								<input type="radio" name="memberType" id="memberTypeM" value="M"
								<c:if test="${member.memberType eq 'M'}">checked="checked"</c:if>>
								<label for="memberTypeM">사업자</label>
							</td>
							
						</tr>
						<tr>
							<th><label for="license">사업 번호</label></th>
							<td><input id="licenseNumber" name="licenseNumber"
								class="form-control" type="text" value="${member.licenseNumber }"></td>
						</tr>
						<tr>
							<th><label>이미지 업로드</label></th>
							<td><input id="image" name="image" class="form-control"
								type="file" value="${member.image }"></td>
						</tr>
					</table>
					<br>
					<div align="center">
						<input class="btn" type="reset" value="취소"> <input
							class="btn btn-success" type="submit" value="수정">
					</div>
				</form>
			</div>
		</main>
	</div>
</div>

<%@include file="/views/common/footer.jsp"%>

</body>
</html>