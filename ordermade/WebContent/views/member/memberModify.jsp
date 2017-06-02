<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<!-- Header ========================================================================================== -->
<head>
<%@ include file="/views/common/head.jsp"%>
</head>
<title>회원 정보 수정</title>
<!-- Main Body ========================================================================================== -->
<body>
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear">
			<div class="sidebar one_third first">
				<%@ include file="/views/common/myPageNav.jsp"%>
			</div>
			<div id="content" class="two_third">
				<h3>회원 정보 수정</h3>
				<br>
				<form id="modifyForm">
					<table class="table">
						<tr>
							<th><label for="id">ID</label></th>
							<td><input id="id" name="id" class="form-control" type="text"
								value="${member.id }" disabled></td>
						</tr>
						<tr>
							<th><label for="password">비밀번호</label></th>
							<td><input id="password" name="password" class="form-control"
								type="password" value="" placeholder="비밀번호를 입력해주세요."></td>
						</tr>
						<tr>
							<th><label for="password2">비밀번호 확인</label></th>
							<td><input id="password2" class="form-control"
								type="password" value="" placeholder="비밀번호를 다시 입력해주세요."></td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input id="name" name="name" class="form-control"
								type="text" value="${member.name }"></td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td><input id="email" name="email" class="form-control"
								type="email" value="${member.email }"></td>
						</tr>
						<tr>
							<th><label for="address">주소</label></th>
							<td><input id="address" name="address" class="form-control"
								type="text" value="${member.address }"></td>
						</tr>
						<tr>
							<th><label for="introduce">소개글</label></th>
							<td><textarea rows="10" cols="75" id="introduce"
									name="introduce" class="form-control">${member.introduce }</textarea></td>
						</tr>
						<tr>
							<th><label>고객/사업자</label></th>
							<td>
								<input type="radio" name="memberType" id="memberTypeC" value="C" 
								<c:if test="${member.memberType eq 'C'}">checked="checked"</c:if>>
								<label for="memberTypeC">고객</label>
								<input type="radio" name="memberType" id="memberTypeM" value="M"
								<c:if test="${member.memberType eq 'M'}">checked="checked"</c:if>>
								<label for="memberTypeM">사업자</label>
							</td>
							
						</tr>
						<tr>
							<th><label for="license">사업 번호</label></th>
							<td><input id="licenseNumber" name="licenseNumber"
								class="form-control" type="text" value="${member.licenseNumber }"></td>
						</tr>
						<tr>
							<th><label>이미지 업로드</label></th>
							<td>
								<div id='imageuploader'>Upload</div>
								<div><img id='memberImage' src="${ctx }/main/file/download.do?fileName=${member.image }" style="width:100px"></div>
								<input id="memberImageHidden" name="image" type="hidden" value="${member.image }">
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<input class="btn" type="reset" value="취소">
						<input class="btn btn-success" type="button" value="수정" onclick="javascript:memberController.modifyMember()">
					</div>
				</form>
			</div>
		</main>
	</div>
</div>

<%@include file="/views/common/footer.jsp"%>

<script type="text/javascript">
$( document ).ready(function() {
	imageUploader();
});

$(function() {
	$("#modifyForm").validate({
		rules : {
			id : "required",
			name : {
				required : true,
				minlength : 2
			},
			password : {
				required : true,
				minlength : 5
			},
			password2 : {
				required : true,
				minlength : 5,
				equalTo : "#password"
			},
			email : {
				required : true,
				email : true
			}
		},
		messages : {
			id : "ID를 입력해주세요.",
			name : "이름을 입력해주세요.",
			password : {
				required : "비밀번호를 입력해주세요.",
				minlength : "비밀번호는 5자 이상이여야 합니다."
			},
			password2 : {
				required : "비밀번호를 확인을 입력해주세요.",
				minlength : "비밀번호는 5자 이상이여야 합니다.",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			email : {
				required : "이메일을 입력해주세요."
			},
			memberType : {
				required : "회원 종류를 선택해 주세요."
			}
		}
	});
});

var imageUploader = function() {
	$("#imageuploader").uploadFile({
		url:"${ctx}/main/file/upload.do",
		acceptFiles:"image/*",
		fileName:"upload",
		returnType:"text",
		showStatusAfterSuccess:false,
		onSuccess:function(files,data,xhr,pd)
		{
			var result = data;
			if(result === "fail") {
				alert("이미지 업로드 실패")
			} else {
				$("#memberImage").attr("src", "${ctx}/main/file/download.do?fileName=" + data);
				$("#memberImageHidden").val(data);
			}
		},
	});	
};

var memberController = {
	modifyMember : function() {
		$('#modifyForm').ajaxForm({
			url : "${ctx }/member/modify.do",
			enctype : "multipart/form-data",
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						location.href="${ctx}/member/myPage.do"
					} else {
						location.href="${ctx}/member/modify.do"
					}
					javascript:$.unblockUI();
			}
		});
		$("#modifyForm").submit();
	}
};
</script>

</body>
</html>