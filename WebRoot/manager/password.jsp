<%@ include file="path.txt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="load.txt" %>
    <script type="text/javascript">	
		function passwordalter() {
				var old=$.trim($("#oldPassword").val());
				var newPassword=$.trim($("#newPassword").val());
				var reNewPassword=$.trim($("#reNewPassword").val());
                    if (newPassword==reNewPassword) {
                        $.ajax({
                            type: "POST",
                            url: "passwordalter",
                            data: {
                            	oldPassword:old,
                            	newPassword:newPassword,
                            },
                            dataType : "json",
                            success: function (data) {
                            	if(data.msg=="one"){
                                    alert("修改成功！");  
                                 }
                                 else{
                                 	alert("原密码输入错误！");
                                 }        
                            },
                            error: function (jqXHR) {
                                alert("发生错误：" + jqXHR.status);
                            }
                        });                       
                    } 
                    else{
                    	alert("新密码两次输入不一致！");
                    } 
         }             
</script>
    
</head>
<body>
    <%@ include file="head.txt" %>

    
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>密码修改页面</span>
            </div>
            <div class="providerAdd">                                  
                    <div class="">
                        <label for="oldPassword">旧密码：</label>
                        <input type="password" name="oldPassword" id="oldPassword" required/>
                        <span>*请输入原密码</span>
                    </div>
                    <div>
                        <label for="newPassword">新密码：</label>
                        <input type="password" name="newPassword" id="newPassword" required/>
                        <span >*请输入新密码</span>
                    </div>
                    <div>
                        <label for="reNewPassword">确认新密码：</label>
                        <input type="password" name="reNewPassword" id="reNewPassword" required/>
                        <span >*请输入新确认密码，保证和新密码一致</span>
                    </div>
                    <div class="providerAddBtn">                        
                        <input type="button" value="保存" onclick="passwordalter();"/>
                    </div>
                
            </div>
        </div>


</body>
</html>