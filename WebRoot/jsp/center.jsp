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
								<td>电话</td>
								<td><input type="text" id="userphone"
									value="<s:property value="#session.user.userphone" />" disabled /></td>
							</tr>
							<tr>
								<td>姓名</td>
								<td><input type="text" id="username"
									value="<s:property value="#session.user.username" />" /></td>
							</tr>
							<tr>
								<td>性别</td>
								<td>男<input type="radio" name="sex" id="man" value="man">女<input
									type="radio" name="sex" id="woman" value="woman"></td>
							</tr>
							<tr>
								<td>生日</td>
								<td><input type="date" id="userbirthday"
									value="<s:property value="#session.user.userbirthday" />" /></td>
							</tr>
							<tr>
								<td>地址</td>
								<td><input type="text" id="address"
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
								<td>原密码</td>
								<td><input type="password" id="password"
									value="<s:property value="#session.user.password" />" /></td>
							</tr>
							<tr>
								<td>新密码</td>
								<td><input type="password" id="newpassword" value="" /></td>
							</tr>
							<tr>
								<td>再次输入新密码</td>
								<td><input type="password" id="repassword" value="" /></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><button id="password_submit">确定修改</button></td>
							</tr>
						</table>
					</div>

				</div>

			</div>

			<!-- 我的收藏-->
			<div class="cd hide">我的收藏</div>

			<!-- 我的预约-->
			<div class="cd hide">我的预约</div>

		</div>

	</div>
</body>

</html>