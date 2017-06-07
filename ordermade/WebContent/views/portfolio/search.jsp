<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>포트폴리오</title>
<%@ include file="/views/common/_common.jsp"%>
	
${head_body}
<%@ include file="/views/common/header.jsp"%>


<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="sidebar one_third first">
			<h6>포트폴리오 카테고리</h6>
			<nav class="sdb_holder">
				<ul>
					<c:forEach items="${categories}" var="category">
						<li><a href="${ctx }/portfolio/ui/search.do?type=${category.type}">${category.type }</a></li>
					</c:forEach>
				</ul>
			</nav>
		</div>

		<div id="content" class="two_third">
			<div class="content" align="center">
				<h1>[${category }] 포트폴리오 페이지</h1>
				<div class="right">
					<form class="navbar-form text-right" method="post" action="#" >
						<select name="type" id="type" class="form-control" style="display:inline-block">
							<option value="title">제목</option>
							<option value="makerName">제작자</option>
						</select> 
						<input input name="search" class="form-control" type="text"
							value="" placeholder="Search Here" style="display:inline-block"/>
						<button class="fa fa-search btn btn-default"  title="Search">검색</button>
					</form>
				</div>
				
			</div>
			
						
			<div id="listSearchResult">
				<c:forEach items="${portfolios }" var="portfolio">
					<div class='listBox'>
						<div class="listExplainBox">
						<div style="padding: 5px;">
							<div>
								<img src="${ctx }/portfolio/image.do?img=${portfolio.image}" style="width: 80px;"><br>
								<input type='button' value='자세히보기'  class="btn btn-success"
									onclick="javascript:location.href='${ctx}/portfolio/ui/detail.do?id=${portfolio.id}'">
							</div>
							<table style="background: #ccc;">
								<tr>
									<td>포트폴리오 명 :</td>
									<td>${portfolio.title }</td>
								</tr>
								<tr>
									<td>포트폴리오 내용 :</td>
									<td>${portfolio.content }</td>
								</tr>
								<tr>
									<td>제작자 :</td>
									<td>${portfolio.maker.name }</td>
								</tr>
								<tr>
									<td>제작항목 :</td>
									<td>${portfolio.category }</td>
								</tr>
								
								
							</table>
						</div>
						<div class="detailBtnBox">
							
						</div>
					</div>
				</c:forEach>
			</div>
		
			
		</div>
		</main>
	</div>
</div>






<%@ include file="/views/common/footer.jsp"%>