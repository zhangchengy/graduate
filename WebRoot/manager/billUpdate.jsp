﻿<%@ include file="path.txt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="load.txt" %>
</head>
<body>
    <%@ include file="head.txt" %>

    
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面 >> 订单添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="providerId">订单编码：</label>
                    <input type="text" name="providerId" id="providerId" placeholder="322"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="providerName">商品名称：</label>
                    <input type="text" name="providerName" id="providerName" placeholder="123"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="people">商品单位：</label>
                    <input type="text" name="people" id="people" placeholder="北极"/>
                    <span>*</span>

                </div>
                <div>
                    <label for="phone">商品数量：</label>
                    <input type="text" name="phone" id="phone" placeholder="22"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="address">总金额：</label>
                    <input type="text" name="address" id="address" placeholder="200"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="fax">供应商：</label>
                    <input type="text" name="fax" id="fax" placeholder="北大"/>
                    <span>*</span>
                </div>
                <div>
                    <label >是否付款：</label>
                    <input type="radio" name="zhifu"checked/>未付款
                    <input type="radio" name="zhifu"/>已付款
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
                    <input type="button" value="保存" onclick="history.back(-1)"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
</footer>
<script src="js/time.js"></script>

</body>
</html>