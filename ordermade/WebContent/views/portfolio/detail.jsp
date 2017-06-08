<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>포트폴리오 상세페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }

<%@ include file="/views/common/myPageNav.jsp"%>

${box2 }


<div class="sdb_holder">
	<h1>나의 포트폴리오 -[${portfolio.title }]</h1>

	<c:if test="${sessionScope.loginId ne null }">
		<%-- <c:if test="${portfolio.maker.id eq sessionScope.loginId">  --%>
		<!--본인이 작성한 글만 수정 삭제 가능하도록   -->
		<div align="right">
			<input class="btn btn-default" type="button" value="삭제"
				onclick="javascript:window.location='${ctx }/portfolio/xml/remove.do?portfolioId=${portfolio.id}'">
			<input class="btn btn-default" id="modifyBtn" type="button"
				value="수정"
				onclick="javascript:window.location='${ctx }/portfolio/ui/modify.do?id=${portfolio.id }'">
		</div>
		<%--  </c:if>  --%>
	</c:if>

	<div>
		<p>제작항목 : ${portfolio.category }</p>
		<p>포트폴리오 명 : ${portfolio.title }</p>
		<!-- <p>
			등록일자 :
			<time datetime="2045-04-06T08:15+00:00">
				Friday, 6<sup>th</sup> April 2045 @08:15:00
			</time>
		</p> -->
	</div>

	<br>
	<%-- <c:forEach items="${ portfolio }" var="portfolio"> --%>
	<img src="${ctx }/portfolio/image.do?img=${portfolio.image}"> <br>
	<%-- </c:forEach> --%>
</div>
<div>
	<p>
		포트폴리오 내용 : <br>
	</p>
	<p>${portfolio.content }</p>
</div>


<script type="text/javascript">
	/* var portfolioController = {
		updatePortfolio : function(id) {
			$.ajax({
						type : "get",
						url : "${ctx}/portfolio/ui/modify.do?id=" + id,
						dataType : "text",
						success : function(text) {
							if (text === "true") {
								location.href = "${ctx }/views/portfolio/ui/detail.do";
							}
						},
						error : function(xml) {
							console.log("실패 메시지 : \n" + xml.responseText);
						}
					});
		}
	}; */

	/* 		  // 등록버튼 구현
	 $("#modifyBtn").click(function(){
		//if(checkIt()){
			$.ajax({
				// 보낼 때
				type : "get",
				url : "${ctx }/portfolio/ui/modify.do",
		
				// 받을 때 
				dataType : "text",
				success : function(text) {
					if(text === "true"){
						location.href="${ctx}/portfolio/ui/detail.do"; // 성공시 페이지 전환
					}// ${ctx}/portfolio/ui/mylist.do 
				},
				error: function(xml){
					console.log("실패 메시지 :\n"+xml.responseText);
				}
			});
	
	});  */
</script>



${box3 }

<%@ include file="/views/common/footer.jsp"%>