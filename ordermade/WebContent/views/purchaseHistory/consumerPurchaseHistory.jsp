<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!-- Header ========================================================================================== -->
<%@ include file="/views/common/head.jsp"%>

<!-- Main Body ========================================================================================== -->
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> 
		<!-- Navigation ================================================================================= -->
		<div class="sidebar one_third first">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>
		
		<div id="content" class="two_third">
			<h1>구매이력</h1>
			<div class="fl_right">
				<form class="clear" method="post" action="${ctx }/deal/xml/searchPurchaseConsumerTitleList.do">
					<div>
						<fieldset>
							<select name="type" id="type" class="form-control">
								<option value="id">의뢰서 제목</option>
								<option value="name">아이디</option>
							</select> 
							<input name="requestTitle" class="search-box-input" type="text"
								value="" placeholder="Search Here" />
							<button class="fa fa-search" type="submit" title="Search">
							</button>
						</fieldset>
					</div>
				</form>
			</div>

			 <table class="">
                   <colgroup>
                       <col width="200"/>
                       <col width="200"/>
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
                            <td class="text-center"><img src=${ctx }/views/images/img-10.jpg></td>
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
                            		<a href="" class="">구매확정</a>
                            </td>
                        </tr>
                       </c:forEach>
                   </tbody>
               </table>
			</div>
		</main>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>