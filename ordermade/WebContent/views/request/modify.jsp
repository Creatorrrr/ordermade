<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="/views/common/head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>
		<div id="content" class="two_third">
			<h1>의뢰서 수정 페이지</h1>
			<br>
			<form id="requestModifyForm">
				<input name="id" type="hidden" value="${request.id }">
				<input name="maker.id" type="hidden" value="${request.maker.id }">
				<table class="table" style="color:black">
					<tr>
						<th>제작 항목</th>
						<td>
							<select name="type" id="type" class="form-control">
								<option value="funiture" <c:if test="${request.category eq 'FUNITURE' }">selected</c:if>>가구</option>
								<option value="clothing"<c:if test="${request.category eq 'CLOTHING' }">selected</c:if>>의류</option>
								<option value="accessory"<c:if test="${request.category eq 'ACCESSORY' }">selected</c:if>>악세사리</option>
								<option value="digital"<c:if test="${request.category eq 'DIGITAL' }">selected</c:if>>디지털</option>
								<option value="kitchen"<c:if test="${request.category eq 'KITCHEN' }">selected</c:if>>주방</option>
								<option value="sport"<c:if test="${request.category eq 'SPORT' }">selected</c:if>>스포츠</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>의뢰 제목</th>
						<td>
							<input id="requestTitle" name="title" 
							class="form-control" type="text" value="${request.title }">
						</td>
					<tr>
					<tr>
						<th>의뢰 상세 내용</th>
						<td>
							<textarea id="requestContent" name="content"
								class="form-control" rows="7">${request.content }</textarea>
						</td>
					</tr>
					<tr>
						<th>희망 금액</th>
						<td>
							<input id="requestHopePrice" name="hopePrice" 
							class="form-control" type="text" value="${request.hopePrice }">
						</td>
					</tr>
					<tr>
						<th>공개 여부</th>
						<td>
							<input type="radio" name="bound" id="boundPublic" value="PUBLIC">
							<label for="boundPublic">공개</label>
							<input type="radio" name="bound" id="boundPrivate" value="PRIVATE" 
								checked="checked">
							<label for="boundPrivate">비공개</label>
						</td>
					</tr>
				</table>
				<div align="right">
					<input class="btn" type="reset" value="취소"
						onclick="javascript:window.location='${ctx }/request/ui/detail.do?id=${request.id }'">
					<input id="modifyBtn" class="btn btn-success" type="button" value="수정" onclick="return checkIt()">
				</div>
			</form>
			<br>
		</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javaScript">
	//저장버튼 구현
	$("#modifyBtn").click(function() {
		if(checkIt()){
			$.ajax({
				url : "${ctx}/request/xml/modify.do",
				type : "post",
				data : $('#requestModifyForm').serialize(),
				dataType : "text",
				success : function(data) {
					if(data=="true"){
						location.href="${ctx}/request/ui/detail.do?id=${request.id}";//성공시 페이지 전환
					}
				},
				error: function(xml){
					console.log("실패 메세지:\n"+xml.responseText);
				}
				
			});
		}
	});

	function checkIt() {
		if (!requestTitle.value) {
			alert("제목을 입력하세요");
			return false;
		}
		if (!requestContent.value) {
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>
</body>
</html>