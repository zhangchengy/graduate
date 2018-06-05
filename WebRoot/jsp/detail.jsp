<%@ include file="path.txt"%>
<!doctype html>
<html>
<head>
<%@ include file="load.txt" %>
  <title>顶王全能吊顶网上商城</title>
<script type="text/javascript">
	$(function(){
		$(".nav>li").hover(function(){
			$(this).children('ul').stop(true,true).show(300);
		},function(){
			$(this).children('ul').stop(true,true).hide(300);
		})
	})
</script>
</head>

<body>

<%@ include file="head.txt" %>
<%@ include file="search.txt" %>
<%@ include file="list.txt" %>


<div id="head_location">当前位置：</div>
<table id="goods_table"  cellpadding="0" cellspacing="0">
  <tr >
    <td rowspan="6" width="60%" >图片</td>
    <td height="50px">名称</td>
  </tr>
  <tr >
    <td width="40%" height="50px">产品编号：</td>
  </tr>
  <tr>
    <td height="50px">产品类别：</td>
  </tr>
  <tr>
    <td height="50px">产品价格：</td>
  </tr>
  <tr>
    <td height="50px">产品描述：</td>
  </tr>
  <tr>
    <td >按钮收藏和预约</td>
  </tr>
</table>





</body>
</html>