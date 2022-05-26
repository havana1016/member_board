<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 2:06
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
    <div class="form-control">
        <h2>회원가입</h2>
        <form action="save" method="post" enctype="multipart/form-data">
            <input class="form-control-lg" type="text" name="mid" placeholder="아이디 입력" autofocus><br>
            <input class="form-control-lg" type="text" name="mpw" id="mpw" placeholder="비밀번호 입력"><br>
            <input class="form-control-lg" type="text" id=repw placeholder="비밀번호 확인"><br>
            <input class="form-control-lg" type="text" name="mname" placeholder="이름 입력"><br>
            <input class="form-control-lg" type="text" name="mphone" placeholder="전화번호 입력"><br>
            <input class="form-control-lg" type="file" ><br>
            <input type="submit" value="가입하기">
            <input type="reset" value="다시시작">
        </form>
    </div>


</body>
</html>
