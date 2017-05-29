<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>
		<div id="content" class="two_third">
			<ul class="nospace listing">
				<li class="clear">
					<div class="content" align="left">
						<h1>${member.id }님의정보</h1>

						<div style="float: right;">
							<%-- <c:if test="${sessionScope.loginId ne null && boardId ne null}"> --%>
							<a class="btn btn-sm btn-success"
								href="${ctx}/member/modifyMember.do">회원정보 수정</a>
							<%-- </c:if> --%>
						</div>
						
						<div class="imgl borderedbox">
							<img src="${ctx }/member/image.do?img=${member.image}" />
						</div>
						<table class="table">
							<tr class="nospace btmspace-15">
							<tr>
								<td><p>아이디 : ${member.id}</p></td>
							</tr>
							<tr>
								<td><p>이메일 : ${member.email }</p></td>
							</tr>
							<tr>
								<td><p>주소 : ${member.address }</p></td>
							</tr>
							<tr>
								<td><p>사업자번호 : ${member.licenseNumber}</p></td>
							</tr>

							<tr>
								<td></br>
								</br>
								<h3>제작자 소개</h3></td>
							</tr>
							<tr>
								<td><p>${member.introduce }</p></td>
							</tr>
							<tr>
								<td><h3>최신 포트폴리오</h3></td>
							</tr>
							<tr>
								<td>
									<div style="display: inline-block">
										<img src="${ctx }/views/images/bul_prev.png" /> <img
											style="width: 60%"
											src="${ctx }/member/image.do?img=${member.image }"> <img
											src="${ctx }/views/images/bul_next.png" />
									</div>
								</td>
							</tr>
						</table>
					</div> <%-- <div>
						<tr>
							<h3>최신 상품</h3>
						</tr>
						<tr class="nospace btmspace-15">
							<td><img src="${ctx }/views/images/bul_prev.png" /></td>
						</tr>
						<tr>
							<div class="imgl borderedbox">
								<c:forEach items="${ box_list }" var="literature">
								<img src="${ctx }/views/images/img1.jpg" />
								</c:forEach>
							</div>
						</tr>
						<tr class="nospace btmspace-15">
						<tr>
							<img src="${ctx }/views/images/bul_next.png" />
						</tr>
					</div> --%>
		</div>
		</li>
		</ul>
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