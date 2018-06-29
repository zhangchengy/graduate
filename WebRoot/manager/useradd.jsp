<%@ include file="path.txt" %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@ include file="load.txt" %>
            <script type="text/javascript">  

                function isexist() {
                    var phone = $("#phone").val();
                    if (phone != "") {
                        var pattern = /^1[34578]\d{9}$/;
                        if (pattern.test(phone) == true) {
                            $.ajax({
                                type: "POST",
                                url: "existfrommanager",
                                async: false,
                                data: {
                                    phone: $.trim($("#phone").val()),
                                },
                                dataType: "json",
                                success: function (data) {

                                    if (data.msg == false) {
                                        phoneok = true;
                                        $("img").remove(".isexist_img");
                                        $("label").remove("#isexist");
                                        $("#add_is").append("<img src='images/yes.jpg' class='isexist_img'>");
                                        $("#add_is").append("<label id='isexist' style='color:#3CB371'>该手机号可使用！</label>");
                                    }
                                    else {
                                        $("img").remove(".isexist_img");
                                        $("label").remove("#isexist");
                                        $("#add_is").append("<img src='images/no.jpg' class='isexist_img'>");
                                        $("#add_is").append("<label id='isexist' style='color:#CD2626'>该手机号已被使用！</label>");
                                    }
                                },
                                error: function (jqXHR) {
                                    alert("发生错误：" + jqXHR.status);
                                }
                            });
                        } else {
                            $("img").remove(".isexist_img");
							$("label").remove("#isexist");
							$("#add_is").append("<img src='images/no.jpg' class='isexist_img'>");
							$("#add_is").append("<label id='isexist' style='color:#CD2626'>请输入正确的手机格式！</label>");
                        }
                    }
                }
                function name_isblank() {
                    var name = $("#name").val();
                    if (name == "") {

                        $("#name_isblank").html("*姓名不能为空");
                    } else {
                        $("#name_isblank").html("");
                        nameok = true;
                    }
                }

                function check_pass() {
                    var pass = $("#password").val();
                    if (pass.length < 5) {

                        $("#check_pass").html("*密码不能少于5位");
                    }
                    else {
                        passok = true;
                        $("#check_pass").html("");
                    }
                }

                function check_repass() {
                    if ($("#password").val() != $("#repassword").val()) {
                        $("#check_repass").html("*两次秘密输入不一致");
                    }
                    else {
                        repassok = true;
                    }
                }

                $(document).ready(function () {
                    $(document).on("click", "#addmanager_submit", function () {
                        if (phoneok == true && nameok == true && passok == true && repassok == true) {
                            $.ajax({
                                type: "POST",
                                url: "addfrommanager",
                                data: {
                                    phone: $.trim($("#phone").val()),
                                    name: $.trim($("#name").val()),
                                    password: $.trim($("#password").val()),
                                    birthday: $.trim($("#birthday").val()),
                                    address: $.trim($("#address").val()),
                                    post: $.trim($("#post").val()),
                                    sex: $('input:radio[name="sex"]:checked').val(),
                                },
                                dataType: "json",
                                success: function (data) {
                                    alert("添加成功！");
                                },
                                error: function (jqXHR) {
                                    alert("发生错误：" + jqXHR.status);
                                }

                            });
                        }
                    });

                });


            </script>
    </head>

    <body>
        <%@ include file="head.txt" %>
            <div class="right">
                <div class="location">
                    <strong>你现在所在的位置是:</strong>
                    <span>用户管理页面 >> 用户添加页面</span>
                </div>
                <table class="altermanager">
                    <tr>
                        <td class="textalter" width="30%">手机号</td>
                        <td id="add_is">
                            <input width="70%" onblur="isexist();" type="text" id="phone" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="textalter">姓名</td>
                        <td>
                            <input type="text" id="name" value="" onblur="name_isblank();" />
                            <label id="name_isblank" style='color:#CD2626'></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="textalter">密码</td>
                        <td>
                            <input type="password" id="password" value="" onblur="check_pass();" />
                            <label id="check_pass" style='color:#CD2626'></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="textalter">确认密码</td>
                        <td>
                            <input type="password" id="repassword" onblur="check_repass();" value="" />
                            <label id="check_repass" style='color:#CD2626'></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="textalter">性别</td>
                        <td>男
                            <input type="radio" id="man" value="man" name="sex" checked />女
                            <input type="radio" id="woman" value="woman" name="sex" />
                        </td>
                    </tr>
                    <tr>
                        <td class="textalter">生日</td>
                        <td>
                            <input type="date" id="birthday" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="textalter">职位</td>
                        <td>
                            <input type="text" id="post" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="textalter">地址</td>
                        <td>
                            <input type="text" id="address" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button id="addmanager_submit">提交</button>
                        </td>
                    </tr>
                </table>

            </div>


    </body>

    </html>