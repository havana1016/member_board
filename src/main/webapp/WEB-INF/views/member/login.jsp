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
        body{
            /*/ background-color: darkgray;*/
            height: 100vh;
            background-image: url("https://images.unsplash.com/photo-1537247090800-2b3e9a940946?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80");
            background-repeat : no-repeat;
            background-size : cover;
        }
    </style>
</head>
<body>
    <div class="container " style="background-color: rgba(253,253,253,0.8); margin-top:200px; width: 400px;padding: 30px">
        <h2 class="gray"><i class="bi bi-gem"></i></h2>
            <div>
            <p class="ltext">ID</p>
            <input type="text" class="form-control gray" name="mid" id="mid" onclick="reset()" placeholder="아이디를 입력하세요.">
            </div>
            <div>
            <p class="ltext">Password</p>
            <input type="text" class="form-control gray" name="mpw" id="mpw" onclick="reset()" placeholder="비밀번호를 입력하세요.">
            </div>
            <div class="row">
                <p id="upresult" class="up"></p>
            <button class="btn btn-secondary mt-2 container col-4" onclick="logc()" onblur=>로그인</button>
            </div>
    </div>
</body>
<script>
    function logc(){
        let mid=document.getElementById("mid").value;
        let mpw=document.getElementById("mpw").value;

        $.ajax({
            url:"logc",
            type:"post",
            data:{"mid":mid,"mpw":mpw},
            dataType:"json",
            success:function (e){
                console.log("logc ajax success");
                location.href="/board/findall"



            },
            error:function (e){
                console.log("logc ajax error");
                let logc=document.getElementById("upresult");

                logc.innerHTML="아이디 또는 비밀번호를 확인하세요.";
                logc.style.color="red";
            }
        })
    }

    function reset(){
        location.href="/member/login"
    }
    function reset(){
        document.getElementById("upresult").innerHTML="";
    }


</script>
</html>
