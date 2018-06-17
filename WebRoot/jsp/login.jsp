<%@ include file="path.txt" %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@ include file="load.txt" %>
            <title>登录</title>
<script type="text/javascript">
function altercolor(){
    $("#login_userphone").css("border-top","2px solid #87CEFF");
    $("#login_userphone").css("border-right","2px solid #87CEFF");
    $("#login_userphone").css("border-bottom","2px solid #87CEFF");
    $("#login_userphone").css("border-left","none");
    $("#login_userphone").css("height","54px");
    $("#username_img").css("border-top","2px solid #87CEFF");
    $("#username_img").css("border-bottom","2px solid #87CEFF");
    $("#username_img").css("border-left","2px solid #87CEFF");
}
function resetcolor(){
    $("#login_userphone").css("border-top","");
    $("#login_userphone").css("border-right","");
    $("#login_userphone").css("border-bottom","");
    $("#login_userphone").css("border-left","none");
    $("#login_userphone").css("height","50px");
    $("#username_img").css("border-bottom","");
    $("#username_img").css("border-left","");
    $("#username_img").css("border-top","");
}

function altercolor1(){
    $("#login_password").css("border-top","2px solid #87CEFF");
    $("#login_password").css("border-right","2px solid #87CEFF");
    $("#login_password").css("border-bottom","2px solid #87CEFF");
    $("#login_password").css("border-left","none");
    $("#login_password").css("height","54px");
    $("#userpassword_img").css("border-top","2px solid #87CEFF");
    $("#userpassword_img").css("border-bottom","2px solid #87CEFF");
    $("#userpassword_img").css("border-left","2px solid #87CEFF");
}
function resetcolor1(){
    $("#login_password").css("border-top","");
    $("#login_password").css("border-right","");
    $("#login_password").css("border-bottom","");
    $("#login_password").css("border-left","none");
    $("#login_password").css("height","50px");
    $("#userpassword_img").css("border-bottom","");
    $("#userpassword_img").css("border-left","");
    $("#userpassword_img").css("border-top","");
}

				
$(document).ready(function () {
    $("#login_submit").click(
        function () {
            $.ajax({
                type: "POST",
                url: "login",
                data: {
                    userphone: $.trim($("#login_userphone").val()),
                    password: $.trim($("#login_password").val()),						
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
                    
                    window.history.back();	}
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
            <div class="login1_logo">
                <img src="images/logo.jpg" class="login1_logo_img">
                <label class="login1_logo_text">欢迎登录</label>
            </div>
            <div class="login1_center">
                <div class="login1_div">
                <img src="images/5.jpg" class="login1_center_img">
                <div class="login1_center_div">
                    <table class="login1_table">
                        <tr height="25%;"><td class="login1_table_td1">用户登录</td></tr>
                        <tr height="25%;"><td>
                            <img src="images/username.png" id="username_img" class="login1_input_img" ><input type="text" onblur="resetcolor();" onfocus="altercolor();" id="login_userphone" placeholder="请输入手机号">
                        </td></tr>
                        <tr height="25%;"><td>
                            <img src="images/userpassword.png" id="userpassword_img" class="login1_input_img" ><input type="password" onblur="resetcolor1();" onfocus="altercolor1();" id="login_password" placeholder="请输入密码">
                        </td></tr>
                        <tr height="25%;"><td>
                            <button id="login_submit">登录</button>
                            <a href="jsp/register.jsp" class="login1_register">立即注册</a>
                        </td></tr>
                    </table>
                </div>
            </div>

    </body>

    </html>