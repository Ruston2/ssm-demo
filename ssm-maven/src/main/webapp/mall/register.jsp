<%--
  Created by IntelliJ IDEA.
  User: cccc
  Date: 2024/3/6
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!doctype html>
<html>
<head></head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

<style>

    body{
        margin-top:20px;
        margin:0 auto;
    }
    .carousel-inner .item img{
        width:100%;
        height:300px;
    }
    .container .row div{
        /* position:relative;
        float:left; */
    }
    .username_err{
        color:red;
    }

    font {
        color: #3164af;
        font-size: 18px;
        font-weight: normal;
        padding: 0 10px;
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
        <img src="${pageContext.request.contextPath}/img/cuit2.png" width="223px" height="45px" />
    </div>

    <div class="col-md-3" style="padding-top:20px;float: right">
        <ol class="list-inline">
            <li><a href="${pageContext.request.contextPath}/mall/login.jsp" style="font-size: 18px">前往登录</a></li>
            <li><a href="${pageContext.request.contextPath}/login.jsp" style="font-size: 18px">后台登录</a></li>
        </ol>
    </div>
</div>


<div class="container" style="width:100%;height: 600px;background:url('${pageContext.request.contextPath}/images/bg1.jpg');">
    <div class="row">

        <div class="col-md-2"></div>




        <div class="col-md-8" style="background:#fff;padding:40px 80px;margin:30px;border:7px solid #ccc;">
            <font>用户注册</font>USER REGISTER
            <form class="form-horizontal" style="margin-top:5px;" id="form-horizontal">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label" >用户名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
                        <span id="username_err" class="username_err"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="confirmpwd" placeholder="请输入确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="email" id="inputEmail3" placeholder="Email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="usercaption" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="name" id="usercaption" placeholder="请输入姓名">
                    </div>
                </div>
<%--                <div class="form-group opt">--%>
<%--                    <label for="inlineRadio1" class="col-sm-2 control-label">性别</label>--%>
<%--                    <div class="col-sm-6">--%>
<%--                        <label class="radio-inline">--%>
<%--                            <input type="radio" name="sex" id="inlineRadio1" value="option1"> 男--%>
<%--                        </label>--%>
<%--                        <label class="radio-inline">--%>
<%--                            <input type="radio" name="sex" id="inlineRadio2" value="option2"> 女--%>
<%--                        </label>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="date" class="col-sm-2 control-label">出生日期</label>--%>
<%--                    <div class="col-sm-6">--%>
<%--                        <input type="date" class="form-control"  name="birthday">--%>
<%--                    </div>--%>
<%--                </div>--%>

                <div class="form-group">
                    <label class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="check" placeholder="请输入验证码">
                    </div>
                    <div class="col-sm-2">
                        <img src="${pageContext.request.contextPath}/mallUser/checkCode.do" id="changeImg"/>
                    </div>

                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="button"  width="100" value="注册" name="sub" border="0" id="sub"
                               style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;">
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-2"></div>

    </div>
</div>



<%--<div style="margin-top:50px;">--%>
<%--    <img src="http://localhost:8081/Shop/image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />--%>
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

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    $("#changeImg").click(function(){
        console.log(12),
            $(this).attr("src","${pageContext.request.contextPath}/mallUser/checkCode.do?"+new Date().getMilliseconds());
    })
    $("#username").blur(function(){
        var url="${pageContext.request.contextPath}/mallUser/usernameCheck.do";

        $.ajax({
            url:url,
            type:"post",
            data:{
                "username":$(this).val(),
            },
            success:function(data){
                if(JSON.parse(data).data){
                    $("#username_err").text("用户名不可用！")
                }else {
                    $("#username_err").text("");
                }
            },
            error:function(){
                alert('请求失败')
            }
        })
    });

    $("#sub").click(function(){
        console.log($("#inputPassword3").val());
        var p1=$("#inputPassword3").val();
        var p2=$("#confirmpwd").val();
        if(p1==p2){
            $("#form-horizontal").attr("action", "${pageContext.request.contextPath}/mallUser/pwdCheck.do");
            $("#form-horizontal").method="post";
            $("#form-horizontal").submit();
        }else{
            alert("两次密码不一致")
        }
    })






</script>
</html>



