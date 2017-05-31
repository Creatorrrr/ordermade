<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/views/common/head.jsp"%>

<style type="text/css">
	.productBox {
		display:inline-block;
		border-style:solid;
		margin:5px;
		width:45%;
	}
	
	.productExplainBox {
		display:inline-block;
		width:100%;
	}
	
	.productExplainBox img {
		width:30%;
	}
	
	.productExplainBox table{
		display:inline-block;
		float:right;
		border-style:none;
		width:auto;
		color:black;
	}
	
	.productExplainBox table * {
		border-style:none;
	}
	
	.detailBtnBox {
		width:100%;
	}
	
	.detailBtnBox input{
		float:right;
	}
</style>
</head>
<body>
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
			<div class="sidebar one_third first">
				<h6>Category</h6>
				<nav class="sdb_holder">
					<ul>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=FUNITURE">Furniture</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=ACCESSORY">Accessory</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=KITCHEN">Kitchen</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=DIGITAL">Digital</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=CLOTHING">Clothing</a></li>
						<li><a href="${ctx }/product/ui/search.do?page=1&category=SPORT">Sport </a></li>
					</ul>
				</nav>
			</div>
			
			<div id="content" class="two_third">
				<div class="content" align="center">
					<h1 align="left">${category }상품페이지</h1>
					<div style="float:right">
						<select id="productSearchType" class="form-control" style="display:inline-block">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input id="productSearchKeyword" name="productSearchKeyword" class="search-box-input"
							type="text" value="" placeholder="Search Here" style="display:inline-block"/>
						<button id="productSearchBtn" class="fa fa-search" title="Search">
							<em>Search</em>
						</button>
						<button id="imageSearchBtn" class="fa fa-search" title="Search">
							<em>Image Search</em>
						</button>
					</div>
				</div>
				<div id="productSearchResult">
					<c:forEach items="${products }" var="product">
						<div class='productBox'>
							<div class="productExplainBox">
								<img src="${ctx }/">
								<table>
									<tr>
										<td>상품명 : </td>
										<td>${product.title }</td>
									</tr>
									<tr>
										<td>제작자 : </td>
										<td>${product.maker.id }</td>
									</tr>
									<tr>
										<td>제작항목 : </td>
										<td>${product.category }</td>
									</tr>
									<tr>
										<td>예상 가격 : </td>
										<td>${product.price }</td>
									</tr>
									<tr>
										<td>기간 : </td>
										<td>${product.period }</td>
									</tr>
								</table>
							</div>
							<div class="detailBtnBox">
								<input type='button' value='자세히보기' onclick="javascript:location.href='${ctx}/product/ui/detail.do?id=${product.id}'">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

</body>

<script type="text/javascript">
//검색을 클릭하면 검색된 의뢰서 목록을 가져온다.
$("#productSearchBtn").click(function() {
	var type = $("#productSearchType option:selected").val();
	var keyword = $("#productSearchKeyword");
	if(type === "title") {
		requestController.getRequestsByBoundAndTitle(1, keyword.val());
	} else if(type === "content") {
		requestController.getRequestsByBoundAndContent(1, keyword.val());
	}
	keyword.val("");
});

var productController = {				
		getProductsByCategoryAndTitle : function(page, title) {
			$.ajax({
				url : "${ctx}/product/ajax/products/CT.do?page=" + page + "&category=${category}&title=" + ,
				type : "get",
				dataType : "xml",
				success : function(xml) {
						var xmlData = $(xml).find("product");
						var listLength = xmlData.length;
						$("#productSearchResult").empty();
						if (listLength) {
							var contentStr = "";
							$(xmlData).each(function(){
								contentStr += requestController.makeContent(this);
							});
							$("#productSearchResult").append(contentStr);
						} else {
							$("#productSearchResult").append(productController.makeContentForEmpty());
						}
				}
			});
		},
};
</script>
</html>