<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>포트폴리오</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>


<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<h6>Category</h6>
			<nav class="sdb_holder">
				<ul>
					<li><a href="${ctx }/portfolio/ui/search.do?type=aa">Furniture</a></li>
					<li><a href="${ctx }/portfolio/ui/search.do?type=Accessory">Accessory</a></li>
					<li><a href="${ctx }/portfolio/ui/search.do?type=Kitchen">Kitchen</a></li>
					<li><a href="${ctx }/portfolio/ui/search.do?type=Digital">Digital</a></li>
					<li><a href="${ctx }/portfolio/ui/search.do?type=Clothing">Clothing</a></li>
					<li><a href="${ctx }/portfolio/ui/search.do?type=Sport">Sport</a></li>
				</ul>
			</nav>
		</div>

		<div id="content" class="two_third">
			<h1>포트폴리오 페이지</h1>

			<div class="fl_right">
				<form class="clear" method="post" action="#">
					<div>
						<fieldset>
							<select name="type" id="type" class="form-control" style="display:inline-block">
								<option value="id">제목</option>
								<option value="name">내용</option>
								<option value="name">상품 명</option>
								<option value="name">제작자</option>
							</select> <input input name="search" class="search-box-input" type="text"
								value="" placeholder="Search Here" style="display:inline-block"/>
							<button class="fa fa-search" type="submit" title="Search">
								<em>Search</em>
							</button>
						</fieldset>
					</div>
				</form>
				
				<button class="fa fa-search" name="" type="submit" title="Search">
								<em>Image Search</em>
							</button>
			</div>
			<ul class="nospace listing">
				<li class="clear">
					<%-- <c:forEach items="${ box_list }" var="literature"> --%>
					<div class="content" align="center">
						<table class="table">

							<tr>
								<td>	
									<img src="${ctx }/views/images/img1.jpg" />
								</td>
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





<%@ include file="/views/common/footer.jsp"%>