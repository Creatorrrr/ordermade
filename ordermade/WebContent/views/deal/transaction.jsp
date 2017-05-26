<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포트폴리오 검색(제작자)</title>
<%@ include file="/views/layout/common.jsp" %>

</head>
<body>
포트폴리오 검색(제작자)

<pre>
<c:forEach var="purchase" items="${purchaseList}">
	ID: ${purchase.id}
	maker_id: ${purchase.maker.id}
	consumer_id: ${purchase.consumer.id}
		----------tags: 
		<c:forEach var="request" items="${portfolio.request}">
		id: ${request.id }
		keyword: ${request.keyword }
		score: ${request.score }
		</c:forEach>
		--------------
	charge: ${purchase.charge}
	deliveryStatus: ${purchase.deliveryStatus}
	payment: ${purchase.payment}
	
</c:forEach>
</pre>

</body>
</html>