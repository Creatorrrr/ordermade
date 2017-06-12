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
			의뢰서<c:if test="${request.maker ne null}"> - ${request.maker.id }님과 매칭되었습니다.</c:if>
			<button id="removeRequest" class="fl_right btn btn-default" onclick="javascript:location.href='${ctx}/request/xml/remove.do?id=${request.id }'">삭제</button>
			<button id="btn1" class="fl_right btn btn-default" onclick="javascript:location.href='${ctx}/request/ui/modify.do?requestId=${request.id }'">수정</button>
		</h1>
		<table class="table" style="color: black">
			<tr>
				<td>
					<p>의뢰 내용</p>
					<div style="word-break:break-all">
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
			<c:if test="${request.maker ne null }">
				<c:choose>
					<c:when test="${sessionScope.memberType eq 'C'}">
						<c:choose>
							<c:when test="${request.price eq 0 }"></c:when>
							<c:when test="${request.payment eq 'N' }">
								<p align="right">결제금액: ${request.price }원</p>
								<input id="requestPayment" type="button" onclick="dealController.consumerMoneyToAccount();" 
								 class="btn btn-default" value="결제" style="float:right">
							</c:when>
							<c:when test="${request.payment eq 'Y' }">
								<p align="right">결제금액: ${request.price }원</p>
								<input type="button" class="btn btn-default" value="결제완료" style="float:right" disabled>
							</c:when>
						</c:choose>
					</c:when>
					<c:when test="${sessionScope.memberType eq 'M'}">
						<form id="registerPayment">
							<p align="right">
								결제금액: 
								<input name="id" type="hidden" value="${request.id }">
								<input name="price" class="form-control" type="number" style="width:200px;display: inline-block" value="${request.price }">원
							</p>
							<input type="button" class="btn btn-default" value="등록" style="float: right" onclick="registerPayment()">
						</form>
					</c:when>
				</c:choose>
			</c:if>
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

$("#removeRequest").click(function() {
	$.ajax({
		url : "${ctx}/request/xml/remove.do?id=${request.id }",
		type : "get",
		dataType : "text",
		success : function(text) {
				if(text === "true") {
					location.href='${ctx}/request/ui/myRequest.do';
				}
		}
	});
});

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



var registerPayment = function() {
	$.ajax({
		url : "${ctx }/request/xml/modifyPaymentValue.do",
		data : $("#registerPayment").serialize(),
		type : "post",
		dataType : "text",
		success : function(text) {
				if(text === "true") {
					alert("등록되었습니다.");
				}
		}
	});
}

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
		var innerData = comment.html();
		var contentStr = "";
		
		contentStr += "<textarea id='commentModifyContent' class='commentModifyContent' rows='5'></textarea>";
		contentStr += "<div style='float:right'>";
		contentStr += 	"<button class='btn btn-default' onclick='javascript:commentController.modifyComment(" + commentId + ");commentController.modifyFormFlag=false;'>코멘트 수정</button>";
		contentStr += 	"<button class='btn btn-default' onclick='javascript:commentController.getCommentsByRequestId(\"${request.id}\", 1);commentController.modifyFormFlag=false;'>취소</button>";
		contentStr += "</div>";

		comment.empty().append(contentStr);
		
		CKEDITOR.replace('commentModifyContent', {
			imageUploadUrl : '${ctx}/main/file/uploadJson.do',
			filebrowserUploadUrl: '${ctx}/main/file/uploadJson.do'
		});
		
		CKEDITOR.instances.commentModifyContent.setData(innerData);
	},
	
	modifyComment : function(commentId) {
		$.ajax({
			url : "${ctx }/comment/xml/modify.do",
			data : {id : commentId,
					'request.id' : "${request.id}",
					content : CKEDITOR.instances.commentModifyContent.getData(),
					contentType : 'C'},
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						CKEDITOR.instances.commentModifyContent.destroy();
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
		content += 		"<div class='commentWriterBox'><img class='imgl borderedbox' src='${ctx}/main/file/download.do?fileName=" + $(xml).find("comment>member>image").text() + "'></div>";
		content += 		"<div class='commentControlBox'>";
		content += 			"<p>작성자 : " + $(xml).find("comment>member>id").text() + "</p>";
		if($(xml).find("comment>member>id").text() === "${sessionScope.loginId}") {
			if($(xml).find("comment>contentType").text() === "C") {
				content += 		"<button class='btn btn-default' onclick='javascript:if(commentController.modifyFormFlag===true)return false;commentController.modifyCommentForm(" + $(xml).find("comment>id").text() + ");commentController.modifyFormFlag=true;'>수정</button>";
			}
			content += 		"<button class='btn btn-default' onclick='javascript:commentController.removeComment(" + $(xml).find("comment>id").text() + ")'>삭제</button>";
		}
		content += 		"</div>";
		content += 		"<div id='commentContentBox-" + $(xml).find("comment>id").text() + "' class='commentContentBox'>";
		if($(xml).find("comment>contentType").text() === "C") {
			content += 		$(xml).find("comment>content").text();
		} else if($(xml).find("comment>contentType").text() === "F") {
			content += 		'<a href="${ctx }/main/file/download.do?fileName=' + $(xml).find("comment>content").text() + '" download="' + $(xml).find("comment>content").text() + '">';
			content += 		'	<img src="${ctx }/views/images/file_icon.png" style="width:50px;margin-top:15px">' + $(xml).find("comment>content").text();
			content += 		'</a>';
		}
		content += 		"</div>";
		content += '</div>';
		return content;
	}
};

// set purchaseHistory with xml
var dealController = {
	consumerMoneyToAccount : function(){
		$.ajax({
			type: "get",
			url: "${ctx }/deal/xml/account/consumerMoney.do",
			data: {"requestId" : "${request.id}"},
			dataType: "text",
			success: function(text){
				if(text === "true") {
					alert("결제되었습니다.");
					$("#requestPayment").val("결제완료").attr("disabled", true);									
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