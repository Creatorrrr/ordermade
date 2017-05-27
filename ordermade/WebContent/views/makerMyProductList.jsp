<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">

			<%@ include file="common/myPageNav.jsp"%>

		</div>

		<div id="content" class="two_third">
			<h1>나의 상품페이지</h1>

			<div class="fl_right">
				<form class="clear" method="post" action="#">
					<input type="hidden" name="boardId" value="${boardId }"
						class="form-control">
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

				<form class="clear" method="post" action="#">
					<div>
						<fieldset>
							<input name="submit" type="submit" value="등록">
						</fieldset>
					</div>
				</form>

			</div>
			</br>
			<ul class="nospace listing">
				<li class="clear">
					<%-- <c:forEach items="${ box_list }" var="literature"> --%>
					<div class="content" align="center">
						<table class="table">
							<tr>
								<div class="imgl borderedbox">
									<img src="${ctx }/views/images/img1.jpg" />
								</div>
							</tr>
							<tr class="nospace btmspace-15">
								<td>상품 이름</td>
								<td><a class="literature" href="${ctx}/#/#.do?#=${asf }">${asf  }
										rkrkrk</a></td>
							</tr>
							<tr class="nospace btmspace-15">
								<td>가격</td>
								<td class="creatorId">${asf}10000000원</td>
							</tr>
						</table>
					</div> <%-- </c:forEach> --%>
				</li>
			</ul>
		</div>
		</main>
	</div>
</div>
<%@ include file="common/footer.jsp"%>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>