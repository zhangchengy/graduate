﻿<%@ include file="path.txt" %>
	<!DOCTYPE html>
	<html>

	<head>
		<%@ include file="load.txt" %>
			<title>顶王全能吊顶网上商城</title>


	</head>

	<body>
		<%@ include file="head.txt" %>
			<%@ include file="search.txt"%>
				<%@ include file="list.txt"%>
					<div id="head_location">当前位置：首页->我的收藏</div>
					<div id="result_count"></div>
					<div id="show-in"></div>
	</body>
	<script type="text/javascript">
		$(document).ready(function () {

			if (customer != null) {
				$.ajax({

					type: "POST",
					url: "findcollectlist",
					data: {},
					async:false,
					dataType: "json",
					success: function (data) {
						if (data != null) {
							count=data.list.length;
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
										+ "</td></tr><tr><td><button id='detail_submit' >查看详情</button><input type='hidden' value='" + data.list[i].number + "'><button id='deletecollect_submit'>删除收藏</button></td></tr></table>");
							}
							$("#result_count").append(
								"您共收藏商品" + count
								+ "件");
						}
					},
					error: function (jqXHR) {
						alert("发生错误：" + jqXHR.status);
					}
				});
			}

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

			$(document).on("click", "#deletecollect_submit", function () {
				if (confirm("您确定要删除该收藏商品？")) {
				$.ajax({
					type: "POST",
					url: "deletefromcollect",
					async:false,
					data: {
						number: $.trim($(this).parent().children("input").val()),
					},

					success: function (data) {
						count--;
						$("input[value='"+data.msg+"']").parents("table").remove();	
						$("#result_count").html(
								"您共收藏商品" + count
								+ "件");					

					},
					error: function (jqXHR) {
						alert("发生错误：" + jqXHR.status);
					}
				});
				}
			});
		});
	</script>

	</html>