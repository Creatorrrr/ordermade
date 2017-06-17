<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>의뢰서 등록</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }
	
			<h1>의뢰서 등록 페이지<c:if test="${productTitle ne null }">(상품명 : ${productTitle})</c:if></h1>
			<br>
			<form action="${ctx }/request/xml/register.do" method="post" id="form1" name="form1" enctype="multipart/form-data" onsubmit="return checkIt()">
				<table class="table">
					<c:choose>
						<c:when test="${makerId ne null }">
							<tr>
								<th>제작자</th>
								<td><input class="form-control" type="text" value="${makerId}" disabled></td>
							</tr>
							<tr>
								<th>제작 항목</th>
								<td>
									<input name="category" type="hidden" value="${category}">
									<input class="form-control" type="text" value="${category}" disabled>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th>제작 항목<span>*</span></th>
								<td><div id="category"></div></td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<th>의뢰 제목<span>*</span></th>
						<td><input id="requestTitle" name="title" class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>의뢰 상세 내용<span>*</span></th>
						<td>
							<textarea id="requestContent" class="form-control" rows="7"></textarea>
							<input id="requestContentHidden" name="content" type="hidden">
						</td>
					</tr>

					<tr>
						<th>희망 금액<span>*</span></th>
						<td><input id="hopePrice" name="hopePrice" class="" type="number" value=""></td>
					</tr>
					<tr>
						<th>공개 여부<span>*</span></th>
						<td>
							<c:if test="${makerId ne null }"><input name="bound" type="hidden" value="PRIVATE"></c:if>
							<input type="radio" name="bound" id="boundPublic" value="PUBLIC" <c:if test="${makerId ne null }">disabled</c:if>><label for="boundPublic">공개</label>
							<input type="radio" name="bound" id="boundPrivate" value="PRIVATE" checked <c:if test="${makerId ne null }">disabled</c:if>><label for="boundPrivate">비공개</label>
						</td>
					</tr>
				</table>
				<div align="center">
					<input class="btn btn-default" type="button" id="btn" name="btn" value="저장">
					<input class="btn btn-default" type="reset" value="취소">
				</div>
			</form>


${box3 }

<%@ include file="/views/common/footer.jsp"%>	
			
<script type="text/javaScript">

	//html구조가 모두 인클루드 된후 실행
	$(document).ready(function() {
		CKEDITOR.replace('requestContent', {
			imageUploadUrl : '${ctx}/main/file/uploadJson.do',
			filebrowserUploadUrl: '${ctx}/main/file/uploadJson.do'
		});
		
		$.ajax({
			url : "${ctx}/main/xml/categoryList.do",
			type : "get",
			dataType : "xml",
			success : function(xml) {
				var categoryId = "${categoryId}";
				var rs = '<select name="category" id="category" class="form-control">';
				var list = $(xml).find("category > type");
				console.log(list.size());
				list.each(function(){
					rs += '<option value"' + $(this).text() + '""';
					if(categoryId == $(this).text()){
						rs += 'selected="selected"';
					}
						rs += '>' + $(this).text() + '</option>';
				});
				rs += '</select>';
				$("#category").html(rs);
			},
			error: function(xml){
				$("#category").html('<select name="category" id="category" class="form-control">'
									+'<option value="가구" selected="selected">가구</option>'
									+'<option value="의류">의류</option>'
									+'<option value="악세사리">악세사리</option>'
									+'<option value="디지털">디지털</option>'
									+'<option value="주방">주방</option>'
									+'<option value="스포츠">스포츠</option>'
								+'</select>');
			}
		});
		
		//저장버튼 구현
		$("#btn").click(function() {
			console.log("--------------test------------");
			if(checkIt()){
				$("#requestContentHidden").val(CKEDITOR.instances.requestContent.getData());
				$.ajax({
					type : "post",
					url : "${ctx}/request/xml/register.do",
					data : $('#form1').serialize(),
					dataType : "text",
					success : function(resultData) {
						if(resultData != "error"){
							if("${makerId}" != "") {
								joinRequest(resultData);
							}
							location.href="${ctx}/request/ui/detail.do?id=" + resultData;	//성공시 페이지 전환
						} else {
							alert("의뢰서 등록 실패");
						}
					},
					error: function(xml){
						console.log("실패 메세지:\n"+xml.responseText);
					}
					
				});
			}
		});
		
		function joinRequest(requestId) {
			$.ajax({
				type : "post",
				url : "${ctx}/request/xml/registerInviteRequest.do",
				data : {'maker.id' : "${makerId}",
						'request.id' : requestId,
						form : "I"},
				dataType : "text",
				success : function(resultData) {
					if(resultData == "error"){
						alert("초대 요청 실패");
					}
				},
				error: function(xml){
					console.log("실패 메세지:\n"+xml.responseText);
				}
				
			});
		};
		
		//필수 입력값 체크 
		function checkIt() {
			
			var form1 = document.form1;
			
			if (!form1.requestTitle.value) {
				alert("제목을 입력하세요");
				return false;
			}else if (CKEDITOR.instances.requestContent.getData().length < 1) {
				alert("내용을 입력하세요");
				return false;
			}else if(!form1.hopePrice.value){
				alert("희망금액을 입력하세요");
				return false;
			}
			return true;
		};

	});

</script>