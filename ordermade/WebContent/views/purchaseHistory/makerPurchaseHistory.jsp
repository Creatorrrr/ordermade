	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>거래 이력</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }


				<h1>거래 이력</h1>
				<div class="fl_right">
					<form class="navbar-form text-center"  method="post" action="#">
								<select name="type" id="type" class="form-control" style="display:inline-block">
									<option value="id">의뢰서 제목</option>
									<option value="name">아이디</option>
								</select> 
								<input name="requestTitle" class="form-control" type="text"
									value="" placeholder="Search Here" style="display:inline-block"/>
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
			                    <td class="" style="text-align: center">구매자 ID</td>
			                    <td class="" style="text-align: center">의뢰서</td>
			                    <td class="" style="text-align: center">가격</td>
			                    <td class="" style="text-align: center">판매일자</td>
			                    <td class="" style="text-align: center">진행상태</td>
			                </tr>
	        			</thead>
	         			<tbody>
	                   		<c:if test="${empty purchaseList}">
		                        <tr>
		                            <td style="text-align: center" colspan="5" class="text-center">이력이 존재하지 않습니다.</td>
		                        </tr>
	              			</c:if>
	           				<c:forEach var="purchaseHistory" items="${purchaseList}"  varStatus="sts">
		           				<tr>
		                 			<td class="text-center">
		                            	${purchaseHistory.consumer.id }
		                            </td>
		                            <td class="text-center">
										<a href="${ctx }/request/ui/detail.do?id=${purchaseHistory.request.id }" style="color:black">
			                        		${purchaseHistory.request.title }
			                        	</a>
									</td>
		                            <td class="text-center" style="text-align: center">
		                            	${purchaseHistory.orderDate}
		                            </td>
		                            <td class="text-center">
										${purchaseHistory.request.price }
									</td>
		                            <td class="text-center">
				                      	<c:choose>
				                      		<c:when test="${purchaseHistory.request.payment eq 'N' }">
				                      			<p>결제 전</p>
				                     			<div align="center">
			                           				<input class="btn btn-warning" type="button" value="결제 전" disabled>
				                           		</div>
				                      		</c:when>
				                      		<c:when test="${purchaseHistory.deliveryStatus eq 'P'}">
				                     			<p id="deliveryStatus-${purchaseHistory.id}">배송준비중</p>
				                     			<div align="center">
			                           				<input id="deliveryBtn-${purchaseHistory.id}" class="btn btn-primary" type="button" value="상품배송" 
			                           					onclick="javascript:createDeliveryModal(${purchaseHistory.id})">
				                           		</div>
				                      		</c:when>
				                      		<c:when test="${purchaseHistory.deliveryStatus eq 'C'}">
				                     			배송완료
			                     				<br>
				                     			<div align="center">
			                           				<input class="btn btn-success" type="button" value="배송완료" disabled>
				                           		</div>
				                      		</c:when>
			                      		</c:choose>
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

var createDeliveryModal = function(purchaseHistoryId) {
	var contentStr = "";

	contentStr += "<form id='deliveryForm'>";
	contentStr += "	<input id='btnData' type='hidden' name='id' value='" + purchaseHistoryId + "'>";
	contentStr += "	<div class='invoiceNumber'>";
	contentStr += "    	<b style='margin:10px;float:left'>메시지</b>";
	contentStr += "    		<input class='form-control' type='text' name='invoiceNumber' style='width: 100%' placeholder='송장번호를 입력해주세요.'></input>";
	contentStr += "    		<input class='form-control' type='number' name='charge' style='width: 100%' placeholder='배송료를 입력해주세요.'></input>";
	contentStr += "	</div>";
	contentStr += "	<div align='right'>";
	contentStr += "		<button class='btn btn-default' type='button' onclick='javascript:setInvoiceNumberToPurchaseHistory.registerInvoiceNumber(" + purchaseHistoryId + ")'>등록</button>";
	contentStr += "    	<button class='btn btn-default' type='reset' onclick='javascript:$.unblockUI();'>취소</button>";
	contentStr += "	</div>";
	contentStr += "</form>";
	
    $.blockUI({message : contentStr});
};

var setInvoiceNumberToPurchaseHistory = {
	registerInvoiceNumber : function(purchaseHistoryId) {
		$.ajax({
			type: "post",
			url: "${ctx }/deal/xml/purchaseHistory/delivery.do",
			data: $('#deliveryForm').serialize(),	
			dataType: "text",
			success: function(text){
						if(text === "true"){
							$("#deliveryStatus-" + purchaseHistoryId).text("배송완료");
							$("#deliveryBtn-" + purchaseHistoryId).val("배송완료").attr("disabled", true);
							$("#deliveryBtn-" + purchaseHistoryId).removeClass("btn-primary").addClass("btn-success");
						}else{
							alert("등록실패");
						}
						javascript:$.unblockUI();
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