<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>로그인</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>



<div class="wrapper row3">
	<div class="rounded">
		<div  id="loginBox">
		<main class="container clear">
			<h1>로그인</h1>
			<form id="loginForm">
				<table class="table">
					<tr>
						<th>ID</th>
						<td><input id="loginId" name="id" class="form-control"
							type="text" value="" placeholder="ID를 입력해주세요."></td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input id="password" name="password" class="form-control"
							type="password" value="" placeholder="비밀번호를 입력해주세요." onkeydown="if(event.keyCode==13) memberController.loginMember();"></td>
					</tr>
				</table>
				<br>
				<div align="center">
					<input class="btn btn-success" type="button" value="로그인" onclick="memberController.loginMember()">
					<input class="btn" type="reset" value="취소"> 
				</div>
			</form>
		</main>
		</div>
	</div>
</div>



<script type="text/javascript">
var memberController = {
	loginMember : function() {	// 작업중
		$('#loginForm').ajaxForm({
			url : "${ctx }/member/login.do",
			type : "post",
			dataType : "text",
			success : function(text) {
					if(text === "true") {
						location.href="${ctx}/main/main.do"
					} else {
						alert("로그인 실패");
						location.href="${ctx}/member/login.do"
					}
					javascript:$.unblockUI();
			}
		});
		$("#loginForm").submit();
	}
};
</script>


${box3 }

<%@ include file="/views/common/footer.jsp"%>