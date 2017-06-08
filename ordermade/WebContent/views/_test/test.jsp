<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/_html.jsp"%>
<title></title>
<%@ include file="/views/common/_common.jsp"%>

${head_body}
<%@ include file="/views/common/header.jsp"%>



<div class="wrapper row3">
	<div class="rounded">
		<main class="container clear"> <!-- main body -->
		<div class="group btmspace-30">

			<!-- Middle Column -->
			<div class="one_half">

				<!-- 장르별 추천작, 장르를 select에서 선택하면 ajax로 controller 들러서 리스트 다시 뿌려줌 -->
				<div class="navbar-form" id="recoResult">
					<select id="recoGenre" class="form-control navbar-right">
						<option value="title">FUNITURE</option>
						<option value="makerName">ACCESSORY</option>
						<option value="title">KITCHEN</option>
						<option value="makerName">DIGITAL</option>
						<option value="title">CLOTHING</option>
						<option value="makerName">SPORT</option>

						<%-- <c:forEach items="${genreList }" var="genre">
							<option value="${genre.category }">${genre.category}</option>
						</c:forEach> --%>
					</select>
					<h2>인기 상품</h2>
				</div>

				<ul class="nospace listing">
					<li class="clear">
						<div class="content" align="center">
							<c:set var="box_list" value="${ recoLiteratures}" />
							<%@ include file="mainBox.jsp"%>
						</div>
					</li>
				</ul>

				<div class="navbar-form">
					<select id="recoGenre" class="form-control navbar-right">
						<option value="title">FUNITURE</option>
						<option value="makerName">ACCESSORY</option>
						<option value="title">KITCHEN</option>
						<option value="makerName">DIGITAL</option>
						<option value="title">CLOTHING</option>
						<option value="makerName">SPORT</option>

						<%-- <c:forEach items="${genreList }" var="genre">
							<option value="${product.category }">${product.category}</option>
						</c:forEach> --%>
					</select>
					<h2>최신 상품</h2>
				</div>

				<ul class="nospace listing">
					<li class="clear">
						<div class="content" align="center" id="newResult">
							<c:set var="box_list" value="${ recoLiteratures}" />
							<%@ include file="mainBox.jsp"%>
						</div>
					</li>
				</ul>
			</div>
			<!-- / Middle Column -->
		</div>

		<div id="twitter" class="group btmspace-30">
			<div class="one_quarter first center">
				<a href="#"><i class="fa fa-twitter fa-3x"></i><br>Instruction</a>
			</div>
			<div class="three_quarter bold">
				<p>
					01. 상품페이지를 검색한 뒤 주문 제작 버튼을 누릅니다.<br /> 02. 의뢰서를 제작합니다.<br /> 03.
					의뢰서를 등록면 제작자와 1:1 매칭이 이루어집니다.<br /> 04. 제작자와 대화를 통해 원하는 물건을 제작할 수
					있습니다.<br />
				</p>
			</div>
		</div>

		</main>
	</div>
</div>


<script>
	/* 장르 선택할때마다 ajax로 갔다와서 장르별로 새로 뿌리기 */

	$('#recoGenre').change(function() {
		$.ajax({
			url : "${ctx}/genreList.do",
			data : {
				type : "recoGenre",
				genre : $("#recoGenre option:selected").val(),
				from : "index"
			},
			type : "get",
			dataType : "xml",
			success : function(xml) {
				secessFun(xml, "#recoResult");
			}
		});
	});
	$('#newGenre').change(function() {
		$.ajax({
			url : "${ctx}/genreList.do",
			data : {
				type : "newGenre",
				genre : $("#newGenre option:selected").val(),
				from : "main"
			},
			type : "get",
			dataType : "xml",
			success : function(xml) {
				secessFun(xml, "#newResult");
			}
		});
	});
</script>


${box3 }

<%@ include file="/views/common/footer.jsp"%>