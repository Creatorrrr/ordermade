<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/common/_html.jsp"%>
<title>의뢰서 등록</title>
<%@ include file="/resources/common/_common.jsp"%>

${head_body}
<%@ include file="/resources/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }
		
			<h1>의뢰서 등록 페이지</h1>
			<br>
			<form action="${ctx }/request/xml/register.do" method="post" name="" onsubmit="return checkIt()">
				<input name="" type="hidden" value="${categoryId }">
				<table class="table">
					<tr>
						<th>제작 항목</th>
						<td><select name="type" id="type" class="form-control">
								<option value="id">가구</option>
								<option value="id">의류</option>
								<option value="id">악세사리</option>
								<option value="id">디지털</option>
								<option value="id">주방</option>
								<option value="id">스포츠</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>의뢰 제목</th>
						<td><input id="requestTitle" name="productTitle" class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>의뢰 상세 내용</th>
						<td><textarea id="requestContent" name="productContent" class="form-control" rows="7"></textarea>
					</tr>
					<tr>
						<th>참고 이미지</th>
						<td><input id="" name="" class="btn btn-success" type="file" value="찾아보기"></td>
					<tr>
					<tr>
						<th>희망 금액</th>
						<td><input id="" name="" class="" type="text" value=""></td>
					</tr>

				</table>
				<div align="center">
					<input class="btn" type="reset" value="취소하기" onclick="javascript:window.location='${ctx }/post/list.do?boardId=${boardId }'">
					<input class="btn btn-success" type="submit" value="저장하기">
				</div>
			</form>

${box3 }


<script type="text/javaScript">
	function checkIt() {

		var pregister = document.pregister;

		if (!pregister.requestTitle.value) {
			alert("제목을 입력하세요");
			return false;
		}
		if (!pregister.requestContent.value) {
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>

<%@ include file="/resources/common/footer.jsp"%>