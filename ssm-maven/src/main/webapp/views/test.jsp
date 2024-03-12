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
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var num = [];
    var cname = [];

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    $(document).ready(function() {
        $.get("${pageContext.request.contextPath}/statistics/getProductCategory.do", function(data) {
            num = JSON.parse(data).num;
            cname = JSON.parse(data).cname;

            // 指定图表的配置项和数据
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
                        data: [131, 120, 363, 210, 110, 70]
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        });
    });

</script>
</body>
</html>
