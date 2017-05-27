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
			<h1>거래이력</h1>

			<div class="fl_right">
				<form class="clear" method="post" action="#">
					<div>
						<fieldset>
							<select name="type" id="type" class="form-control">
								<option value="id">제목</option>
								<option value="name">내용</option>
							</select> <input input name="search" class="search-box-input" type="text"
								value="" placeholder="Search Here" />
							<button class="fa fa-search" type="submit" title="Search">
								<em>Search</em>
							</button>
						</fieldset>
					</div>
				</form>
			</div>
			</br>

			<div class="">
				<table>
					<tr>
						<td>상품 정보</td>
						<td>배송일자</td>
						<td>진행상태</td>
					</tr>
					<tr>
						<td><img src=${ctx }/views/images/img-10.jpg>
							<p>상품명 : </p>
							<p>아이디 : </p>
							<p>가격 : </p>
						</td>
						<td><p>배송 일자 출력</p></td>
						<td><p>진행상태</p></td>
					</tr>
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