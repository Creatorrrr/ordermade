<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>의뢰서 검색</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

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
		border-style:none;
	}
</style>


${box1 }
		
	<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }

	<h1 align="left">의뢰서 검색</h1>
	<div class="fl_right">
		<form class="navbar-form text-center">
			<select id="requestSearchType" class="form-control" style="display:inline-block">
					<option value="title">제목</option>
					<option value="content">내용</option>
			</select>
			<input id="requestSearchKeyword" name="requestSearchKeyword" class="form-control"
					type="text" value="" placeholder="Search Here" style="display:inline-block"/>
			<button id="requestSearchBtn" class="btn btn-default" title="Search" type="button">검색</button>
		</form>
	</div>
	
	<div class="content" align="left">					
		<div class="btn-group btn-group-justified" id="tabBox">
			<button class="btn btn-default" onclick="javascript:requestController.getRequestsByBound(1);">모든 의뢰서</button>
			<button class="btn btn-default" onclick="javascript:requestController.getMyInviteRequestsForMaker(1);">내가 보낸 의뢰서</button>
		</div>
	</div>
	
	<!-- requests from server -->
	<div id="requestSearchResult"></div>



<script type="text/javascript">	

$(document).ready(function() {
	requestController.getRequestsByBound(1);
	//requestController.getRequestsByBoundAndTitle(1,1);	// test
	//requestController.getRequestsByBoundAndContent(1,2);	// test
});

// 검색을 클릭하면 검색된 의뢰서 목록을 가져온다.
$("#requestSearchBtn").click(function() {
	var type = $("#requestSearchType option:selected").val();
	var keyword = $("#requestSearchKeyword");
	if(type === "title") {
		requestController.getRequestsByBoundAndTitle(1, keyword.val());
	} else if(type === "content") {
		requestController.getRequestsByBoundAndContent(1, keyword.val());
	}
	keyword.val("");
});

var createInviteModal = function(requestId) {
	var contentStr = "";

	contentStr += "<form id='inviteRequestForm'>";
	contentStr += "	<input type='hidden' name='request.id' value='" + requestId + "'>";
	contentStr += "	<input type='hidden' name='form' value='R'>";
	contentStr += "	<div>";
	contentStr += "    	<label>메시지<textarea name='message' rows='5' style='width: 100%' placeholder='메시지를 입력해주세요.'></textarea></label>";
	contentStr += "	</div>";
	contentStr += "	<div align='right'>";
	contentStr += "		<button type='button' class='btn btn-default' onclick='javascript:requestController.registerInviteRequest()'>참가요청 보내기</button>";
	contentStr += "    	<button type='reset' class='btn btn-default' onclick='javascript:$.unblockUI();'>취소</button>";
	contentStr += "	</div>";
	contentStr += "</form>";
	
    $.blockUI({message : contentStr});
};

var requestController = {
	registerInviteRequest : function() {	// 작업중
		$.ajax({
			url : "${ctx }/request/xml/registerInviteRequest.do",
			data : $('#inviteRequestForm').serialize(),
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						alert("참가 요청 성공");
					} else {
						alert("참가 요청 실패");
					}
					javascript:$.unblockUI();
					requestController.getRequestsByBound(1);
			}
		});
	},
			
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
							contentStr += requestController.makeContent(this, "참가");
						});
						$("#requestSearchResult").append(contentStr);
					} else {
						$("#requestSearchResult").append(requestController.makeContentForEmpty());
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
							contentStr += requestController.makeContent(this, "참가");
						});
						$("#requestSearchResult").append(contentStr);
					} else {
						$("#requestSearchResult").append(requestController.makeContentForEmpty());
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
							contentStr += requestController.makeContent(this, "참가");
						});
						$("#requestSearchResult").append(contentStr);
					} else {
						$("#requestSearchResult").append(requestController.makeContentForEmpty());
					}
			}
		});
	},
		
	getMyInviteRequestsForMaker : function(page) {
		$.ajax({
			url : "${ctx}/request/xml/searchMyInviteRequestsForMaker.do?page=" + page + "&form=R",
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("inviterequest>request");
					var listLength = xmlData.length;
					$("#requestSearchResult").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += requestController.makeContent(this, "진행중");
						});
						$("#requestSearchResult").append(contentStr);
					} else {
						$("#requestSearchResult").append(requestController.makeContentForEmpty());
					}
			}
		});
	},
	
	makeContent : function(xml, contentType) {
		var content = "";
		
		content += "<div class='requestBox'>";
		content += 	"<table class='request_table'>";
		content += 		"<tr>";
		content += 			"<td>의뢰명 : </td>";
		content += 			"<td>" + $(xml).find("request>title").text() + "</td>";
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
		if(contentType === "참가") {
			content += 	"<input type='button' class='btn btn-default' value='참가' onclick='javascript:createInviteModal(" + $(xml).find("request>id").text() + ")'>";
		} else if(contentType === "진행중") {
			content += 	"<input type='button' class='btn btn-default' value='요청중' disabled>";
		}
		content += "</div>";

		return content;
	},
	
	makeContentForEmpty : function() {
		var content = "";
		
		content += "<div class='requestBox'>";
		content += 	"<table class='request_table'>";
		content += 		"<tr>";
		content += 			"<td>조건에 해당하는 의뢰서가 없습니다.</td>";
		content += 		"</tr>";
		content += 	"</table>";
		content += "</div>";

		return content;
	}
};
</script>


${box3 }

<%@ include file="/views/common/footer.jsp"%>