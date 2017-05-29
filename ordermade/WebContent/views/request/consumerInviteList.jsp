<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!-- TEST ========================================================================================== -->
<!-- http://localhost:8080/ordermade/views/request/consumerInviteList.jsp -->
<!-- http://localhost:8080/ordermade/request/ui/consumerInviteList.do -->

<!-- Header ========================================================================================== -->
<%@ include file="/views/common/head.jsp"%>

<!-- Main Body ========================================================================================== -->
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
                       <col width="100"/>
                   </colgroup>
                   <thead>
                   <tr>
                       <td class="" style="text-align: center">번호</td>
                       <td class="" style="text-align: center">제작'자</td>
                       <td class="" style="text-align: center">메시지</td>
                       <td class="" style="text-align: center">요청시간</td>
                       <td class="" style="text-align: center">참가요청</td>
                   </tr>
                   </thead>
                   <tbody>
                   	<c:if test="${empty inviteRequests}">
                        <tr>
                            <td style="text-align: center" colspan="5" class="text-center">참가요청이 존재하지 않습니다.</td>
                        </tr>
                       </c:if>
                       <c:forEach var="inviteRequest" items="${inviteRequests}"
                                  varStatus="sts">
                        <tr>
                            <td class="text-center">
                            	${sts.count }
                            </td>
                            <td style="text-align: center">
								${inviteRequest.maker.id }
							</td>
                            <td class="" style="text-align: center">
                            	${inviteRequest.message}
                            </td>
                            <td class="" style="text-align: center">
                           		${inviteRequest.requestTime}
                            </td>
                            <td class="" style="text-align: center">
                           		<a href="" class="">수락</a><a href="" class="">거절</a>
                            </td>
                        </tr>
                       </c:forEach>
                   </tbody>
               </table>
				<%-- <table>
					<tr>
						<td>번호</td>
						<td>제작자</td>
						<td>메시지</td>
						<td>요청시간</td>
						<td>참가요청</td>
					</tr>

					<c:forEach items="${ }" var="">
					<tr>
						<td><p>1</p></td>
						<td><p>1</p></td>
						<td><p>1</p></td>
						<td><p>1</p></td>
						<td><input type="button" value="수락"><input
							type="button" value="거절"></td>
					</tr>
					</c:forEach>

				</table> --%>
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