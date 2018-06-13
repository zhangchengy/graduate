<%@ include file="path.txt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="load.txt" %>
</head>
<body >
    <%@ include file="head.txt" %>

    <div class="right">
        <img class="wColck" src="img/clock.jpg" alt=""/>
        <div class="wFont">
            <h2><s:property value="#session.manager.name" /></h2>
            <p>欢迎来到顶王吊顶后台管理系统!</p>
			<span id="hours"></span>
        </div>
    </div>



</body>
</html>