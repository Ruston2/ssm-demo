<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ssm.maven.core.entity.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
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
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<%--                <ul class="nav navbar-nav">--%>
<%--                    <li class="active"><a href="#">手机数码<span class="sr-only">(current)</span></a></li>--%>
<%--                    <li><a href="#">电脑办公</a></li>--%>
<%--                    <li><a href="#">电脑办公</a></li>--%>
<%--                    <li><a href="#">电脑办公</a></li>--%>
<%--                </ul>--%>
<%--                <form class="navbar-form navbar-right" role="search">--%>
<%--                    <div class="form-group">--%>
<%--                        <input type="text" class="form-control" placeholder="Search">--%>
<%--                    </div>--%>
<%--                    <button type="submit" class="btn btn-default">Submit</button>--%>
<%--                </form>--%>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</div>


<div class="container">
    <div class="row">
<%--        <div style="border: 1px solid #e4e4e4;width:930px;margin-bottom:10px;margin:0 auto;padding:10px;margin-bottom:10px;">--%>
<%--            <a href="${pageContext.request.contextPath}/mall/index.jsp">首页&nbsp;&nbsp;&gt;</a>--%>
<%--            <a href="./蔬菜分类.htm">蔬菜&nbsp;&nbsp;&gt;</a>--%>
<%--            <a>无公害蔬菜</a>--%>
<%--        </div>--%>

        <div style="margin:0 auto;width:950px;">
            <div class="col-md-6">
                <img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/${p.pimage }">
            </div>
            <div class="col-md-6">
                <div><strong>${p.pname }</strong></div>
                <div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
                    <div>编号：${p.pid}</div>
                </div>
                <div style="margin:10px 0 10px 0;">成信商城价: <strong style="color:#ef0101;">${p.shopPrice }</strong> 参 考 价： <del>${p.marketPrice }</del>
                </div>
                <div style="margin:10px 0 10px 0;">促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)" style="background-color: #f07373;">限时抢购</a> </div>
                <div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;;background-color: #fffee6;">
<%--                    <div style="margin:5px 0 10px 0;">白色</div>--%>
                    <div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
                        <input id="quantity" name="quantity" value="1" maxlength="4" size="10" type="text"> </div>
                    <div style="margin:20px 0 10px 0;;text-align: center;">
                        <a href="${pageContext.request.contextPath}/mall/cart.jsp">
                            <input id="order" style="background: url('${pageContext.request.contextPath}/images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="button">
                        </a>&nbsp;
<%--                        &nbsp;<span id="git">${p.pflag==0?'收藏商品':'已收藏' }</span>--%>
                    </div>
                </div>
            </div>
        </div>


        <div class="clear"></div>
        <div style="width:950px;margin:0 auto;">
            <div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
                <strong>商品介绍</strong>
            </div>

            <div>
                <p>${p.pdesc}</p>
            </div>

            <div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
                <strong>商品参数</strong>
            </div>
            <div style="margin-top:10px;width:900px;">
                <table class="table table-bordered">
                    <tbody>
                    <tr class="active">
                        <th colspan="2">基本参数</th>
                    </tr>
                    <tr>
                        <th width="10%">级别</th>
                        <td width="30%">标准</td>
                    </tr>
                    <tr>
                        <th width="10%">标重</th>
                        <td>500</td>
                    </tr>
                    <tr>
                        <th width="10%">浮动</th>
                        <td>200</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div style="background-color:#d3d3d3;width:900px;">
                <table class="table table-bordered">
                    <tbody id="commentSection">
                    <tr class="active">
                        <th><strong>商品评论</strong></th>
                    </tr>
                    <tr class="warning">
                        <!-- <th>暂无商品评论信息 <a>[发表商品评论]</a></th> -->
                        <th><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">发表商品评论</button></th>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">评论</h4>
                        </div>
                        <div class="modal-body">
                            <form>

                                <div class="form-group">
                                    <label for="message-text" class="control-label">Message:</label>
                                    <textarea class="form-control" id="message-text"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="close1">关闭</button>
                            <button type="button" class="btn btn-primary" id="comment">发表评论</button>
                        </div>
                    </div>
                </div>
            </div>

