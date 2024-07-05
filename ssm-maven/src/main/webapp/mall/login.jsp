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
 
font {
    color: #666;
    font-size: 22px;
    font-weight: normal;
    padding-right:17px;
}
 </style>
</head>
<body>
	
<%-- 菜单--%>
			<div class="container-fluid">
				<div class="col-md-4">
					<img src="${pageContext.request.contextPath}/img/cuit2.png" width="223px" height="45px"/>
				</div>
<%--				<div class="col-md-5">--%>
<%--					<img src=""  width="230px" height="45px"/>--%>
<%--				</div>--%>
                <div class="col-md-3" style="padding-top:20px;float: right">
                    <ol class="list-inline">
                        <li><a href="${pageContext.request.contextPath}/mall/register.jsp" style="font-size: 18px">前往注册</a></li>
                        <li><a href="${pageContext.request.contextPath}/login.jsp" style="font-size: 18px">后台登录</a></li>
                    </ol>
                </div>
<%--                <div class="col-md-3" style="padding-top:20px; float: right">--%>
<%--                    <ol class="list-inline">--%>
<%--                        <li><a href="${pageContext.request.contextPath}/mall/register.jsp" style="font-size: 18px">前往注册</a></li>--%>
<%--                    </ol>--%>
<%--                </div>--%>
<%--				<div class="col-md-3" style="padding-top:20px; float: right">--%>
<%--					<ol class="list-inline">--%>
<%--						<li><a href="${pageContext.request.contextPath}/login.jsp" style="font-size: 18px">后台登录</a></li>--%>
<%--					</ol>--%>
<%--				</div>--%>
			</div>

<%--			<div class="container-fluid">--%>
<%--				<nav class="navbar navbar-inverse">--%>
<%--					<div class="container-fluid">--%>
<%--						<div class="navbar-header">--%>
<%--							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">--%>
<%--								<span class="sr-only">Toggle navigation</span>--%>
<%--								<span class="icon-bar"></span>--%>
<%--								<span class="icon-bar"></span>--%>
<%--								<span class="icon-bar"></span>--%>
<%--							</button>--%>
<%--							<a class="navbar-brand" href="#">首页</a>--%>
<%--						</div>--%>

<%--						<!-- Collect the nav links, forms, and other content for toggling -->--%>
<%--						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--%>
<%--							<ul class="nav navbar-nav">--%>
<%--								<li class="active"><a href="#">手机数码<span class="sr-only">(current)</span></a></li>--%>
<%--								<li><a href="#">电脑办公</a></li>--%>
<%--								<li><a href="#">电脑办公</a></li>--%>
<%--								<li><a href="#">电脑办公</a></li>--%>
<%--							</ul>--%>
<%--							<form class="navbar-form navbar-right" role="search">--%>
<%--								<div class="form-group">--%>
<%--									<input type="text" class="form-control" placeholder="Search">--%>
<%--								</div>--%>
<%--								<button type="submit" class="btn btn-default">Submit</button>--%>
<%--							</form>--%>

<%--						</div>--%>
<%--					</div>--%>
<%--				</nav>--%>
<%--			</div>--%>

	
	
	
	
	
	
<div class="container"  style="width:100%;height:600px;background:#FF2C4C url('${pageContext.request.contextPath}/images/bg1.jpg') no-repeat;">
<div class="row"> 
	<div class="col-md-7">
		<!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
	</div>
	
	<div class="col-md-5">
				<div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:60px;background:#fff;">
				<font>用户登录</font>USER LOGIN

				<div>&nbsp;</div>
<form class="form-horizontal" action="${pageContext.request.contextPath}/mallUser/login.do">
  <%
	  String username="";
      boolean auto=false;
	  Cookie[] cs=request.getCookies();
	  if(cs!=null){
  		for(Cookie c:cs){
  	  		if(c.getName().equals("name")){
  	  			username=c.getValue();
  	  		}if(c.getName().equals("auto")){
                    username=c.getValue().split("@")[0];
                    auto=true;
            }
  	  	}
  	}
  %>
 <div class="form-group">
    <label for="username" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" value="<%=username %>"  name="username" id="username" placeholder="请输入用户名" >
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-6">
      <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="请输入密码">
      <span><%=request.getAttribute("login_err")==null?"":request.getAttribute("login_err") %></span>
    </div>
  </div>
   <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="inputPassword4" name="check" placeholder="请输入验证码">
    </div>
    <div class="col-sm-3">
      <img src="${pageContext.request.contextPath}/mallUser/checkCode.do" id="changeImg"/>
    </div>
    
  </div>
   <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox" name="auto"> 自动登录
        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label>
          <input type="checkbox" name="rember"> 记住用户名
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
    <input type="submit"  width="100" value="登录" name="submit" border="0"
    style="background: url('http://localhost:8082/Shop/images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    height:35px;width:100px;color:white;">
    </div>
  </div>
</form>
</div>			
	</div>
</div>
</div>	

<%--	<div style="margin-top:50px;">--%>
<%--			<img src=${pageContext.request.contextPath}/image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />--%>
<%--		</div>--%>

<%--		<div style="text-align: center;margin-top: 5px;">--%>
<%--			<ul class="list-inline">--%>
<%--				<li><a>关于我们</a></li>--%>
<%--				<li><a>联系我们</a></li>--%>
<%--				<li><a>招贤纳士</a></li>--%>
<%--				<li><a>法律声明</a></li>--%>
<%--				<li><a>友情链接</a></li>--%>
<%--				<li><a target="_blank">支付方式</a></li>--%>
<%--				<li><a target="_blank">配送方式</a></li>--%>
<%--				<li><a>服务声明</a></li>--%>
<%--				<li><a>广告声明</a></li>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
			Copyright &copy; 2024 成信大商城 版权所有
		</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    window.onload = function() {
        let condition = <%=auto%> // 你的条件
        if(condition){
            window.location.href = "${pageContext.request.contextPath}/mall/index.jsp";
        }
    };


    $("#changeImg").click(function(){
		$(this).attr("src","${pageContext.request.contextPath}/mallUser/checkCode.do?"+new Date().getMilliseconds());
	})
</script>

</html>