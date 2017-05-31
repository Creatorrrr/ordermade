<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/common/_html.jsp"%>
<title>나의 의뢰서</title>
<%@ include file="/resources/common/_common.jsp"%>

${head_body}
<%@ include file="/resources/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }



			<ul class="nospace listing">
				<li class="clear">

					<div class="content" align="center">
						<h1 align="left">나의 의뢰서</h1>
						<table class="table">
							<tr>
								<td><button id="tab1">모든 의뢰서</button></td>
								<td><button id="tab2">진행중</button></td>
								<td><button id="tab3">완료</button></td>
							</tr>
						</table>
					</div>
					<div id="resultBox">
					<c:forEach items="${requests }" var="request" varStatus="status">
						<div class="request_table" data="${request.id }">
							
								<div class="imgl borderedbox">
									<img src="${ctx }/views/images/img-10.jpg" />
								</div>
							
								
								<p>의뢰 명 : ${request.title}</p>
								<c:if test="${request.maker.id ne null}"><p>의뢰자 : ${request.maker.id }</p></c:if>
								<p>의뢰 내용 : ${request.content }</p>
								<p>제작항목 : ${request.category }</p>
								<p>희망 가격 : ${request.hopePrice }</p>
								<c:choose>
									<c:when test='${request.bound eq "PRIVATE" }'><button class="boundBtn">비공개</button></c:when>
									<c:otherwise><button class="boundBtn">공개</button></c:otherwise>
								</c:choose>
								<button class="modifyBtn">수정</button>
								<button class="deleteBtn">삭제</button>
							
						</div>
					</c:forEach>
					</div>
				</li>
				<li><button id="registerBtn">의뢰서 추가</button></li>
			</ul>
			
			
	<script type="text/javaScript">
	
		$(document).ready(function() {
			
			//공개 설정 버튼 구현 
			$(".boundBtn").click(function(){
				var requestId = $(this).parent().attr("data");
				var bound = ($(this).text() == "비공개") ? 1 : 0;
				console.log($(this).text() + bound);
				$.ajax({
					url : '${ctx}/request/xml/modifyBound.do?bound='+bound+'&requestId='+requestId,
					type : "get",
					dataType : "text",
					success : function(data) {
						if(bound==1){
							console.log('--------');
							if(data=="true"){
								$('div[data='+requestId+']>.boundBtn').text("공개");
							}else{
								alert("비공개 설정이 실패하였습니다.");
							}
						}else if(bound==0){
							if(data=="true"){
								$('div[data='+requestId+']>.boundBtn').text("비공개");
							}else{
								alert("공개 설정이 실패하였습니다.");
							}
						}
					},
					error: function(xml){
						console.log("실패 메세지:\n"+xml.responseText);
					}
				});
			});
			
			
			//수정 버튼 구현
			$(".modifyBtn").click(function(){
				var requestId = $(this).parent().attr("data");
				window.location.href = "${ctx}/request/ui/modify.do?requestId="+requestId;
			});
			
			
			//삭제 버튼 구현 
			$(".deleteBtn").click(function(){
				var thisOne = $(this).parent();
				var requestId = thisOne.attr("data");
				
				if(confirm("삭제 하시겠습니까?")){
					$.ajax({
						url : '${ctx}/request/xml/remove.do?id='+requestId,
						type : "get",
						dataType : "text",
						success : function(data) {
							if(data=="true"){
								thisOne.remove();
							}else{
								alert("삭제에 실패하였습니다.");
							}
							
						},
						error: function(xml){
							console.log("실패 메세지:\n"+xml.responseText);
						}
					});
				}
				


			});
			
			//의뢰서 추가 버튼
			$("#registerBtn").click(function(){
				window.location.href = "${ctx}/request/ui/register.do";
			});
			
			
			
			//-------------------
		

			
			function tab1(page){
				var page = page || 1;
				$.ajax({
					url : '${ctx}/request/xml/searchMyRequests.do?page='+page,
					type : "get",
					dataType : "xml",
					success : function(xml) {
						console.log(xml);
						var list = $(xml).find("request");
						console.log(list.size());
						list.each(function(){
							console.log($('id',this).text());
						});
/* 						
						
						var ctx = ${ctx};
						var makerId = '';
						var bound = '';
						
						var rs='<div class="request_table" data="request.id ">'
							+'<div class="imgl borderedbox">'
							+'	<img src="'+ctx+'/views/images/img-10.jpg" />'
							+'</div>'
							+'<p>의뢰 명 : title</p>';
							
						if(makerId == null){
							rs+='<p>의뢰자 : request.maker.id </p>';
						}
						
						rs+='<p>의뢰 내용 : request.content </p>'
							+'<p>제작항목 : request.category </p>'
							+'<p>희망 가격 : request.hopePrice </p>';
							
						if(bound == null){
							rs+='	<button class="boundBtn">비공개</button>';
						}else{
							rs+='	<button class="boundBtn">공개</button>';
						}
						
						rs+='<button class="modifyBtn">수정</button>'
							+'<button class="deleteBtn">삭제</button>'
							+'</div>'; */
						
					}
				});
			}
			
			
			//모든 의뢰서 탭구현
			$('#tab1').click(function(){
				tab1();
			});

			
			//진행중 탭 구현
			$('#tab2').click(function(){
				
			});
			
			
			//완료 탭 구현
			$('#tab3').click(function(){
				
			});
			
		});
			
			
	</script>
			

${box3 }

<%@ include file="/resources/common/footer.jsp"%>