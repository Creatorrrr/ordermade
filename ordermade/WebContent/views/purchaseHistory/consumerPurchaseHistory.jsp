<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>구매 이력</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }


			<h1>구매이력</h1>
			<div class="fl_right">
				<form  class="navbar-form text-center" method="post" action="${ctx }/deal/xml/searchPurchaseConsumerTitleList.do">
					<select name="type" id="type" class="form-control" style="display:inline-block">
						<option value="id">의뢰서 제목</option>
						<option value="name">아이디</option>
					</select> 
					<input name="requestTitle" class="form-control" type="text" value="" 
						placeholder="Search Here" style="display:inline-block" />
					<button class="fa fa-search btn btn-default" title="Search">검색</button>
				</form>
			</div>
			<p>
			<table class="">
            	<colgroup>
	                <col width="100"/>
	                <col width="500"/>
	                <col width="100"/>
	                <col width="100"/>
	                <col width="100"/>
           		</colgroup>
                <thead>
	                <tr>
	                    <td class="" style="text-align: center">판매자 ID</td>
	                    <td class="" style="text-align: center">의뢰서</td>
	                    <td class="" style="text-align: center">가격</td>
	                    <td class="" style="text-align: center">구매일자</td>
	                    <td class="" style="text-align: center">진행상태</td>
	                </tr>
                </thead>
                <tbody>
	                <c:if test="${empty purchaseList}">
		               	<tr>
		                   	<td style="text-align: center" colspan="5" class="text-center">이력이 존재하지 않습니다.</td>
		                </tr>
	                </c:if>
                    <c:forEach var="purchaseHistory" items="${purchaseList}" varStatus="sts">
	                    <tr>
	                        <td class="text-center">
	                        	${purchaseHistory.maker.id }
	                        </td>
	                        <td class="text-center">
	                        	<a href="${ctx }/request/ui/detail.do?id=${purchaseHistory.request.id }" style="color:black">
	                        		${purchaseHistory.request.title }
	                        	</a>
							</td>
							<td class="text-center">
								${purchaseHistory.request.price }
							</td>
	                        <td class="text-center">
	                        	${purchaseHistory.orderDate}
	                        </td>
	                      	<td class="text-center">
		                      	<c:choose>
		                      		<c:when test="${purchaseHistory.deliveryStatus eq 'P'}">
		                     			배송준비중
		                      		</c:when>
		                      		<c:when test="${purchaseHistory.deliveryStatus eq 'C'}">
		                     			배송완료
		                      		</c:when>
	                      		</c:choose>
	                     		<br>
	                     		<c:if test="${purchaseHistory.payment eq 'N'}">
		                      		<div align="center">
			                      		<input id="purchaseBtn-${purchaseHistory.request.id}" class="btn btn-sm btn-primary" type="button" value="구매확정"
			                      		onclick="javascript:dealController.changeMakerAccount(${purchaseHistory.request.id})">
		                    		</div>
			                   	</c:if>
			                   	<c:if test="${purchaseHistory.payment eq 'Y'}">
			                   		<div align="center">
			                   			<input class="btn btn-sm btn-success" type="button" value="구매완료" disabled>
			                   		</div>
			              		</c:if>
	                    	</td>
	                    </tr>
                    </c:forEach>
                </tbody>
			</table>
          	<div id="pagination">페이지 위치</div>

${box3 }

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	pagination();
});

var dealController = {
	changeMakerAccount : function(requestId) {
		$.ajax({
			type: "get",
			url: "${ctx }/deal/xml/account/makerMoney.do",
			data: {"requestId" : requestId},
			dataType: "text",
			success: function(text){
				if(text === "true"){
					$("#purchaseBtn-" + requestId).val("구매완료").attr("disabled", true);
					$("#purchaseBtn-" + requestId).removeClass("btn-primary").addClass("btn-success");
				}else{
					alert("구매확정이 실패하였습니다.");
				}
			},
			error: function(xml){
				console.log("실패 메시지 : \n" + xml.responseText)
			}
		});
	},
};

//페이지 생성 함수
function pagination(){
	$.ajax({
		url : "${ctx}/deal/pages/transaction.do",
		type : "get",
		dataType : "text",
		success : function(pages) {
		    $('#pagination').pagination({	// 페이지 총 개수를 구한 다음 생성
		        items: pages,
		        itemOnPage: 10,
				currentPage: "${thisPage}", // 초기에 보여주는 페이지
		        cssStyle: 'light-theme',
		        onPageClick: function (page, evt) {
		        	location.href = "${ctx }/deal/ui/transaction.do?page=" + page;
		        }
		    });
		}
	});
};
</script>