<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 포트폴리오(제작자)</title>
<%@ include file="/views/layout/common.jsp" %>

</head>
<body>
나의 포트폴리오(제작자)

<pre>
<c:forEach var="portfolio" items="${portfolios}">
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
	
</c:forEach>
</pre>

</body>
</html>