<%@ include file="path.txt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="load.txt" %>
    
    <script type="text/javascript">				
				$(document).ready(function () {
					$("#login_button").click(
						function () {
							$.ajax({
								type: "POST",
								url: "loginmanager",
								data: {
									phone: $.trim($("#user").val()),
									password: $.trim($("#mima").val()),						
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
									location.href="manager/index.jsp";	}
								},
								error: function (jqXHR) {
									alert("发生错误：" + jqXHR.status);
								}
							});
						
						});
				});
				
			</script>
    
</head>
<body class="login_bg">
    
                            
                <table class="login_table">
                   <tr><td colspan="2" class="login_text">顶王吊顶后台管理系统</td></tr>
                    <tr><td class="login_user">手机号：</td>
                 <td>   <input id="user" type="text" name="username" placeholder="请输入手机号" required/></td></tr>
               
                
                    <tr><td class="login_password">密码：</td>
                   <td> <input id="mima" type="password" name="password" placeholder="请输入密码" required/></td></tr>
              
                
                  <tr><td>  <button id="login_button">登录</button></td>
                    <td><button id="reset">重置</button></td></tr>
                </table>

</body>
</html>