<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <style>
        .ltext{
            margin-top: 20px;
            margin-bottom: 8px;
            color: gray;
        }

        .form-control:focus{
            border-color: #8c8f91;
            box-shadow: 0 0 0 0.2rem rgba(74, 74, 75, 0.5);
        }
        .up{
            font-size: small;
        }
        .gray{
            color:gray;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="form-control container " style=" margin-top:200px; width: 400px">
    <h2 class="gray mt-2"><i class="bi bi-gem"></i></h2>
        <div>
        <p class="ltext mb-1">Password</p>
        <input type="text" class="form-control gray" name="mpw" id="mpw" onclick="reset()" placeholder="비밀번호를 입력하세요.">
    </div>
    <div class="row">
        <p id="upresult" class="up"></p>
        <button class="btn btn-secondary mb-2 container col-4" onclick="pwc()">확인하기</button>
    </div>
</div>
</body>
<script>
    function pwc(){
        let mpw=document.getElementById("mpw").value;
        let logc=document.getElementById("upresult");
        let logmpw='${mem.mpw}'
        console.log("mpw : "+mpw)
        console.log("logmpw : "+logmpw)
            if (logmpw===mpw){
                location.href="/member/${type}/?mid=${mem.mid}"
            } else{
                logc.innerHTML="비밀번호를 확인하세요.";
                logc.style.color="red";}

    }
    function reset(){
        document.getElementById("mpw").focus()
    }




</script>
</html>
