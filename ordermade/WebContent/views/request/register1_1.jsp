<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/common/_html.jsp"%>
<title>의뢰서 등록</title>
<%@ include file="/resources/common/_common.jsp"%>

${head_body}
<%@ include file="/resources/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }
	
			<h1>의뢰서 등록 페이지</h1>
			<br>
			<form action="${ctx }/request/xml/register.do" method="post" id="form1" name="form1" onsubmit="return checkIt()">
				<input name="category" type="hidden" value="${categoryId }">

				<table class="table">
					<tr>
						<th>제작자</th>
						<td>
							${makerId }
							<input id="maker" name="maker.id" class="form-control" type="hidden" value="${makerId }" >
						</td>
					<tr>
					<tr>
						<th>제작 항목</th>
						<td><div id="category"></div>
						
						</td>
					</tr>
					<tr>
						<th>의뢰 제목</th>
						<td><input id="title" name="title" class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>의뢰 상세 내용</th>
						<td><textarea id="contentText" name="content" class="form-control" rows="7"></textarea></td>
					</tr>

					<tr>
						<th>희망 금액</th>
						<td><input id="hopePrice" name="hopePrice" class="" type="text" value=""></td>
					</tr>

				</table>
				<div align="center">
					<input class="btn btn-success" type="button" id="btn" value="저장하기">
				</div>
			</form>
			
			
	<script type="text/javaScript">
	

		//html구조가 모두 인클루드 된후 실행
		$(document).ready(function() {
			
			//상품번호 의뢰 내용에 넣기 (출처)
			var productId= '${productId }';
			if(productId != ''){
				$("#contentText").html("[상품번호: ${productId }]\n");
			}
			
			
			//DB에서 카테고리 리스트 불러오기  
			$.ajax({
				url : "${ctx}/main/xml/categoryList.do",
				type : "post",
				dataType : "xml",
				success : function(xml) {
					var categoryId = "${categoryId}";
					//console.log(xml);
					var rs= '<select name="category" id="category" class="form-control">';
					var list = $(xml).find("category > type");
					console.log(list.size());
					list.each(function(){
						rs+='<option value="' + $(this).text() + '" ';
						if(categoryId == $(this).text()){
							rs+='selected="selected"';
						}
						rs+='>'+$(this).text()+'</option>';
						//console.log($(this).text());
					});
					rs+='</select>';
					//console.log(rs);
					$("#category").html(rs);
					
				},
				error: function(xml){
					$("#category").html('<select name="category" id="category" class="form-control">'
											+'<option value="가구" selected="selected">가구</option>'
											+'<option value="의류">의류</option>'
											+'<option value="악세사리">악세사리</option>'
											+'<option value="디지털">디지털</option>'
											+'<option value="주방">주방</option>'
											+'<option value="스포츠">스포츠</option>'
										+'</select>');
				}
			});
			
			
			//저장버튼 구현
			$("#btn").click(function() {
				console.log("----------");
				if(checkIt()){
					$.ajax({
						url : "${ctx}/request/xml/register.do",
						type : "post",
						data : $('#form1').serialize(),
						dataType : "text",
						success : function(data) {
							if(data=="true"){
								location.href="${ctx}/request/ui/detail.do";//성공시 페이지 전환
							}
						},
						error: function(xml){
							console.log("실패 메세지:\n"+xml.responseText);
						}
						
					});
				}
			});
			
			
			
			//필수 입력값 체크 
			function checkIt() {
				if (!title.value) {
					alert("제목을 입력하세요");
					return false;
				}else if (!contentText.value) {
					alert("내용을 입력하세요");
					return false;
				}else if(!hopePrice.value){
					alert("희망금액을 입력하세요");
					return false;
				}
				return true;
			}

		});

		
	

	</script>


${box3 }

<%@ include file="/resources/common/footer.jsp"%>