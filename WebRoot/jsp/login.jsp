<%@ include file="path.txt" %>
	<!doctype html>
	<html>

	<head>
		<%@ include file="load.txt" %>
			<title>顶王全能吊顶网上商城</title>
			<script type="text/javascript">

				
				$(document).ready(function () {
					$("#login_submit").click(
						function () {
							$.ajax({
								type: "POST",
								url: "login",
								data: {
									userphone: $.trim($("#userphone").val()),
									password: $.trim($("#password").val()),						
								},
								dataType : "json",
								success: function (data) {
									if(data.msg=="three"){
										alert("该用户未注册");
									}
									else if(data.msg=="two"){
										alert("密码错误");
									}
									else {
									location.href="jsp/index.jsp";	}
								},
								error: function (jqXHR) {
									alert("发生错误：" + jqXHR.status);
								}
							});
						
						});
				});
				
			</script>

	</head>

	<body>
		<%@ include file="head.txt" %>
		<table align="center" class="ab">
			<tr>
				<td colspan="2">
					<a href="index.jsp">
						<img src="images/logo.jpg" />
					</a>
					<img src="images/conf.png" class="ac" />
				</td>
			</tr>
			<tr>
				<td colspan="2" height="60px"></td>
			</tr>

			<tr>
				<td rowspan="8" width="10%" class="ae">
					<img src="images/5.jpg" width="640px" height="360px">
				</td>

				<td class="ah" title="sign">&nbsp;</td>
			</tr>

			<tr title="name">
				<td>
					<img src="images/username.png" style="float:left;" />
					<input type="text" name="userphone" id="userphone" placeholder="手机号" size="40" class="ad1" style="float:left;" />
				</td>
			</tr>
			<tr title="code">
				<td style="float:left;">
					<img src="images/userpassword.png" style="float:left;" />
					<input type="password" name="password" style="float:left;" id="password" placeholder="密码" size="40" class="ad1" />
				</td>
			</tr>
			<tr>
				<td align="center">
					<button id="login_submit" class="af" value="" />
				</td>
			</tr>
			</form>
			<tr>
				<td>
					<a href="jsp/register.jsp" class="ag">立即注册</a>
				</td>
			</tr>




		</table>




	</body>

	</html>