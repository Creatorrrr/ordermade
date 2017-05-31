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
				<h1>나의 상품페이지</h1>

				<div class="fl_right">
					<form class="clear" method="post" action="#">
						<input type="hidden" name="boardId" value="${boardId }"
							class="form-control">
						<div>
							<fieldset>
								<select name="type" id="type" class="form-control"
									style="display: inline-block;">
									<option value="id">제목</option>
									<option value="name">내용</option>
								</select> <input input name="search" class="search-box-input" type="text"
									value="" placeholder="Search Here"
									style="display: inline-block;" />
								<button class="fa fa-search" type="submit" title="Search">
									<em>Search</em>
								</button>
							</fieldset>
						</div>
					</form>

					<div style="float: right;">
						<%-- <c:if test="${sessionScope.loginId ne null && boardId ne null}"> --%>
						<a class="btn btn-sm btn-success"
							href="${ctx}/product/ui/register.do">상품 등록</a>
						<%-- </c:if> --%>
					</div>

				</div>
				</br>
				<ul class="nospace listing">
					<li class="clear"><c:forEach items="${ products }"
							var="product">
							<div class="content" align="center">
								<table class="table">
									<tr>
										<div class="imgl borderedbox">
											 <img
												src="${ctx }/product/image.do?img=${product.image}" />
										</div>
									</tr>
									<tr class="nospace btmspace-15">
										<td>상품 이름</td>
										<td><a class="literature" id="productId"
											href="${ctx }/product/ui/detail.do?id=${product.id }">${product.title }</a>
										</td>
									</tr>
									<tr class="nospace btmspace-15">
										<td>가격</td>
										<td class="creatorId">${product.price}원</td>
									</tr>
								</table>
							</div>
						</c:forEach></li>
				</ul>
			</div>
			</main>
		</div>
	</div>

	<%@ include file="/views/common/head.jsp"%>
	<!-- JAVASCRIPTS -->
	<script type="text/javascript">
		function findProduct(data) {
			$.ajax({
				url : "${ctx}/product/ajax/product/productId.do?productId="
						+ data,
				type : "get",
				dataType : "xml",
				success : function(xml) {
					console.log("333")
				}
			})

		}
	</script>
</body>
</html>