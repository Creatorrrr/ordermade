<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>나의 상품페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }

				<h1>나의 상품페이지</h1>
				<a class="btn btn-default" href="${ctx}/product/ui/register.do" style="display:inline-block">상품 등록</a>
				<div class="fl_right" >
					<form class="navbar-form text-center">
						<div class="form-group">
							<input id="productSearchKeyword" name="keyword" class="form-control" type="text" value="" placeholder="Search Title"  />
						</div>
						<button id="productSearchBtn" type="button" class="fa fa-search btn btn-default">검색</button>
						<button class="fa fa-search btn btn-default" type="button" title="Search" onclick="javascript:pagination('makerid');productController.getMyProducts(1)">내 상품 전체 보기</button>
					</form>
				</div>
				<div id="listSearchResult" class="nospace listing" style="margin-top:20px; ">
					<!-- products from server -->
				</div>
				<!-- 페이지 구현  -->
				<div id = "pagination"></div>

${box3 }

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	pagination("makerid");
	productController.getMyProducts(1);
});

//검색을 클릭하면 검색된 상품 목록을 가져온다.
$("#productSearchBtn").click(function() {
	var keyword = $("#productSearchKeyword");
	productController.getProductsByMakerIdAndTitle(1, keyword.val());
	keyword.val("");
});
	
var productController = {
	getMyProducts : function(page) {
		$.ajax({
			url : "${ctx}/product/ajax/products/makerid.do?page=" + page,
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
		
	getProductsByMakerIdAndTitle : function(page, title) {
		$.ajax({
			url : "${ctx}/product/ajax/products/MT.do?page=" + page + "&title=" + title,
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
	
	makeContent : function(xml) {
		var content = "";

		content += '<div style="display:inline-block; padding-right: 10px;">';
		content += '	<table class="table" style="width:210px;">';
		content += '		<tr>';
		content += '			<div class="imgl borderedbox">';
		content += '				<a href="${ctx }/product/ui/detail.do?id=' + $(xml).find("product>id").text() + '">';
		content += '					<img src="${ctx }/main/file/download.do?fileName=' + $(xml).find("product>image").text() + '" style="width:105px;height: 100px"; />';
		content += '				</a>';
		content += '			</div>';																			
		content += '		</tr>';
		content += '		<tr class="nospace btmspace-15">';
		content += '			<td>상품명</td>';
		content += '			<td class="creatorId">' + $(xml).find("product>title").text() + '</td>';
		content += '		</tr>';
		content += '		<tr class="nospace btmspace-15">';
		content += '			<td>가격</td>';
		content += '			<td class="creatorId">' + $(xml).find("product>price").text() + '원</td>';
		content += '		</tr>';
		content += '		<tr class="nospace btmspace-15">';
		content += '			<td>제작항목</td>';
		content += '			<td class="creatorId">' + $(xml).find("product>category").text() + '</td>';
		content += '		</tr>';
		content += '	</table>';
		content += '</div>';
		
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
function pagination(doName){
	$.ajax({
		url : "${ctx}/product/pages/" + doName + ".do",
		type : "get",
		dataType : "text",
		success : function(pages) {
		    $('#pagination').pagination({	// 페이지 총 개수를 구한 다음 생성
		        items: pages,
		        itemOnPage: 10,
		        cssStyle: 'light-theme',
		        onPageClick: function (page, evt) {
		        	productController.getMyProducts(page);
		        }
		    });
		}
	});
};
</script>