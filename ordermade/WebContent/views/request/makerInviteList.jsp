<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!-- TEST ========================================================================================== -->
<!-- http://localhost:8080/ordermade/views/request/makerInviteList.jsp -->
<!-- http://localhost:8080/ordermade/request/ui/makerInviteList.do -->
<!DOCTYPE html>
<html lang="ko">
<!-- Header ========================================================================================== -->
<head>
<%@ include file="/views/common/head.jsp"%>
</head>
<!-- Main Body ========================================================================================== -->
<body>
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>

		<div id="content" class="two_third">
			<h1>참가요청내역</h1>
			<div class="">
				<table class="">
	                   <colgroup>
	                       <col width="110"/>
	                       <col width="120"/>
	                       <col width="350"/>
	                       <col width="200"/>
	                       <col width="200"/>
	                   </colgroup>
	                   <thead>
	                   <tr>
	                       <td class="" style="text-align: center">번호</td>
	                       <td class="" style="text-align: center">소비자</td>
	                       <td class="" style="text-align: center">메시지</td>
	                       <td class="" style="text-align: center">요청시간</td>
	                       <td class="" style="text-align: center">참가요청</td>
	                   </tr>
	                   </thead>
	                   <tbody>
	                   	<c:if test="${empty inviteRequests}">
	                        <tr>
	                            <td style="text-align: center" colspan="5" class="text-center"> 내역이 존재하지 않습니다.</td>
	                        </tr>
	                       </c:if>
	                       <c:forEach var="inviteRequest" items="${inviteRequests}"
	                                  varStatus="sts">
	                        <tr>
	                            <td class="" style="text-align: center">
	                            	${sts.count }
	                            </td>
	                            <td style="text-align: center">
									${inviteRequest.request.consumer.id }
								</td>
	                            <td class="" style="text-align: center">
	                            	${inviteRequest.message}
	                            </td>
	                            <td class="" style="text-align: center">
	                           		${inviteRequest.requestTime}<br>
	                            </td>
	                            <td style="text-align: center">
	                            	<!-- 수락 ajax 구현 -->
	                           		<input type="button" value="수락" style="display: inline-block;">
	                           		<!-- 거절 ajax 구현 -->
	                           		<span>
	                           		<input type="button" value="거절" style="display: inline-block;">
	                           		</span>
	                            </td>
	                        </tr>
	                       </c:forEach>
	                   </tbody>
	               </table>
				</div>
			</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>