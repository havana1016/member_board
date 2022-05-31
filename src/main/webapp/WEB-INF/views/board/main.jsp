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
   .gray{
       color: #5c636a;
       text-align: center;
   }


   .form-control:focus{
       border-color: #8c8f91;
       box-shadow: 0 0 0 0.2rem rgba(74, 74, 75, 0.5);
   }

   .form-select:focus{
       /*!*border-color:#86b7fe;*!*/
       /*border-color:gray;*/

       /*!*box-shadow:0 0 0 .25rem rgba(13,110,253,.25)*!*/
       /*box-shadow:0 0 0 .25rem rgba(13,110,253,.25)*/
       border-color: #8c8f91;
       box-shadow: 0 0 0 0.2rem rgba(74, 74, 75, 0.5);
   }
   body{
       /*/ background-color: darkgray;*/
       height: 100vh;
       background-image: url("https://img.wallpapersafari.com/desktop/1024/576/60/72/D3Zzgu.jpg");

       /*background-image: url("https://allhdwallpapers.com/wp-content/uploads/2018/03/Supreme-Wallpapers-desktop-and-mobile-HD-25.jpg");*/
       /*background-image: url("https://wallpapercave.com/wp/wp3904942.jpg");*/
       background-repeat : no-repeat;
       background-size : cover;
   }
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

<div id="blist" class=" container mt-5" style="padding: 30px;width: 1100px; height: 700px; background-color: white">

    <form class="input-group mt-3" action="/board/search" method="get">
<%--    <div class="input-group">--%>
        <select class="form-select gray" name="type" id="type">
            <option value="mid" class="gray">작성자</option>
            <option value="btitle" class="gray">제목</option>
        </select>

    <input type="text" class="form-control" name="search" id="search" placeholder="검색어 입력">
<%--        <button  class="input-group-text btn btn-outline-secondary" onclick="search()">검색</button>--%>
        <input type="submit" class="input-group-text btn btn-outline-secondary" value="검색"></input>
    </form>

    <table class="table table-bordered table-hover mt-5">
        <thead>
        <tr>
            <th class="col-2 gray">글번호</th>
            <th class="gray">제목</th>
            <th class="col-2 gray">작성자</th>
            <th class="col-2 gray">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="blist" items="${boardList}">
            <tr onclick=location.href="detail/?bid=${blist.bid}">
                <td class="gray">${blist.bid}</td>
                <td class="gray"  style="text-align: left" >${blist.btitle}</td>
                <td class="gray">${blist.mid}</td>
                <td class="gray">${blist.bhit}</td>

            </tr>
        </c:forEach>
        </tbody>
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
