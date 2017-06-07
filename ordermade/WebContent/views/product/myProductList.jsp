<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title>나의 상품페이지</title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>

${box1 }
		
			<%@ include file="/views/common/myPageNav.jsp"%>
			
${box2 }


				<h1>나의 상품페이지</h1>
				<div class="fl_left">
					<%-- <c:if test="${sessionScope.loginId ne null && boardId ne null}"> --%>
					<a class="btn btn-success" href="${ctx}/product/ui/register.do">상품 등록</a>
					<%-- </c:if> --%>
				</div>
				
				<div class="fl_right" >


						<div>
						
								<form class="navbar-form text-center"  method="post" action="#" role="search">
									<input type="hidden" name="boardId" value="${boardId }" class="form-control">
									<div class="form-group">
										<select name="type" id="type" class="form-control" style="display: inline-block;">
											<option value="id">제목</option>
											<option value="name">내용</option>
										</select> 
										<input name="search" class="form-control" type="text" value="" placeholder="Search Here"  />
									</div>
									<button type="submit" class="btn btn-default">검색</button>
								</form>

						</div>


				</div>
				</br></br></br>
				<div class="nospace listing" style="margin-top:20px; ">
					<c:forEach items="${ products }" var="product">
						<div style="display:inline-block; padding-right: 10px;">
							<table class="table" style="width:210px;">
								<tr>
									<div class="imgl borderedbox">
										<a href="${ctx }/product/ui/detail.do?id=${product.id }">
											<img src="${ctx }/product/image.do?img=${product.image}" style="width:100px;" />
										</a>
									</div>
								</tr>
								<tr class="nospace btmspace-15">
									<td>상품 이름</td>
									<td class="creatorId">${product.title}</td>
								</tr>
								<tr class="nospace btmspace-15">
									<td>가격</td>
									<td class="creatorId">${product.price}원</td>
								</tr>
							</table>
						</div>
					</c:forEach>
					
				</div>

${box3 }

<%@ include file="/views/common/footer.jsp"%>