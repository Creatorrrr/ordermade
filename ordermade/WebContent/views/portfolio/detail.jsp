<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포트폴리오 디테일 페이지</title>
<%@ include file="/views/layout/common.jsp" %>

</head>
<body>
디테일 페이지.

<pre>
ID: ${portfolio.id}
title: ${portfolio.title}
content: ${portfolio.content}
----------tags: 
<c:forEach var="tag" items="${portfolio.tags}">
id: ${tag.id }
keyword: ${tag.keyword }
score: ${tag.score }
</c:forEach>
--------------
category: ${portfolio.category}
maker_id: ${portfolio.maker.id}
image: ${portfolio.image}
</pre>

</body>
</html>