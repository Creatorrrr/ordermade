<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>구매이력</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }


			<h1>구매이력</h1>
			<div class="fl_right">
				<form class="clear" method="post" action="${ctx }/deal/xml/searchPurchaseConsumerTitleList.do">
					<div>
						<fieldset>
							<select name="type" id="type" class="form-control" style="display:inline-block">
								<option value="id">의뢰서 제목</option>
								<option value="name">아이디</option>
							</select> 
							<input name="requestTitle" class="search-box-input" type="text"
								value="" placeholder="Search Here" style="display:inline-block" />
							<button class="fa fa-search" type="submit" title="Search">
							</button>
						</fieldset>
					</div>
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
                       <c:forEach var="purchaseHistory" items="${purchaseList}"
                                  varStatus="sts">
                          
	                        <tr>
	                            <td class="text-center" style="text-align: center">
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
	                           		<c:if test="${purchaseHistory.payment eq false}">
		                           		<input class="purchaseBtn" type="button" 
		                           			value="구매확정" class="btn btn-sm btn-success"
		                           			data1 = "${purchaseHistory.id }"
			                        		data2 = "${purchaseHistory.request.id }"
			                        		data3 = "${purchaseHistory.consumer.id }"
			                        		data4 = "${purchaseHistory.maker.id }"
			                        		data5 = "${purchaseHistory.invoiceNumber }"
			                        		data6 = "${purchaseHistory.deliveryStatus }"
			                        		data7 = "${purchaseHistory.payment }">
		                        	</c:if>
		                        	<c:if test="${purchaseHistory.payment eq true}">
		                        		<input class="" type="button" 
		                           			value="구매완료" class="btn btn-sm btn-success" disabled>
		                        	</c:if>
	                            </td>
	                        </tr>
	                        
                       </c:forEach>
                   </tbody>
               </table>

<script type="text/javascript">

$(".purchaseBtn").click(function(){
	var dom = $(this);
	console.log(dom)
	console.log(dom.attr("value"))
	sendMoneyToMakerAccount.changeMakerAccount(dom);
});

var sendMoneyToMakerAccount = {
	changeMakerAccount : function(dom) {
		$.ajax({
			type: "post",
			url: "${ctx }/deal/xml/account/makerMoney.do",
			data: {
					"id" : dom.attr("data1"),
					"request.id" : dom.attr("data2"),
					"consumer.id" : dom.attr("data3"),
					"maker.id" : dom.attr("data4"),
					"invoiceNumber" : dom.attr("data5"),
					"deliveryStatus" : dom.attr("data6"),
					"payment" : dom.attr("data7")
				   },
			dataType: "text",
			success: function(text){
						if(text === "true"){
							console.log(text)
							dom.attr("value", "구매완료");
							dom.attr("disabled", "true");
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
</script>


${box3 }

<%@ include file="/views/common/footer.jsp"%>