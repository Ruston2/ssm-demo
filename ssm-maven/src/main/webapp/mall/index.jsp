<%--
  Created by IntelliJ IDEA.
  User: cccc
  Date: 2024/3/6
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
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
                    <a class="navbar-brand" href="#">首页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
<%--                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--%>
<%--                    <ul class="nav navbar-nav">--%>
<%--                        <li class="active"><a href="product_list.htm">手机数码<span class="sr-only">(current)</span></a></li>--%>
<%--                        <li><a href="#">电脑办公</a></li>--%>
<%--                        <li><a href="#">电脑办公</a></li>--%>
<%--                        <li><a href="#">电脑办公</a></li>--%>
<%--                    </ul>--%>


                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search" id="search" name="pname" autocomplete="off">
                            <div id="completeShow">
                                <ul id="itemul" class="list-group" ></ul>
                            </div>
                        </div>

                        <button type="button" class="btn btn-default" id="sub">Submit</button>
                    </form>

<%--                </div>--%>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </div>

    <!--
        作者：ci2713@163.com
        时间：2015-12-30
        描述：轮播条
    -->
    <div class="container-fluid">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/img/0101d75d709f3ca801202f177e96ba.gif" style="width: 1600px;height: 800px">
                    <div class="carousel-caption">

                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/0101d75d709f3ca801202f177e96ba.gif" style="width: 1600px;height: 800px">
                    <div class="carousel-caption">

                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/0101d75d709f3ca801202f177e96ba.gif" style="width: 1600px;height: 800px">
                    <div class="carousel-caption">

                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
<%--主体--%>
    <div class="col-md-12">
        <h2>热门商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
    </div>
    <div class="container-fluid" id="products">

    </div>
    <div style="float: right">
        <a href="" style="color: #00a0e9;  text-decoration: underline;margin-right: 10px">查看更多>></a>
    </div>

<%--    <div class="container-fluid">--%>
<%--        <img src="products/hao/ad.jpg" width="100%"/>--%>
<%--    </div>--%>
    <!--
        作者：ci2713@163.com
        时间：2015-12-30
        描述：商品显示
    -->
<%--    <div class="container-fluid">--%>
<%--        <div class="col-md-12">--%>
<%--            <h2>热门商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>--%>
<%--        </div>--%>
<%--        <div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">--%>
<%--            <img src="products/hao/big01.jpg" width="205" height="404" style="display: inline-block;"/>--%>
<%--        </div>--%>
<%--        <div class="col-md-10">--%>
<%--            <div class="col-md-6" style="text-align:center;height:200px;padding:0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/middle01.jpg" width="516px" height="200px" style="display: inline-block;">--%>
<%--                </a>--%>
<%--            </div>--%>

<%--            <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small03.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>

<%--            <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small04.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>

<%--            <div class="col-md-2 yes-right-border" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small05.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>

<%--            <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small03.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>

<%--            <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small04.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>

<%--            <div class="col-md-2 yes-right-border" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small05.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>
<%--            <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small03.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>

<%--            <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small04.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>

<%--            <div class="col-md-2 yes-right-border" style="text-align:center;height:200px;padding:10px 0px;">--%>
<%--                <a href="product_info.htm">--%>
<%--                    <img src="products/hao/small05.jpg" width="130" height="130" style="display: inline-block;">--%>
<%--                </a>--%>
<%--                <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>--%>
<%--                <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="container-fluid" style="margin-top: 30px">

        <div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
            Copyright &copy; 2024 成信大商城 版权所有
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/axios-0.18.0.js"></script>
<script type="text/javascript" >

    var contextPath = "${pageContext.request.contextPath}";

    $(document).ready(function() {
        $.ajax({
            url: "${pageContext.request.contextPath}/product/findProducts.do",
            method: "POST",
            data: {
                page: 1,
                rows: 10
            },
            success: function(data) {
                JSON.parse(data).rows.forEach(function(item) {
                    var product = '<div class="product" style="display: inline-block; width: 20%; text-align: center;" >';
                    product += '<a href=""> <img src="' +contextPath+'/'+ item.pimage + '" width="200" height="200" style="display: inline-block;border: 1px solid lightgray;" /></a>';                    product += '<p><a href="product_info.html" style="color:#666">'+ item.pname +'</a></p>';
                    product += '<p><font color="#E4393C" style="font-size:16px">&yen;' +
                        (item.shopPrice ? item.shopPrice : '敬请期待') +
                        '</font></p>';
                    product += '</div>';
                    $('#products').append(product);
                });
            }
        });
    });



    $("#search").keyup(function(){
        console.log(this.value);
        var pname=this.value;
        axios({
            method:"get",
            url:"${pageContext.request.contextPath}/product/findProducts.do?pname="+pname
        }).then(function(resp){
            var products=resp.data.rows;
            $("#itemul>li").remove()
            $("#itemul").hide()
            for(let i=0;i<products.length;i++){
                if(products[i].pname!=null&&products[i].pname!=""){
                    products[i].pname=products[i].pname.replace(pname,"<span>"+pname+"</span>");
                    //resp.data[i].pname=resp.data[i].pname.replace(pname.toUpperCase(),"<span>"+pname.toUpperCase()+"</span>")
                }
                $("#itemul").append("<li>"+products[i].pname+"</li>");
            }
            $("#itemul").show();
            $("#completeShow").show();
            <%--$("#itemul>li").click(function(){--%>
            <%--    //console.log(2);--%>
            <%--    console.log(this.innerText);--%>
            <%--    $("#search").val(this.innerText);--%>
            <%--    $("#itemul").hide()--%>
            <%--    location.href="${pageContext.request.contextPath}/product/clickItem.do?pname="+this.innerText;--%>
            <%--})--%>
            $(document).on('click', '#itemul>li', function(){
                console.log(this.innerText);
                $("#search").val(this.innerText);
                $("#itemul").hide();
                location.href="${pageContext.request.contextPath}/product/clickItem.do?pname="+this.innerText;
            });
        });
    })
    // $("#search").blur(function(){
    //     $("#itemul").hide();
    //     $("#completeShow").hide();
    // });



    $("#sub").click(function(){
        console.log(1);
        var text=$("#search").val();
        console.log(text);
        location.href="/Shop/web/findPage?pname="+text+"&page=1";
    })


</script>
</html>
