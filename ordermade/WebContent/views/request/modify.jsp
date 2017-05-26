<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>의뢰서 수정 페이지</title>
<%@ include file="/views/layout/common.jsp" %>

</head>
<body>
의뢰서 수정 페이지.

<pre>
ID: ${request.id}
title: ${request.title}
content: ${request.content}
maker_id: ${request.maker.id}
consumer_id : ${request.consumer.id }
category: ${request.category}
content: ${request.content }
hopePrice: ${request.hopePrice}
price: ${request.price }
----------comments: 
<c:forEach var="comment" items="${request.comments}">
id: ${comment.id }
content: ${comment.content }
member: ${comment.member.id }
time: ${comment.time }
</c:forEach>
--------------
----------attachs: 
<c:forEach var="attach" items="${request.attachs}">
id: ${attach.id }
path: ${attach.path }
fileName: ${attach.fileName }
extension: ${attach.extension }
</c:forEach>
--------------
bound: ${request.bound }

</pre>

</body>
</html>