<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>상품 페이지</title>
<%@ include file="/views/common/_common.jsp"%>
	
${head_body}
<%@ include file="/views/common/header.jsp"%>


${box1 }
				<h6>상품 카테고리</h6>
				<nav class="sdb_holder">
					<ul>
						<c:forEach items="${categories}" var="category">
							<li><a href="${ctx }/product/ui/search.do?category=${category.type}">${category.type }</a></li>
						</c:forEach>
					</ul>
				</nav>
				
${box2 }

				<div class="content" align="center">
					<h1 id="productCategory">[${category }] 상품페이지</h1>
					
					<div class="right">
						<form class="navbar-form text-right">
							<select id="productSearchType" class="form-control" style="display: inline-block">
								<option value="title">제목</option>
								<option value="makerName">제작자</option>
							</select> 
							<input id="productSearchKeyword" name="keyword"
								class="form-control" type="text" value=""
								placeholder="Search Here" style="display: inline-block" />
							<button id="productSearchBtn" class="fa fa-search btn btn-default" type="button" title="Search">검색</button>
							<button id="imageSearchBtn" class="fa fa-search btn btn-default" type="button" title="Search" onclick="javascript:createImageSearchModal();">이미지 검색</button>
						</form>
					</div>
				</div>
				<!-- style=" width: 100px;height: 100px" -->
				<div id="listSearchResult">
					<c:forEach items="${products }" var="product">
						<div class='listBox'>
							<div align="center">
								<a href="${ctx}/product/ui/detail.do?id=${product.id}">
									<img src="${ctx }/main/file/download.do?fileName=${product.image}" style="width: 250px; height: 180px">
								</a>     
							</div>
							<table class="table">
								<tr>
									<td style="color: #000000">상품명 :</td>
									<td style="color: #000000">${product.title }</td>
								</tr>
								<tr>
									<td style="color: #000000">제작자 :</td>
									<td style="color: #000000">${product.maker.name }</td>
								</tr>
								<tr>
									<td style="color: #000000">제작항목 :</td>
									<td style="color: #000000">${product.category }</td>
								</tr>
								<tr>
									<td style="color: #000000">예상 가격 :</td>
									<td style="color: #000000">${product.price }</td>
								</tr>
								<tr>
									<td style="color: #000000">기간 :</td>
									<td style="color: #000000">${product.period }</td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
				<!-- 페이지 구현  -->
				<div id = "pagination"></div>
	
${box3 }

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	pagination();
});

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
		content += "		<div align='center'>";
		content += "			<a href='${ctx}/product/ui/detail.do?id=" + $(xml).find("product>id").text() + "'>";
		content += '				<img src="${ctx }/main/file/download.do?fileName=' + $(xml).find("product>image").text() + '"style="width: 250px; height: 180px">';
		content += "			</a>";            
		content += "		</div>";
		content += "		<table class='table'>";
		content += "			<tr>";
		content += "				<td style='color: #000000'>상품명 :</td>";
		content += "				<td style='color: #000000'>" + $(xml).find("product>title").text() + "</td>";
		content += "			</tr>";
		content += "			<tr>";
		content += "				<td style='color: #000000'>제작자 : </td>";
		content += "				<td style='color: #000000'>" + $(xml).find("product>maker>name").text() + "</td>";
		content += "			</tr>";
		content += "			<tr>";
		content += "				<td style='color: #000000'>제작항목 : </td>";
		content += "				<td style='color: #000000'>" + $(xml).find("product>category").text() + "</td>";
		content += "			</tr>";
		content += "			<tr>";
		content += "				<td style='color: #000000'>예상 가격 : </td>";
		content += "				<td style='color: #000000'>" + $(xml).find("product>price").text() + "</td>";
		content += "			</tr>";
		content += "			<tr>";
		content += "				<td style='color: #000000'>기간 : </td>";
		content += "				<td style='color: #000000'>" + $(xml).find("product>period").text() + "</td>";
		content += "			</tr>";
		content += "		</table>";
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

//페이지 생성 함수
function pagination(){
	$.ajax({
		url : "${ctx}/product/pages/search.do?category=${category}",
		type : "get",
		dataType : "text",
		success : function(pages) {
		    $('#pagination').pagination({	// 페이지 총 개수를 구한 다음 생성
		        items: pages,
		        itemOnPage: 10,
				currentPage: "${thisPage}", // 초기에 보여주는 페이지
		        cssStyle: 'light-theme',
		        onPageClick: function (page, evt) {
		        	location.href='${ctx}/product/ui/search.do?category=${category}&page=' + page;
		        }
		    });
		}
	});
};
</script>