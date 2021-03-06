﻿<%@ include file="path.txt"%>
	<!DOCTYPE html>
	<html>

	<head>
		<%@ include file="load.txt"%>
			<title>顶王全能吊顶网上商城</title>
			<script type="text/javascript">
				$(document)
					.ready(
						function () {
							$.ajax({
								type: "POST",
								url: "sessionlist",
								data: {},
								dataType: "json",
								success: function (data) {
									if (data != null) {
										for (var i = 0; i < data.list.length; i++) {
											$("#show-in")
												.append(
													"<table class='result_list'><tr><td class='result_photo' rowspan='6'><img src='" + data.list[i].image + "' class='result_img'></td><td class='result_name'>"
													+ data.list[i].name
													+ "&nbsp;&nbsp;&nbsp;&nbsp;"
													+ data.list[i].brief
													+ "</td></tr><tr><td>产品编号："
													+ data.list[i].number
													+ "</td></tr><tr><td>标签："
													+ data.list[i].style
													+ "&nbsp;&nbsp;&nbsp;&nbsp;"
													+ data.list[i].variety
													+ "</td></tr><tr><td class='result_price'>￥"
													+ data.list[i].price
													+ "/平米</td></tr><tr><td>"
													+ data.list[i].intro
													+ "</td></tr><tr><td><button id='detail_submit' >查看详情</button><input type='hidden' value='" + data.list[i].number + "'><button id='collect_submit'>收藏</button></td></tr></table>");
										}
										$("#result_count").append(
											"共检索出商品" + data.list.length
											+ "个");
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
		<%@ include file="head.txt"%>
			<%@ include file="search.txt"%>
				<%@ include file="list.txt"%>
					<div id="head_location">当前位置：首页->搜索结果</div>
					<div id="result_count"></div>
					<div id="show-in"></div>
	</body>

	<script type="text/javascript">
		$(document)
			.ready(
				function () {
					$(document).on("click", "#collect_submit", function () {
						if(customer!=null){
						$.ajax({
							type: "POST",
							url: "resultsavetocollect",
							data: {
								number: $.trim($(this).parent().children("input").val()),
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

					$(document).on("click", "#detail_submit", function () {
						
						$.ajax({
							type: "POST",
							url: "goodsdetail",
							data: {
								number: $.trim($(this).parent().children("input").val()),

							},

							success: function (data) {
								location.href = "jsp/detail.jsp";


							},
							error: function (jqXHR) {
								alert("发生错误：" + jqXHR.status);
							}
						});
				
					});
				});
	</script>

	</html>