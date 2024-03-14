<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>allBooksManger</title>
    <link href="${pageContext.request.contextPath}/css/base.css"
          type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/tab.css"
          type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/item.css"
          type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/item_do.css"
          type="text/css" rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/uploadify.css"
          type="text/css">
</head>
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
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/jquery.uploadify.v2.0.3.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/swfobject.js"></script>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/ueditor/ueditor.config.js">

</script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js">
</script>
<%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>--%>
<%--<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>--%>

</head>
<body style="margin:1px;" id="ff">
<table id="dg" title="订单信息管理" class="easyui-datagrid" pagination="true"
       rownumbers="true" fit="true" data-options="pageSize:10"
       url="${pageContext.request.contextPath}/buyRecord/listBuyRecord.do" toolbar="#tb">
    <thead data-options="frozen:true">
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="60" align="center">编号</th>
        <th field="username" width="150" align="center">用户</th>
        <th field="orders" width="90" align="center" hidden="true">订单</th>
        <th field="createTime" width="300" align="center">购买时间</th>
        <th field="option" width="100" align="center" formatter="optionsFormatter">订单详情</th>
<%--        <th field="cid" width="100" align="center" formatter="formatStatus">分类</th>--%>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
<%--        <a href="javascript:openProductModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>--%>
        <a href="javascript:deleteProduct()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;订单编号：&nbsp;<input type="text" id="orderId" size="20" onkeydown="if(event.keyCode==13) searchBook()"/>&nbsp
        <a href="javascript:searchBook()" class="easyui-linkbutton"
           iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>
<div id="dlg" class="easyui-dialog"
     style="width: 850px;height:555px;padding: 10px 20px; position: relative; z-index:1000;"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post" enctype="multipart/form-data">
        <table cellspacing="8px">
            <tr>
                <td width="58px">商品名：</td>
                <td><input type="text" id="productname" name="pname"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="58px">价格: </td>
                <td><input type="text" id="price" name="shopPrice"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>分类: </td>
                <td>
                    <select id="category" class="easyui-combobox" name="category" style="width:200px;">
                        <option value="">请选择...</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>库存: </td>
                <td><input type="text" id="storage" name="store"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>图片：</td>
                <td>
                    <input style="width: 180px;" id="assetphotourl" type="file" name="assetphotourl"/>
                    <%--                    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="AssetPhotosAdd($('#assetnum1').val())">添加</a>--%>
                </td>
            </tr>
            <tr>
                <td>描述: </td>
                <td><input type="text" id="desc" class="easyui-validatebox"/>
                </td>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:saveProduct()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a> <a href="javascript:closeArticleDialog()"
                                     class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>


<div id="dlg_c" class="easyui-dialog"
     style="width: 300px;height:450px;padding: 10px 20px; position: relative; z-index:1000;"
     closed="true" buttons="#dlg_c-buttons">
    <form id="fm_c" method="post">
        <table cellspacing="8px" id="tab">
        </table>
    </form>
</div>

