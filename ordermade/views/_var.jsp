<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"  />
<c:set var="a_episode_list" value='<a href="${ctx }/episode/list.do">연재글 목록x</a>' />
<c:set var="a_episode_register" value='<a href="${ctx }/views/episodeRegister.jsp">연재글 등록</a>' />
