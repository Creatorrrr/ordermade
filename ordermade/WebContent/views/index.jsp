<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="head.jsp"%>

	<!--Main Image-->
	<div class="wrapper">
		<div id="slider">
			<div id="slide-wrapper" class="rounded clear">
				<figure id="slide-1">
					<a class="view" href="#"><img
						src="${stx }images/demo/slider/pp.jpg" alt=""></a>
					<!-- 					<figcaption>
						<h2>Nullamlacus dui ipsum</h2>
						<p>Attincidunt vel nam a maurisus lacinia consectetus magnisl
							sed ac morbi. Inmaurisus habitur pretium eu et ac vest penatibus
							id lacus parturpis.</p>
						<p class="right">
							<a href="#">Continue Reading &raquo;</a>
						</p>
					</figcaption> -->
				</figure>
				<figure id="slide-2">
					<a class="view" href="#"><img
						src="${stx }images/demo/slider/2.png" alt=""></a>
				</figure>
				<figure id="slide-3">
					<a class="view" href="#"><img
						src="${stx }images/demo/slider/3.png" alt=""></a>
				</figure>
				<figure id="slide-4">
					<a class="view" href="#"><img
						src="${stx }images/demo/slider/4.png" alt=""></a>
				</figure>
				<figure id="slide-5">
					<a class="view" href="#"><img
						src="${stx }images/demo/slider/5.png" alt=""></a>
				</figure>
				<ul id="slide-tabs">
					<li><a href="${stx }#slide-1">A</a></li>
					<li><a href="${stx }#slide-2">B</a></li>
					<li><a href="${stx }#slide-3">C</a></li>
					<li><a href="${stx }#slide-4">D</a></li>
					<li><a href="${stx }#slide-5">E</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--Main Image End  -->

	<div class="wrapper row3">
		<div class="rounded">
			<main class="container clear"> <!-- main body -->
			<div class="group btmspace-30">

				<!-- Middle Column -->
				<div class="one_half">

					<h2>인기 상품</h2>
					<ul class="nospace listing">
						<li class="clear">
							<%-- <c:forEach items="${ box_list }" var="literature"> --%>
							<div class="content" align="center">
								<table class="table">

									<tr>
										<div class="imgl borderedbox">
											<img src="${ctx }/views/images/img1.jpg" />
										</div>
									</tr>
									<tr class="nospace btmspace-15">
										<td>상품 이름</td>
										<td><a class="literature" href="${ctx}/#/#.do?#=${asf }">${asf  }
												rkrkrk</a></td>
									</tr>
									<tr class="nospace btmspace-15">
										<td>가격</td>
										<td class="creatorId">${asf}10000000원</td>
									</tr>
								</table>
							</div> <%-- </c:forEach> --%>
						</li>

						<h2>최신 상품</h2>
						<ul class="nospace listing">
							<li class="clear">
								<%-- <c:forEach items="${ box_list }" var="literature"> --%>
								<div class="content" align="center">
									<table class="table">
										<tr>
											<div class="imgl borderedbox">
												<img src="${ctx }/views/images/img1.jpg" />
											</div>
										</tr>
										<tr class="nospace btmspace-15">
											<td>상품 이름</td>
											<td><a class="literature" href="${ctx}/#/#.do?#=${asf }">${asf  }
													rkrkrk</a></td>
										</tr>
										<tr class="nospace btmspace-15">
											<td>가격</td>
											<td class="creatorId">${asf}10000000원</td>
										</tr>
									</table>
								</div> <%-- </c:forEach> --%>
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
			<!-- Instruction END --> <!-- / main body -->
			<div class="clear" />
			</main>
		</div>
	</div>
	<div class="wrapper row4">
		<div class="rounded">
			<footer id="footer" class="clear">
				<div class="one_third first">
					<figure class="center">
						<img class="btmspace-15" src="${stx }images/demo/worldmap.png"
							alt="">
						<figcaption>
							<a href="#">Find Us With Google Maps &raquo;</a>
						</figcaption>
					</figure>
				</div>
				<div class="one_third">
					<address>
						Long Educational Facility Name<br> Address Line 2<br>
						Town/City<br> Postcode/Zip<br> <br> <i
							class="fa fa-phone pright-10"></i> xxxx xxxx xxxxxx<br> <i
							class="fa fa-envelope-o pright-10"></i> <a href="#">contact@domain.com</a>
					</address>
				</div>
				<div class="one_third">
					<p class="nospace btmspace-10">Stay Up to Date With What's
						Happening</p>
					<ul class="faico clear">
						<li><a class="faicon-twitter" href="#"><i
								class="fa fa-twitter"></i></a></li>
						<li><a class="faicon-linkedin" href="#"><i
								class="fa fa-linkedin"></i></a></li>
						<li><a class="faicon-facebook" href="#"><i
								class="fa fa-facebook"></i></a></li>
						<li><a class="faicon-flickr" href="#"><i
								class="fa fa-flickr"></i></a></li>
						<li><a class="faicon-rss" href="#"><i class="fa fa-rss"></i></a></li>
					</ul>
					<form class="clear" method="post" action="#">
						<fieldset>
							<legend>Subscribe To Our Newsletter:</legend>
							<input type="text" value=""
								placeholder="Enter Email Here&hellip;">
							<button class="fa fa-sign-in" type="submit" title="Sign Up">
								<em>Sign Up</em>
							</button>
						</fieldset>
					</form>
				</div>
			</footer>
		</div>
	</div>
	<div class="wrapper row5">
		<div id="copyright" class="clear">
			<p class="fl_left">
				Copyright &copy; 2014 - All Rights Reserved - <a href="#">Domain
					Name</a>
			</p>
			<p class="fl_right">
				Template by <a target="_blank" href="http://www.os-templates.com/"
					title="Free Website Templates">OS Templates</a>
			</p>
		</div>
	</div>
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.fitvids.min.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<script src="layout/scripts/tabslet/jquery.tabslet.min.js"></script>
</body>
</html>