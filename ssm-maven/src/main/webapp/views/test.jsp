<%--
  Created by IntelliJ IDEA.
  User: cccc
  Date: 2024/3/4
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/echarts.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div id="main" style="width: 750px;height:400px;"></div>
<div id="main2" style="width: 1000px;height:400px;"></div>
<script type="text/javascript">
    var num = [];
    var cname = [];
    var soldNum = [];

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var myChart2 = echarts.init(document.getElementById('main2'));

    $(document).ready(function() {
        $.get("${pageContext.request.contextPath}/statistics/getProductCategory.do", function(data) {
            num = JSON.parse(data).num;
            cname = JSON.parse(data).cname;
            soldNum = JSON.parse(data).soldNum;
            var option = {
                title: {
                    text: '商品种类详情'
                },
                tooltip: {},
                legend: {
                    data: ['种类','销量']
                },
                xAxis: {
                    data: cname
                },
                yAxis: {},
                series: [
                    {
                        name: '种类',
                        type: 'bar',
                        data: num
                    },
                    {
                        name: '销量',
                        type: 'bar',
                        data: soldNum
                    }
                ]
            };
            myChart.setOption(option);
        });

        $.get("${pageContext.request.contextPath}/statistics/recentSalesRevenue.do",function (data) {
            var time = JSON.parse(data).time;
            var sum = JSON.parse(data).sum;


            var option2 = {
                title: {
                    text: '近一周商城销售额'
                },
                xAxis: {
                    type: 'category',
                    data: time
                },
                yAxis: {
                    type: 'value'
                },
                series: [
                    {
                        data: sum,
                        type: 'line'
                    }
                ]
            };

            myChart2.setOption(option2);
        })
    });

</script>
</body>
</html>
