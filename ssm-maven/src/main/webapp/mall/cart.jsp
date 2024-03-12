<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        .container .row div {
            /* position:relative;
 float:left; */
        }

        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }
        .test1{
            width: 95%;
        }
    </style>
</head>

<body>


<!--
    时间：2015-12-30
    描述：菜单栏
-->
<div class="container-fluid">
    <div class="col-md-4">
        <img src="${pageContext.request.contextPath}/img/cuit2.png" width="223px" height="45px"/>
    </div>
    <div class="test1" style="padding-top:20px">
        <ol class="list-inline" style="float: right">
            <li><p style="font-size: 18px;">用户:<%=session.getAttribute("username") %></p></li>
<%--            <li><a href="${pageContext.request.contextPath}/mall/cart.jsp" style="font-size: 18px">购物车</a></li>--%>
        </ol>
    </div>
</div>
<!--
    时间：2015-12-30
    描述：导航条
-->
<div class="container-fluid">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/mall/index.jsp">首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</div>


<div class="container">
    <div class="row">

        <div style="margin:0 auto; margin-top:10px;width:950px;">
            <strong style="font-size:16px;margin:5px 0;">订单详情</strong>
            <table class="table table-bordered">
                <tbody id="orderShow">

                </tbody>

            </table>
        </div>
    </div>

    <div style="margin-right:130px;">
        <div style="text-align:right;">
<%--            <em style="color:#ff6600;">--%>
<%--                登录后确认是否享有优惠&nbsp;&nbsp;</em>--%>
            赠送积分: <em id="score" style="color:#ff6600;"></em>&nbsp; 商品金额: <strong id="allPrice" style="color:#ff6600;">￥</strong>
        </div>
        <div style="text-align:right;margin-top:10px;margin-bottom:10px;">
            <a href="#" id="clear" class="clear">清空购物车</a>
            <input type="submit" id="submitOrder" width="100" value="提交订单" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
						height:35px;width:100px;color:white;">
        </div>
    </div>

</div>

<%--<div style="margin-top:50px;">--%>
<%--    <img src="./image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />--%>
<%--</div>--%>

<%--<div style="text-align: center;margin-top: 5px;">--%>
<%--    <ul class="list-inline">--%>
<%--        <li><a>关于我们</a></li>--%>
<%--        <li><a>联系我们</a></li>--%>
<%--        <li><a>招贤纳士</a></li>--%>
<%--        <li><a>法律声明</a></li>--%>
<%--        <li><a>友情链接</a></li>--%>
<%--        <li><a target="_blank">支付方式</a></li>--%>
<%--        <li><a target="_blank">配送方式</a></li>--%>
<%--        <li><a>服务声明</a></li>--%>
<%--        <li><a>广告声明</a></li>--%>
<%--    </ul>--%>
<%--</div>--%>
<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
    Copyright &copy; 2024 成信大商城 版权所有
</div>
<script type="text/javascript">
    var allPrice = 0;
    var orderIds="";

    $(document).ready(function() {
        $.ajax({
            url: '${pageContext.request.contextPath}/order/listOrders.do', // 服务器端获取购物车数据的URL
            type: 'GET', // 请求类型
            dataType: 'json', // 预期服务器返回的数据类型
            success: function(data) {
                console.log(data);
                console.log(data.data);
                // 成功获取数据后的处理函数
                updateCartUI(data.data);
            },
            error: function(error) {
                // 错误处理
                console.error("Error fetching cart data:", error);
            }
        });
    });

    // 示例：更新购物车UI
    function updateCartUI(cartData) {
        const cartTableBody = $("#orderShow"); // 定位到表格的tbody
        cartTableBody.empty(); // 首先清空当前内容，包括之前的表头和数据行

        // 插入新的表头行
        const headerRow = `
        <tr class="warning">
            <th>图片</th>
            <th>商品</th>
            <th>价格</th>
            <th>数量</th>
            <th>小计</th>
            <th>操作</th>
        </tr>
    `;
        cartTableBody.append(headerRow); // 添加表头行到tbody

        // 循环遍历购物车中的项目并更新到表格中
        cartData.forEach(item => {
            const count = item.count;
            const imageUrl = item.pimage;
            const productName = item.pname;
            const price = item.shopPrice;
            const total = item.totlePrice;
            const id = item.orderId;

            var row = document.createElement('tr');

            // 创建并填充td元素（数据单元格），例如图片，名字，价格等
            var imgCell = document.createElement('th');
            var img = document.createElement('img');
            img.width=50;
            img.height=70;
            img.src = "${pageContext.request.contextPath}/"+imageUrl;
            imgCell.appendChild(img);

            var nameCell = document.createElement('th');
            nameCell.textContent = productName;

            var priceCell = document.createElement('th');
            priceCell.textContent = "￥"+price;

            var countCell = document.createElement('th');
            var input = document.createElement('input');
            input.textContent=count;
            input.value=count;
            countCell.appendChild(input);
            // countCell.textContent = count;

            var totalCell = document.createElement('th');
            totalCell.textContent = total;

            var optionCell = document.createElement('th');
            var a = document.createElement('a');
            a.id="delete";
            a.textContent = "删除";
            a.href="${pageContext.request.contextPath}/order/deleteOrder.do?orderId="+id;
            optionCell.appendChild(a)

            // 将这些单元格附加到行上
            row.appendChild(imgCell);
            row.appendChild(nameCell);
            row.appendChild(priceCell);
            row.appendChild(countCell);
            row.appendChild(totalCell);
            row.appendChild(optionCell);

            allPrice =allPrice+total;
            orderIds =orderIds+id+",";
            // 将行附加到tbody
            cartTableBody.append(row);
            const all = $("#allPrice");
            all.val("￥"+allPrice);
            all.text(allPrice);
            const score =$("#score");
            score.text(allPrice);
        });
    }


    $("#submitOrder").click(function(){
        if(orderIds!==""&&orderIds!=null){
            $.ajax({
                url: "${pageContext.request.contextPath}/buyRecord/create.do?orders="+orderIds,
                type: "GET",
                success: function(response) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/order/buy.do?orderId="+orderIds,
                        type: "GET",
                        success: function (response){
                            alert("订单提交成功！");
                            location.reload();
                        }
                    });
                    // 这里你可以处理服务器返回的response
                    console.log(response);
                },
                error: function(error) {
                    // 这里你可以处理请求失败的情况
                    console.log(error);
                }
            });
        }else{
            alert("购物车中没有商品！");
        }

    });

    $("#clear").click(function(){
        if(orderIds!==""&&orderIds!=null){
            $.ajax({
                url: "${pageContext.request.contextPath}/order/deleteOrder.do?orderId="+orderIds,
                type: "GET",
                success: function(response) {
                    location.reload();
                    alert("清空成功！");
                    location.reload();
                },
                error: function(error) {
                    // 这里你可以处理请求失败的情况
                    console.log(error);
                }
            });
        }else{
            alert("购物车中没有商品！");
        }
    })





</script>

</body>

</html>
