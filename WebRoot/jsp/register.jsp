<%@ include file="path.txt"%>
<!doctype html>
<html>

<head>
<%@ include file="load.txt"%>
<title>注册</title>

<script type="text/javascript">

$(document).ready(function(){
	$("#register_submit").click(
			function() {
				console.log($.trim($("#userbirthday").val()));
				$.ajax({
					type : "POST",
					url : "register",
					data : {
						userphone: $.trim($("#userphone").val()),
						username : $.trim($("#username").val()),
						password : $.trim($("#password").val()),
						sex:$('input:radio[name="sex"]:checked').val(),
						userbirthday : $.trim($("#userbirthday").val()),
						address:$.trim($("#address").val()),

					},
					dataType : "json",
					success : function(data) {
						showdiv();
						$("#show-in").append("<br>手机号：" + data.userphone);
						$("#show-in").append("<br>姓名：" + data.username);
						$("#show-in").append("<br>密码：" + data.password);
						$("#show-in").append(
								"<br>生日：" + data.userbirthday.substring(0, 10));
						$("#show-in").append("<br>地址：" + data.address);
						$("#show-in").append("<br>性别：" + data.sex);

					},
					error : function(jqXHR) {
						alert("发生错误：" + jqXHR.status);
					}
				});
			});
});
</script>
<script type="text/javascript">
	$(function() {
		$("#username").focus(function() { // 地址框获得鼠标焦点
			var text1 = $("#nameme").text();
			if (text1 != "请输入中文、英文或者其他字符组合，但是不能输入空格") {
				$("#nameme").append("<span>请输入中文、英文或者其他字符组合，但是不能输入空格</span>");
			}
		});
		$("#password").focus(function() { // 地址框获得鼠标焦点
			var text1 = $("#passwordme").text();
			if (text1 != "请输入长度不大于20的英文数字符号组合") {
				$("#passwordme").append("<span>请输入长度不大于20的英文数字符号组合</span>");
			}
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
		countDown(3,'jsp/index.jsp');
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
	filter: alpha(opacity = 70);
}


</style>
</head>

<body>
		
	<div class="ai">
		<a href="jsp/index.jsp"> <img src="images/logo.jpg" class="aj" />
		</a>
		<ul class="ak">
			<li class="b">欢迎光临集成吊顶门户网站！</li>
			<li class="b"><a href="jsp/login.jsp"> <span class="dcd">请登录</span>
			</a></li>
			<span id="user_name"></span>
			<li class="b"><a href="javascript:void(0)"> <span class="c">成为会员</span>
			</a></li>

			<li class="b"><a href="self_order.jsp"> <span class="c">我的预约</span>
			</a></li>
			<li class="b"><a href="history_order.jsp"> <span class="c">收藏夹</span>
			</a></li>
			<li class="b"><a href="mailto:skysgreen@qq.com"> <span
					class="c">联系客服</span>
			</a></li>
		</ul>
	</div>
	<div class="al">
		<div class="am">
			<div class="an">新用户注册</div>
			<div class="ao">
				
					<table width="90%">
						<tr>
							<td class="ap">手机号</td>
							<td><input type="text" size="40" placeholder="手机号"
								class="aq" id="userphone" name="userphone"> <span
								id="queuser"></span></td>
						</tr>
						<tr>
							<td colspan="2" id="nameme"></td>
						</tr>
						
						<tr>
							<td class="ap">用户名</td>
							<td><input type="text" size="40" placeholder="用户名"
								class="aq" id="username" name="username"> <span
								id="queuser"></span></td>
						</tr>
						<tr>
							<td colspan="2" id="nameme"></td>
						</tr>
						
						<tr>
							<td class="ap">登陆密码</td>
							<td><input type="password" size="40" placeholder="密码"
								class="aq" id="password" name="password"> <span
								id="mi"></span></td>
						</tr>
						<tr>
							<td colspan="2" id="passwordme"></td>
						</tr>
						<tr>
							<td class="ap">确认密码</td>
							<td><input type="password" id="repassword" size="40"
								placeholder="再次输入密码" class="aq" name="repassword"> <span
								id="quemi"></span></td>
						</tr>

						<tr>
							<td class="ap">性别</td>
							<td><label class="aq1">男</label> <input type="radio"
								value="man" id="sex" name="sex" class="au" checked />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="aq1">女</label> <input type="radio" value="woman"
								id="sex" name="sex" class="au" /></td>
						</tr>
						<tr>
							<td class="ap">生日</td>
							<td><input type="date" size="40" class="aq" id="userbirthday"
								name="userbirthady"></td>
						</tr>

						<tr>
							<td class="ap">收货地址</td>
							<td><input type="text" size="80" placeholder="收货地址"
								class="aq" id="address" name="address"></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><button  id="register_submit"
								 class="ar" data-toggle="modal" data-target="#myModel">立即注册</button></td>
						</tr>
					</table>
				
			</div>
		</div>
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
			<div class="modal-body" id="show-in">
			  
			</div>
	   
			<!-- 模态框底部 -->
			<div class="modal-footer">
					<a href="index.jsp">
							<span id="jumpTo">3</span>秒后系统会自动跳转，也可点击本处直接跳</a>
			  
			</div>
	   
		  </div>
		</div>
	  </div>
	
</body>

</html>