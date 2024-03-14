<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WEB01</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        #completeShow{
            border:1px solid #999;
            position:absolute;
            width:199px;
            z-index:100;
            background-color:#fff;
            border-radius:1px;
            left:0px;
            top:36px;
            display:none;
        }
        #itemul{
            list-style:none;
        }
        #itemul>li:hover{
            background: blue;
        }
        #itemul>li>span{
            color:red;
        }
        .form-group{
            position:relative;
        }
        .test1{
            width: 7%;
        }
    </style>
</head>

<body>
<div class="container-fluid">

    <!--
        时间：2015-12-30
        描述：菜单栏
    -->
    <div class="container-fluid">
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}/img/cuit2.png" width="223px" height="45px"/>
        </div>
        <div class="test1" style="padding-top:20px;float: right">
            <ol class="list-inline">
                <%--                <li><a href="http://localhost:8081/Shop/login.jsp">登录</a></li>--%>
                <%--                <li><a href="http://localhost:8081/Shop/register.jsp">注册</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/mall/cart.jsp" style="font-size: 18px">购物车</a></li>
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
                <%--                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--%>
                <%--                    <ul class="nav navbar-nav">--%>
                <%--                        <li class="active"><a href="product_list.htm">手机数码<span class="sr-only">(current)</span></a></li>--%>
                <%--                        <li><a href="#">电脑办公</a></li>--%>
                <%--                        <li><a href="#">电脑办公</a></li>--%>
                <%--                        <li><a href="#">电脑办公</a></li>--%>
                <%--                    </ul>--%>


<%--                <form class="navbar-form navbar-right" role="search">--%>
<%--                    <div class="form-group">--%>
<%--                        <input type="text" class="form-control" placeholder="Search" id="search" name="pname" autocomplete="off">--%>
<%--                        <div id="completeShow">--%>
<%--                            <ul id="itemul" class="list-group" ></ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <button type="button" class="btn btn-default" id="sub">Submit</button>--%>
<%--                </form>--%>

                <%--                </div>--%>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <div class="container">
            <div class="row">
                <div class="test" style="float: right;margin-right: 10px">
                    <input type="text" class="form-control" id="search-box" placeholder="搜索商品" width="100px">
                </div>
            </div>
        </div>


        <!-- 商品展示区域 -->
        <div class="container-fluid" style="margin-top: 40px">
            <div class="row">
                <div id="product-list" class="col-md-12">
                    <!-- 这里将显示商品卡片 -->
                </div>
            </div>
        </div>

        <!-- 分页 -->
        <div class="container">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li id="prev-page">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <!-- 页码-->
                    <li id="next-page">
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>


    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        var PAGE_SIZE = 10; // 每页显示的商品数量
        var CURRENT_PAGE = 1; // 当前页码
        var TOTAL_PAGE = 0; // 总页数
        var LAST_QUERY = ''; // 上一次的查询

        var itemName = "${itemName}";
        // 获取并显示商品
        function getProducts(query) {
            // 模拟一个GET请求到后端API
            $.get('${pageContext.request.contextPath}/product/findProducts.do', { pname: query }, function(data) {
                var products = JSON.parse(data).rows;
                TOTAL_PAGE = Math.ceil(products.length / PAGE_SIZE);

                // 显示商品
                var start = (CURRENT_PAGE - 1) * PAGE_SIZE;
                var end = CURRENT_PAGE * PAGE_SIZE;
                $('#product-list').html('');
                for(var i=start; i<end; i++){
                    if(i >= products.length) break;
                    var product = products[i];
                    var row = document.createElement('div');
                    row.className='col-sm-6 col-md-4';
                    row.style.width="20%";
                    row.style.height="280px";
                    row.style.float="left";
                    // row.style.display="inline-block";
                    row.style.textAlign="center";
                    var di=document.createElement('div');
                    di.className='thumbnail1';
                    di.style.textAlign="center";

                    var imgCell = document.createElement('img');
                    imgCell.src="${pageContext.request.contextPath}/"+product.pimage;
                    imgCell.alt=product.pname;
                    imgCell.width=200;
                    imgCell.height=200;
                    imgCell.style.display="block";
                    imgCell.style.display="margin: 0 auto;"
                    imgCell.style.border="1px solid lightgray"

                    var a = document.createElement('a');
                    a.href="${pageContext.request.contextPath}/product/clickItemById.do?pid="+product.pid;
                    a.appendChild(imgCell)


                    var div = document.createElement('div');
                    div.className='caption';
                    div.style.display="inline-block";
                    var hCell = document.createElement('h5');
                    hCell.style.marginRight="20px";
                    hCell.textContent=product.pname;
                    var pCell = document.createElement('p');
                    pCell.textContent="￥"+product.shopPrice;
                    pCell.style.color="red";
                    div.appendChild(hCell);
                    div.appendChild(pCell);
                    di.appendChild(a);
                    di.appendChild(div);
                    row.appendChild(di);
                    $('#product-list').append(row);

                }

                // 显示分页条
                var pagination = $('.pagination');
                pagination.html('');
                pagination.append('<li id="prev-page"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>');
                for(var i=1; i<=TOTAL_PAGE; i++){
                    var li = $('<li>').html('<a href="#">'+i+'</a>');
                    if(i == CURRENT_PAGE) li.addClass('active');
                    pagination.append(li);
                }
                pagination.append('<li id="next-page"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>');
            });
        }

        if(itemName!==''&&itemName!=null){
            getProducts(itemName);
            $('#search-box').val(itemName);
            LAST_QUERY=itemName;
        }else {
            getProducts(''); // 默认加载所有商品
        }

        // 输入框监听事件
        $('#search-box').on('input', function() {
            var query = $(this).val();
            if(query !== LAST_QUERY) {
                LAST_QUERY = query;
                CURRENT_PAGE = 1; // 重置页码
                getProducts(query);
            }
        });

        // 分页点击事件
        $(document).on('click', '.pagination li a', function(e){
            e.preventDefault();
            var parent = $(this).parent();
            if(parent.attr('id') === 'prev-page') {
                if(CURRENT_PAGE > 1) CURRENT_PAGE--;
            } else if(parent.attr('id') === 'next-page') {
                if(CURRENT_PAGE < TOTAL_PAGE) CURRENT_PAGE++;
            } else {
                CURRENT_PAGE = parseInt($(this).text());
            }
            getProducts(LAST_QUERY);
        });
    });
</script>


</body>
</html>