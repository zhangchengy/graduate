<%@ include file="path.txt"%>
<!doctype html>
<html>

<head>
<%@ include file="load.txt"%>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#inform_submit").click(
						function() {
							
							$.ajax({
								type : "POST",
								url : "informalter",
								data : {
									userphone : $.trim($("#userphone").val()),
									username : $.trim($("#username").val()),
									
									sex : $('input:radio[name="sex"]:checked')
											.val(),
									userbirthday : $.trim($("#userbirthday")
											.val()),
									address : $.trim($("#address").val()),

								},
								dataType : "json",
								success : function(data) {
									if(data!=null){
									alert("修改成功!");}
								},
								error : function(jqXHR) {
									alert("发生错误：" + jqXHR.status);
								}
							});
						});
			});

	$(function() {
		var $div_li = $("div.person_center_dao ul li");
		$div_li.click(function() {
			$(this).addClass("ce").siblings().removeClass("ce");
			var index = $div_li.index(this);
			$("div.cc2 > div").eq(index).show().siblings().hide();
		}).hover(function() {
			$(this).addClass("hover");
		}, function() {
			$(this).removeClass("hover");
		})

		var $inform_div_li = $("div.person_inform ul li");
		$inform_div_li.click(function() {
			$(this).addClass("de").siblings().removeClass("de");
			var index_inform = $inform_div_li.index(this);
			$("div.dc > div").eq(index_inform).show().siblings().hide();
		}).hover(function() {
			$(this).addClass("hover");
		}, function() {
			$(this).removeClass("hover");
		})

		if (<s:property value="#session.user.sex" /> == man) {
			$("#man").attr("checked", true);
		} else
			$("#woman").attr("checked", true);
	})
</script>

</head>

<body>
	<%@ include file="head.txt"%>
	<%@ include file="search.txt"%>
	<%@ include file="list.txt"%>

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


				<div class="person_inform">
					<ul class="da">
						<li class="db de">修改我的信息</li>
						<li class="db">修改登录密码</li>
					</ul>
				</div>
				<div class="dc">
					<div class="dd">
						<table align="center">
							<tr>
								<td class="table_label">电话</td>
								<td class="table_content"><input type="text" id="userphone"
									value="<s:property value="#session.user.userphone" />" disabled /></td>
							</tr>
							<tr>
								<td class="table_label">姓名</td>
								<td class="table_content"><input type="text" id="username"
									value="<s:property value="#session.user.username" />" /></td>
							</tr>
							<tr>
								<td class="table_label">性别</td>
								<td class="table_content">男<input type="radio" name="sex" id="man" value="man">女<input
									type="radio" name="sex" id="woman" value="woman"></td>
							</tr>
							<tr>
								<td class="table_label">生日</td>
								<td class="table_content"><input type="date" id="userbirthday"
									value="<s:property value="#session.user.userbirthday" />" /></td>
							</tr>
							<tr>
								<td class="table_label">地址</td>
								<td class="table_content"><input type="text" id="address"
									value="<s:property value="#session.user.address" />" /></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><button id="inform_submit">确定修改</button></td>
							</tr>
						</table>
					</div>

					<div class="dd hide">
						<table align="center">
							<tr>
								<td class="table_label">原密码</td>
								<td><input type="password" id="oldPassword"
									value="" /></td>
							</tr>
							<tr>
								<td class="table_label">新密码</td>
								<td><input type="password" id="newPassword" value="" /></td>
							</tr>
							<tr>
								<td class="table_label">再次输入新密码</td>
								<td><input type="password" id="reNewPassword" value="" /></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><button id="password_submit" onclick="passwordalter();">确定修改</button></td>
							</tr>
						</table>
					</div>

				</div>

			</div>

			<!-- 我的收藏-->
			<div class="cd hide" id="collect_show"></div>

			<!-- 我的预约-->
			<div class="cd hide" id="order_show">
					<div id="cener_head_location">当前位置：首页->个人中心->我的预约</div>
					<div id="center_result_count"></div>
					<div id="center_status_select">
					<label>分类选择：</label>
						已完成<input type="checkbox" name="status_select" value="2" id="status_select_em" checked="checked" />
						正在预约<input type="checkbox" name="status_select" value="1" id="status_select_em" checked="checked" />
						已取消<input type="checkbox" name="status_select" value="0" id="status_select_em" checked="checked" />
						<button id="status_all_select" onclick="status_all_select();">全选</button>
					</div>

			</div>

		</div>

	</div>
</body>
<script type="text/javascript">	
	function passwordalter() {
			var old=$.trim($("#oldPassword").val());
			var newPassword=$.trim($("#newPassword").val());
			var reNewPassword=$.trim($("#reNewPassword").val());
				if (newPassword==reNewPassword) {
					$.ajax({
						type: "POST",
						url: "userpasswordalter",
						data: {
							oldPassword:old,
							newPassword:newPassword,
						},
						dataType : "json",
						success: function (data) {
							if(data.msg=="one"){
								alert("修改成功！");  
							 }
							 else{
								 alert("原密码输入错误！");
							 }        
						},
						error: function (jqXHR) {
							alert("发生错误：" + jqXHR.status);
						}
					});                       
				} 
				else{
					alert("新密码两次输入不一致！");
				} 
	 }             
</script>


<!--收藏显示-->
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
							$("#collect_show")
								.append(
									"<table class='center_result_list'><tr><td class='result_photo' rowspan='6'><img src='" + data.list[i].image + "' class='result_img'></td><td class='result_name'>"
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

<!--预约订单-->
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
							$("#order_show")
								.append(
									"<table class='center_result_list'><tr><td colspan='2'>预约时间：" + data.ordertime[i] + "<label id='order_label'></label></td></tr><tr><td class='result_photo' rowspan='6'><img src='" + data.list[i].image + "' class='result_img'></td><td class='result_name'>"
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