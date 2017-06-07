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
	                       <col width="170"/>
	                       <col width="210"/>
	                       <col width="200"/>
	                       <col width="300"/>
	                   </colgroup>
	                   <thead>
	                   <tr>
	                       <td class="" style="text-align: center">상품이미지</td>
	                       <td class="" style="text-align: center">구매상품 정보</td>
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
	                       <c:forEach var="purchaseHistory" items="${purchaseList}"  varStatus="sts">
	                        <tr>
	                            <td style="text-align: center">
	                            	<%-- <img src=${ctx }/views/images/img-10.jpg> --%>
	                            	${purchaseHistory.request.id }
	                            </td>
	                            <td style="text-align: center">
									상품명 : ${purchaseHistory.request.title }<br>
									아이디 : ${purchaseHistory.consumer.id }<br>
									가격 : ${purchaseHistory.request.price }<br>
								</td>
	                            <td class="text-center" style="text-align: center">
	                            	${purchaseHistory.orderDate}
	                            </td>
	                            <td class="text-center" style="text-align: center">
	                           		${purchaseHistory.deliveryStatus}<br>
	                           		<c:if test="${purchaseHistory.deliveryStatus eq '배송중' }">
	                           			<input class="deliveryBtn" type="button" 
		                           			value="상품배송" class="btn btn-sm btn-success"
		                           			data1 = "${purchaseHistory.id }">
                           			</c:if>
                           			<c:if test="${purchaseHistory.deliveryStatus eq '배송완료' }">
                           			</c:if>
	                            </td>
	                        </tr>
	                       </c:forEach>
	                   </tbody>
	               </table>
				



<script type="text/javascript">

$(".deliveryBtn").click(function(){
	var dom = $(this);
	console.log(dom.attr("data1"))
	createDeliveryModal(dom);
});

var createDeliveryModal = function(dom) {
	var contentStr = "";

	contentStr += "<form id='deliveryForm'>";
	contentStr += "	<input id='btnData' type='hidden' name='id' value='" + dom.attr("data1") + "'>";
	contentStr += "	<div class='invoiceNumber'>";
	contentStr += "    	<label>메시지<textarea name='invoiceNumber' rows='1' style='width: 100%' placeholder='송장번호를 입력해주세요.'></textarea></label>";
	contentStr += "	</div>";
	contentStr += "	<div align='right'>";
	contentStr += "		<button type='button' onclick='javascript:setInvoiceNumberToPurchaseHistory.registerInvoiceNumber()'>등록</button>";
	contentStr += "    	<button type='reset' onclick='javascript:$.unblockUI();'>취소</button>";
	contentStr += "	</div>";
	contentStr += "</form>";
	
    $.blockUI({message : contentStr});
};

var setInvoiceNumberToPurchaseHistory = {
	registerInvoiceNumber : function() {
		$.ajax({
			type: "post",
			url: "${ctx }/deal/xml/purchaseHistory/delivery.do",
			data: $('#deliveryForm').serialize(),	
			dataType: "text",
			success: function(text){
						if(text === "true"){
							alert("등록완료")
							var dom = $('.deliveryBtn[data1 = '+ $('#btnData').val() +']');
							console.log(dom)
							dom.attr('value', '배송완료');
							dom.attr('disabled', 'true');
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
</script>

${box3 }

<%@ include file="/views/common/footer.jsp"%>