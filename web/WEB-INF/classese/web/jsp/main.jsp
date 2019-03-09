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
<frameset rows="15%,*">
    <frame src="<%=path%>/jsp/top.jsp" name="top" noresize="false"/>
    <frameset cols="15%,*">
        <frame src="<%=path%>/jsp/left.jsp" name="left" noresize="true">
        <frame src="<%=path%>/jsp/right.jsp" name="right" noresize="true">
    </frameset>
</frameset>
</html>
