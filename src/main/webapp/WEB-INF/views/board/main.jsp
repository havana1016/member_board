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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <title>Title</title>

<style>
    /*body{*/
    /*    text-align: center;*/
    /*}*/
</style>
    <script>
        function search(){
            let search=document.getElementById("search").value;
            let type=document.getElementById("type").value;
            $.ajax({
                url:"/board/search",
                type:"get",
                data:{"search":search,"type":type},
                dataType:"json",
                success:function (e){
                    console.log("success")
                    console.log(${blist})



                },
                error:function (e){
                    console.log("error")
                }

            })
        }
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
        <c:forEach var="blist" items="${boardList}">
            <tr onclick=location.href="detail/?bid=${blist.bid}">
                <td>${blist.bid}</td>
                <td>${blist.btitle}</td>
                <td>${blist.mid}</td>
                <td>${blist.bhit}</td>

            </tr>
        </c:forEach>
    </table>
    <c:if test="${sessionScope.logid!=null}">
<button class="btn btn-outline-secondary" onclick="location.href='/board/text-form'">글쓰기</button><br>
    </c:if>
<%--</div>--%>



<%--<div class="container">--%>
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>

            <%--            1페이지가 아닌 경우에는 [이전]을 클릭하면 현제 페이지보다 1작은 페이지 요청--%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/findall?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%--                요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게--%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/findall?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/findall?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>



</body>
</html>
