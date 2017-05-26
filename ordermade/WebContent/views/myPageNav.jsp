<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />


<h6>마이페이지</h6>
<nav class="sdb_holder">
	<ul>
		<li><a href="#">내 정보수정</a></li>
		<li><a href="#">나의 의뢰서</a></li>
		<c:if test="${sessionScope.loginId ne null && # ne null}">
			<li><a href="#">나의 프로필</a></li>
			<li><a href="#">받은 의뢰서</a></li>
			<li><a href="#">의뢰서 검색</a></li>
			<li><a href="#">상품 관리</a></li>
			<li><a href="#">포트폴리오 관리 </a></li>
			<li><a href="#">거래 이력 </a></li>
		</c:if>
		<li><a href="#">구매 이력 </a></li>
		<li><a href="#">참가요청내역 </a></li>
		<li><a href="#">회원탈퇴 </a></li>
	</ul>
</nav>

