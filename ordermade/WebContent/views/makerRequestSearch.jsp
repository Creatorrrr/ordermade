<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="head.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">

			<%@ include file="myPageNav.jsp"%>

		</div>

		<div id="content" class="two_third">

			<ul class="nospace listing">
				<li class="clear">

					<div class="content" align="center">
						<h1 align="left">의뢰서 검색</h1>
						<form class="clear" method="post" action="#">
							<div>
								<fieldset>
									<select name="type" id="type" class="form-control">
										<option value="id">제목</option>
										<option value="name">내용</option>
									</select> <input input name="search" class="search-box-input"
										type="text" value="" placeholder="Search Here" />
									<button class="fa fa-search" type="submit" title="Search">
										<em>Search</em>
									</button>
								</fieldset>
							</div>
						</form>

						<table class="table">
							<tr>
								<div class="">
									<tr>
										<td><input name="" type="button" value="모든 의뢰서"></td>
										<td><input name="" type="button" value="내가보낸 의뢰서"></td>
									</tr>
								</div>
							</tr>
						</table>
					</div> <%-- <c:forEach items="${ box_list }" var="literature"> --%>
					<table class="request_table">
						<tr>
							<div class="imgl borderedbox">
								<img src="${ctx }/views/images/img-10.jpg" />
							</div>
						</tr>

						<tr>
							<p>의뢰 명 : ${title}</p>
						</tr>
						<tr>
							<p>의뢰자 : ${id }</p>
						</tr>
						<tr>
							<p>의뢰 내용 : ${contents }</p>
						</tr>
						<tr>
							<p>제작항목 : ${hope_price }</p>
						</tr>
						<tr>
							<p>희망 가격 : ${hope_price }</p>
						</tr>
						<tr>
							<td><input name="" type="button" value="참가"></td>
						</tr>
					</table> <%-- </c:forEach> --%>
				</li>
			</ul>
		</div>
	</div>
	</main>
</div>

<%@ include file="footer.jsp"%>

<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>


<%-- <!-- request popup form div start-->
<div id="sendRequest">
	<form class="form" action="${ctx }/ /invite.do" id="send"
		method="post">
		<input type="hidden" name="" value="${invite.id }">
		<h3>초대 메시지 작성</h3>
		<hr />
		<br /> <label>보내는 사람 : ${loginId }</label> <br /> <br /> <label>초대
			메시지 :</label> <br /> <input type="text" id="message" name="message"
			placeholder="메세지를 작성하세요" /><br /> <br /> <input type="button"
			name="sendMessage" id="submit" value="보내기" /> <input type="button"
			id="cancel" value="취소" /> <br />
	</form>
</div>
<!-- request popup form div end -->
<script>
 	var addReceiver = function(id){
		var addContext = "<input type='hidden' name='receiverId' value='" + id + "'>";
		$("#send").append(addContext);
		$("#sendRequest").css("display", "block");
 	}
	$(document).ready(function() {
		
	$("#cancel").click(function() {
		$(this).parent().parent().hide();
	});
	
	// Contact form popup send-button click event.
	// Login form popup login-button click event.
	//
	$("#submit").click(function() {
		alert("초대 완료!");
		$(this).parent().parent().hide();
		$.ajax({
			url :"${ctx }/member/invite.do",
			type:"post",
			data:{ receiverId:$("input[name='receiverId']").val(),
					message:$("input[name='message']").val(),
					litStorageId:$("input[name='litStorageId']").val()
			}
		});
	});

	/* search ajax */
						
	$("input[name='searchbutton']").click(function() {
		$.ajax({
			url : "${ctx}/member/search.do",
			data : {type : $("#type option:selected").val(),
					keyword : $("#keywordId").val()},
			type : "post",
			dataType : "xml",
			success : function(xml) {
					var xmlData = $(xml).find("members");
					var listLength = xmlData.length;
					$("#result > tbody").empty();			
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += "<tr><td>"+ $(this).find("id").text() + "</td><td>"
								+ $(this).find("name").text() + "</td><td>"
								+ $(this).find("email").text() + "</td>"
								+ "<td>" + "<button onclick='addReceiver(\"" + $(this).find("id").text() + "\")' id='pop' type='button'>초대하기</button>" + "</td></tr>";
						});
						$("#result > tbody").append(contentStr);
					}
				}
			});
		});
	});
	</script> --%>
</html>