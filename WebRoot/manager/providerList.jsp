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
                        dataType : "json",
                        success: function (data) {
                            if(data!=null){                            
                            	for(var i=0;i<data.list.length;i++){                           	
                            		$("#providerTable").append("<tr><td>"+data.list[i][0]+"</td><td>"+data.list[i][1]+"</td><td>"+data.list[i][2]+"</td><td>"+data.list[i][3]+"</td><td>"+data.list[i][4]+"</td><td>"+data.list[i][5]+"</td><td><a href='providerView.jsp'><img src='img/read.png' alt='查看' title='查看'/></a><a href='providerUpdate.html'><img src='img/xiugai.png' alt='修改' title='修改'/></a><a href='#' class='removeProvider'><img src='img/schu.png' alt='删除' title='删除'/></a></td></tr>");	
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
            <span>预约管理页面</span>
        </div>
        <div class="search">
            <span>客户名称：</span>
            <input type="text" placeholder="请输入客户名称"/>
            <input type="button" value="查询"/>
        </div>
        <table class="providerTable" id="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">客户电话</th>
                <th width="10%">客户姓名</th>
                <th width="10%">产品编号</th>
                <th width="20%">产品名称</th>
                <th width="10%">创建时间</th>
                <th width="20%">客户地址</th>
                <th width="20%">操作</th>
            </tr>                      
        </table>

    </div>

</body>
</html>