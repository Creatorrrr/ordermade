<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>회원 가입</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>



<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear">
			<h3>회원가입</h3>
			<br>
			<form id="registerForm">
				<table class="table">
					<tr>
						<th><label for="id">ID</label></th>
						<td><input id="id" name="id" class="form-control" type="text"
							value="" placeholder="ID를 입력해주세요."></td>
					</tr>
					<tr>
						<th><label for="password">비밀번호</label></th>
						<td><input id="password" name="password" class="form-control"
							type="password" value="" placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<th><label for="password2">비밀번호 확인</label></th>
						<td><input id="password2" name="password2"
							class="form-control" type="password" value=""
							placeholder="비밀번호 확인을 입력해주세요."></td>
					</tr>
					<tr>
						<th><label for="name">이름</label></th>
						<td><input id="name" name="name" class="form-control"
							type="text" value="" placeholder="이름을 입력해주세요."></td>
					</tr>
					<tr>
						<th><label for="email">이메일</label></th>
						<td><input id="email" name="email" class="form-control"
							type="email" value="" placeholder="이메일을 입력해주세요."></td>
					</tr>
					<tr>
						<th><label for="address">주소</label></th>
						<td><input id="address" name="address" class="form-control"
							type="text" value="" placeholder="주소를 입력해주세요."></td>
					</tr>
					<tr>
						<th><label for="introduce">소개글</label></th>
						<td>
							<textarea rows="10" cols="75" id="introduce"
								name="introduce" class="form-control" placeholder="소개"></textarea>
						</td>
					</tr>
					<tr>
						<th><label>고객/사업자</label></th>
						<td>
							<input type="radio" name="memberType" id="memberTypeC" value="C" 
								checked="checked">
							<label for="memberTypeC">고객</label>
							<input type="radio" name="memberType" id="memberTypeM" value="M">
							<label for="memberTypeM">사업자</label>
						</td>
					</tr>
					<tr>
						<th><label for="license">사업 번호</label></th>
						<td><input id="licenseNumber" name="licenseNumber"
							class="form-control" type="text" value=""
							placeholder="사업번호을 입력해주세요."></td>
					</tr>
					<tr>
						<th><label>이미지 업로드</label></th>
						<td>
							<div id='imageuploader'>Upload</div>
							<button onclick="javascript:imageUploader()">다시 업로드 하기</button>
							<div><img id='memberImage' src="" style="width:100px;display:none"></div>
							<input id="memberImageHidden" name="image" type="hidden" value="${member.image }">
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<input class="btn" type="reset" value="취소">
					<input class="btn btn-success" type="button" value="회원가입" 
						onclick="javascript:memberController.registerMember()">
				</div>
			</form>
		</main>
	</div>
</div>




<script type="text/javascript">
$( document ).ready(function() {
	imageUploader();
});

$(function() {
	$("#registerForm").validate({
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
		multiple:false,
		maxFileCount:1,
		returnType:"text",
		onSuccess:function(files,data,xhr,pd)
		{
			var result = data;
			if(result === "fail") {
				alert("이미지 업로드 실패")
			} else {
				$("#memberImage").css("display", "block").attr("src", "${ctx}/main/file/download.do?fileName=" + data);
				$("#memberImageHidden").val(data);
			}
		},
	});	
};

var memberController = {
	registerMember : function() {
		$('#registerForm').ajaxForm({
			url : "${ctx }/member/join.do",
			enctype : "multipart/form-data",
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						location.href="${ctx}/member/login.do"
					} else {
						location.href="${ctx}/member/join.do"
					}
					javascript:$.unblockUI();
			}
		});
		$("#registerForm").submit();
	}
};
</script>

${box3 }

<%@ include file="/views/common/footer.jsp"%>