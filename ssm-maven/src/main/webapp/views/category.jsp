<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>articleManger</title>
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
<table id="dg" title="分类信息管理" class="easyui-datagrid" pagination="true"
       rownumbers="true" fit="true" data-options="pageSize:10"
       url="${pageContext.request.contextPath}/category/getCategories.do" toolbar="#tb">
    <thead data-options="frozen:true">
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="cname" width="200" align="center">分类名称</th>
        <th field="cid" width="50px" align="center" >分类编号</th>
    <%--        <th field="content" width="70" align="center"--%>
<%--            formatter="formatHref">操作--%>
<%--        </th>--%>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openArticleAddDialog()" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">添加</a> <a
            href="javascript:openArticleModifyDialog()"
            class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> <a
            href="javascript:deleteArticle()" class="easyui-linkbutton"
            iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;分类：&nbsp;<input type="text" id="articleTitle" size="20"
                                onkeydown="if(event.keyCode==13) searchArticle()"/>&nbsp; <a
            href="javascript:searchArticle()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog"
     style="width: 850px;height:555px;padding: 10px 20px; position: relative; z-index:1000;"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>分类编号：</td>
                <td><input type="text" id="cid" name="cid"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>分类名称：</td>
                <td><input type="text" id="cname" name="cname"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveArticle()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a> <a href="javascript:closeArticleDialog()"
                                     class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>


<script type="text/javascript">
    var url;
    function ResetEditor() {
        UE.getEditor('myEditor', {
            initialFrameHeight: 480,
            initialFrameWidth: 660,
            enableAutoSave: false,
            elementPathEnabled: false,
            wordCount: false,
            /*  toolbars: [
             [
             'fontfamily', 'fontsize', 'forecolor', 'backcolor', 'bold', 'italic', 'underline', '|',
             'link', '|',
             ]
             ]  */
        });
    }
    function searchArticle() {
        $("#dg").datagrid('load', {
            "cname": $("#articleTitle").val(),
        });
    }

    function deleteArticle() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length == 0) {
            $.messager.alert("系统提示", "请选择要删除的数据！");
            return;
        }
        var strIds = [];
        for (var i = 0; i < selectedRows.length; i++) {
            strIds.push(selectedRows[i].cid);
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
                            "${pageContext.request.contextPath}/category/deleteCategory.do",
                            {
                                ids: ids
                            },
                            function (result) {
                                if (result.success) {
                                    $.messager.alert(
                                        "系统提示", "数据已成功删除！");
                                    $("#dg").datagrid("reload");
                                } else {
                                    $.messager.alert(
                                        "系统提示", "数据删除失败！");
                                }
                            }, "json");
                    }
                });

    }

    function openArticleAddDialog() {
        // var html = '<div id="myEditor" name="articleContent"></div>';
        // $('#editor').append(html);
        // ResetEditor(editor);
        // var ue = UE.getEditor('myEditor');
        // ue.setContent("");
        $("#dlg").dialog("open").dialog("setTitle", "添加分类信息");
        url = "${pageContext.request.contextPath}/category/saveCategory.do";
    }

    function saveArticle() {
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

    function openArticleModifyDialog() {
        var selectedRows = $("#dg").datagrid('getSelections');
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
        var row = selectedRows[0];

        $("#dlg").dialog("open").dialog("setTitle", "修改信息");
        $('#fm').form('load', row);
        $("#cid").prop('readonly', true); // 设置cid为不可编辑
        // var html = '<div id="myEditor" name="articleContent"></div>';
        // $('#editor').append(html);
        // ResetEditor(editor);
        // var ue = UE.getEditor('myEditor');
        // ue.setContent(row.articleContent);
        url = "${pageContext.request.contextPath}/category/modifyCategory.do?id="
            + row.id;
    }

    function formatHref(val, row) {
        return "<a href='${pageContext.request.contextPath}/article.html?id=" + row.id + "' target='_blank'>查看详情</a>";
    }

    function resetValue() {
        $("#cid").val("");
        $("#cid").prop('readonly', false); // 设置cid为可编辑
        $("#cname").val("");
    }

    function closeArticleDialog() {
        $("#dlg").dialog("close");
        resetValue();
    }
</script>
</body>
</html>