</body>
<script type="text/javascript">
    var url;
    var categoryData = [];

    //绑定下拉框数据
    function bindBox(){
        var parse = JSON.parse(categoryData);
        for (var i = 0; i < parse.length; i++) {
            $('#category').append($('<option>', {
                value: parse[i],
                text: parse[i]
            }));
        }
        // $('#category').combobox('loadData', parse);
    }



    <%--$(document).ready(function() {--%>
    <%--    $.get("${pageContext.request.contextPath}/product/getAllCategories.do", function(data) {--%>
    <%--        categoryData = data;--%>
    <%--    });--%>
    <%--});--%>

    function searchBook() {
        if($("#orderId").val()==="" || $("#orderId").val()===""){
            $("#dg").datagrid('load', {
                "id": 0,
            });
        }else{
            $("#dg").datagrid('load', {
                "id": $("#orderId").val(),
            });
        }

    }





    <%--function formatStatus(val, row, index) {--%>
    <%--    var cate;--%>

    <%--    $.post(--%>
    <%--        "${pageContext.request.contextPath}/product/findCategory.do",--%>
    <%--        {--%>
    <%--            cid: row.cid--%>
    <%--        },--%>
    <%--        function (result) {--%>
    <%--            cate = result.category;--%>
    <%--            // 在请求成功后更新单元格数据--%>
    <%--            $('#dg').datagrid('updateRow', {--%>
    <%--                index: index,--%>
    <%--                row: {--%>
    <%--                    cid: cate--%>
    <%--                }--%>
    <%--            });--%>
    <%--        },"json");--%>

    <%--    return "<div>Loading...</div>";--%>
    <%--}--%>
    // function formatStatus(val, row) {
    //     if(row.cid !== undefined && row.cid!==''){
    //         let cate = JSON.parse(categoryData)[row.cid-1];
    //         return "<div>" + cate + "</div>";
    //     }
    //     else {
    //         return "<div>暂未分类</div>";
    //     }
    // }

    // 定义操作列显示数据和详情跳转页

    function optionsFormatter(val,row){
        var orders = row.orders;
        var u = "javascript:openOrderDetail('"+orders.toString()+"')";
        return '<a href="'+u+'" style="color: red; text-decoration: underline;">订单详情</a>'
    }
    function openOrderDetail(orders){
        window.parent.openTab('订单详情', 'OrderDetail.jsp?orders=' + orders,
            'icon-shujias');
    }

    // function formatPrice(val,row) {
    //     if(row.shopPrice === "" || row.shopPrice ==null){
    //         return "<div style='color:red;'>敬请期待</div>";
    //     }else return "<div style='color:black;'>"+row.shopPrice+"</div>";
    // }

    function deleteProduct() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length === 0) {
            $.messager.alert("系统提示", "请选择要删除的数据！");
            return;
        }
        var strIds = [];
        for (var i = 0; i < selectedRows.length; i++) {
            strIds.push(selectedRows[i].id);
        }
        var ids = strIds.join(",");
        $.messager
            .confirm(
                "系统提示",
                "您确认要删除这<font color=red>" + selectedRows.length
                + "</font>条数据吗？",
                function (r) {
                    if (r) {
                        $.post(
                            "${pageContext.request.contextPath}/buyRecord/deleteBuyRecord.do",
                            {
                                ids: ids
                            },
                            function (result) {
                                if (result.success) {
                                    $.messager.alert("系统提示", "数据已成功删除！");
                                    $("#dg").datagrid("reload");
                                } else {
                                    $.messager.alert("系统提示", "数据删除失败！");
                                }
                            }, "json");
                    }
                });

    }

    function openProductAddDialog() {
        // var html = '<div id="myEditor" name="articleContent"></div>';
        // $('#editor').append(html);
        // ResetEditor(editor);
        // var ue = UE.getEditor('myEditor');
        // ue.setContent("");
        $("#dlg").dialog("open").dialog("setTitle", "添加文本信息");
        bindBox();
        url = "${pageContext.request.contextPath}/product/save.do";
    }

    function openProductModifyDialog() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg").dialog("open").dialog("setTitle", "修改信息");
        $('#fm').form('load', row);
        var html = '<div id="myEditor" name="articleContent"></div>';
        $('#editor').append(html);
        // ResetEditor(editor);
        var ue = UE.getEditor('myEditor');
        ue.setContent(row.articleContent);
        url = "${pageContext.request.contextPath}/article/save.do?id="
            + row.id;
    }

    function saveProduct() {
        var files = document.getElementById("assetphotourl").files;
        var length = files.length;
        if(length==1){
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
                    return $(this).form("validate");
                },
                success: function (result) {
                    $.messager.alert("系统提示", "保存成功");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                    resetValue();
                }
            });
        }else if(length==0){
            $.messager.alert("系统提示","图片不能为空！");
        }else{
            $.messager.alert("只能上传一张图片");
        }

    }

    function closeArticleDialog() {
        $("#dlg").dialog("close");
        resetValue();
    }

    function resetValue() {
        $("#productname").val("");
        $("#price").val("");
        $("#storage").val("");
        $("#desc").val("");
        $("#assetphotourl").val("");
        $("#category").val("");
        // ResetEditor();
    }


</script>
</html>