<%--            <div style="background-color:#d3d3d3;width:900px;">--%>
<%--                <table class="table table-bordered">--%>
<%--                    <tbody>--%>
<%--                    <tr class="active">--%>
<%--                        <th><strong>商品咨询</strong></th>--%>
<%--                    </tr>--%>
<%--                    <tr class="warning">--%>
<%--                        <th>暂无商品咨询信息 <a>[发表商品咨询]</a></th>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
        </div>

    </div>
</div>

<%--<div style="margin-top:50px;">--%>
<%--    <img src="./image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />--%>
<%--</div>--%>


<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
    Copyright &copy; 2024 成信大商城 版权所有
</div>
<%

%>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

    // $("#comment").click(function(){
    //     var t=$("#message-text").val();
    //     console.log(t);
    //     $("#close1").trigger('click');
    //     $.ajax({
    //         type:"get",
    //         url:"/Shop/web/getComment?text"+t,
    //     })
    //
    // })



    $(document).ready(function(){
        $.ajax({
            url: '${pageContext.request.contextPath}/comment/getCommentsShow.do?pid='+${p.pid},
            type: 'GET',
            dataType: 'json',
            success: function(result){
                var data = result.data;
                for(var i=0; i<data.length; i++){
                    var card = $(`
                    <tr>
                        <th>
                            <div class="card mb-3">
                                <div class="card-header" style="font-size: 14px"></div>
                                <div class="card-body">
                                    <h5 class="card-title" style="font-size: 16px"></h5>
                                    <p class="card-text"></p>
                                </div>
                                <div class="card-footer text-muted" style="font-size: 10px"></div>
                            </div>
                        </th>
                    </tr>
                `);
                    card.find('.card-header').text(data[i].name+":");
                    card.find('.card-title').text(data[i].message);
                    card.find('.card-footer').text(data[i].time);
                    $('#commentSection').append(card);
                }
            },
            error: function(error){
                console.log(error);
            }
        });
    });





    $("#git").click(function(){

        console.log(1);
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/mallProduct/favorite.do",
            data: {
                pid: ${p.pid}
            },
            success:function(data){
                // $.ajax({
                //     type:"get",
                //     url:"/Shop/web/isLogin",
                //     success:function(data2){
                //         if(data2=='no'){
                //             location.href="/Shop/login.jsp";
                //         }
                //     }
                // })
                console.log(data);
                if(data.success===0){
                    $("#git").text('收藏商品')
                }else{
                    $("#git").text('已收藏')
                }
            },
            error:function(){
                alert('请求失败')
            }
        })

    });

    // $(document).ready(function() {
        $("#order").click(function() {
            // This is the data you want to send to the server (example)

            // Perform the AJAX request
            $.ajax({
                type: "POST", // or GET, depending on your server setup
                url: "${pageContext.request.contextPath}/order/createOrder.do",
                data: {
                    pid: ${p.pid},
                    shopPrice: ${p.shopPrice },
                    count: $("#quantity").val()
                },
                success: function(response) {
                    // This is the callback function that is called if the request succeeds
                    console.log("Success:", response);
                    var data = JSON.parse(response);
                    // You can do something here in response to the server's reply
                    // For example, showing a success message to the user
                    if(!data.success) {
                        alert("添加失败！");
                    }else {
                        alert("添加成功! ");
                    }
                },
                error: function(xhr, status, error) {
                    // This callback handles any errors
                    console.error("Error:", status, error);
                    // Similarly, you can notify the user about the failure
                    alert("Failed to add product to cart.");
                }
            });
        });

        $("#comment").click(function (){
            $.ajax({
                type: "POST", // or GET, depending on your server setup
                url: "${pageContext.request.contextPath}/comment/createComment.do",
                data: {
                    pid: ${p.pid},
                    comment: $("#message-text").val()
                },
                success: function(response) {
                    // This is the callback function that is called if the request succeeds
                    console.log("Success:", response);
                    var data = JSON.parse(response);
                    // You can do something here in response to the server's reply
                    // For example, showing a success message to the user
                    if(!data.success) {
                        alert("评论失败！");
                    }else {
                        alert("评论成功! ");
                    }
                    $('#exampleModal').hide();

                    // 刷新页面
                    location.reload();
                },
                error: function(xhr, status, error) {
                    // This callback handles any errors
                    // Similarly, you can notify the user about the failure
                    alert("Failed to add product to cart.");
                }
            });
        })
</script>
</html>