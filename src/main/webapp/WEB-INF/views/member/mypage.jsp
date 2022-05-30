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


</head>
<body>
<div class="form-control container " style="width: 500px; margin-top: 100px;">
    <table class="gray table ">
        <tr>
            <td rowspan="4" style="margin-right: 10px"><img src="${pageContext.request.contextPath}/upload/${mem.mfname}"
                                 alt="" height="200" width="200"></td>
            <th>Name</th>
            <td>${mem.mname}</td>
        </tr>
        <tr>
            <th>Id</th>
            <td>${mem.mid}</td>
        </tr>
        <tr>
            <th>E-mail</th>
            <td>${mem.memail}</td>

        </tr>
        <tr>
            <th>Mobile</th>
            <td>${mem.mphone}</td>

        </tr>

    </table>

    <div class="input-group mt-5 mb-4">
        <button class="btn btn-outline-secondary col-6" onclick="location.href='/member/pwc/?type=update&mid=${mem.mid}'">정보수정</button>
        <button class="btn btn-outline-secondary col-6" onclick="location.href='/member/pwc/?type=delete&mid=${mem.mid}'">회원탈퇴</button>
    </div>
</div>






</body>
</html>
