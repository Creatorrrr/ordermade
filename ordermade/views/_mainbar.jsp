<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />


<div class="jumbotron">

	<div class="container text-center">
		<h1>Author와~~</h1>
		<h3>- 작가님들을 위한 문학작품 공동 생산 지원 서비스 -</h3>      
		<p>Mission, Vission & Values</p>

		<div class="nav  navbar-right" style="background: #ccc;">
	  		<c:choose>
				<c:when test="${loginId eq null }">
						<!-- 로그인 버튼 -->
						<button id="loginBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">로그인</button>
	
						<div class="modal" id="modal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title">로그인</h4>
						      </div>
						      
						      <form action="${ctx }/login.do" method="post">
								      <div class="modal-body">
								        <label>ID<input id="loginId" name="loginId" class="form-control" type="text" value="" placeholder="ID를 입력해주세요."></label>
										<label>Password<input id="password" name="password" class="form-control" type="password" value="" placeholder="비밀번호를 입력해주세요."></label>
										 <button type="submit" class="btn btn-success">로그인</button>
								
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								      
								      </div>
						      </form>
						      
						    </div>
						  </div>
						</div>
						<script type="text/javascript">
							$('#loginBtn').click(function(){
								$('#modal').modal('toggle');
							});
						</script>
						<!-- 회원가입 버튼 -->
						<a href="${ctx }/views/register.jsp" class="btn btn-success">회원가입</a>
				
				</c:when>
				<c:otherwise>
					<span class="glyphicon glyphicon-user"></span>
					<b>${loginId}</b>님!! 환영합니다. [<a href="${ctx }/logout.do">로그아웃</a>]
					<ul >
						<li><a href="${ctx}/member/detail.do">회원정보</a></li>
						<li><a href="${ctx}/member/inviteList.do">초대 온 목록</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
	   </div>
	</div>
</div>


<!-- 메인메뉴 시작 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${ctx }/">메인페이지</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
		<li><a href="${ctx }/post/list.do">자유게시판</a></li>
		<li><a href="${ctx }/litStorage/myList.do">작품 저장소</a></li>
		<li><a href="${ctx }/literature/allList.do">작품 목록</a></li>
		
      </ul>

		<!-- 메인 페이지용 작품 검색창 -->
		<form method="get"  class="navbar-form navbar-right" >
			<div class="form-group">
				<select name="type" id="type" class="form-control">
					<option value="id">작가 아이디</option>
					<option value="name">작품 이름</option>
				</select>
				<input type="text" name="keyword" class="form-control">
				<input type="button" id="btn" name="search" value="검색" class="btn btn-success" >
			</div>
		</form>
		
		<div id="litTemplate" class="hidden">
			<div class="literatureBox">
				<table  class="table table-striped table-hover ">
					<tr>
						<td colspan="2"><img class="imagePath img-responsive" src="${literature.imagePath }" style="width:165px;height:239px;"></td>
					</tr>
					<tr>
						<td>작품명</td>
						<td><a class="literature" href="${ctx}/episode/list.do?literatureId=${literature.id}">${literature.name }</a></td>
					</tr>
					<tr>
						<td>작가</td>
						<td class="creatorId">${literature.creator.id }</td>
					</tr>
					<tr>
						<td>장르</td>
						<td class="genre">${literature.genre }</td>
					</tr>
					<tr>
						<td>소개</td>
						<td class="introduce">${literature.introduce }</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td class="hits">${literature.hits }</td>
					</tr>
				</table>
			</div>
		</div>
		
		<style>
		
		.literatureBox {
			display: inline-block;
		    margin: 10px;
		    border: 3px solid #73AD21;
		}
		
		</style>
		
		<script>
		
			
			function secessFun(xml,resultId){
				var xmlData = $(xml).find("literature");
				var listLength = xmlData.length;
				$(resultId).empty();			
				if (listLength) {
					var one = $("#litTemplate > .literatureBox").first();
					$(resultId).html('');
					$(xmlData).each(function() {
						var rs = one.clone();
						rs.find('img').attr('src', $(this).find('imagePath').text());
						rs.find('.literature').attr('href', '${ctx}/episode/list.do?literatureId=' + $(this).find("literature>id").text());
						rs.find('.literature').text( $(this).find("name:first").text());
						rs.find('.creatorId').html($(this).find("creator").find("id").text());
						rs.find('.genre').html($(this).find("genre").text());
						rs.find('.introduce').html($(this).find("introduce").text());
						rs.find('.hits').html($(this).find("hits").text());
						$(resultId).append(rs);
					});
					
				}else{
					$(resultId).html('<div class="alert alert-dismissible alert-info"><a href="${ctx}/" type="button" class="close" data-dismiss="alert">&times;</a><strong>Heads up!</strong>검색하신 작품이 없습니다.</div>');
				}
			}
			
			$(document).ready(function() {
				/* ajax로 작품 다른거 검색하기*/
				$("input[name='search']").click(function() {
					$.ajax({
						url : "/litStorage/literature/search.do",
						data : {type : $("#type option:selected").val(),
								keyword : $("input[name='keyword']").val()},
						type : "post",
						dataType : "xml",
						success : function(xml) {
							secessFun(xml,"#result");
						}
					});
				});
	
			});
		
		</script>
		<!-- 메인 페이지용 작품 검색창 -->

      </div>
    </div>
</nav>
<!-- 메인 메뉴 끝 -->



<!-- ajax loading start -->
<div id='ajax_loader' style="position: fixed; left: 50%; top: 40%; display: none;">
<img src="${ctx }/resources/img/ajax-loader.gif"></img></div>
<script type="text/javascript">
	//gif download: http://ajaxload.info/
    jQuery(function ($){
    	$('body').append($('#ajax_loader'));
    	
        $(document).ajaxStop(function(){
            $("#ajax_loader").hide();
         });
         $(document).ajaxStart(function(){
             $("#ajax_loader").show();
         });    
    });    
</script>
<!-- ajax loading end -->
	



<c:if test="${message ne null }">
	<!-- 요청결과 (3초후 자동 없어짐) -->
	<div class="alert alert-success fade in" id="message">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>알림 메시지!</strong></p>
        ${message }
    </div>
</c:if>




