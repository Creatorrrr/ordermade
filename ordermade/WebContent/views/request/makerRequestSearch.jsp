<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>

<style type="text/css">
	.requestBox {
		display:inline-block;
		border-style:solid;
		margin:5px;
		width:100%;
	}
	.requestBox input {
		float:right;
		margin:5px;
	}
	.requestBox table {
		color:black;
	}
</style>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
			<div class="sidebar one_third first">
				<%@ include file="/views/common/myPageNav.jsp"%>
			</div>
			<div id="content" class="two_third">
				<div class="content" align="center">
					<h1 align="left">의뢰서 검색</h1>
					<div style="float:right">
						<select id="requestSearchType" class="form-control" style="display:inline-block">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input id="requestSearchKeyword" name="requestSearchKeyword" class="search-box-input"
							type="text" value="" placeholder="Search Here" style="display:inline-block"/>
						<button id="requestSearchBtn" class="fa fa-search" title="Search">
							<em>Search</em>
						</button>
					</div>
				</div> <%-- <c:forEach items="${ box_list }" var="literature"> --%>
				
				<div align="left">
					<button id="allRequests">모든 의뢰서</button>
					<button id="askedRequests">내가 보낸 의뢰서</button>
				</div>
				
				<div id="requestSearchResult">
					<!-- loop start -->
					<div class="requestBox">
						<table class="request_table">
							<tr>
								<td>의뢰명 : </td>
								<td>의뢰의뢰 SAMPLESAMPLESAMPLESAMPLESAMPLE</td>
							</tr>
							<tr>
								<td>의뢰자 : </td>
								<td>의뢰자 SAMPLESAMPLESAMPLESAMPLESAMPLE</td>
							</tr>
							<tr>
								<td>제작항목 : </td>
								<td>카테 SAMPLESAMPLESAMPLESAMPLESAMPLE</td>
							</tr>
							<tr>
								<td>희망 가격 : </td>
								<td>얼마 SAMPLESAMPLESAMPLESAMPLESAMPLE</td>
							</tr>
						</table>
						<input name="" type="button" value="참가">
					</div>
					<!-- loop end -->
				</div>
			</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

</body>
<script type="text/javascript">	
$(document).ready(function() {
	searchRequest.getRequestsByBound(1);
	//searchRequest.getRequestsByBoundAndTitle(1,1);	// test
	//searchRequest.getRequestsByBoundAndContent(1,2);	// test
});

// 모든 의뢰서를 클릭하면 모든 의뢰서 목록을 가져온다.
$("#allRequests").click(function() {
	searchRequest.getRequestsByBound(1);
});

// 내가 보낸 의뢰서를 클릭하면 내가 보낸 의뢰서 목록을 가져온다.
$("#askedRequests").click(function() {
	searchRequest.getMyInviteRequestsForMaker(1);
});

// 검색을 클릭하면 검색된 의뢰서 목록을 가져온다.
$("#requestSearchBtn").click(function() {
	var type = $("#requestSearchType option:selected").val();
	if(type === "title") {
		searchRequest.getRequestsByBoundAndTitle(1, $("#requestSearchKeyword").val());
	} else if(type === "content") {
		searchRequest.getRequestsByBoundAndContent(1, $("#requestSearchKeyword").val());
	}
});

var searchRequest = {
	getRequestsByBound : function(page) {
		$.ajax({
			url : "${ctx}/request/xml/searchBound.do?page=" + page,
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("request");
					var listLength = xmlData.length;
					$("#requestSearchResult").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function(){
							contentStr += searchRequest.makeContent(this);
						});
						$("#requestSearchResult").append(contentStr);
					}
				}
			});
		},
		
	getRequestsByBoundAndTitle : function(page, title) {
		$.ajax({
			url : "${ctx}/request/xml/searchBoundAndTitle.do?page=" + page + "&title=" + title,
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("request");
					var listLength = xmlData.length;
					$("#requestSearchResult").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += searchRequest.makeContent(this);
						});
						$("#requestSearchResult").append(contentStr);
					}
				}
			});
		},
	
	getRequestsByBoundAndContent : function(page, content) {
		$.ajax({
			url : "${ctx}/request/xml/searchBoundAndContent.do?page=" + page + "&content=" + content,
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("request");
					var listLength = xmlData.length;
					$("#requestSearchResult").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += searchRequest.makeContent(this);
						});
						$("#requestSearchResult").append(contentStr);
					}
				}
			});
		},
		
		getMyInviteRequestsForMaker : function(page) {
			$.ajax({
				url : "${ctx}/request/xml/searchMyInviteRequestsForMaker.do?page=" + page,
				type : "get",
				dataType : "xml",
				success : function(xml) {
						var xmlData = $(xml).find("inviterequest>request");
						var listLength = xmlData.length;
						$("#requestSearchResult").empty();
						if (listLength) {
							var contentStr = "";
							$(xmlData).each(function() {
								contentStr += searchRequest.makeContentForAsked(this);
							});
							$("#requestSearchResult").append(contentStr);
						}
					}
				});
			},
	
	makeContent : function(xml) {
		var content = "";
		
		content += "<div class='requestBox'>";
		content += 	"<table class='request_table'>";
		content += 		"<tr>";
		content += 			"<td>의뢰명 : </td>";
		content += 			"<td><p>" + $(xml).find("request>title").text() + "</p></td>";
		content += 		"</tr>";
		content += 		"<tr>";
		content += 			"<td>의뢰자 : </td>";
		content += 			"<td>" + $(xml).find("request>consumer>id").text() + "</td>";
		content += 		"</tr>";
		content += 		"<tr>";
		content += 			"<td>제작항목 : </td>";
		content += 			"<td>" + $(xml).find("request>category").text() + "</td>";
		content += 		"</tr>";
		content += 		"<tr>";
		content += 			"<td>희망 가격 : </td>";
		content += 			"<td>" + $(xml).find("request>hopePrice").text() + "</td>";
		content += 		"</tr>";
		content += 	"</table>";
		content += 	"<input name='' type='button' value='참가'>";
		content += "</div>";

		return content;
	},
			
	makeContentForAsked : function(xml) {
		var content = "";
		
		content += "<div class='requestBox'>";
		content += 	"<table class='request_table'>";
		content += 		"<tr>";
		content += 			"<td>의뢰명 : </td>";
		content += 			"<td><p>" + $(xml).find("request>title").text() + "</p></td>";
		content += 		"</tr>";
		content += 		"<tr>";
		content += 			"<td>의뢰자 : </td>";
		content += 			"<td>" + $(xml).find("request>consumer>id").text() + "</td>";
		content += 		"</tr>";
		content += 		"<tr>";
		content += 			"<td>제작항목 : </td>";
		content += 			"<td>" + $(xml).find("request>category").text() + "</td>";
		content += 		"</tr>";
		content += 		"<tr>";
		content += 			"<td>희망 가격 : </td>";
		content += 			"<td>" + $(xml).find("request>hopePrice").text() + "</td>";
		content += 		"</tr>";
		content += 	"</table>";
		content += 	"<input type='button' value='진행중' disabled>";
		content += "</div>";

		return content;
	}
};
</script>
</html>