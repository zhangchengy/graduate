<%@ include file="path.txt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="load.txt" %>
    
    <script type="text/javascript">    		
       $(document).ready(function () {                   
                    $.ajax({
                        type: "POST",
                        url: "findallmanager",
                        data: {
                        },
                        dataType : "json",
                        success: function (data) {
                            if(data!=null){
                            
                            	for(var i=0;i<data.list.length;i++){
                            		if(data.list[i].sex=="man") {sex="男";}else{sex="女";}
                            		age=2018-data.list[i].birthday.substring(0,4);
                           			$("#providerTable").append("<tr class='secondtr'><td>"+data.list[i].phone+"</td><td>"+data.list[i].name+"</td><td>"+sex+"</td><td>"+age+"</td><td>"+data.list[i].post+"</td><td>"+data.list[i].address+"</td><td><a data-toggle='modal' id='manageralter' data-target='#myModel'><img src='img/xiugai.png' alt='修改' title='修改'/></a><a class='removeUser' id='managerdelete'><img src='img/schu.png' alt='删除' title='删除'/></a></td></tr>");                           
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
                <span>用户管理页面</span>
            </div>
            <div class="search">
                <span>用户名：</span>
                <input type="text" placeholder="请输入用户名"/>
                <input type="button" id="button_all_find" value="查询"/>
                <a href="userAdd.jsp">添加用户</a>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0" id="providerTable">
                <tr class="firstTr">
                    <th width="10%">手机号</th>
                    <th width="10%">员工姓名</th>
                    <th width="10%">性别</th>
                    <th width="10%">年龄</th>
                    <th width="10%">职位</th>
                    <th width="30%">地址</th>
                    <th width="20%">操作</th>
                </tr>
                
                
               
                
                
               
            </table>

        </div>




<div class="modal fade" id="myModel">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- 模态框头部 -->
				<div class="modal-header">
					<h4 class="modal-title">修改员工信息</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- 模态框主体 -->
				<div class="modal-body" id="show-in"></div>
					<table class="altermanager">
						<tr><td class="textalter">手机号</td><td><input type="text" id="phone" value="" disabled /></td></tr>
						<tr><td class="textalter">姓名</td><td><input type="text" id="name" value="" /></td></tr>
						<tr><td class="textalter">性别</td><td>男<input type="radio"  value="man" name="sex" />女<input type="radio"  value="man" name="sex" /></td></tr>
						<tr><td class="textalter">生日</td><td><input type="text" id="birthday" value="" /></td></tr>
						<tr><td class="textalter">职位</td><td><input type="text" id="post" value="" /></td></tr>
						<tr><td class="textalter">地址</td><td><input type="text" id="address" value="" /></td></tr>
						<tr><td colspan="2"><button id="alter_submit">提交修改</button></td></tr>
					</table>
				<!-- 模态框底部 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>

				</div>

			</div>
		</div>
	</div>


   

</body>
</html>