<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
    <base href="<%=basePath%>">
    
    <title>页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#save").click(function(){ 
		$.ajax({ 
		    type: "POST", 	
			url: "login",
			data: {
				cname: $.trim($("#cname").val()), 
				cpassword: $("#cpassword").val(), 
				birthday: dojo.widget.byId("birthday").getValue()
				
			},
			dataType: "json",
			success: function(data){
				
					$("#show-in").html("<br>编号："+data.cid);
					$("#show-in").append("<br>姓名："+data.cname);
					$("#show-in").append("<br>密码："+data.cpassword);
					$("#show-in").append("<br>生日："+data.birthday.substring(0,10));
			
			},
			error: function(jqXHR){     
			   alert("发生错误：" + jqXHR.status);  
			}   
		});
	});
	
	
});


</script>	
  </head>
  
  <body>
    
    	<s:textfield label="用户名" name="cname" id="cname" /><br>
    	<s:textfield label="密码" name="cpassword" id="cpassword" /><br>
    	<sx:head/><sx:datetimepicker name="birthday" id="birthday" label="生日" displayFormat="yyyy-MM-dd"/>
    	<br><input type="button" value="提交" id="save" />
    
    
    <div id="show-in">
    </div>
  </body>
</html>