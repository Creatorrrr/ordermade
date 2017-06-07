<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>마이 페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }



			<ul class="nospace listing">
				<li class="clear">
					<h1>${member.id}님의 정보</h1>
					
					<div class="content" align="left">
						<div class="imgl borderedbox">
							<img src="${ctx }/main/file/download.do?fileName=${member.image}">
						</div>
						<table class="table">
							<tr class="nospace btmspace-15">
							<tr>
								<td>아이디 : ${member.id}</td>
							</tr>
							<tr>
								<td>이메일 : ${member.email }</td>
							</tr>
							<tr>
								<td>주소 : ${member.address }</td>
							</tr>
							<tr>
								<td>회원 종류 : ${member.memberType }</td>
							</tr>
						</table>
					</div>
				</li>
			</ul>


${box3 }

<%@ include file="/views/common/footer.jsp"%>