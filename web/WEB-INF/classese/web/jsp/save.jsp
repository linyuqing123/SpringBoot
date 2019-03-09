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
</head>
<body>
      <form action="<%=path%>/saveItem.action" enctype="multipart/form-data" method="post">
          修改商品信息:
          <table width="100%" border="1">
                <tr>
                    <td>商品名称:</td>
                    <td><input type="text"  name="name"/></td>
                </tr>
                <tr>
                    <td>商品价格:</td>
                    <td><input type="text"  name="price"/></td>
                </tr>
                <tr>
                     <td>商品简介:</td>
                    <td><input type="text" name="detail"/></td>
                </tr>
                <tr>
                    <td>商品照片:</td>
                    <td>
                        <%--<c:if test="${item.pic!=null}">
                            <img src="/pic/${item.pic}" width="100" height="100" alt="照片" />
                            <input type="hidden" value="${item.pic}" name="pic"/>
                        </c:if>--%>
                        <input type="file" name="file">
                    </td>
                </tr>
                <tr>
                    <td>照片时间:</td>
                    <td><input type="text" name="createtime" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="添加"/>
                    </td>
                </tr>
          </table>
      </form>
</body>
</html>
