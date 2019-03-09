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
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
    <%-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <link href="<%=path%>/css/index_work.css" rel="stylesheet" style="text/css"/>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
        function clickAll(b) {
            $(".ck").attr("checked",b);
            $(".ck").map(function () {
                $(this).attr("checked",!$(this).attr("checked"));
            })
        };

        function deleBatch() {
            ids="";
            $(".ck:checked").map(function () {
                ids+=","+$(this).val();
            })
            if (ids==""){
                alert("请先选择数据；；；");
            }
            else {
                ids=ids.substr(1);
                if(confirm("确定要删除数据？？？")){
                    $.post(
                        "<%=path%>/delBatch.action",
                        {id:ids},
                        function (i) {
                            if (i>0){
                                alert("删除数据成功;;;");
                                location="<%=path%>/itemList.action";
                            }
                        }

                    ,"json");
                }
            }
        }
    </script>
</head>
<body>
      <table>
          ${pageUtils.mohuPage}
          <hr>
                <td>Id</td>
                <td>名称</td>
                <td>价格</td>
                <td>详情</td>
                <td>照片</td>
                <td>生产日期</td>
                <td>操作</td>
          </hr>
          <c:forEach items="${list}" var="item">
              <tr>
              <td><input type="checkbox" name="id" value="${item.id}" class="ck"></td>
              <td>${item.name}</td>
              <td>${item.price}</td>
              <td>${item.detail}</td>
              <td>
                  <c:if test="${item.pic!=null}">
                      <a href="<%=path%>/down.action?pic=${item.pic}">
                      <img src="/pic/${item.pic}" width="80" height="80" title="点击下载图片"/>
                      </a>
                  </c:if>
              </td>
              <td><fmt:formatDate  value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                  <td><input type="button" value="修改" onclick="location='<%=path%>/findItemById.action?id='+${item.id}"/></td>
              </tr>
          </c:forEach>
          ${pageUtils.page}
      </table>
      <tr colspan="20" align="center">
          <td><input type="button" value="全选" onclick="clickAll(false)"></td>
          <td><input type="button" value="反选" onclick="clickAll()"></td>
          <td><input type="button" value="全不选" onclick="clickAll(true)"></td>
          <td><input type="button" value="批量删除" onclick="deleBatch()"></td>
      </tr>
</body>
</html>
