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
<title>My Page</title>
<!-- Main Body ========================================================================================== -->
<body>
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>

		<div id="content" class="two_third">
			<ul class="nospace listing">
				<li class="clear">
					<h1>${member.id}님의 정보</h1>
					
					<div class="content" align="left">
						<div class="imgl borderedbox">
							<img src="${ctx }/main/file/download.do?fileName=${member.image}">
						</div>
						<table class="table">
							<tr class="nospace btmspace-15">
							<tr>
								<td>아이디 : ${member.id}</td>
							</tr>
							<tr>
								<td>이메일 : ${member.email }</td>
							</tr>
							<tr>
								<td>주소 : ${member.address }</td>
							</tr>
							<tr>
								<td>회원 종류 : ${member.memberType }</td>
							</tr>
						</table>
					</div>
				</li>
			</ul>
		</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

</body>
</html>