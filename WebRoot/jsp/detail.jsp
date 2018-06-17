<%@ include file="path.txt"%>
	<!doctype html>
	<html>

	<head>
		<%@ include file="load.txt" %>
			<title>顶王全能吊顶网上商城</title>
			<script type="text/javascript">
				$(document).ready(function () {
					$.ajax({
						type: "POST",
						url: "sessiongoods",
						data: {},
						dataType: "json",
						success: function (data) {
							if (data != null) {
								$("#goods_image").attr("src", data.image);
								$("#goods_name").append(data.name);
								$("#goods_name").append("&nbsp;&nbsp;&nbsp;&nbsp;");
								$("#goods_name").append(data.brief);
								$("#goods_number").append(data.number);
								$("#goods_variety").append(data.variety);
								$("#goods_name").append("&nbsp;&nbsp;&nbsp;&nbsp;");
								$("#goods_variety").append(data.style);
								$("#goods_price").append(data.price); $("#goods_price").append("/平米");
								$("#goods_intro").append(data.intro);
								$("#image_say_img").attr("src", data.imagesay);
							}
						},
						error: function (jqXHR) {
							alert("发生错误：" + jqXHR.status);
						}
					});
				});
			</script>
	</head>

	<body>

		<%@ include file="head.txt" %>
			<%@ include file="search.txt" %>
				<%@ include file="list.txt" %>


					<div id="head_location">当前位置：首页->搜索结果->商品详情</div>
					<table id="goods_table" cellpadding="0" cellspacing="0">
						<tr>
							<td rowspan="6" width="60%">
								<img src="" id="goods_image">
							</td>
							<td height="50px" id="goods_name"></td>
						</tr>
						<tr>
							<td width="40%" height="50px" id="goods_number">产品编号：</td>
						</tr>
						<tr>
							<td height="50px" id="goods_variety">标签：</td>
						</tr>
						<tr>
							<td height="50px" id="goods_price">￥</td>
						</tr>
						<tr>
							<td height="50px" id="goods_intro"></td>
						</tr>
						<tr>
							<td>
								<button id="order_submit">立即预约</button>
								<button id="collect_submit">收藏</button>
							</td>
						</tr>
					</table>
					<div id="image_say">
						<table class="hot_sale">
							<tr>
								<td class="hot_sale_lan">热销商品</td>
							</tr>
							<tr>
								<td class="hot_goods1">1</td>
							</tr>
							<tr>
								<td class="hot_goods2">2</td>
							</tr>
							<tr>
								<td class="hot_goods3">3</td>
							</tr>
							<tr>
								<td class="hot_goods4">4</td>
							</tr>
							<tr>
								<td class="hot_goods5">5</td>
							</tr>
							<table>
								<img src="" id="image_say_img">
					</div>
	</body>

	<script type="text/javascript">
		$(document).ready(function () {	
			$(document).on("click", "#order_submit", function () {
				if(customer!=null){
				$.ajax({
					type: "POST",
					url: "savetoorder",
					data: {
					},
					success: function (data) {
						alert("预约成功！");
					},
					error: function (jqXHR) {
						alert("发生错误：" + jqXHR.status);
					}
				});
			}else{
							alert("您还未登录!");
							location.href="jsp/login.jsp";
						}
			});

			$(document).on("click", "#collect_submit", function () {
				if(customer!=null){
				$.ajax({
					type: "POST",
					url: "savetocollect",
					data: {
					},
					success: function (data) {
						if (data.msg != "no")
							alert("收藏成功！");
						else
							alert("该商品已经被收藏过！");
					},
					error: function (jqXHR) {
						alert("发生错误：" + jqXHR.status);
					}
				});
			}else{
							alert("您还未登录!");
							location.href="jsp/login.jsp";
						}
			});
		});
	</script>

	</html>