<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

    <title>Title</title>

    <style>
        .gray{
            color: gray;
            font-size: 15px;

        }
    </style>
    <script>










    </script>

</head>
<body>
<div class="form-control container " style="width: 700px; margin-top: 100px;">
    <form action="/member/update" method="post" class="mt-3">
    <table class="gray table ">
        <tr>

            <th>Name</th>
            <td>${sessionScope.logmem.mname}</td>
        </tr>
        <tr>
            <th>Id</th>
            <td>${sessionScope.logmem.mid}</td>
        </tr>
        <tr>
            <th>E-mail</th>
            <td><input class="form-control" type="text" name="memail" value=${mem.memail}></td>
        </tr>
        <tr>
            <th>Mobile</th>
            <td><input class="form-control" type="text" name="mphone" value=${mem.mphone}></td>
        </tr>
        <tr>
            <th>Password</th>
            <td><input class="form-control" type="password" name="mpw" value=${mem.mpw}></td>
        </tr>
    </table>
        <input type="text" name="mid" value=${mem.mid} hidden>
        <button class="btn btn-secondary container" type="submit">수정하기</button>
    </form>

</div>






</body>
</html>
