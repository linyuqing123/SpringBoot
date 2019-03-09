<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/4
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path=request.getContextPath();%>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%=path%>/js/jquery-1.8.2.min.js"></script>
    <link href="<%=path%>/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" style="text/css"/>
    <script type="text/javascript" src="<%=path%>/ztree/js/jquery.ztree.all.js"></script>
    <script type="text/javascript">
        $(function(){
            var setting;
            var zTreeNodes;
            setting={
                data: {
                    simpleData: {
                        enable: true,//启用简单数据
                        idKey: "mid",//本身节点
                        pIdKey: "pid",//父节点
                        rootPId: 0//根节点id
                    },
                    key: {
                        name: "mname",//展示的节点名称
                        url: "url",
                        target: "target"//模块
                    }
                }
            }

           /* zTreeNodes = [
                {mid:0,mname:"八维管理系统"},
                {mid:1,mname:"员工管理",pid:0},
                {mid:2,mname:"学生管理",pid:0},
                {mid:3,mname:"查看员工信息",pid:1},
                {mid:4,mname:"员工入职",pid:1},
                {mid:5,mname:"开除员工",pid:1},
                {mid:6,mname:"修改员工信息",pid:1},
                {mid:7,mname:"查看学生信息",pid:2},
                {mid:8,mname:"学生入学",pid:2},
                {mid:9,mname:"开除学生",pid:2},
                {mid:10,mname:"修改学生信息",pid:2}
            ];
            //初始化zTree
            $.fn.zTree.init($(".ztree"), setting, zTreeNodes);*/
           $.post(
               "<%=path%>/findUserMenuList.action",
            {},
               function (data) {
                   zTreeNodes=data;
                   $.fn.zTree.init($(".ztree"), setting, zTreeNodes);
               }
           ,"json");

        });
    </script>
</head>
<body>
<div class="ztree"></div>
</body>
</html>
