<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<link href="${ctx }/resources/js/js_simplePagination/simplePagination.css" rel="stylesheet" type="text/css">
<script src="${ctx }/resources/js/js_simplePagination/jquery.simplePagination.js"></script>
<title>구매이력</title>
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
	                        <td class="text-center" style="text-align: center">
	                        	${purchaseHistory.maker.id }
	                        </td>
	                        <td style="text-align: center">
	                        	<a href="${ctx }/request/ui/detail.do?id=${purchaseHistory.request.id }" style="color:black">
	                        		${purchaseHistory.request.title }
	                        	</a>
							</td>
							<td style="text-align: center">
								${purchaseHistory.request.price }
							</td>
	                        <td class="text-center" style="text-align: center">
	                        	${purchaseHistory.orderDate}
	                        </td>
	                      	<td class="text-center" style="text-align: center">
	                     		${purchaseHistory.deliveryStatus}<br>
	                     		<c:if test="${purchaseHistory.payment eq 'N'}">
		                      		<div align="center">
			                      		<input id="purchaseBtn" class="btn btn-sm btn-primary" type="button" value="구매확정"
			                      		onclick="javascript:dealController.changeMakerAccount(${purchaseHistory.request.id})">
		                    		</div>
			                   	</c:if>
			                   	<c:if test="${purchaseHistory.payment eq 'Y'}">
			                   		<div align="center">
			                   		<input class="btn btn-sm btn-success" type="button" value="구매완료" disabled></div>
			              		</c:if>
	                    	</td>
	                    </tr>
                    </c:forEach>
                </tbody>
			</table>
          	<div id="pagination">페이지 위치</div>

<script type="text/javascript">
$(document).ready(function(){
	// 페이지수 얻음
	pagination($($('.purchaseTable').get(0)).attr("page"));
	var pageNum = $($('.purchaseTable').get(0)).attr("page");
	console.log($($('.purchaseTable').get(0)).attr("page"));
	// simplePagination 
	//http://flaviusmatis.github.io/simplePagination.js
	function pagination(pageNum){
		// URL 현재 페이지 값 얻어오기
		var urlPageNum = location.search;
		var list = urlPageNum.match(/[^\d]+/g);
		thisPage = 1;
		if ( list != null) {
			for ( i = 0 ; i < list.length; i++ ){
				if ( list[i].indexOf('page=') == 1){
					var temp = urlPageNum.match(/\d+/g);
					if( temp != null ) thisPage = temp[i];
					console.log("this Page is :" + thisPage);
				}
			}
		}
	}
	
	$('#pagination').pagination({
		items: pageNum,	// 게시글 수
		itemOnPage: 7,	// 한 페이지에 보여주 게시글 수
		currentPage: thisPage, // 초기에 보여주는 페이지
		cssStyle: 'light-theme', 
		hrefTextPrefix: '#page=', // href 속성에 사용되는 문자열
		prevText: '', // 이전버튼 텍스트
		nextText: '', // 다음버튼 텍스트
		onPageClick: function ( page, evt) {
			location.href = "${ctx }/deal/ui/transaction.do?page=" + page;
		}
	});
	
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
					$("#purchaseBtn").val("구매완료").attr("disabled", true);
					$("#purchaseBtn").removeClass("btn-primary").addClass("btn-success");
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