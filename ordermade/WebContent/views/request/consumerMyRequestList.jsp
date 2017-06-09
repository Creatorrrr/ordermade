<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>나의 의뢰서</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }

 System.print.out("dksdkdksadkgfjdlg");

			<ul class="nospace listing">
				<li class="clear">

					<div class="content" align="center">
						<h1 align="left">나의 의뢰서</h1>
						<button id="registerBtn" class="btn btn-success">의뢰서 등록</button>
						<div class="btn-group btn-group-justified" id="tabBox">
							<button id="tab1" class="btn btn-default">모든 의뢰서</button>
							<button id="tab2" class="btn btn-default">진행중</button>
							<button id="tab3" class="btn btn-default">완료</button>
						</div>
					</div>
					
					<div id="resultBox">
					<c:forEach items="${requests }" var="request" varStatus="status">
						<div class="request_table" data="${request.id }" page="${request.page }" >
						
								<div class="fl_left"><b style="padding: 20px 0 0 10px;font-size: 20px;">No: ${request.id }</b></div>
								<div class="fl_right" style="padding: 4px;">
									<c:choose>
										<c:when test='${request.bound eq "PRIVATE" }'><button class="boundBtn btn btn-xs btn-success">비공개</button></c:when>
										<c:otherwise><button class="boundBtn btn btn-xs btn-success">공개</button></c:otherwise>
									</c:choose>
									<button class="modifyBtn btn btn-xs btn-warning" id="modifyBtn">수정</button>
									<button class="deleteBtn btn btn-xs btn-default" id="deleteBtn">삭제</button>
								</div>
								
								<table>
									<tr><td>의뢰 명 : ${request.title}</td></tr>
									<c:choose>
										<c:when test='${request.maker.id ne null }'><tr><td>의뢰자 : ${request.maker.id }</td></tr></c:when>
										<c:otherwise><tr><td>의뢰자 : 없음</td></td></c:otherwise>
									</c:choose>
									<tr><td>의뢰 내용 : ${request.content }</td></tr>
									<tr><td>제작항목 : ${request.category }</td></tr>
									<tr><td>희망 가격 : ${request.hopePrice }</td></tr>
								</table>
						</div>
					</c:forEach>
					</div>
				</li>
				
				<!-- 페이지 구현  -->

				<link href="${ctx }/resources/js/js_simplePagination/simplePagination.css" rel="stylesheet" type="text/css">
				<script src="${ctx }/resources/js/js_simplePagination/jquery.simplePagination.js"></script>	
				<li><div id = "pagination"></div></li>

			</ul>
			
	<script type="text/javaScript">

		$(document).ready(function() {
			
	

			//공개 설정 버튼 구현 
			$("#resultBox").on('click','.boundBtn', function(){
				var requestId = $(this).parent().parent().attr("data");
				var bound = ($(this).text() == "비공개") ? 1 : 0;
				console.log(requestId);
				//console.log($(this).text() + bound);
				$.ajax({
					url : '${ctx}/request/xml/modifyBound.do?bound='+bound+'&requestId='+requestId,
					type : "get",
					dataType : "text",
					success : function(data) {
						if(bound==1){
							console.log('--------');
							if(data=="true"){
								$('div[data='+requestId+'] .boundBtn').text("공개");
							}else{
								alert("비공개 설정이 실패하였습니다.");
							}
						}else if(bound==0){
							if(data=="true"){
								$('div[data='+requestId+'] .boundBtn').text("비공개");
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
			$("#resultBox").on('click','.modifyBtn',function(){
				var requestId = $(this).parent().parent().attr("data");
				window.location.href = "${ctx}/request/ui/modify.do?requestId="+requestId;
			});
			
			
			//삭제 버튼 구현 
			$("#resultBox").on('click','.deleteBtn',function(){
				var thisOne = $(this).parent().parent();
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
			
			
			//-------------page
			
			var ajaxName = 'searchMyRequests';
			
		    
		   	pagination($($('.request_table').get(0)).attr("page"));//페이지수 얻고 실행
		    function pagination(pageNum){//참고  http://flaviusmatis.github.io/simplePagination.js
		   		//URL에서 현재 페이지 번호 얻어오기.
		   		//var urlStr= location.search;//?...
		   		var urlStr= location.hash;//#...
		   		var list=urlStr.match(/[^\d]+/g);
		    	var thisPage=1;
		   		if(list != null){		   			
			   		for(i=0; i<list.length; i++){
			   			if(list[i].indexOf('page=')==1){
			   				var temp = urlStr.match(/\d+/g);
			   				if(temp != null) thisPage=temp[i];
			   				console.log("thispage-----"+thisPage);
			   			}
			   		}
		   		}
		   	
			    $('#pagination').pagination({
			        items: pageNum,
			        itemOnPage: 7,
			        currentPage: thisPage,
			        cssStyle: 'light-theme',
			        hrefTextPrefix : '#page=', //#..
			        prevText: '',
			        nextText: '',
			       /*  onInit: function () {
			              console.log("------onInit---");
			        }, */
			        onPageClick: function (page, evt) {
			           // console.log(page+"---"+ajaxName+"--"+status);
			            tab1(ajaxName, page);
			        }
			    });
		    }

			
			//-------------------tab
			var status = 'tab1';
			
			function tab1(doName, page){
				var page = page || 1;
				ajaxName = doName;
				//var ctx = ${ctx};
				$.ajax({
					url : '${ctx}/request/xml/'+doName+'.do?page='+page,
					type : "get",
					dataType : "xml",
					success : function(xml) {
						console.log(xml);
						$('#resultBox').html('');
						var list = $(xml).find("request");
						var pageNum = $('>page',list.get(0)).text();
						//console.log(pageNum);
						pagination(pageNum);
						//console.log(list.size());
						list.each(function(){
							/* console.log($('>id',this).text());
							console.log($('>title',this).text());
							console.log($('>consumer>id',this).text());
							 */
							 
							 /* 
							 	<div class="fl_left"><b style="padding: 20px 0 0 10px;font-size: 20px;">No: ${request.id }</b></div>
								<div class="fl_right" style="padding: 4px;">
									<c:choose>
										<c:when test='${request.bound eq "PRIVATE" }'><button class="boundBtn btn btn-xs btn-success">비공개</button></c:when>
										<c:otherwise><button class="boundBtn btn btn-xs btn-success">공개</button></c:otherwise>
									</c:choose>
									<button class="modifyBtn btn btn-xs btn-warning">수정</button>
									<button class="deleteBtn btn btn-xs btn-default">삭제</button>
								</div>
								<table>
									
									<tr><td>의뢰 명 : ${request.title}</td></tr>
									<c:choose>
										<c:when test='${request.maker.id ne null }'><tr><td>의뢰자 : ${request.maker.id }</td></tr></c:when>
										<c:otherwise><tr><td>의뢰자 : 없음</td></td></c:otherwise>
									</c:choose>
									<tr><td>의뢰 내용 : ${request.content }</td></tr>
									<tr><td>제작항목 : ${request.category }</td></tr>
									<tr><td>희망 가격 : ${request.hopePrice }</td></tr>
								</table>
							 */
							
							var makerId = $(">maker>id",this).text();
							var bound = $(">bound",this).text();
							
							var rs = '<div class="request_table" data="'+ $(">id",this).text() +'" page="'+ pageNum +'" >';
								rs+='<div class="fl_left"><b style="padding: 20px 0 0 10px;font-size: 20px;">No : '+ $(">id",this).text() +'</b></div>';
								rs+='<div class="fl_right" style="padding: 4px;">';
								
								if(bound == null){
									rs+='	<button class="boundBtn btn btn-xs btn-success">비공개</button>';
								}else{
									rs+='	<button class="boundBtn btn btn-xs btn-success">공개</button>';
								}
								
								rs+='<button class="modifyBtn btn btn-xs btn-warning">수정</button>';
								rs+='<button class="deleteBtn btn btn-xs btn-default">삭제</button>';
								rs+='</div><table><tr><td>의뢰 명 : '+ $(">title",this).text() +'</td></tr>';
									
								if(makerId == null || makerId==""){
									rs+='<tr><td>의뢰자 : 없음 </td></tr>';
								}else{
									rs+='<tr><td>의뢰자 : '+ makerId +' </td></tr>';
								}
								
								rs+='<tr><td>의뢰 내용 : '+ $(">content",this).text() +'  </td></tr>';
								rs+='<tr><td>제작항목 : '+ $(">category",this).text() +'  </td></tr>';
								rs+='<tr><td>희망 가격 : '+ $(">hopePrice",this).text() +'  </td></tr>';
								rs+='</table></div>'; 
							$('#resultBox').append(rs);
							//console.log(rs);
							
						});
				
						

						
					}
				});
			}
			
			$('#tab1').addClass("btn-primary");
			
			//모든 의뢰서 탭구현
			$('#tab1').click(function(){
				if(status != 'tab1'){
					tab1('searchMyRequests');
					status = 'tab1';
					
					$('#tab1').addClass("btn-primary").removeClass('btn-default');
					$('#tab2').removeClass("btn-primary").addClass('btn-default');
					$('#tab3').removeClass("btn-primary").addClass('btn-default');
				}
			});

			
			//진행중 탭 구현
			$('#tab2').click(function(){
				if(status != 'tab2'){
					tab1('searchMyRequestsWithMaker');
					status = 'tab2';
					$('#tab2').addClass("btn-primary").removeClass('btn-default');
					$('#tab1').removeClass("btn-primary").addClass('btn-default');
					$('#tab3').removeClass("btn-primary").addClass('btn-default');
				}
			});
			
			
			//완료 탭 구현
			$('#tab3').click(function(){
				if(status != 'tab3'){
					tab1('searchMyRequestsWithPayment');
					status = 'tab3';
					$('#tab3').addClass("btn-primary").removeClass('btn-default');
					$('#tab1').removeClass("btn-primary").addClass('btn-default');
					$('#tab2').removeClass("btn-primary").addClass('btn-default');
				}
			});
			
			
			
			
		});
			
			
	</script>
			

${box3 }

<%@ include file="/views/common/footer.jsp"%>