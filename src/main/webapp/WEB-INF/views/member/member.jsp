<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-31
  Time: 오후 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>

    <script>
        function del(cmid){

            $.ajax({
                url:"/member/admin",
                type:"get",
                data:{"mid":cmid},
                dataType:"text",
                success:function (e){
                    console.log("del success")
                    alert("삭제 완료")
                    location.href="/member/member"
                },
                error:function (e){
                    console.log("del error")

                }
            })
        }
    </script>


</head>
<body>
<table class="table table-bordered" style="width: 700px">
    <tr>
        <th>회원번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <td></td>
    </tr>
    <c:forEach var="c" items="${mlist}">
        <c:if test="${c.mid !='admin'}">
        <tr>
            <td>${c.id}</td>
            <td>${c.mid}</td>
            <td>${c.mname}</td>
            <td>${c.memail}</td>
            <td><button onclick="del('${c.mid}')">삭제</button></td>
        </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
