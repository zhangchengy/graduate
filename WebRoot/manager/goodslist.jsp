<%@ include file="path.txt" %>
    <!DOCTYPE html>
    <html>

    <head>
        <%@ include file="load.txt" %>
            <script type="text/javascript">    		
                $(document).ready(function () {
                    $.ajax({
                        type: "POST",
                        url: "findgoodsall",
                        data: {
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data != null) {
                                for (var i = 0; i < data.list.length; i++) {
                                    $("tbody").append("<tr><td>" + data.list[i].number
                                        + "</td><td>" + data.list[i].name
                                        + "</td><td>" + data.list[i].brief
                                        + "</td><td>" + data.list[i].style
                                        + "</td><td>" + data.list[i].variety
                                        + "</td><td>" + data.list[i].price
                                        + "</td><td>" + data.list[i].intro
                                        + "</td><td><img class='manager_goods' src='" + data.list[i].image
                                        + "'</td><td id='status'></td>"
                                        + "<td><button id='altergoods' class='altergoods'>修改</button><input type='hidden' id='status_input' value='"+data.list[i].status+"'><input type='hidden' id='number' value='" 
                                        + data.list[i].number + "'><button id='downgoods' class='downgoods'>下架</button></td></tr>");

                                    if (data.list[i].status == 0) {
                                        $("#providerTable").find("input#number[value='"+data.list[i].number+"']").
                                        parents().children("#status").html("已下架");
                                        $("#providerTable").find("input#number[value='"+data.list[i].number+"']").
                                        parents().children("#status").css("color","red");
                                        $("#providerTable").find("input#number[value='"+data.list[i].number+"']").
                                        parent().children("button#downgoods").remove();
                                    } else {
                                        $("#providerTable").find("input#number[value='"+data.list[i].number+"']").
                                        parents().children("#status").html("上架中");
                                        $("#providerTable").find("input#number[value='"+data.list[i].number+"']").
                                        parents().children("#status").css("color","green");
                                    }
                                }

                            }
                        },
                        error: function (jqXHR) {
                            alert("发生错误：" + jqXHR.status);
                        }
                    });

                    $(document).on("click", "#downgoods", function () {
                        if (confirm("您确定要下架该商品？")) {
                            $.ajax({
                                type: "POST",
                                url: "downfromgoods",
                                data: {
                                    number: $.trim($(this).parent().children("input#number").val()),
                                },

                                success: function (data) {
                                    
                                    $("input#number[value='" + data.msg + "']").parents("tr").find("#status").html("已下架");
                                    $("input#number[value='" + data.msg + "']").parents("tr").find("#downgoods").remove();
                                },
                                error: function (jqXHR) {
                                    alert("发生错误：" + jqXHR.status);
                                }
                            });
                        }
                    });

                    $(document).on("click", "#altergoods", function () {
                            $.ajax({
                                type: "POST",
                                url: "goodsdetail",
                                data: {
                                    number: $.trim($(this).parent().children("input#number").val()),
                                },

                                success: function (data) {
                                    location.href="manager/goodsalter.jsp";
                                },
                                error: function (jqXHR) {
                                    alert("发生错误：" + jqXHR.status);
                                }
                            });
                    });

                    $("input[type='checkbox']").change(function(){
				var obj=document.getElementsByName('status_goods');
					$("tr").show();
                    
				for(var i=0;i<obj.length;i++){

					if(!obj[i].checked){
						if(obj[i].value=="1"){
						$("input#status_input[value='1']").parent("tr").hide();
						}
						if(obj[i].value=="0"){
						$("input#status_input[value='0']").parents("tr").hide();
						}
					}
				}
			}); 



            $("#variety").on("change",function(){
    var input, filter, table, tr, td, i;
  input = $("#variety option:selected");
  filter = input.val();
  table = document.getElementById("providerTable");
  tr = table.getElementsByTagName("tr");

 
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[4];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }


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

         function searchall(){
            var $sea=$('#searchall').val();
        //先隐藏全部，再把符合筛选条件的值显示
        $('#providerTable tbody tr').hide().filter(':contains('+$sea+')').show();
}
            
            
            
            </script>



    </head>

    <body>
        <%@ include file="head.txt" %>


            <div class="right">
                <div class="location">
                    <strong>你现在所在的位置是:</strong>
                    <span>库存管理页面</span>
                </div>
                <div class="search">
                    <span>产品名称：</span>
                    <input type="text" id="searchname" onkeyup="searchname()" placeholder="请输入产品的名称" />

                    <span>种类：</span>
                    <select name="variety" id="variety">
                        <option value="">--请选择--</option>
                        <option value="卫浴">卫浴</option>
                        <option value="客厅">客厅</option>
                        <option value="卧室">卧室</option>
                        <option value="餐厅">餐厅</option>
                        <option value="厨房">厨房</option>
                        <option value="其他">其他</option>
                    </select>

                    <span>模糊查询</span>
                    <input type="text" placeholder="关键词" onkeyup="searchall()" id="searchall" name="searchall" />

                    

                    <label id="status_choose_goods">选择：</label><label class="status_choose_goods_em">已下架</label><input type="checkbox" checked="checked" id="status_goods" name="status_goods" value="0">
                    <label class="status_choose_goods_em">上架中</label><input type="checkbox" id="status_goods" checked="checked" name="status_goods" value="1">
                    
                    <a href="manager/goodsadd.jsp">添加产品</a>
                </div>
                <!--账单表格 样式和供应商公用-->
                <table class="providerTable" cellpadding="0" cellspacing="0" id="providerTable">
                    <thead>
                    <tr class="firstTr">
                        <th width="6%">产品编号</th>
                        <th width="8%">产品名称</th>
                        <th width="10%">产品简介</th>
                        <th width="10%">产品风格</th>
                        <th width="6%">产品种类</th>
                        <th width="8%">产品价格</th>
                        <th width="12%">产品介绍</th>
                        <th width="25%">产品图片</th>
                        <th width="6%">状态</th>
                        <th width="11%">操作</th>
                    </tr>
                    </thead>
                    <tbody></tbody>

                </table>
            </div>

    </body>

    </html>