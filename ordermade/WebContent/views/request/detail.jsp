<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>의뢰서</title>
<%@ include file="/views/common/_common.jsp"%>

	<style type="text/css">
		.commentListStyle li p {
			margin: 5px 0 5px 0;
		}
		
		.ajax-upload-dragdrop
		{
		  border:2px dotted #A5A5C7;
		  width:420px;
		  height:300px;
		  color: #DADCE3;
		  text-align:left;
		  vertical-align:middle;
		  padding:10px 10px 0px 10px;
		}
	</style>
	
${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
	<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }


	<div class="content" align="center">
		<h1 align="left" style="line-height:200%">
			의뢰서
			<button id="btn2" class="fl_right btn btn-default" onclick="javascript:location.href='${ctx}/request/xml/remove.do?id=${request.id }'">삭제</button>
			<button id="btn1" class="fl_right btn btn-default" onclick="javascript:location.href='${ctx}/request/ui/modify.do?requestId=${request.id }'">수정</button>
		</h1>
		<table class="table" style="color: black">
			<tr>
				<td>
					<p>의뢰 내용</p>
					<div>
						${request.content }
					</div>
				</td>
			</tr>
			<tr>
				<td><p>의뢰 명 : ${request.title}</p></td>
			</tr>
			<tr>
				<td><p>의뢰자 : ${request.consumer.id }</p></td>
			</tr>
			<tr>
				<td><p>제작 항목 : ${request.category }</p></td>
			</tr>
			<tr>
				<td><p>희망 가격 : ${request.hopePrice }</p></td>
			</tr>
		</table>
		<table class="table" style="color: black">
			<tr>
				<td>
					<h3 style="line-height:200%">
						대화 기록
						<!-- <button  class="btn btn-default" style="float: right;">파일함</button> -->
					</h3>
				</td>
			</tr>
			<tr>
				<td>
					<div id="commentList">
						<!-- comments from server -->
					</div>
	            </td>
			</tr>
			<tr><td><h3>추가 요구 사항</h3></td></tr>
			<tr>
				<td>
					<div id="tabs">
						<ul>
					    	<li><a href="#tabs-1">코멘트 입력</a></li>
					    	<li><a href="#tabs-2">파일 업로드</a></li>
						</ul>
						<div id="tabs-1">
							<textarea id="commentRegisterContent" rows="5" style="width:100%"></textarea>
							<div align="right">
								<button id="commentRegister" class="btn btn-default">코멘트 등록</button>
							</div>
						</div>
						<div id="tabs-2">
							<div id='fileuploader'>Upload</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<div>
			<c:choose>
				<c:when test="${sessionScope.memberType eq 'C'}">
					<p align="right">제작기간 : 일</p>
					<p align="right">결제금액 (배송비 포함): ${request.price }원</p> 
					<input type="button" name="" onclick="setPurchaseHistory.registerPurchaseHistory();" 
						 class="btn btn-default" value="결제" style="float:right">
				</c:when>
				<c:when test="${sessionScope.memberType eq 'M'}">
					<p align="right">
						제작기간 :<input name="" type="text" value=""
							style="display: inline-block">일
					</p>
					<p align="right">
						결제금액 (배송비 포함): <input name="" type="text" value=""
							style="display: inline-block">원
					</p>
					<input type="button" name=""  class="btn btn-default" value="등록" style="float: right">
				</c:when>
			</c:choose>
		</div>
	</div>




<script type="text/javascript">
$(document).ready(function() {
	$("#tabs").tabs({active:2});
	fileUploader();
	commentController.getCommentsByRequestId("${request.id}", 1);
});

CKEDITOR.replace('commentRegisterContent', {
	imageUploadUrl : '${ctx}/main/file/uploadJson.do',
	filebrowserUploadUrl: '${ctx}/main/file/uploadJson.do'
});

var fileUploader = function() {
	$("#fileuploader").uploadFile({
		url:"${ctx}/main/file/upload.do",
		fileName:"upload",
		dragdropWidth:"95%",
		dragdropHeight:"500px",
		returnType:"text",
		showStatusAfterSuccess:false,
		onSuccess:function(files,data,xhr,pd)
		{
			var result = data;
			if(result === "fail" || result === "error") {
				alert("이미지 업로드 실패")
			} else {
				commentController.registerComment(data, "F");
			}
		},
	});	
};

$("#commentRegister").click(function() {
	var editor = CKEDITOR.instances.commentRegisterContent;
	if(editor.getData().length < 1){
		alert("내용을 입력해 주세요.");
	} else {
		commentController.registerComment(editor.getData(), "C");
		editor.setData("");
	}
});

$("#paymentButton").click(function(){
	setPurchaseHistory.registerPurchaseHistory();
});

