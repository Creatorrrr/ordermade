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
							<li><a href="${ctx }/product/ui/search.do?category=${category.type}">${category.type }</a></li>
						</c:forEach>
					</ul>
				</nav>
			</div>

			<div id="content" class="two_third">
				<div class="content" align="center">
					<h1 id="productCategory">[${category }] 상품페이지</h1>
					
					<div class="right">
						<form class="navbar-form text-right">
							<select id="productSearchType" class="form-control" style="display: inline-block">
								<option value="title">제목</option>
								<option value="makerName">제작자</option>
							</select> 
							<input id="productSearchKeyword" name="productSearchKeyword"
								class="form-control" type="text" value=""
								placeholder="Search Here" style="display: inline-block" />
							<button id="productSearchBtn" class="fa fa-search btn btn-default" type="button" title="Search">검색</button>
							<button id="imageSearchBtn" class="fa fa-search btn btn-default" type="button" title="Search" onclick="javascript:createImageSearchModal();">이미지 검색</button>
						</form>
					</div>
				</div>
				
				<div id="listSearchResult">
					<c:forEach items="${products }" var="product">
						<div class='listBox'>
							<div class="listExplainBox">
								<div class="imgl borderedbox">
									<a href="${ctx}/product/ui/detail.do?id=${product.id}">
										<img src="${ctx }/main/file/download.do?fileName=${product.image}" style=" width: 100px;height: 100px">
									</a>
								</div>
								<table class="table">
									<tr>
										<td>상품명 :</td>
										<td>${product.title }</td>
									</tr>
									<tr>
										<td>제작자 :</td>
										<td>${product.maker.name }</td>
									</tr>
									<tr>
										<td>제작항목 :</td>
										<td>${product.category }</td>
									</tr>
									<tr>
										<td>예상 가격 :</td>
										<td>${product.price }</td>
									</tr>
									<tr>
										<td>기간 :</td>
										<td>${product.period }</td>
									</tr>
								</table>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</main>
		</div>
	</div>

${box3 }

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javascript">
//검색을 클릭하면 검색된 상품 목록을 가져온다.
$("#productSearchBtn").click(
		function() {
			var type = $("#productSearchType option:selected").val();
			var keyword = $("#productSearchKeyword");
			if("${category}" === "ALL" || "${category}" === "IMAGE SEARCH") {
				if (type === "title") {
					productController.getProductsByTitle(1, keyword.val());
				} else if (type === "makerName") {
					productController.getProductsByMakerName(1, keyword.val());
				}
			} else {
				if (type === "title") {
					productController.getProductsByCategoryAndTitle(1, keyword.val());
				} else if (type === "makerName") {
					productController.getProductsByCategoryAndMakerName(1, keyword.val());
				}
			}
			keyword.val("");
});

// 이미지 검색 대화상자를 생성
var createImageSearchModal = function() {
	var contentStr = "";

	contentStr += "<div align='right'><button onclick='javascript:$.unblockUI();'>X</button></div>";
	contentStr += "<div id='fileuploader'>Upload</div>";

	$.blockUI({
		message : contentStr
	});

	$("#fileuploader").uploadFile({
		url : "${ctx}/main/file/upload.do",
		acceptFiles : "image/*",
		fileName : "image",
		multiple : false,
		dragdropWidth:"100%",
		maxFileCount : 1,
		returnType : "text",
		onSuccess : function(files, data, xhr, pd) {
			$.unblockUI();
			var result = data;
			if (result === "fail") {
				alert("이미지 업로드 실패")
			} else {
				productController.getProductsByImage(result);
			}
		},
	});
};

