<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>allBooksManger</title>
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
            src="${pageContext.request.contextPath}/ueditor/ueditor.config.js">

    </script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js">

    </script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body style="margin:1px;" id="ff">
<table id="dg" title="评论信息管理" class="easyui-datagrid" pagination="true"
       rownumbers="true" fit="true" data-options="pageSize:10"
       url="${pageContext.request.contextPath}/comment/commentManage.do" toolbar="#tb">
    <thead data-options="frozen:true">
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="60" align="center" hidden="true">编号</th>
        <th field="username" width="150" align="center">评论用户</th>
        <th field="pname" width="150" align="center">评论商品</th>
        <th field="comment" width="300" align="center">评论内容</th>
        <th field="createTime" width="300" align="center">评论时间</th>
        <%--        <th field="cid" width="100" align="center" formatter="formatStatus">分类</th>--%>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openProductModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:deleteProduct()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;商品名称：&nbsp;<input type="text" id="serarchPname" size="20" onkeydown="if(event.keyCode==13) searchBook()"/>&nbsp
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
                <td width="58px">用户名：</td>
                <td><input type="text" id="username" name="username"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="58px">商品名: </td>
                <td><input type="text" id="pname" name="pname"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="58px">评论内容: </td>
                <td><input type="text" id="comment" name="comment"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
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

    function searchBook() {
        $("#dg").datagrid('load', {
            "pname": $("#serarchPname").val(),
        });
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
                            "${pageContext.request.contextPath}/comment/deleteComment.do",
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
        $("#username").prop('readonly', true);
        $("#pname").prop('readonly', true);
        url = "${pageContext.request.contextPath}/comment/modifyComment.do?id="
            + row.id;
    }

    function saveProduct() {
        $("#fm").form("submit", {
            url: url,
            onSubmit: function () {
                return $(this).form("validate");
            },
            success: function (result) {
                if(JSON.parse(result).success){
                    $.messager.alert("系统提示", "保存成功");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                    resetValue();
                }else {
                    $.messager.alert("系统提示","输入数据有误,保存失败");
                    resetValue();
                }

            }
        });

    }

    function closeArticleDialog() {
        $("#dlg").dialog("close");
        resetValue();
    }

    function resetValue() {
        $("#username").val("");
        $("#pname").val("");
        $("#comment").val("");
        // ResetEditor();
    }


</script>
</html>