<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />


<h6>마이페이지</h6>
<nav class="sdb_holder">
	<ul>
		<li><a href="${ctx }/member/myPage.do">내 정보수정</a></li>
		<li><a href="${ctx }/request/ui/myPage.do">나의 의뢰서</a></li>
		
			<li><a href="#">나의 프로필</a></li>
			<li><a href="#">받은 의뢰서</a></li>
			<li><a href="#">의뢰서 검색</a></li>
			<li><a href="#">상품 관리</a></li>
			<li><a href="${ctx }/portfolio/ui/mylist.do">포트폴리오 관리 </a></li>
			<li><a href="#">거래 이력 </a></li>
	
		<li><a href="#">구매 이력 </a></li>
		<li><a href="#">참가요청내역 </a></li>
		<li><a onclick="deleteBtn();" class="btn btn-warning">회원탈퇴 </a></li>
	</ul>
</nav>


<script type="text/javascript">

	
	function deleteBtn(){
		var r = confirm("탈퇴하시면 로그인을 할수가 없습니다!");
		if (r == true) {
		   	location.href="${ctx }/member/removeMember.do";
		}
	}

</script>