var productController = {
	getProductsByTitle : function(page, title) {
		$.ajax({
			url : "${ctx}/product/ajax/products/title.do?page=" + page + "&title=" + title,
			type : "get",
			dataType : "xml",
			success : function(xml) {
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				$("#listSearchResult").empty();
				if (listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr += productController.makeContent(this);
					});
					$("#listSearchResult").append(contentStr);
				} else {
					$("#listSearchResult").append(
							productController.makeContentForEmpty());
				}
			}
		});
	},
	
	getProductsByMakerName : function(page, makerName) {
		$.ajax({
			url : "${ctx}/product/ajax/products/makerName.do?page=" + page + "&makerName=" + makerName,
			type : "get",
			dataType : "xml",
			success : function(xml) {
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				$("#listSearchResult").empty();
				if (listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr += productController.makeContent(this);
					});
					$("#listSearchResult").append(contentStr);
				} else {
					$("#listSearchResult").append(
							productController.makeContentForEmpty());
				}
			}
		});
	},
		
	getProductsByCategoryAndTitle : function(page, title) {
		$.ajax({
			url : "${ctx}/product/ajax/products/CT.do?page=" + page
					+ "&category=${category}&title=" + title,
			type : "get",
			dataType : "xml",
			success : function(xml) {
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				$("#listSearchResult").empty();
				if (listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr += productController.makeContent(this);
					});
					$("#listSearchResult").append(contentStr);
				} else {
					$("#listSearchResult").append(
							productController.makeContentForEmpty());
				}
			}
		});
	},

	getProductsByCategoryAndMakerName : function(page, makerName) {
		$.ajax({
			url : "${ctx}/product/ajax/products/CM.do?page=" + page
					+ "&category=${category}&makerName=" + makerName,
			type : "get",
			dataType : "xml",
			success : function(xml) {
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				$("#listSearchResult").empty();
				if (listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr += productController.makeContent(this);
					});
					$("#listSearchResult").append(contentStr);
				} else {
					$("#listSearchResult").append(
							productController.makeContentForEmpty());
				}
			}
		});
	},

	getProductsByImage : function(image) {
		$.ajax({
			url : "${ctx}/product/ajax/products/image.do?image=" + image,
			type : "get",
			dataType : "xml",
			success : function(xml) {
				var xmlData = $(xml).find("product");
				var listLength = xmlData.length;
				$("#listSearchResult").empty();
				$("#productCategory").html("[이미지 검색] 상품페이지");
				if (listLength) {
					var contentStr = "";
					$(xmlData).each(function() {
						contentStr += productController.makeContent(this);
					});
					$("#listSearchResult").append(contentStr);
				} else {
					$("#listSearchResult").append(
							productController.makeContentForEmpty());
				}
			}
		});
	},

	makeContent : function(xml) {
		var content = "";
		content += "<div class='listBox'>";
		content += "	<div class='listExplainBox'>";
		content += "		<div class='imgl borderedbox'>";
		content += "			<a href='${ctx}/product/ui/detail.do?id='" + $(xml).find("product>id").text() + ">";
		content += '				<img src="${ctx }/main/file/download.do?fileName=' + $(xml).find("product>image").text() + '"style="width:100px;height: 100px";>';
		content += "			</a>";
		content += "		</div>";
		content += "		<table class='table'>";
		content += "			<tr>";
		content += "				<td>상품명 : </td>";
		content += "				<td>" + $(xml).find("product>title").text()
				+ "</td>";
		content += "			</tr>";
		content += "			<tr>";
		content += "				<td>제작자 : </td>";
		content += "				<td>" + $(xml).find("product>maker>name").text()
				+ "</td>";
		content += "			</tr>";
		content += "			<tr>";
		content += "				<td>제작항목 : </td>";
		content += "				<td>" + $(xml).find("product>category").text()
				+ "</td>";
		content += "			</tr>";
		content += "			<tr>";
		content += "				<td>예상 가격 : </td>";
		content += "				<td>" + $(xml).find("product>price").text()
				+ "</td>";
		content += "			</tr>";
		content += "			<tr>";
		content += "				<td>기간 : </td>";
		content += "				<td>" + $(xml).find("product>period").text()
				+ "</td>";
		content += "			</tr>";
		content += "		</table>";
		content += "	</div>";
		content += "</div>";

		return content;
	},

	makeContentForEmpty : function() {
		var content = "";

		content += "<div class='productBox'>";
		content += "<table>";
		content += "<tr>";
		content += "<td>조건에 해당하는 상품이 없습니다.</td>";
		content += "</tr>";
		content += "</table>";
		content += "</div>";

		return content;
	}
};
</script>