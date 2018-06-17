<%@ include file="path.txt"%>
	<!doctype html>
	<html>

	<head>
		<%@ include file="load.txt"%>
			<title>注册</title>

			<script type="text/javascript">
				function isexist() {
					if ($("#register_phone").val() != "") {
						var phone = $("#register_phone").val();
						var pattern = /^1[34578]\d{9}$/;
						if (pattern.test(phone)) {
							$.ajax({
								type: "POST",
								url: "isexistphone",
								data: {
									userphone: $.trim($("#register_phone").val()),
								},
								dataType: "json",
								success: function (data) {
									if (data.msg == false) {
										$("img").remove(".isexist_img");
										$("label").remove("#isexist");
										$("#register_is").append("<img src='images/yes.jpg' class='isexist_img'>");
										$("#register_is").append("<label id='isexist' style='color:#3CB371'>手机号未注册，可使用！</label>");
									}
									else {
										$("img").remove(".isexist_img");
										$("label").remove("#isexist");
										$("#register_is").append("<img src='images/no.jpg' class='isexist_img'>");
										$("#register_is").append("<label id='isexist' style='color:#CD2626'>该手机号已注册！</label>");
									}
								},
								error: function (jqXHR) {
									alert("发生错误：" + jqXHR.status);
								}
							});
						} else {
							$("#register_is").append("<label id='isexist' style='color:#CD2626'>该手机号不存在，请输入正确手机格式！</label>");
						}
					}

					$(document).ready(function () {
						$("#register_submit").click(
							function () {

								$.ajax({
									type: "POST",
									url: "register",
									data: {
										userphone: $.trim($("#register_phone").val()),
										username: $.trim($("#register_name").val()),
										password: $.trim($("#register_password").val()),
										sex: $('input:radio[name="sex"]:checked')
											.val(),
										userbirthday: $.trim($("#register_birthday")
											.val()),
										address: $.trim($("#register_address").val()),

									},
									dataType: "json",
									success: function (data) {
										showdiv();
										$("#show-in").append(
											"<br>手机号：" + data.userphone);
										$("#show-in").append(
											"<br>姓名：" + data.username);
										$("#show-in").append(
											"<br>密码：" + data.password);
										$("#show-in").append(
											"<br>生日："
											+ data.userbirthday
												.substring(0, 10));
										$("#show-in").append(
											"<br>地址：" + data.address);
										$("#show-in").append("<br>性别：" + data.sex);

									},
									error: function (jqXHR) {
										alert("发生错误：" + jqXHR.status);
									}
								});
							});
					});
			</script>

			<script type="text/javascript">
					function countDown(secs, surl) {
						var jumpTo = document.getElementById('jumpTo');
						jumpTo.innerHTML = secs;
						if (--secs > 0) {
							setTimeout("countDown(" + secs + ",'" + surl + "')", 1000);
						} else {
							location.href = surl;
							-ma
						}
					}
			</script>
			<script language="javascript" type="text/javascript">
					function showdiv() {
						document.getElementById("bg").style.display = "block";
						document.getElementById("myModel").style.display = "block";
						countDown(3, 'jsp/index.jsp');
					}
					function hidediv() {
						document.getElementById("bg").style.display = 'none';
						document.getElementById("myModel").style.display = 'none';
					}
			</script>
			<style type="text/css">
				#bg {
					display: none;
					position: absolute;
					top: 0%;
					left: 0%;
					width: 100%;
					height: 100%;
					background-color: black;
					z-index: 1001;
					-moz-opacity: 0.7;
					opacity: 0.7;
					filter: alpha(opacity=70);
				}
			</style>
	</head>

	<body>

		<%@ include file="head.txt" %>
			<div class="register_logo">
				<img src="images/logo.jpg" class="register_logo_img">
				<label class="register_logo_text">欢迎注册</label>
			</div>
			<div class="inin"></div>

			<div class="register_div">
				<table class="register_table">
					<tr>
						<td>手机号：</td>
						<td id="register_is">
							<input type="text" onblur="isexist();" id="register_phone" class="register_phone" placeholder="输入手机号">
						</td>
					</tr>
					<tr>
						<td>用户名：</td>
						<td>
							<input type="text" id="register_name" class="register_name" placeholder="输入用户名">
						</td>
					</tr>
					<tr>
						<td>登录密码：</td>
						<td>
							<input type="password" id="register_password" class="register_password" placeholder="输入密码">
						</td>
					</tr>
					<tr>
						<td>确定密码：</td>
						<td>
							<input type="password" id="register_repassword" class="register_password" placeholder="再次输入密码">
						</td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<label class="register_sex">男</label>
							<input type="radio" name="sex" value="man" id="register_sex" checked>
							<label class="register_sex">女</label>
							<input type="radio" value="woman" name="sex" id="register_sex">
						</td>
					</tr>
					<tr>
						<td>生日：</td>
						<td>
							<input type="date" id="register_birthday" class="register_birthday" placeholder="输入手机号">
						</td>
					</tr>
					<tr>
						<td>收货地址：</td>
						<td>
							<input type="text" id="register_address" class="register_address" placeholder="输入收货地址">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="register_submit" id="register_submit" data-toggle="modal" data-target="#myModel">注册</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="bg"></div>
			<div class="modal fade" id="myModel">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">注册成功！</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- 模态框主体 -->
						<div class="modal-body" id="show-in"></div>

						<!-- 模态框底部 -->
						<div class="modal-footer">
							<a href="index.jsp">
								<span id="jumpTo">3</span>秒后系统会自动跳转，也可点击本处直接跳
							</a>

						</div>

					</div>
				</div>
			</div>

	</body>

	</html>