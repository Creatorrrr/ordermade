<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear">
		<div class="sidebar one_third first">
			<h6>Category</h6>
			<nav class="sdb_holder">
				<ul>
					<li><a href="#">Furniture</a></li>
					<li><a href="#">Accessory</a></li>
					<li><a href="#">Kitchen</a></li>
					<li><a href="#">Digital</a></li>
					<li><a href="#">Clothing</a></li>
					<li><a href="#">Sport </a></li>
				</ul>
			</nav>
		</div>

		<c:if test="${product ne null && product > 0}">
			<c:forEach items="${categories }" var="category">
				<c:if test="${category.type eq type }">

					<div id="content" class="two_third">
						<h1>${category.type }상품페이지</h1>

						<c:forEach items="${products }" var="product">
							<c:if test="${product.id eq productId }">
								<div class="fl_right">
									<form class="clear" method="post"
										action="${ctx }/product/searchList.do">
										<input type="hidden" name="boardId" value="${boardId }"
											class="form-control">
										<div>
											<fieldset>
												<select name="type" id="type" class="form-control">
													<option value="productTitle">제목</option>
													<option value="productContents">내용</option>
													<option value="productName">상품 명</option>
													<option value="maker">제작자</option>
												</select> <input input name="search" class="search-box-input"
													type="text" value="" placeholder="Search Here" />
												<button class="fa fa-search" type="submit" title="Search">
													<em>Search</em>
												</button>
											</fieldset>
										</div>
									</form>
								</div>
							</c:if>
						</c:forEach>
						<button class="fa fa-search" name="" type="submit" title="Search">
							<em>Image Search</em>
						</button>
					</div>
					</br>

					<table class="table table-hover table-condensed">
						<ul class="nospace listing">
							<li class="clear">
								<%-- <c:forEach items="${products }" var="product"> --%>
								<div class="content" align="center">
									<table class="table">
										<tr>
											<div class="imgl borderedbox">
												<img src="${ctx }/views/images/img1.jpg" />
											</div>
										</tr>
										<tr class="nospace btmspace-15">
											<td>상품 명</td>
											<td><a class="literature"
												href="${ctx}/product/detail.do?productId=${product.id }">${product.title }</a></td>
										</tr>
										<tr class="nospace btmspace-15">
											<td>가격</td>
											<td>${product.price}원</td>
										</tr>
									</table>
								</div> <%-- </c:forEach> --%>
							</li>
						</ul>

					<%-- 	<tbody>
							<c:choose>
								<c:otherwise>
									<c:forEach items="${products }" var="product">
										<tr>
											<td><a
												href="${ctx }/product/detail.do?productId=${product.id }">${product.title }</a></td>
											<td>${product.price}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody> --%>
						
					</table>

					<div>
						<fmt:parseNumber var="pages" integerOnly="true"
							value="${rows / 20 }" />
						<c:forEach var="i" begin="1" end="${pages + 1 }" step="1">
							<a href="${ctx }/post/list.do?boardId=${boardId}&pageNum=${i}">${i}</a>
						</c:forEach>
					</div>

				</c:if>
			</c:forEach>
		</c:if> </main>
	</div>
</div>
