<%@ include file="path.txt" %>
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
					<div id="head_location">当前位置：首页->我的预约</div>
					<div id="result_count"></div>
					<div id="status_select">
					<label>分类选择：</label>
						已完成<input type="checkbox" name="status_select" value="2" id="status_select_em" checked="checked" />
						正在预约<input type="checkbox" name="status_select" value="1" id="status_select_em" checked="checked" />
						已取消<input type="checkbox" name="status_select" value="0" id="status_select_em" checked="checked" />
						<button id="status_all_select" onclick="status_all_select();">全选</button>
					</div>
					<div id="show-in"></div>
	</body>
	<script type="text/javascript">

		function status_all_select(){
			$("input[type='checkbox']").each(function(){
				$(this).prop("checked",true);
			});
			$("table").show();
		
		}

		$(document).ready(function () {

			if (customer != null) {
				$.ajax({
					type: "POST",
					url: "findorderlist",
					data: {},
					dataType: "json",
					success: function (data) {
						if (data != null) {
							count = data.list.length;
							for (var i = 0; i < data.list.length; i++) {
								$("#show-in")
									.append(
										"<table class='result_list'><tr><td colspan='2'>预约时间：" + data.ordertime[i] + "<label id='order_label'></label></td></tr><tr><td class='result_photo' rowspan='6'><img src='" + data.list[i].image + "' class='result_img'></td><td class='result_name'>"
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
										+ "</td></tr><tr><td><button id='detail_submit' >查看详情</button><input type='hidden' id='ordergoodsnumber' value='" + data.list[i].number + "'><input type='hidden' id='orderstatus' value='" + data.orderstatus[i] + "'><input type='hidden' id='ordernumber' value='" + data.ordernumber[i] + "'><button id='deleteorder_submit'>取消预约</button></td></tr></table>");
								if (data.orderstatus[i] == 2 || data.orderstatus[i] == 0) {
									$("input#ordernumber[value='"+data.ordernumber[i]+"']").parent().children("#deleteorder_submit").remove();
								}
								if(data.orderstatus[i]==2){
									
									$("input#ordernumber[value='"+data.ordernumber[i]+"']").parents("table").find("#order_label").html("预约订单已完成!");
									$("input#ordernumber[value='"+data.ordernumber[i]+"']").parents("table").find("#order_label").css("color","blue");
								}else if(data.orderstatus[i]==1){
									$("input#ordernumber[value='"+data.ordernumber[i]+"']").parents("table").find("#order_label").html("成功预约，等待商家线下安装!");
									$("input#ordernumber[value='"+data.ordernumber[i]+"']").parents("table").find("#order_label").css("color","green");
								}else{
									$("input#ordernumber[value='"+data.ordernumber[i]+"']").parents("table").find("#order_label").html("预约已取消!");
									$("input#ordernumber[value='"+data.ordernumber[i]+"']").parents("table").find("#order_label").css("color","#646464");
								}
							}
							$("#result_count").append(
								"您共预约商品" + count
								+ "次");
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
						number: $.trim($(this).parent().children("input#ordergoodsnumber").val()),

					},

					success: function (data) {
						location.href = "jsp/detail.jsp";
					},
					error: function (jqXHR) {
						alert("发生错误：" + jqXHR.status);
					}
				});
			});
			
			$(document).on("click", "#deleteorder_submit", function () {
				if (confirm("您确定要取消预约该商品？")) {
					$.ajax({
						type: "POST",
						url: "deletefromorder",
						data: {
							ordernumber: $.trim($(this).parent().children("input#ordernumber").val()),
						},

						success: function (data) {
							$("input#ordernumber[value='"+data.msg+"']").parent().children("#deleteorder_submit").remove();
							$("input#ordernumber[value='"+data.msg+"']").parents("table").find("#order_label").html("预约已取消!");
									$("input#ordernumber[value='"+data.msg+"']").parents("table").find("#order_label").css("color","#646464");
						},
						error: function (jqXHR) {
							alert("发生错误：" + jqXHR.status);
						}
					});
				}
			});

			$("input[type='checkbox']").change(function(){
				var obj=document.getElementsByName('status_select');
					$("table").show();
				for(var i=0;i<obj.length;i++){
					if(!obj[i].checked){
						if(obj[i].value=="2"){
						$("input#orderstatus[value='2']").parents("table").hide();
						}
						if(obj[i].value=="1"){
						$("input#orderstatus[value='1']").parents("table").hide();
						}
						if(obj[i].value=="0"){
						$("input#orderstatus[value='0']").parents("table").hide();
						}
					}
				}
			});
		});
	</script>

	</html>