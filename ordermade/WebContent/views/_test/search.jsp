<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<%@ include file="/views/common/_common.jsp"%>
${head_body}
<%@ include file="/views/common/header.jsp"%>

<div class="wrapper row3">
	<div class="rounded">
		<div class="fl_right">
			<form class="clear" method="post"
				action="${ctx }/product/searchList.do">
				<input type="hidden" name="boardId" value="${boardId }"
					class="form-control">
				<div>
					<fieldset>
						<select name="type" id="type" class="form-control">
							<option value="productTitle">제목</option>
							<option value="productContents">내용</option>
							<option value="productName">상품 명</option>
							<option value="maker">제작자</option>
						</select> <input input name="search" class="search-box-input" type="text"
							value="" placeholder="Search Here" />
						<button class="fa fa-search" type="submit" title="Search">
							<em>Search</em>
						</button>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>