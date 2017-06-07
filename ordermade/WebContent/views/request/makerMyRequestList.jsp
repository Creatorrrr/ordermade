<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>받은 의뢰서</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
	<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }



	<ul class="nospace listing">
		<li class="clear">

			<div class="content" align="center">
				<h1 align="left">받은 의뢰서</h1>
				<table class="btn-group btn-group-justified">
					<button id="tab2" class="btn btn-default">진행중</button>
					<button id="tab3" class="btn btn-default">완료</button>
				</table>
			</div>
			<div id="resultBox">
			<c:forEach items="${requests }" var="request" varStatus="status">
				<div class="request_table" data="${request.id }" page="${request.page }">
					
						<div class="imgl borderedbox">
							<img src="${ctx }/views/images/img-10.jpg" />
						</div>
					
						<p>의뢰번호: ${request.id }</p>
						<p>의뢰 명 : ${request.title}</p>
						<c:choose>
							<c:when test='${request.maker.id ne null }'><p>의뢰자 : ${request.maker.id }</p></c:when>
							<c:otherwise><p>의뢰자 : 없음</p></c:otherwise>
						</c:choose>
						<p>의뢰 내용 : ${request.content }</p>
						<p>제작항목 : ${request.category }</p>
						<p>희망 가격 : ${request.hopePrice }</p>
						<button class="modifyBtn">수정</button>
						<button class="deleteBtn">삭제</button>
					
				</div>
			</c:forEach>
			</div>
		</li>
		<li><button id="registerBtn" class="btn btn-success">의뢰서 추가</button></li>
		
		<!-- 페이지 구현  -->

		<link href="${ctx }/resources/js/js_simplePagination/simplePagination.css" rel="stylesheet" type="text/css">
		<script src="${ctx }/resources/js/js_simplePagination/jquery.simplePagination.js"></script>	
		<li><div id = "pagination"></div></li>


	</ul>
			
			
	<script type="text/javaScript">

		$(document).ready(function() {
			
			

			//수정 버튼 구현
			$("#resultBox").on('click','.modifyBtn',function(){
				var requestId = $(this).parent().attr("data");
				window.location.href = "${ctx}/request/ui/modify.do?requestId="+requestId;
			});
			
			
			//삭제 버튼 구현 
			$("#resultBox").on('click','.deleteBtn',function(){
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
			
			
			//-------------page
			
			var ajaxName = 'searchMyRequestsByMakerId';
			

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
			var status = 'tab2';
			
			function tab1(doName, page){
				var page = page || 1;
				ajaxName = doName;
				console.log(ajaxName);
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
						console.log(pageNum);
						pagination(pageNum);
						//console.log(list.size());
						list.each(function(){
							/* console.log($('>id',this).text());
							console.log($('>title',this).text());
							console.log($('>consumer>id',this).text());
							 */
							
							
							var makerId = $(">maker>id",this).text();
							var bound = $(">bound",this).text();
							
							var rs='<div class="request_table" data="'+ $(">id",this).text() +'" page="'+ pageNum +'" > '
								+'<div class="imgl borderedbox">'
								+'	<img src="${ctx}/views/images/img-10.jpg" />'
								+'</div>'
								+'<p>의뢰번호 : '+ $(">id",this).text() +'</p>';
								+'<p>의뢰 명 : '+ $(">title",this).text() +'</p>';
								
							if(makerId == null || makerId==""){
								rs+='<p>의뢰자 : 없음 </p>';
							}else{
								rs+='<p>의뢰자 : '+ makerId +' </p>';
							}
							
							rs+='<p>의뢰 내용 : '+ $(">content",this).text() +' </p>'
								+'<p>제작항목 : '+ $(">category",this).text() +' </p>'
								+'<p>희망 가격 : '+ $(">hopePrice",this).text() +' </p>';
							
							rs+='<button class="modifyBtn">수정</button>'
								+'<button class="deleteBtn">삭제</button>'
								+'</div>'; 
							$('#resultBox').append(rs);
							//console.log(rs);
							
						});
				
						

						
					}
				});
			}
			
			
;

			
			//진행중 탭 구현
			$('#tab2').click(function(){
				if(status != 'tab2'){
					tab1('searchMyRequestsByMakerId');
					status = 'tab2';
				}
			});
			
			
			//완료 탭 구현
			$('#tab3').click(function(){
				if(status != 'tab3'){
					tab1('searchMyRequestsByMakerIdWithPayment');
					status = 'tab3';
				}
			});
			
			
			
			
		});
			
			
	</script>
			

${box3 }

<%@ include file="/views/common/footer.jsp"%>