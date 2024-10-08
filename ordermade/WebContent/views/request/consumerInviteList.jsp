<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>참가요청내역</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
	<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }


	<h1>참가요청내역</h1>
	<div class="">
		<table>
                <colgroup>
                    <col width="110"/>
                    <col width="120"/>
                    <col width="350"/>
                    <col width="200"/>
                    <col width="200"/>
                </colgroup>
                <thead>
                <tr>
                    <td class="" style="text-align: center">번호</td>
                    <td class="" style="text-align: center">제작자</td>
                    <td class="" style="text-align: center">메시지</td>
                    <td class="" style="text-align: center">요청시간</td>
                    <td class="" style="text-align: center">참가요청</td>
                </tr>
                </thead>
                <tbody>
                	<c:if test="${empty inviteRequests}">
                     <tr>
                         <td style="text-align: center" colspan="5" class="text-center">참가요청이 존재하지 않습니다.</td>
                     </tr>
                    </c:if>
                    <c:forEach var="inviteRequest" items="${inviteRequests}" varStatus="sts">
                     <tr>
                         <td class="" style="text-align: center">${sts.count }</td>
                         <td style="text-align: center">${inviteRequest.maker.id }</td>
                         <td class="" style="text-align: center">${inviteRequest.message}</td>
                         <td class="" style="text-align: center">${inviteRequest.requestTime}</td>
                         <td class="" style="text-align: center">
                         	<!-- 수락 ajax 구현 -->																		<!--javascript:inviteRequestController.acceptInviteRequest(${inviteRequest.request.id}, ${inviteRequest.maker.id})  -->
                       		<input type="button" class="btn btn-default" value="수락" style="display: inline-block;" onclick="inviteRequestController.acceptInviteRequest('${inviteRequest.request.id}','${inviteRequest.maker.id}')">
                       		<!-- 거절 ajax 구현 -->
                       		<span>
                       		<input type="button" class="btn btn-default" value="거절" style="display: inline-block;" onclick="javascript:inviteRequestController.rejectInviteRequest('${inviteRequest.id}')">
                       		</span>
                         </td>
                     </tr>
                    </c:forEach>
                </tbody>
          </table>
	</div>
	<div id="pagination">페이지 위치</div>

${box3 }

<%@ include file="/views/common/footer.jsp"%>


<script type="text/javascript">
$(document).ready(function(){
	pagination();
});

var inviteRequestController = {
	acceptInviteRequest : function(requestId, makerId){
		$.ajax({
			type: "get",
			url: "${ctx }/request/xml/modifyMakerId.do?requestId=" + requestId + "&makerId=" + makerId,
			dataType: "text",
			success: function(text) {
					if(text === "true"){
						alert("수락되었습니다");
					/* 	location,href="${ctx}/product/ui/myProducts.do"; */
					}
			},
			error: function(xml){
				console.log("실패 메시지 :\n" + xml.responseText);
			}
		});
		
		$.ajax({
			type: "get",
			url: "${ctx }/request/xml/removeInviteByRequestId.do?requestId=" + requestId,
			dataType: "text",
			success: function(text) {
					if(text === "true"){
						location.href="${ctx}/request/ui/consumerInviteList.do?page=1";
					};
			},
			error: function(xml){
				console.log("실패 메시지 :\n" + xml.responseText);
			}
		});
	},
	
	rejectInviteRequest : function(inviteRequestId){
		$.ajax({
			type: "get",
			url: "${ctx}/request/xml/removeInviteById.do?id=" + inviteRequestId,
			dataType: "text",
			success: function(text){
					if(text === "true"){
						/* 나중에 page 동적으로 받아서 넘겨주어야 함 */
						location.href="${ctx}/request/ui/consumerInviteList.do?page=1";
					}
			},
			error: function(xml){
				console.log("실패 메시지 :\n" + xml.responseText);
			}
		});
	}
};

//페이지 생성 함수
function pagination(){
	$.ajax({
		url : "${ctx}/request/pages/consumerInviteList.do",
		type : "get",
		dataType : "text",
		success : function(pages) {
		    $('#pagination').pagination({	// 페이지 총 개수를 구한 다음 생성
		        items: pages,
		        itemOnPage: 10,
				currentPage: "${thisPage}", // 초기에 보여주는 페이지
		        cssStyle: 'light-theme',
		        onPageClick: function (page, evt) {
		        	location.href = "${ctx }/request/ui/consumerInviteList.do?page=" + page;
		        }
		    });
		}
	});
};

</script>
