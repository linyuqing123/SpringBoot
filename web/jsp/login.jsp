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
    <link href="<%=path%>/css/index_work.css" rel="stylesheet" style="text/css"/>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var i="${param.lid}";
            if (i==5){
                $("#ckl").html("请先进行登录操作");
            }
        });
        function ckLogin() {
            $.post(
                "<%=path%>/login.action",
                $("form").serialize(),
                function (i) {
                    if (i==1){
                        alert("登录系统成功");
                        location="<%=path%>/jsp/main.jsp";
                    } if (i==2){
                        $("#upan").html("用户名有误");
                    }if (i==3){
                        $("#pan").html("密码请重新验证");
                    }
                }
            ,"json");
        }
    </script>
</head>
<body>
    <form>

        <table align="center"   style="width: 60%;background-color:#00f;border:1px solid #ff2c0d;">
            <tr>
                <td colspan="2"><b>员工登录</b></td>
            </tr>
            <span id="ckl" style="color: red;"></span>
            <tr>
            <td>用户名:</td>
            <td><input name="username" type="text" id="usr"/><span id="upan" style="color: red;"></span></td>
        </tr>
        <tr>
            <td>密&nbsp;码</td>
            <td><input name="password" type="text" id="pas"><span id="pan" style="color: red;"></span></td>
        </tr>
        <tr>
            <td colspan="2"><input type="button" value="登录" onclick="ckLogin()"></td>
        </tr>
    </form>
    </table>
</body>
</html>
