<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upphoto.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	 <script type="text/javascript" src="js/ajaxfileupload.js"></script>
        <script type="text/javascript">
    function ajaxFileUpload()
    {
        
      
        
        $.ajaxFileUpload
        (
            {
                url:'fileUploadAction.action',//用于文件上传的服务器端请求地址
                secureuri:false,//一般设置为false
                fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'json',//返回值类型 一般设置为json
                success: function (data, status)  //服务器成功响应处理函数
                {
     		        $("#show_d").append("<img src='photo/"+data.fileFileName+"' width='250' height='250' />");                 
                    if(typeof(data.error) != 'undefined')
                    {
                        if(data.error != '')
                        {
                            alert(data.fileFileName);
                        }else
                        {
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



    function ajaxFileUpload2()
    {
        
      
        
        $.ajaxFileUpload
        (
            {
                url:'fileUploadAction.action',//用于文件上传的服务器端请求地址
                secureuri:false,//一般设置为false
                fileElementId:'file2',//文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'json',//返回值类型 一般设置为json
                success: function (data, status)  //服务器成功响应处理函数
                {
     		        $("#show_d").append("<img src='photo/"+data.fileFileName+"' width='250' height='250' />");                 
                    if(typeof(data.error) != 'undefined')
                    {
                        if(data.error != '')
                        {
                            alert(data.fileFileName);
                        }else
                        {
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
     
        <input type="file" id="file" name="file" />
        <br />
        <input type="button" value="上传" onclick="return ajaxFileUpload();">
        <p>第二张图片</p>
        <input type="file" id="file2" name="file" />
        <br />
        <input type="button" value="上传" onclick="return ajaxFileUpload2();">
        <div id="show_d"></div>
    </body>
</html>