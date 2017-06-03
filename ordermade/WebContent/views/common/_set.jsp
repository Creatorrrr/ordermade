<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="ctx" value="${pageContext.request.contextPath }"  />
<c:set var="a_tag_test" value='<a href="${ctx }/views/">aaaa</a>' />
<c:set var="head_body" value='
</head>
<body id="top">
'/>
<c:set var="box1" value='
<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
'/>
<c:set var="box2" value='
		</div>
		<div id="content" class="two_third">
'/>
<c:set var="box3" value='
		</div>
		</main>
	</div>
</div>
'/>