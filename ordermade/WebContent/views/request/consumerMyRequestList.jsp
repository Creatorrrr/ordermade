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
<title>나의 의뢰서</title>
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

					<div class="content" align="center">
						<h1 align="left">나의 의뢰서</h1>
						<table class="table">
							<tr>
								<div class="">
									<tr>
										<td><input name="" type="button" value="모든 의뢰서"></td>
										<td><input name="" type="button" value="진행 중"></td>
										<td><input name="" type="button" value="완료 "></td>
									</tr>
								</div>
							</tr>
						</table>
					</div> <%-- <c:forEach items="${ box_list }" var="literature"> --%>
					<table class="request_table">
						<tr>
							<div class="imgl borderedbox">
								<img src="${ctx }/views/images/img-10.jpg" />
							</div>
						</tr>

						<tr>
							<p>의뢰 명 : ${title}</p>
						</tr>
						<tr>
							<p>의뢰자 : ${id }</p>
						</tr>
						<tr>
							<p>의뢰 내용 : ${contents }</p>
						</tr>
						<tr>
							<p>제작항목 : ${hope_price }</p>
						</tr>
						<tr>
							<p>희망 가격 : ${hope_price }</p>
						</tr>
						<tr>
							<td><input name="" type="button" value="공개"></td>
							<td><input name="" type="button" value="수정"></td>
							<td><input name="" type="button" value="삭제 "></td>
						</tr>
					</table> <%-- </c:forEach> --%>
					<div>
						<input class="" type="button" name="" value="의뢰서 추가">
					</div>
				</li>
			</ul>
		</div>
	</div>
	</main>
</div>
<%@ include file="/views/common/footer.jsp"%>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>