// get comments with xml
var commentController = {
	modifyFormFlag : false,
		
	registerComment : function(content, type) {
		$.ajax({
			url : "${ctx }/comment/xml/register.do",
			data : {'request.id' : "${request.id}",
					content : content,
					contentType : type},
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						commentController.getCommentsByRequestId("${request.id}", 1);
					}
			}
		});
	},
	
	modifyCommentForm : function(commentId) {
		var comment = $("#commentContentBox-" + commentId);
		var contentStr = "";
		
		contentStr += "<p class='commentWriter'><strong>" + comment.children(".commentWriter").text() + "</strong></p>"
		contentStr += "<textarea class='commentModifyContent' rows='5' style='width:100%'>" + comment.children(".commentContent").text() + "</textarea>";
		contentStr += "<div style='float:right'>";
		contentStr += 	"<button onclick='javascript:commentController.modifyComment(" + commentId + ")'>코멘트 수정</button>";
		contentStr += 	"<button onclick='javascript:commentController.getCommentsByRequestId(\"${request.id}\", 1)'>취소</button>";
		contentStr += "</div>";

		comment.empty().append(contentStr);
	},
	
	modifyComment : function(commentId) {
		$.ajax({
			url : "${ctx }/comment/xml/modify.do",
			data : {id : commentId,
					'request.id' : "${request.id}",
					content : $("#commentContent-" + commentId + ">.commentModifyContent").val()},
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						commentController.getCommentsByRequestId("${request.id}", 1);
					}
			}
		});
	},
	
	removeComment : function(id) {
		$.ajax({
			url : "${ctx }/comment/xml/remove.do?id=" + id,
			type : "get",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						commentController.getCommentsByRequestId("${request.id}", 1);
					}
			}
		});
	},
	
	getCommentsByRequestId : function(requestId, page) {
		$.ajax({
			url : "${ctx}/comment/xml/searchRequestId.do?requestId=" + requestId + "&page=" + page,
			type : "get",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("comment");
					var listLength = xmlData.length;
					$("#commentList").empty();
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += commentController.makeContent(this);
						});
						$("#commentList").append(contentStr);
					}
			}
		});
	},
	
	makeContent : function(xml) {
		var content = "";

		content += "<div class='commentBox'>";
		content += 		"<div id='commentContentBox-" + $(xml).find("comment>id").text() + "' class='commentContentBox' style='width:550px;'>";
		content += 			"<div class='commentControlBox'>";
		content += 				"<p>작성자 : " + $(xml).find("comment>member>id").text() + "</p>";
		if($(xml).find("comment>member>id").text() === "${sessionScope.loginId}") {
			content += 			"<button class='btn btn-default' onclick='javascript:if(commentController.modifyFormFlag===true)return false;commentController.modifyCommentForm(" + $(xml).find("comment>id").text() + ");commentController.modifyFormFlag=true;'>수정</button>";
			content += 			"<button class='btn btn-default' onclick='javascript:commentController.removeComment(" + $(xml).find("comment>id").text() + ")'>삭제</button>";
		}
		content += 			"</div>";
		if($(xml).find("comment>contentType").text() === "C") {
			content += '<p class="commentContent" style="﻿word-break:break-word;">' + $(xml).find("comment>content").text() + '</p>';
		} else if($(xml).find("comment>contentType").text() === "F") {
			content += '<p class="commentContent">';
			content += '	<a href="${ctx }/main/file/download.do?fileName=' + $(xml).find("comment>content").text() + '" download="' + $(xml).find("comment>content").text() + '">';
			content += '		<img src="${ctx }/views/images/file_icon.png" style="width:50px">' + $(xml).find("comment>content").text();
			content += '	</a>';
			content += '</p>';
		}
		content += 		"</div>";
		content += 		"<div class='commentWriterBox'><img class='imgl borderedbox' src='${ctx}/main/file/download.do?fileName=" + $(xml).find("comment>member>image").text() + "'></div>"
		content += '</div>';
		return content;
	}
};

// set purchaseHistory with xml
var setPurchaseHistory = {
		registerPurchaseHistory : function(){
			$.ajax({
				type: "post",
				url: "${ctx }/deal/xml/account/consumerMoney.do",
				data: {"request.id" : "${request.id}",
						"consumer.id" : "${request.consumer.id}",
						"maker.id" : "${request.maker.id}",
						"invoiceNumber":"0",
						"deliveryStatus":"no",
						"payment" : "${sessionScope.memberType}"},
				dataType: "text",
				success: function(text){
							if(text === "true") {
								// 성공시 purchaseHistory UI 페이지 전환
								location.href="${ctx }/deal/ui/transaction.do?page=" + "1";										
							}
				},
				error: function(xml){
					console.log("실패 메시지 : \n" + xml.responseText)
				}
			});
		}
};
</script>


${box3 }

<%@ include file="/views/common/footer.jsp"%>