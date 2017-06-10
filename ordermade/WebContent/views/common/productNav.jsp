<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<h2>제작자 정보</h2>
<nav class="sdb_holder">
	<ul>
		<li><img src="${ctx }/main/file/download.do?fileName=${product.maker.image}" /></li>
		<li><p>제작자 아이디 : ${product.maker.id }</p></li>
		<li><p>제작자 소개 : </p></li>
		<li><p>${product.maker.introduce }</p></li>
		<li><p>가격정보 :${product.price }원</p></li>
		<li><p>작업기간 :${product.period } 일</p></li>
		<br>
		<li><a href="${ctx }/member/myPage.do?makerId=${product.maker.id }" class="btn btn-info">프로필 바로가기</a></li>
		<li><button class="btn btn-danger btn-lg" style="width:100%" onclick="javascript:location.href='${ctx}/request/ui/register.do?productTitle=${product.title}&makerId=${product.maker.id }&category=${product.category }'">주문하러 가기</button></li>
	</ul>
</nav>



