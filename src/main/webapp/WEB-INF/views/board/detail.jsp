<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-05-29
  Time: 오후 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>
    <style>
        .small{
            color: gray;
            font-size: 15px;
            text-align: center;

        }
        .center{
            text-align: center;
        }
    </style>
</head>
<body>
제목 내용 조회수 작성자
<div class="form-control" style="width: 500px">
    <table class="table table-bordered mt-3">
        <tr>
            <th class="center">제목</th>
            <td class="col-2 small">작성자</td>
            <td class="col-2 small">조회수</td>
        </tr>
        <tr>
            <td class="center">${mem.btitle} </td>
            <td class="col-2 small">${mem.mid}</td>
            <td class="col-2 small">${mem.bhit}</td>
        </tr>
        <tr>
            <th colspan="3" style="text-align: center;" >내용</th>
        </tr>
        <tr>
            <td colspan="3">${mem.btext}</td>
        </tr>

    </table>
    <c:if test="${mem.mid eq sessionScope.logid}" >
        <div>
            <button class="btn btn-outline-secondary">수정하기</button>
            <button class="btn btn-outline-secondary">삭제하기</button>

        </div>
    </c:if>
    ${sessionScope.logid}



</div>
</body>
</html>
