<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />


<h6>마이페이지</h6>
<nav class="sdb_holder">
	<ul>
		<c:choose>
			<c:when test="${sessionScope.loginId ne null }">
				<li><a href="${ctx}/member/myPage.do">나의 프로필</a></li>
				<li><a href="${ctx}/member/modify.do">내 정보수정</a></li>
				<c:choose>
					<c:when test="${sessionScope.memberType eq 'C'}">
						<li><a href="${ctx }/request/ui/myRequest.do">나의 의뢰서</a></li>
						<li><a href="${ctx }/deal/ui/transaction.do">구매 이력 </a></li>
						<li><a href="${ctx }/request/ui/consumerInviteList.do?page=1">참가요청내역 </a></li>
					</c:when>
					<c:when test="${sessionScope.memberType eq 'M'}">
						<li><a href="${ctx }/request/ui/search.do">의뢰서 검색</a></li>
						<li><a href="${ctx }/request/ui/myRequest.do">받은 의뢰서</a></li>
						<li><a href="${ctx }/product/ui/myProducts.do?page=1">상품 관리</a></li>
						<li><a href="${ctx }/portfolio/ui/mylist.do">포트폴리오 관리 </a></li>
						<li><a href="${ctx }/deal/ui/transaction.do">거래 이력 </a></li>
						<li><a href="${ctx }/request/ui/makerInviteList.do?page=1">참가요청내역 </a></li>
					</c:when>
				</c:choose>
				<li><a onclick="deleteBtn();">회원탈퇴 </a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${ctx }/main/main.do">메인으로</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>


<script type="text/javascript">
	function deleteBtn(){
		var r = confirm("탈퇴하시면 로그인을 할수가 없습니다!");
		if (r == true) {
		   	location.href="${ctx }/member/remove.do";
		}
	}
</script>