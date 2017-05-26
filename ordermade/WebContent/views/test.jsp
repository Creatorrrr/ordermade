<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ include file="head.jsp"%>



<!--comment write  -->
			<div id="comments">
				<h2>후기 작성</h2>
				<form action="#" method="post">
					<div class="one_third first">
						<label for="name">제목 <span>*</span></label> <input type="text"
							name="name" id="name" value="" size="22">
					</div>
					<div class="one_third">
						<label for="email">비밀번호 <span>*</span></label> <input type="text"
							name="email" id="email" value="" size="22">
					</div>
					<div class="block clear">
						<label for="comment">후기</label>
						<textarea name="comment" id="comment" cols="25" rows="10"></textarea>
					</div>
					<div>
						<input name="submit" type="submit" value="Submit Form">
						&nbsp; <input name="reset" type="reset" value="Reset Form">
					</div>
				</form>
			</div>
		</div>
<!--/comment write  -->


		<div class="sidebar one_third">
			<%@ include file="productNav.jsp"%>
		</div>
		<div class="clear"></div>
		</main>
	</div>
</div>

<div class="wrapper row4">
	<div class="rounded">
		<footer id="footer" class="clear">
			<div class="one_third first">
				<figure class="center">
					<img class="btmspace-15" src="../images/demo/worldmap.png" alt="">
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
						<input type="text" value="" placeholder="Enter Email Here&hellip;">
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
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.fitvids.min.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>
