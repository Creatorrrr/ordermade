<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>포트폴리오 등록</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }


			<h1>포트폴리오 등록</h1>
			<br>
			<form action="${ctx }/portfolio/xml/register.do" method="post" enctype="multipart/form-data"
				name="pRegister"id="pRegister" onsubmit="return checkIt()" >
				<%--   <input name="makerId" type="hidden" value="${makerId}">   --%>
				<table class="table">
					<tr>
						<th>제작 항목 <span>*</span></th>
						<td><div id="category"></div></td>
					</tr>
					<tr>
						<th>포트폴리오 명 <span>*</span></th>
						<td><input id="title" name="title" class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>표지 이미지</th>
						<td><input id="image" name="image" class="btn btn-default" type="file" value="찾아보기"></td>
					<tr>
					<tr>
						<th>포트폴리오 내용 <span>*</span></th>
						<td><textarea id="content" name="content"
								class="form-control" cols="35" rows="10"></textarea></td>
					</tr>
				</table>
				<div align="right">
					<input id="registBtn" name="registBtn" class="btn btn-default" type="button" value="등록하기"> &nbsp; 
					<input name="reset" class="btn btn-default" type="reset" value="취소">
				</div>
			</form>
			<br>



<script type="text/javaScript">

$(document).ready(function(){
	
	$.ajax({
		url : "${ctx}/main/xml/categoryList.do",
		type : "post",
		dataType : "xml",
		success : function(xml) {
			var categoryId = "${categoryId}";
			var rs = '<select name="category" id="category" class="form-control">';
			var list = $(xml).find("category > type");
			console.log(list.size());
			list.each(function(){
				rs += '<option value"' + $(this).text() + '""';
				if(categoryId == $(this).text()){
					rs += 'selected="selected"';
				}
					rs += '>' + $(this).text() + '</option>';
			});
			rs += '</select>';
			$("#category").html(rs);
		},
		error: function(xml){
			$("#category").html('<select name="category" id="category" class="form-control">'
									+'<option value="가구" selected="selected">가구</option>'
									+'<option value="의류">의류</option>'
									+'<option value="악세사리">악세사리</option>'
									+'<option value="디지털">디지털</option>'
									+'<option value="주방">주방</option>'
									+'<option value="스포츠">스포츠</optioin>'
								 +'</select>');
		}
	});
	
 	 // 등록버튼 구현
	 $("#registBtn").click(function(){
		 var data = new FormData($('#pRegister')[0]);
		 
		console.log("----testing here-------");
		if(checkIt()){
			$.ajax({
				// 보낼 때
				type : "post",
				enctype :'multipart/form-data',
				url : "${ctx }/portfolio/xml/register.do",
				data : data,
				processData: false,
				contentType: false,
				cache: false,
				// 받을 때 
				dataType : "text",
				success : function(resultData) {
					if(resultData === "true"){
						location.href="${ctx}/portfolio/ui/mylist.do" // 성공시 페이지 전환
					}
				},
				error: function(xml){
					console.log("실패 메시지 :\n"+xml.responseText);
				}
			});
		}
	}); 

	//유효성 검사
	function checkIt() {

		var pRegister = document.pRegister;

		if (!pRegister.title.value) {
			alert("제목을 입력하세요");
			return false;
		}

		if (!pRegister.content.value) {
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
});

</script>


${box3 }

<%@ include file="/views/common/footer.jsp"%>