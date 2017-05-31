<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<title>상품 상세페이지</title>
<%@ include file="/views/common/head.jsp"%>
<script>
	/* $(function() { */

	var registReview = function() {
		console.log("11111111");
		$.ajax({
			url : "${ctx}/product/review/register.do",
			type : "post",
			data : {
				title : $("#title").val(),
				grade : $("#grade").val(),
				content : $("#content").val()
			},
			success : displayContents,
			error : errorCallback
		});
	};
	var displayComment = function(resultData) {
		var commentHtml = "";
		$
				.each(
						resultData.comments,
						function(index, comment) {
							alert("수행중 성공가 발생했습니다.");
							commentHtml += '<table class="table" style="font-size:13px; padding:20px;">';
							commentHtml += '<tr>';
							commentHtml += '<td><strong>' + comment.authorName
									+ '</strong></td>';
							commentHtml += '<td class="text-right">'
									+ comment.regDate;
							commentHtml += '<a class="glyphicon glyphicon-trash" href="javascript:removeComment('
									+ comment.commentId + ');"></a>';
							commentHtml += '</td></tr>';
							commentHtml += '<tr><td colspan="2">';
							commentHtml += '<p class="txt">' + comment.comment
									+ '</p>';
							commentHtml += '</td></tr></table>';
						});
		$("#commenArea").empty();
		$("#commenArea").append(commentHtml);
		$("#comment").val("");
	};
	var errorCallback = function() {
		alert("수행중 오류가 발생했습니다.");
	}
			/* 	}); */
</script>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->

		<div id="content" class="two_third first">
			<div class="sdb_holder">
				<h1>상품페이지-${product.title }</h1>

				<c:if test="${sessionScope.loginId ne null}">
					<c:if test="${product.maker.id eq sessionScope.loginId}">
						<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
						<div align="center">
							<input class="btn btn-warning" type="button" value="삭제"
								onclick="javascript:window.location='${ctx }/product/delete.do?productId=${product.id}'">
							<input class="btn btn-success" type="button" value="수정"
								onclick="javascript:window.location='${ctx}/product/modify.do?productId=${product.id }'">
						</div>
					</c:if>
				</c:if>
				<br>
				<!-- <img class="imgr borderedbox"
				src="images/demo/slider/pp.jpg" alt=""> -->
				<p>Aliquatjusto quisque nam consequat doloreet vest orna partur
					scetur portortis nam. Metadipiscing eget facilis elit sagittis
					felisi eger id justo maurisus convallicitur.</p>
			</div>
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

			<p>${product.content }</p>

			<div class="scrollable">
				<table>
				</table>
			</div>

			<div id="reviews">
				<h2>상품 후기</h2>
				<form class="clear" method="post" action="#">
					<div>
						<fieldset>
							<select name="type" id="type" class="form-control">
								<option value="id">아이디</option>
								<option value="name">내용</option>
							</select> <input name="search" class="search-box-input" type="text"
								value="" placeholder="Search Here" />
							<button class="fa fa-search" type="submit" title="Search">
								<em>Search</em>
							</button>
						</fieldset>
					</div>
				</form>

				<ul>
					<li>
						<article>
							<header>
								<%--        <c:forEach items="${reviews }" var="review"> --%>
								<figure class="avatar">
									<img src="${ctx }/views/images/img-10.jpg">
								</figure>
								<div class=reviewCotent>
									<p>제목 : ${review.title }testReviewTitle</p>
								</div>
								<div class="comcont">
									<p>This is an example of a comment made on a post. You can
										either edit the comment, delete the comment or reply to the
										comment. Use this as a place to respond to the post or to
										share what you are thinking.</p>
								</div>

								<div class="one_half first">아이디 :${review.consumer.id }</div>
								<div class="one_half">평점 :${review.grade }</div>
								<!-- <time datetime="2045-04-06T08:15+00:00">
									Friday, 6<sup>th</sup> April 2045 @08:15:00
								</time> -->
								<%--	</c:forEach> --%>
							</header>
						</article>
					</li>
				</ul>




				<h2>후기 작성</h2>
				<form onsubmit="registReview();">
					<div class="one_third first">
						<label for="title">제목 <span>*</span></label> <input type="text"
							id="title" value="" size="22">
					</div>

					<!-- <div class="one_third">
							<label for="password">비밀번호 <span>*</span></label> <input
								type="text" id="cosumer.password" value="" size="22">
						</div>-->

					<div class="one_third">
						<label for="grade">평점<span>*</span></label> <input type="text"
							id="grade" value="" size="22">
					</div>

					<div class="block clear">
						<label for="content">후기</label>
						<textarea id="content" placeholder="댓글쓰기" cols="55" rows="7"></textarea>
					</div>

					<input type="submit" value="Submit">
					<!-- <button onclick="alert('a');"></button> -->
					<input name="reset" type="reset" value="Reset">
				</form>
			</div>
		</div>
		<div class="sidebar one_third">
			<h6>제작자 정보</h6>
			<nav class="sdb_holder">
				<ul>
					<li><p>가격정보 : 원</p></li>
					<li><p>작업기간 : 일</p></li>
					<li><img src="${ctx }/views/images/img-10.jpg" /></li>
					<li><p>제작자 아이디 :</p></li>
					<li><p>제작자 소개</p></li>
					<li><p></p></li>
					<br>
					<li><a href="">프로필 바로가기</a></li>
				</ul>
			</nav>
		</div>
		<!-- / main body -->
		<div class="clear"></div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

<!-- JAVASCRIPTS -->

</body>
</html>