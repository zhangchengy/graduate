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
                           			$("tbody.main").append("<tr class='secondtr'><td>"
                                       +data.list[i].phone+"</td><td>"
                                       +data.list[i].name+"</td><td>"
                                       +sex+"</td><td>"+age
                                       +"</td><td>"+data.list[i].post
                                       +"</td><td>"+data.list[i].address
                                       +"</td><td><button id='alter_manager' data-toggle='modal' data-target='#myModel' class='alter_manager'>修改</button><input type='hidden' id='hidden_phone' value='"+data.list[i].phone+"'><button id='delete_manager' class='delete_manager'>删除</button></td></tr>");                           
                           		}
                           }
                            
                        },
                        error: function (jqXHR) {
                            alert("发生错误：" + jqXHR.status);
                        }
                    }); 

                    $(document).on("click", "#alter_manager", function () {
                        $.ajax({
                        type: "POST",
                        url: "sessionaltermanager",
                        data: {
                            phone:$.trim($(this).parent().children("input#hidden_phone").val()),
                        },
                        dataType : "json",
                        success: function (data) {
                            $("#phone").val(data.phone);
                            $("#name").val(data.name);
                            
                            $("#address").val(data.address);
                            $("#birthday").val(data.birthday);
                            $("#post").val(data.post);
                            if (data.sex == "man") {
			                    $("#man").attr("checked", true);
		                    } else
			                    $("#woman").attr("checked", true);
                            
                        },
                        error: function (jqXHR) {
                            alert("发生错误：" + jqXHR.status);
                        }
                     
                      });		

                });


                $(document).on("click", "#delete_manager", function () {
                    if (confirm("您确定要删除该用户信息？")) {
                        $.ajax({
                        type: "POST",
                        url: "deletefrommanager",
                        data: {
                            phone:$.trim($(this).parent().children("input#hidden_phone").val()),
                        },
                        dataType : "json",
                        success: function (data) {
                           $("input#hidden_phone[value='"+data.msg+"']").parent().parent().remove();
                            
                        },
                        error: function (jqXHR) {
                            alert("发生错误：" + jqXHR.status);
                        }
                     
                      });		
                    }
                });


                $(document).on("click", "#alter_submit", function () {
                        $.ajax({
                        type: "POST",
                        url: "alterfrommanager",
                        data: {
                            phone: $.trim($("#phone").val()),
                            name: $.trim($("#name").val()),
                            birthday: $.trim($("#birthday").val()),
                            address: $.trim($("#address").val()),
                            post: $.trim($("#post").val()),
                            sex: $('input:radio[name="sex"]:checked').val(),
                        },
                        dataType : "json",
                        success: function (data) {                         
                            alert("修改成功！");                           
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
                <span>用户管理页面</span>
            </div>
            <div class="search">
                <span>用户名：</span>
                <input type="text" id="searchname" onkeyup="searchname()" class="searchname" placeholder="请输入用户名"/>
                <span>手机号：</span> <input type="text" onkeyup="searchphone()" id="searchphone" class="searchphone" placeholder="请输入手机号" />
                <a href="manager/useradd.jsp">添加用户</a>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0" id="providerTable">
                <thead>
                <tr class="firstTr">
                    <th width="10%">手机号</th>
                    <th width="10%">员工姓名</th>
                    <th width="10%">性别</th>
                    <th width="10%">年龄</th>
                    <th width="10%">职位</th>
                    <th width="30%">地址</th>
                    <th width="20%">操作</th>
                </tr>
            </thead>
                <tbody class='main'></tbody>
                
               
                
                
               
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
						<tr><td class="textalter">手机号</td><td><input type="text" id="phone" value="18713588381" disabled /></td></tr>
						<tr><td class="textalter">姓名</td><td><input type="text" id="name" value="" /></td></tr>
						<tr><td class="textalter">性别</td><td>男<input type="radio" id="man"  value="man" name="sex" />女<input type="radio" id="woman" value="woman" name="sex" /></td></tr>
						<tr><td class="textalter">生日</td><td><input type="date" id="birthday" value="" /></td></tr>
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