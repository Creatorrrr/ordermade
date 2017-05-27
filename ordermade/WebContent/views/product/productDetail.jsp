<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>


<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div id="content" class="two_third first">

			<h1>${ctx }상품페이지-상품번호나이름넣기</h1>
			<c:if test="${sessionScope.loginId ne null}">
				<c:if test="${product.writer.id eq sessionScope.loginId}">
					<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
					<div align="center">
						<input class="btn btn-warning" type="button" value="삭제"
							onclick="javascript:window.location='${ctx }/product/delete.do?productId=${product.id}'">
						<input class="btn btn-success" type="button" value="수정"
							onclick="javascript:window.location='${ctx}/product/modify.do?productId=${product.id }'">
					</div>
				</c:if>
			</c:if>
			<br> <img class="imgr borderedbox"
				src="images/demo/slider/pp.jpg" alt="">
			<p>Aliquatjusto quisque nam consequat doloreet vest orna partur
				scetur portortis nam. Metadipiscing eget facilis elit sagittis
				felisi eger id justo maurisus convallicitur.</p>

			<br>
			<div>
				<h2>상품 내용</h2>
				<p class="">상품 번호 :</p>
				<p class="">색상 :</p>
				<p class="">소재 :</p>
				<p class="">크기 :</p>
			</div>
			<%-- <c:forEach items="${ box_list }" var="literature"> --%>
			<div align="center">
				<img src="${ctx }/views/images/img6.jpg" />
			</div>
			<br>
			<%--  </c:forEach>--%>

			<!-- 확인</main>  -->

			<p>You can use and modify the template for both personal and
				commercial use. You must keep all copyright information and credit
				links in the template and associated files. For more website
				templates visit</p>

			<!-- comment List -->
			<div class="wrapper row3">
				<div class="rounded">
					<div class="container clear">

						<h1>상품 후기</h1>
						<%-- <c:forEach items="${ box_list }" var="literature"> --%>
						<div class="imgl borderedbox">
							<img src="${ctx }/views/images/img-10.jpg" />
						</div>
						<div>
							<p>This page basically demonstrates the use of the mini grid
								system used in this template.</p>
						</div>
						<!-- section content -->
						<div class="group">
							<div class="one_half first">아이디 :</div>
							<div class="one_half">평점 :</div>
						</div>
						<%--  </c:forEach>--%>
						<!-- / section content -->
						<div class="clear"></div>
						<form class="clear" method="post" action="#">
							<div>
								<fieldset>
									<select name="type" id="type" class="form-control">
										<option value="id">아이디</option>
										<option value="name">내용</option>
									</select> <input input name="search" class="search-box-input"
										type="text" value="" placeholder="Search Here" />
									<button class="fa fa-search" type="submit" title="Search">
										<em>Search</em>
									</button>
								</fieldset>
							</div>
						</form>
					</div>

				</div>
			</div>
			<!-- / comment List-->

			<!--comment write  -->
			<div id="comments">
				<h2>후기 작성</h2>
				<form action="#" method="post">
					<div class="one_third first">
						<label for="name">제목 <span>*</span></label> <input type="text"
							name="name" id="name" value="" size="22">
					</div>
					<div class="one_third">
						<label for="email">비밀번호 <span>*</span></label> <input type="text"
							name="email" id="email" value="" size="22">
					</div>
					<div class="one_third">
						<label for="url">평점<span>*</span></label> <input type="text"
							name="url" id="url" value="" size="22">
					</div>
					<div class="block clear">
						<label for="comment">후기</label>
						<textarea name="comment" id="comment" cols="25" rows="10"></textarea>
					</div>
					<div>
						<input name="submit" type="submit" value="Submit">
						&nbsp; <input name="reset" type="reset" value="Reset">
					</div>
				</form>
			</div>
		</div>
		<!--/comment write  --> <!--side bar  -->
		<div class="sidebar one_third">
			<%@ include file="/views/common/productNav.jsp"%>
		</div>
		<div class="clear"></div>
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