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
                        dataType : "json",
                        success: function (data) {
                            if(data!=null){                            
                            	for(var i=0;i<data.list.length;i++){                           	
                            		$("#providerTable").append("<tr><td>"+data.list[i].number+"</td><td>"+data.list[i].name+"</td><td>"+data.list[i].brief+"</td><td>"+data.list[i].style+"</td><td>"+data.list[i].variety+"</td><td>"+data.list[i].price+"</td><td>"+data.list[i].intro+"</td><td><img class='manager_goods' src='"+data.list[i].image+"'></td><td><a href='billUpdate.jsp'><img src='img/xiugai.png' alt='修改' title='修改'/></a><a href='' class='removeBill'><img src='img/schu.png' alt='删除' title='删除'/></a></td></tr>");	
                           		}
                           }                            
                        },
                        error: function (jqXHR) {
                            alert("发生错误：" + jqXHR.status);
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
                <span>库存管理页面</span>
            </div>
            <div class="search">
                <span>产品名称：</span>
                <input type="text" placeholder="请输入产品的名称"/>
                
                <span>种类：</span>
                <select name="tigong" >
                    <option value="">--请选择--</option>
                    <option value="">卫浴</option>
                    <option value="">客厅</option>
                </select>

                <span>模糊查询</span>
               		<input type="text" placeholder="关键词"/>

                <input type="button" value="查询"/>
                <a href="billAdd.html">添加产品</a>
            </div>
            <!--账单表格 样式和供应商公用-->
            <table class="providerTable" cellpadding="0" cellspacing="0" id="providerTable">
                <tr class="firstTr">
                    <th width="8%">产品编号</th>
                    <th width="8%">产品名称</th>
                    <th width="10%">产品简介</th>
                    <th width="10%">产品风格</th>
                    <th width="8%">产品种类</th>
                    <th width="8%">产品价格</th>
                    <th width="12%">产品介绍</th>
                    <th width="30%">产品图片</th>
                    <th width="10%">操作</th>
                </tr>
                
                                
                
            </table>
        </div>

</body>
</html>