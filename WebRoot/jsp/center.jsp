<%@ include file="path.txt" %>
	<!doctype html>
	<html>

	<head>
		<%@ include file="load.txt" %>
			<script type="text/javascript">
				$(function () {
					var $div_li = $("div.person_center_dao ul li");
					$div_li.click(function () {
						$(this).addClass("ce")
							.siblings().removeClass("ce");
						var index = $div_li.index(this);
						$("div.cc2 > div")
							.eq(index).show()
							.siblings().hide();
					}).hover(function () {
						$(this).addClass("hover");
					}, function () {
						$(this).removeClass("hover");
					})

					$(".nav>li").hover(function () {
						$(this).children('ul').stop(true, true).show(300);
					}, function () {
						$(this).children('ul').stop(true, true).hide(300);
					})
				})

			</script>

	</head>

	<body>
		<%@ include file="head.txt" %>
			<%@ include file="search.txt" %>
				<%@ include file="list.txt" %>

					<div class="person_center">
						<div class="person_center_dao">
							<ul class="ca">
								<li class="cb ce">个人信息</li>
								<li class="cb">我的收藏</li>
								<li class="cb">我的预约</li>
							</ul>
						</div>

						<div class="cc2">

							<!-- 个人中心-->
							<div class="cd">
								
							</div>

							<!-- 我的收藏-->
							<div class="cd hide">
								我的收藏</div>

							<!-- 我的预约-->
							<div class="cd hide">
								我的预约</div>

						</div>

					</div>
	</body>
	</html>