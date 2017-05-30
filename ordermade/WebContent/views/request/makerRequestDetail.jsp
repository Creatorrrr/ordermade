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
						<div class="imgl borderedbox">
							<img src="${ctx }/views/images/img1.jpg" />
						</div>
						<table class="table">
							<tr>
							<td><p>의뢰 명 : ${request.title}</p></td>
						</tr>
						<tr>
							<td><p>의뢰자 : ${request.id }</p></td>
						</tr>
						<tr>
							<td><p>의뢰 내용 : ${request.content }</p></td>
						</tr>
						<tr>
							<td><p>제작 항목 : ${request.category }</p></td>
						</tr>
						<tr>
							<td><p>희망 가격 : ${request.hopePrice }</p></td>
						</tr>
						</table>
						<div>
							<tr>
								<h3>최신 포트폴리오</h3>
							</tr>
							<tr>
								<p>내용나와야 함@@@</p>
							</tr>
						</div>

						<br>

						<div>
							<tr>
								<h3>추가 요구 사항</h3>
							</tr>
							<tr>
							<td><textarea rows="10" cols="80"></textarea>
							</tr>
							<tr>
							<td><input class="" name="" type="button" value="등록">
							<input class="" name="" type="reset" value="취소"></td>
							</tr>
						</div>
						
						<div>
							<p>제작기간 :<input class=" " name="" type="text" value="">일</p>
							<p>결제금액 (배송비 포함): <input class=" " name="" type="text" value="">원</p> 
							<input class=""  type="button" name="" value="등록">
						</div>
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