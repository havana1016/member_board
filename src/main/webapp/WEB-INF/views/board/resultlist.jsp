<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>Title</title>

    <style>
        /*body{*/
        /*    text-align: center;*/
        /*}*/
    </style>
    <script>

    </script>
</head>

<body>

<div id="blist" class="form-control" style="width: 600px">

    <form class="input-group" action="/board/search" method="get">
        <%--    <div class="input-group">--%>
        <select class="form-select " name="type" id="type">
            <option value="mid">작성자</option>
            <option value="btitle">제목</option>
        </select>

        <input type="text" class="form-control" name="search" id="search" placeholder="검색어 입력">
        <%--        <button  class="input-group-text btn btn-outline-secondary" onclick="search()">검색</button>--%>
        <input type="submit" class="input-group-text btn btn-outline-secondary" value="검색"></input>
    </form>

    <table class="table table-bordered table-hover mt-4">
        <tr style="background-color:rgba(0,0,0,0.1)">
            <th class="col-2">글번호</th>
            <th style="text-align: left">제목</th>
            <th class="col-2">작성자</th>
            <th class="col-2">조회수</th>
        </tr>
        <c:forEach var="b" items="${blist}">
            <tr onclick=location.href="detail/?bid=${b.bid}">
                <td>${b.bid}</td>
                <td>${b.btitle}</td>
                <td>${b.mid}</td>
                <td>${b.bhit}</td>

            </tr>
        </c:forEach>
    </table>
    <c:if test="${sessionScope.logid!=null}">
        <button class="btn btn-outline-secondary" onclick="location.href='/board/text-form'">글쓰기</button><br>
    </c:if>
    <%--</div>--%>




</div>



</body>
</html>
