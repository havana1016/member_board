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
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

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
        .gray{
            color: gray;
        }
    </style>
    <script>
        function delc(cid,bid){
            $.ajax({
                url:"/comment/delc",
                type:"get",
                data:{"cid":cid,"bid":bid},
                dataType:"text",
                success:function (e){
                    console.log("delc success")
                    location.href="/board/detail/?bid="+bid
                },
                error:function (e){
                    console.log("delc error")

                }
            })
        }
    </script>

</head>
<body>

<div class="form-control container mt-3" style="width: 700px">
    <c:if test="${mem.mid eq sessionScope.logid || sessionScope.logid=='admin'}" >
        <div class="input-group mt-3">
            <button class="btn btn-outline-secondary  col-6" onclick="location.href='/board/update?bid=${mem.bid}'">수정하기</button>
            <button class="btn btn-outline-secondary col-6" onclick="location.href='/board/delete?bid=${mem.bid}'">삭제하기</button>

        </div>
    </c:if>
    <table class="table table-bordered mt-5">
        <tr>
            <th class="center gray">제목</th>
            <td class="col-2 small">작성자</td>
            <td class="col-2 small">조회수</td>
        </tr>
        <tr>
            <td class="center gray">${mem.btitle} </td>
            <td class="col-2 small">${mem.mid}</td>
            <td class="col-2 small">${mem.bhit}</td>
        </tr>
        <tr>
            <th colspan="3" class="gray" style="text-align: center;" >내용</th>
        </tr>
        <tr>
            <td class="gray" colspan="3">${mem.btext}</td>
        </tr>
        <tr>
        <td colspan="3" style="margin-right: 10px"><img src="${pageContext.request.contextPath}/upload/${mem.bfname}"
                                                        alt="" width="300"></td></tr>
    </table>
    <div>
        <table class="table mt-5">
            <c:forEach var="c" items="${clist}">
                       <tr>
                <td class="gray">${c.mid}</td>
                <td class="gray">${c.ctext}</td>
                <c:if test="${c.mid eq sessionScope.logid}">
                    <td class="gray col-2"><button class="btn btn-outline-secondary" onclick="delc('${c.cid}','${c.bid}')">삭제</button></td>
                </c:if>
                <c:if test="${c.mid != sessionScope.logid}">
                    <td class="gray col-2"></td>
                </c:if>
            </tr>
            </c:forEach>
        </table>
    <c:if test="${sessionScope.logid!=null}">
        <div class="mt-3">
            <form action="/comment/save" method="get">
                <input type="text" name="mid" value="${sessionScope.logid}" hidden>
                <input type="text" name="bid" value="${mem.bid}" hidden>
                <div class="input-group mt-4">
                <textarea class="form-control input-group gray" name="ctext" placeholder="댓글을 작성해주세요."></textarea>
                <input type="submit" class="input-group-text btn btn-outline-secondary gray" value="작성">
                </div>
            </form>

        </div>
    </c:if>

    </div>


</div>
</body>
</html>
