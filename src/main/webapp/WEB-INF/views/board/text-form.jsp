<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-05-28
  Time: 오후 7:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>
</head>
<body>
<div class="form-control" style="width: 400px">
    <form action="/board/save">
        <input type="text" name="mid" class="form-control" value="${sessionScope.logid}" hidden><br>
        <input type="text" name="btitle" class="form-control" placeholder="제목을 입력하세요."><br>
        <textarea name="btext" id="btext" class="form-control" cols="30" rows="5" placeholder="내용을 입력하세요."></textarea><br>
        <button class="btn btn-outline-secondary container" type="submit" >글 작성</button>
    </form>

</div>
</body>
</html>
