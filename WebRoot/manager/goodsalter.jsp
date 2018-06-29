<%@ include file="path.txt" %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@ include file="load.txt" %>
            <script type="text/javascript">
                $(document).ready(function () {
                    $.ajax({
                        type: "POST",
                        url: "sessiongoods",
                        data: {},
                        async: false,
                        dataType: "json",
                        success: function (data) {
                            if (data != null) {
                                $("#goods_name").val(data.name);
                                $("#goods_brief").val(data.brief);
                                $("#goods_number").val(data.number);
                                $("#goods_variety").val(data.variety);
                                $("#goods_style").val(data.style);
                                $("#goods_price").val(data.price); $("#goods_price").append("/平米");
                                $("#goods_intro").val(data.intro);
                                $("#goods_image").val(data.image);
                                $("#goods_imagesay").val(data.imagesay);
                                if (data.status == 0) {
                                    $("#goods_status_down").attr("checked", true);
                                } else
                                    $("#goods_status_up").attr("checked", true);
                            }
                        },
                        error: function (jqXHR) {
                            alert("发生错误：" + jqXHR.status);
                        }
                    });


                    $(document).on("click", "#goodsalter_submit", function () {
                        $.ajax({
                            type: "POST",
                            url: "alterfromgoods",
                            data: {
                                name: $.trim($("#goods_name").val()),
                                number: $.trim($("#goods_number").val()),
                                brief: $.trim($("#goods_brief").val()),
                                variety: $.trim($("#goods_variety").val()),
                                style: $.trim($("#goods_style").val()),
                                price: $.trim($("#goods_price").val()),
                                intro: $.trim($("#goods_intro").val()),
                                image: $.trim($("#goods_image").val()),
                                imagesay: $.trim($("#goods_imagesay").val()),
                                status:$('input:radio[name="goods_status"]:checked')
											.val(),
                            },

                            success: function (data) {
                                alert("修改商品信息成功！");
                    
                            },
                            error: function (jqXHR) {
                                alert("发生错误：" + jqXHR.status);
                            }
                        });
                    });
                });
            </script>


            <script type="text/javascript" src="js/ajaxfileupload.js"></script>
            <script type="text/javascript">
                function ajaxFileUpload() {



                    $.ajaxFileUpload
                        (
                        {
                            url: 'fileUploadAction.action',//用于文件上传的服务器端请求地址
                            secureuri: false,//一般设置为false
                            fileElementId: 'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
                            dataType: 'json',//返回值类型 一般设置为json
                            success: function (data, status)  //服务器成功响应处理函数
                            {
                                $("#goods_image").val("photo/" + data.fileFileName);
                                $("#show_photo").html("<img src='photo/" + data.fileFileName + "' width='600' />");
                                if (typeof (data.error) != 'undefined') {
                                    if (data.error != '') {
                                        alert(data.fileFileName);
                                    } else {
                                        alert(data.message);
                                    }
                                }
                            },
                            error: function (data, status, e)//服务器响应失败处理函数
                            {
                                alert(e);
                            }
                        }
                        )

                    return false;

                }



                function ajaxFileUpload2() {



                    $.ajaxFileUpload
                        (
                        {
                            url: 'fileUploadAction.action',//用于文件上传的服务器端请求地址
                            secureuri: false,//一般设置为false
                            fileElementId: 'file2',//文件上传空间的id属性  <input type="file" id="file" name="file" />
                            dataType: 'json',//返回值类型 一般设置为json
                            success: function (data, status)  //服务器成功响应处理函数
                            {
                                $("#goods_imagesay").val("photo/" + data.fileFileName);
                                $("#show_photo").html("<img src='photo/" + data.fileFileName + "' width='600'  />");
                                if (typeof (data.error) != 'undefined') {
                                    if (data.error != '') {
                                        alert(data.fileFileName);
                                    } else {
                                        alert(data.message);
                                    }
                                }
                            },
                            error: function (data, status, e)//服务器响应失败处理函数
                            {
                                alert(e);
                            }
                        }
                        )

                    return false;

                }
            </script>
    </head>

    <body>
        <%@ include file="head.txt" %>


            <div class="right">
                <div class="location">
                    <strong>你现在所在的位置是:</strong>
                    <span>库存管理页面 >> 产品添加页面</span>
                </div>
                <table class="goodsalter_table">
                    <tr>
                        <td width="50%">
                            <table class="goodsdetail_altertable">
                                <tr>
                                    <td width="20%">编号</td>
                                    <td width="80%">
                                        <input type="text" id="goods_number" class="goods_number" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <td>名称</td>
                                    <td>
                                        <input type="text" id="goods_name" class="goods_name">
                                    </td>
                                </tr>
                                <tr>
                                    <td>种类</td>
                                    <td>
                                        <input type="text" id="goods_variety" class="goods_variety">
                                    </td>
                                </tr>
                                <tr>
                                    <td>风格</td>
                                    <td>
                                        <input type="text" id="goods_style" class="goods_style">
                                    </td>
                                </tr>
                                <tr>
                                    <td>价格</td>
                                    <td>
                                        <input type="text" id="goods_price" class="goods_price">
                                    </td>
                                </tr>
                                <tr>
                                    <td>简介</td>
                                    <td>
                                        <textarea id="goods_brief" class="goods_brief"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>详细介绍</td>
                                    <td>
                                        <textarea id="goods_intro" class="goods_intro"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>实物图</td>
                                    <td>
                                        <input type="text" id="goods_image" class="goods_image">
                                        <input type="file" id="file" name="file" />

                                        <input type="button" value="上传" id="uploadphoto" onclick="return ajaxFileUpload();">
                                    </td>
                                </tr>
                                <tr>
                                    <td>推广图</td>
                                    <td>
                                        <input type="text" id="goods_imagesay" class="goods_imagesay">
                                        <input type="file" id="file2" name="file" />

                                        <input type="button" value="上传" id="uploadphoto" onclick="return ajaxFileUpload2();">
                                    </td>
                                </tr>
                                <tr>
                                    <td>状态</td>
                                    <td>
                                        <input type="radio" name="goods_status" id="goods_status_down" value="0" class="goods_status">
                                        <label class="goods_status_alter_text">下架</label>
                                        <input type="radio" name="goods_status" id="goods_status_up" value="1"
                                            class="goods_status">
                                        <label class="goods_status_alter_text">上架</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="submit_altergoods">
                                        <button id="goodsalter_submit" class="goodsalter_submit">确定修改</button>
                                        <button id="back_submit" class="back_submit">取消返回</button>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="50%">
                            <div id="show_photo"></div>
                        </td>
                    </tr>
                </table>

            </div>

    </body>

    </html>