<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<br>
<h2>● 제작자 정보</h2>
<nav class="sdb_holder">
	<ul>
		<li><img src="${ctx }/main/file/download.do?fileName=${portfolio.maker.image}" /></li>
		<li><p style="color: #000000">제작자 아이디 &nbsp; :  &nbsp; ${portfolio.maker.id }</p></li>
		<li><p style="color: #000000">제작자 소개  &nbsp; : </p></li>
		<li><p style="color: #000000">${portfolio.maker.introduce }</p></li>
		<li><a href="${ctx }/member/myPage.do?makerId=${portfolio.maker.id }" class="btn btn-info">프로필 바로가기</a></li>
	</ul>
</nav>



