<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-29
  Time: 오후 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>Title</title>
</head>
<body>
<%--<nav class="navbar navbar-dark bg-dark">--%>
<%--    <!-- Navbar content -->--%>

<%--    <li class="nav-item">--%>
<%--        <a class="nav-link active" aria-current="page" href="/">Home</a>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="#">Link</a>--%>
<%--    </li>--%>
<%--    <c:if test="${sessionScope.logid!=null}">--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link" href="/member/logout">Logout</a>--%>
<%--    </li>--%>
<%--    </c:if>--%>

<%--</nav>--%>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">&nbsp;&nbsp;<i class="bi bi-gem"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
               <c:if test="${sessionScope.logid==null}">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/member/save-form">Join Us</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/member/login">LogIn</a>
                </li></c:if>
                <li class="nav-item">
                    <a class="nav-link" href="/board/findall">Board</a>
                </li>
                <c:if test="${sessionScope.logid!=null && sessionScope.logid!='admin'}">
                <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/member/mypage/?mid=${sessionScope.logid}">My Page</a>
                </li>
                </c:if>
                <c:if test="${sessionScope.logid!=null && sessionScope.logid=='admin'}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/member/member">회원목록</a>
                    </li>
                </c:if>
            </ul>
            <span class="navbar-text">
            <c:if test="${sessionScope.logid!=null}">
                 <a class="nav-link" href="/member/logout">Logout</a>
            </c:if>
      </span>
        </div>
    </div>
</nav>





</body>
</html>
