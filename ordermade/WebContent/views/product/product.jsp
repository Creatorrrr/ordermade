<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>상품 페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>


	<div class="wrapper row3">
		<div class="rounded">
			<main class="container clear"> <!-- main body -->
			<div class="sidebar one_third first">
				<h6>상품 카테고리</h6>
				<nav class="sdb_holder">
					<ul>
						<c:forEach items="${categories}" var="category">
							<li><a href="${ctx }/ajax/products/category.do?category=${category.type}">${category.type }</a></li>
						</c:forEach>
					</ul>
				</nav>
			</div>

			<div id="content" class="two_third">
				<h1>상품페이지</h1>

				<div class="fl_right">
					<form class="clear" method="post" action="#">
						<div>
							<fieldset>
								<select name="type" id="type" class="form-control">
									<option value="id">제목</option>
									<option value="name">내용</option>
									<option value="name">상품 명</option>
									<option value="name">제작자</option>
								</select> <input input name="search" class="search-box-input" type="text"
									value="" placeholder="Search Here" />
								<button class="fa fa-search" type="submit" title="Search">
									<em>Search</em>
								</button>
								<button class="fa fa-search" name="" type="submit" title="Search">
									<em>Image Search</em>
								</button>
							</fieldset>
						</div>
					</form>
					
				</div>
				<ul class="nospace listing">
					<li class="clear">
						<%-- <c:forEach items="${ box_list }" var="literature"> --%>
						<div class="content" align="center">
							<table class="table">

								<tr>
									<td><img src="${ctx }/views/images/img1.jpg" /></td>
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




${box3 }

<%@ include file="/views/common/footer.jsp"%>