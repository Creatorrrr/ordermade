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
				<h1>받은 의뢰서</h1>
				<div align="left" class="btn-group btn-group-justified" id="tabBox">
					<button id="tab2" class="btn btn-primary">진행중</button>
					<button id="tab3" class="btn btn-default">완료</button>
				</div>
			</div>
			<div id="resultBox">
			<c:forEach items="${requests }" var="request" varStatus="status">
				<div id="requestContentBox-${request.id }" class="request_table">
					<table>
						<tr>
							<td>의뢰번호</td>
							<td>${request.id }</td>
						</tr>
						<tr>
							<td>의뢰명</td>
							<td><div style="width:200px"><p class="ellipse">${request.title}</p></div></td>
						</tr>
						<tr>
							<td>의뢰자</td>
							<td><div style="width:200px"><p class="ellipse">${request.consumer.id}</p></div></td>
						</tr>
						<tr>
							<td>희망 가격</td>
							<td><div style="width:200px"><p class="ellipse">${request.hopePrice }</p></div></td>
						</tr>
					</table>
					<div align="right">
						<button class="btn btn-default" onclick="javascript:location.href='${ctx}/request/ui/detail.do?id=${request.id }'">자세히 보기</button>;
					</div>
				</div>
			</c:forEach>
			</div>
		</li>
	
		<!-- 페이지 구현  -->
		<li><div id = "pagination"></div></li>


	</ul>

${box3 }

<%@ include file="/views/common/footer.jsp"%>
			
<script type="text/javaScript">

$(document).ready(function() {
	pagination('searchMyRequestsByMakerIdExceptPayment');
	
	//-------------page
	
	// 페이지 생성 함수
	function pagination(doName){
		$.ajax({
			url : "${ctx}/request/pages/" + doName + ".do",
			type : "get",
			dataType : "text",
			success : function(pages) {
			    $('#pagination').pagination({	// 페이지 총 개수를 구한 다음 생성
			        items: pages,
			        itemOnPage: 10,
			        cssStyle: 'light-theme',
			        onPageClick: function (page, evt) {
			        	getRequests(doName, page);
			        }
			    });
			}
		});
	};
	
	//-------------------tab
	function getRequests(doName, page){
		$.ajax({
			url : '${ctx}/request/xml/'+doName+'.do?page='+page,
			type : "get",
			dataType : "xml",
			success : function(xml) {
				console.log(xml);
				$('#resultBox').html('');
				var list = $(xml).find("request");
				list.each(function(){
					var makerId = $(">maker>id",this).text();
					var bound = $(">bound",this).text();
					var rs = "";
					
					rs += '<div class="request_table" data="${request.id }">';
					rs += '	<table>';
					rs += '		<tr>';
					rs += '			<td>의뢰번호</td>';
					rs += '			<td>' + $(">id",this).text() + '</td>';
					rs += '		</tr>';
					rs += '		<tr>';
					rs += '			<td>의뢰명</td>';
					rs += '			<td><div style="width:200px"><p class="ellipse">' + $(">title",this).text() + '</p></div></td>';
					rs += '		</tr>';
					rs += '		<tr>';
					rs += '			<td>의뢰자</td>';
					rs += '			<td><div style="width:200px"><p class="ellipse">' + $(">maker>id",this).text() + '</p></div></td>';
					rs += '		</tr>';
					rs += '		<tr>';
					rs += '			<td>희망 가격</td>';
					rs += '			<td><div style="width:200px"><p class="ellipse">' + $(">hopePrice",this).text() + '</p></div></td>';
					rs += '		</tr>';
					rs += '	</table>';
					rs += '	<div align="right">';
					rs += '		<button class="btn btn-default" onclick="javascript:location.href=\'${ctx}/request/ui/detail.do?id=' + $(">id",this).text() + '\'">자세히 보기</button>';
					rs += '	</div>';
					rs += '</div>';
						
					$('#resultBox').append(rs);
				});
			}
		});
	};

	var status = 'tab2';
	
	//진행중 탭 구현
	$('#tab2').click(function(){
		if(status != 'tab2'){
			pagination('searchMyRequestsByMakerIdExceptPayment');
			getRequests('searchMyRequestsByMakerIdExceptPayment', 1);
			
			status = 'tab2';
			
			$('#tab2').addClass("btn-primary").removeClass('btn-default');
			$('#tab3').removeClass("btn-primary").addClass('btn-default');
		}
	});
	
	
	//완료 탭 구현
	$('#tab3').click(function(){
		if(status != 'tab3'){
			pagination('searchMyRequestsByMakerIdWithPayment');
			getRequests('searchMyRequestsByMakerIdWithPayment', 1);
			
			status = 'tab3';
			
			$('#tab3').addClass("btn-primary").removeClass('btn-default');
			$('#tab2').removeClass("btn-primary").addClass('btn-default');
		}
	});
});

//수정 버튼 구현
var modifyRequest = function(requestId){
	window.location.href = "${ctx}/request/ui/modify.do?requestId="+requestId;
};

//삭제 버튼 구현 
var removeRequest = function(requestId){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			url : '${ctx}/request/xml/remove.do?id='+requestId,
			type : "get",
			dataType : "text",
			success : function(data) {
				if(data=="true"){
					$("#requestContentBox-" + requestId).remove();
				}else{
					alert("삭제에 실패하였습니다.");
				}
			},
			error: function(xml){
				console.log("실패 메세지:\n"+xml.responseText);
			}
		});
	}
};	
</script>