<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<c:forEach items="${ box_list }" var="main">
	<div class="maineBox">
		<table  class="table table-striped table-hover ">
			<tr>
				<td colspan="2"><img class="imagePath img-responsive" src="${literature.imagePath }" style="width:165px;height:239px;"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><a class="product" href="${ctx}/product/list.do?productId=${product.id}">${product.name }</a></td>
			</tr>
			<tr>
				<td>가격</td>
				<td class="price">${product.price }</td>
			</tr>
		</table>
	</div>
</c:forEach>
