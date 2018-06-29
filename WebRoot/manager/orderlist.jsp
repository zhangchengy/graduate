<%@ include file="path.txt" %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@ include file="load.txt" %>

            <script type="text/javascript">    		
                $(document).ready(function () {
                    $.ajax({
                        type: "POST",
                        url: "findorderall",
                        data: {
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data != null) {
                                for (var i = 0; i < data.list.length; i++) {
                                    $("tbody").append("<tr><td>" + data.list[i][0]
                                        + "</td><td>" + data.list[i][1]
                                        + "</td><td>" + data.list[i][2]
                                        + "</td><td>" + data.list[i][3]
                                        + "</td><td>" + data.list[i][4]
                                        + "</td><td>" + data.list[i][5]
                                        + "</td><td id='order_status'>"
                                        + "</td><td><input type='hidden' id='ordernumber' value='" + data.list[i][7] + "'><button id='finishorder' name='finishorder'>预约完成</button></td></tr>");
                                    if (data.list[i][6] == "0") {
                                        $("input[value='" + data.list[i][7] + "']").parent().parent().children("#order_status").html("预约已取消");
                                        $("input#ordernumber[value='" + data.list[i][7] + "']").parent().children("#finishorder").remove();
                                        $("input[value='" + data.list[i][7] + "']").parent().parent().children("#order_status").css("color", "red");
                                    } else if (data.list[i][6] == "1") {
                                        $("input[value='" + data.list[i][7] + "']").parent().parent().children("#order_status").html("预约中");
                                        $("input[value='" + data.list[i][7] + "']").parent().parent().children("#order_status").css("color", "blue");
                                    } else {
                                        $("input#ordernumber[value='" + data.list[i][7] + "']").parent().children("#finishorder").remove();
                                        $("input[value='" + data.list[i][7] + "']").parent().parent().children("#order_status").html("预约已完成");
                                    }
                                }
                            }
                        },
                        error: function (jqXHR) {
                            alert("发生错误：" + jqXHR.status);
                        }
                    });

                    $(document).on("click", "#finishorder", function () {
                        $.ajax({
                            type: "POST",
                            url: "finishfromorder",
                            data: {
                                ordernumber: $.trim($(this).parent().children("input#ordernumber").val()),
                            },

                            success: function (data) {
                                $("input#ordernumber[value='" + data.msg + "']").parent().children("#finishorder").remove();
                                $("input#ordernumber[value='" + data.msg + "']").parent().parent().children("#order_status").html("预约完成");
                                $("input#ordernumber[value='" + data.msg + "']").parent().parent().children("#order_status").css("color", "black");
                            },
                            error: function (jqXHR) {
                                alert("发生错误：" + jqXHR.status);
                            }
                        });
                    });

                });

                function searchname() {

                    var input, filter, table, tr, td, i;
                    input = document.getElementById("searchname");
                    filter = input.value.toUpperCase();
                    table = document.getElementById("providerTable");
                    tr = table.getElementsByTagName("tr");


                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[1];
                        if (td) {
                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }

                function searchphone() {

                    var input, filter, table, tr, td, i;
                    input = document.getElementById("searchphone");
                    filter = input.value.toUpperCase();
                    table = document.getElementById("providerTable");
                    tr = table.getElementsByTagName("tr");


                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[0];
                        if (td) {
                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }
            </script>

    </head>

    <body>
        <%@ include file="head.txt" %>


            <div class="right">
                <div class="location">
                    <strong>你现在所在的位置是:</strong>
                    <span>预约管理页面</span>
                </div>
                <div class="search">
                    <span>客户名称：</span>
                    <input type="text" id="searchname" onkeyup="searchname()" class="searchname" placeholder="请输入客户名称" />
                    <span>客户电话：</span>
                    <input type="text" id="searchphone" onkeyup="searchphone()" class="searchphone" placeholder="请输入客户电话" />
                </div>
                <table class="providerTable" id="providerTable" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr class="firstTr">
                            <th width="8%">客户电话</th>
                            <th width="8%">客户姓名</th>
                            <th width="8%">产品编号</th>
                            <th width="20%">产品名称</th>
                            <th width="10%">创建时间</th>
                            <th width="20%">客户地址</th>
                            <th width="6%">预约状态</th>
                            <th width="20%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>

    </body>

    </html>