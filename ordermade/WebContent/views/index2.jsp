<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<title>내꺼</title>

<%@ include file="/views/common/header.jspf" %>

<h1>이 밑에서 버튼 만들어서 기능구현 테스트 해주세요~</h1>
<a href="${ctx }/views/memberRegister.jsp">회원가입</a><br>
<a href="${ctx }/views/login.jsp">로그인</a><br>
<a href="${ctx }/product/register.do">상품등록</a><br>


