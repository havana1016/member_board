<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>
    <title>Title</title>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

    <style>
        .up{
            color: gray;
            font-size: 20px;
            margin-bottom: 5px;
        }
        h3{
          color: gray;
          text-align: center;
            margin-bottom: 15px;

        }
    </style>
</head>
<body>
<div class="form-control container col-4" style="width: 500px">
    <form action="update?bid=${mem.bid}" method="post">
        <h3>글 수정</h3>
        <p class="up">제목</p>
        <input type="text" class="form-control" name="btitle" value="${mem.btitle}"><br>
        <p class="up">내용</p>
        <textarea class="form-control" row="5" name="btext" id="btext">${mem.btext}</textarea><br>
        <input class="btn btn-outline-secondary" type="submit" value="수정하기">
    </form>
</div>

</body>
</html>
