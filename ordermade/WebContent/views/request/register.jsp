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
			<form action="${ctx }/request/xml/register.do" method="post"  onsubmit="return checkIt()">
				<input name="" type="hidden" value="${categoryId }">
				<table class="table">
					<tr>
						<th>제작 항목</th>
						<td><select name="category" id="category" class="form-control">
								<option value="id" selected="selected">가구</option>
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
						<td><input id="title" name="title" class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>의뢰 상세 내용</th>
						<td><textarea id="contentText" name="content" class="form-control" rows="7"></textarea></td>
					</tr>

					<tr>
						<th>희망 금액</th>
						<td><input id="hopePrice" name="hopePrice" class="" type="text" value=""></td>
					</tr>

				</table>
				<div align="center">
					<input class="btn btn-success" type="button" id="btn" value="저장하기">
				</div>
			</form>
			
			
	<script type="text/javaScript">
	


		$(document).ready(function() {
			/* ajax로 작품 다른거 검색하기*/
			$("#btn").click(function() {
				console.log("----------");
				
				$.ajax({
					url : "${ctx}/request/xml/register.do",
					data : {
						category : $("#category option:selected").text(),
						title : $("#title").val(),
						content : $("#contentText").val(),
						hopePrice : $("#hopePrice").val()
							
					},
					type : "post",
					dataType : "text",
					success : function(data) {
						if(data=="true"){
							location.href="${ctx}/request/ui/detail.do";
						}
						//secessFun(xml,"#result");
					},
					error: function(xml){
						console.log(xml.responseText);
					}
					
				});
			});

		});
/* 	
		function secessFun(xml,resultId){
			var xmlData = $(xml).find("literature");
			var listLength = xmlData.length;
			$(resultId).empty();			
			if (listLength) {
				var one = $("#litTemplate > .literatureBox").first();
				$(resultId).html('');
				$(xmlData).each(function() {
					var rs = one.clone();
					rs.find('img').attr('src', $(this).find('imagePath').text());
					rs.find('.literature').attr('href', '${ctx}/episode/list.do?literatureId=' + $(this).find("literature>id").text());
					rs.find('.literature').text( $(this).find("name:first").text());
					rs.find('.creatorId').html($(this).find("creator").find("id").text());
					rs.find('.genre').html($(this).find("genre").text());
					rs.find('.introduce').html($(this).find("introduce").text());
					rs.find('.hits').html($(this).find("hits").text());
					$(resultId).append(rs);
				});
				
			}else{
				$(resultId).html('<div class="alert alert-dismissible alert-info"><a href="${ctx}/" type="button" class="close" data-dismiss="alert">&times;</a><strong>Heads up!</strong>검색하신 작품이 없습니다.</div>');
			}
		} */
		
	
	
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


${box3 }

<%@ include file="/resources/common/footer.jsp"%>