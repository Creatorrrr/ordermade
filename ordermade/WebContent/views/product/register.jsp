<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>상품 등록페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }


			<h1>상품 등록 페이지</h1>
			<br>
			<form id="productRegister">
				<table class="table">
					<tr>
						<th>제작 항목 <span>*</span></th>
						<td><div id="category"></div></td>
					</tr>
					<tr>
						<th>상품명 <span>*</span></th>
						<td><input id="productTitle" name="title"
							class="form-control" type="text" value=""></td>
					<tr>
					<tr>
						<th>상품 이미지</th>
						<td>
							<div id='imageuploader'>Upload</div>
							<div><img id='productImage' src="${ctx }/main/file/download.do?fileName=default.jpg" style="width:100px"></div>
							<input id="productImageHidden" name="image" type="hidden" value="">
						</td>
					<tr>
					<tr>
						<th>금액 <span>*</span></th>
						<td><input id="productPrice" name="price" class="form-control"
							type="number" value=""></td>
					</tr>
					<tr>
						<th>제작 기간</th>
						<td><input id="productPeriod" name="period" class="form-control"
							type="number" value=""></td>
					</tr>
					<tr>
						<th>상품 내용 <span>*</span></th>
						<td><textarea id="productContent" name="content"
								class="form-control" rows="7" cols="50"></textarea>
					</tr>
				</table>
				<div align="center">
					<input class="btn btn-default" type="reset" value="취소하기" onclick="javascript:window.location='${ctx }/product/ui/myProducts.do?page=1'">
					<input id="registBtn" class="btn btn-success" type="button" value="등록하기">
				</div>
			</form>
			<br>

${box3 }

<%@ include file="/views/common/footer.jsp"%>

<script type="text/javaScript">

$(document).ready(function() {
	imageUploader();
	
	// DB에서 카테고리 리스트 불러오기
	$.ajax({
		url : "${ctx}/main/xml/categoryList.do",
		type : "post",
		dataType : "xml",
		success : function(xml) {
			var categoryId = "${categoryId}";
			var rs = '<select name="category" id="category" class="form-control">';
			var list = $(xml).find("category > type");
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
		if(checkIt()){
			$.ajax({
				// 보낼 때
				type : "post",
				url : "${ctx}/product/xml/register.do",
				data : $('#productRegister').serialize(),
				// 받을 때 
				dataType : "text",
				success : function(resultData) {
					if(resultData === "true"){
						location.href= "${ctx}/product/ui/myProducts.do"
					}
				},
				error: function(xml){
					console.log("실패 메시지 :\n"+xml.responseText);
				}
			});
		}
	});
});

//필수 입력값 체크
function checkIt() {
	if (!$("#productTitle").val()) {
		alert("상품명을 입력하세요");
		return false;
	}
	if (!$("#productContent").val()) {
		alert("내용을 입력하세요");
		return false;
	}
	if (!$("#productPrice").val()) {
		alert("금액을 입력하세요");
		return false;
	}
	if (!$("#productPeriod").val()) {
		alert("기간을 입력하세요");
		return false;
	}
	return true;
}

var imageUploader = function() {
	$("#imageuploader").uploadFile({
		url:"${ctx}/main/file/upload.do",
		acceptFiles:"image/*",
		fileName:"upload",
		returnType:"text",
		showStatusAfterSuccess:false,
		onSuccess:function(files,data,xhr,pd)
		{
			var result = data;
			if(result === "fail") {
				alert("이미지 업로드 실패")
			} else {
				$("#productImage").attr("src", "${ctx}/main/file/download.do?fileName=" + data);
				$("#productImageHidden").val(data);
			}
		},
	});	
};
</script>