<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="\resources\js\jquery.js"></script>

    <style>
        body{
            /*/ background-color: darkgray;*/
            height: 100vh;
            background-image: url("https://wallpapercave.com/wp/wp4415444.jpg");

            /*background-image: url("https://allhdwallpapers.com/wp-content/uploads/2018/03/Supreme-Wallpapers-desktop-and-mobile-HD-18.jpg");*/
            /*background-image: url("https://wallpapercave.com/wp/wp3904942.jpg");*/
            background-repeat : no-repeat;
            background-size : cover;
        }
        .form-control:focus {
            border-color: #8c8f91;
            box-shadow: 0 0 0 0.2rem rgba(74, 74, 75, 0.25);
        }

        .uptext {
            font-size: 12px;
            text-align: left;
            margin-top: 5px;
            margin-bottom: 15px;
            font-family: 'Noto Sans Korean', sans-serif;
            color: gray;
        }
        .uptext1 {
            font-size: 12px;
            text-align: left;
            margin-top: 5px;
            /*margin-bottom: 15px;*/
            font-family: 'Noto Sans Korean', sans-serif;
            color: gray;
        }
        .item {
            margin-top: 10px;
        }
        .gray{
            color: gray;
        }

    </style>


    <script>
        function upid() {
            document.getElementById("up-id").innerHTML = "영문 소문자,숫자 8~20자"
        }
        function uppw() {
            document.getElementById("up-pw").innerHTML = "영문 소문자, 숫자, 1개 이상의 특수문자 8~15자"
        }
        function uprepw() {
            document.getElementById("up-repw").innerHTML = "입력하신 비밀번호와 똑같이 입력해주세요."
        }
        function upname() {
            document.getElementById("up-name").innerHTML = "한글 2~15자"
        }
        function upphone() {
            document.getElementById("up-phone").innerHTML = "-(하이픈) 제외하고 입력해주세요."
        }
        function upemail() {
            document.getElementById("up-email").innerHTML = "이메일 주소 양식을 지켜주세요."
        }

        function idc() {
            let inputid = document.getElementById("mid");
            let id = document.getElementById("mid").value;
            let upid = document.getElementById("up-id")
            let next = document.getElementById("mpw");
            let next1 = document.getElementById("repw");
            const exp = /^(?=.*[a-z])(?=.*[\d])[a-z \d]{8,20}$/
            if (id.length == 0) {
                upid.innerHTML = "필수 정보입니다."
                upid.style.color = "red"
                inputid.className = ("form-control is-invalid")
                next.setAttribute("disabled","disabled")
                next1.setAttribute("disabled","disabled")
            } else if (id.length == undefined) {

                upid.innerHTML = "영문 소문자,숫자 8~20자"
            } else {


                if (id.match(exp)) {
                    // inputid.className = ("form-control is-valid")
                    //
                    // upid.innerHTML = "사용가능한 아이디입니다."
                    // upid.style.color = "green"
                    // next.removeAttribute("disabled")
                    // next1.removeAttribute("disabled")
                    idck();
                } else if (!id.match(exp)) {
                    inputid.className = ("form-control is-invalid")

                    upid.innerHTML = "영문 소문자,숫자 8~20자"
                    upid.style.color = "red"
                    next.setAttribute("disabled","disabled")
                    next1.setAttribute("disabled","disabled")
                }
            }
        }

        function pwc() {
            let inputid = document.getElementById("mpw");
            let id = document.getElementById("mpw").value;
            let upid = document.getElementById("up-pw")

            const exp = /^(?=.*[a-z])(?=.*[\d])(?=.*[! @ # $ % ^ & * - _])[a-z \d ! @ # $ % ^ & * - _]{8,15}$/
            if (id.length == 0) {
                upid.innerHTML = "필수 정보입니다."
                upid.style.color = "red"
                inputid.className = ("form-control is-invalid")

            }


            else if (id.match(exp)) {
                inputid.className = ("form-control is-valid")

                upid.innerHTML = "사용가능한 비밀번호입니다."
                upid.style.color = "green"

            } else if (!id.match(exp)) {
                inputid.className = ("form-control is-invalid")

                upid.innerHTML = "영문소문자,숫자,1개 이상의 특수문자 8~15자"
                upid.style.color = "red"

            }
        }

        function repwc() {
            let inputid = document.getElementById("repw");
            let id = document.getElementById("repw").value;
            let pw = document.getElementById("mpw").value;
            let upid = document.getElementById("up-repw")
            let next=document.getElementById("mname")
            if (pw.length == 0) {

                resetrepw();
                upid.innerHTML = "먼저 윗칸의 비밀번호를 입력해주세요."
                upid.style.color = "red"
                inputid.className = ("form-control is-invalid")
                next.setAttribute("disabled","disabled")

            } else {
                if (id.length == 0) {
                    upid.innerHTML = "필수 정보입니다."
                    upid.style.color = "red"
                    inputid.className = ("form-control is-invalid")
                    next.setAttribute("disabled","disabled")
                }


                else if (id === pw) {
                    inputid.className = ("form-control is-valid")

                    upid.innerHTML = "비밀번호가 일치합니다."
                    upid.style.color = "green"
                    next.removeAttribute("disabled")
                } else if (id != pw) {
                    inputid.className = ("form-control is-invalid")

                    upid.innerHTML = "비밀번호가 일치하지 않습니다."
                    upid.style.color = "red"
                    next.setAttribute("disabled","disabled")
                }
            }
        }


        function namec() {
            let inputid = document.getElementById("mname");
            let id = document.getElementById("mname").value;
            let upid = document.getElementById("up-name")
            let next=document.getElementById("memail")
            const exp = /^(?=.*[ㄱ-ㅎㅏ-ㅣ가-힣])[ㄱ-ㅎㅏ-ㅣ가-힣]{2,15}$/
            if (id.length == 0) {
                upid.innerHTML = "필수 정보입니다."
                upid.style.color = "red"
                inputid.className = ("form-control is-invalid")
                next.setAttribute("disabled","disabled")
            }
            else if (id.match(exp)) {
                upid.innerHTML = "사용가능한 이름입니다."
                upid.style.color = "green"
                inputid.className = ("form-control is-valid")
                next.removeAttribute("disabled")
            } else if (!id.match(exp)) {
                upid.innerHTML = "한글 2~15자"
                upid.style.color = "red"
                inputid.className = ("form-control is-invalid")
                next.setAttribute("disabled","disabled")
            }
        }


        function mailc() {
            let inputid = document.getElementById("memail");
            let id = document.getElementById("memail").value;
            let upid = document.getElementById("up-email")
            let next=document.getElementById("mphone")
            //const exp = /^(?=.*[a-z]|[A-Z])[a-z A-Z \d !  # $ % ^ & * - _]{4,20}$/
            const exp = /\w+@\w+\.\w+(\.\w+)?/;
           // var exp = /^(?:|(01[0|1|6|7|8|9]))$/;

            if (id.length == 0) {
                upid.innerHTML = "필수 정보입니다."
                upid.style.color = "red"
                inputid.className = ("form-control is-invalid")
                next.setAttribute("disabled","disabled")

            }


            else if (id.match(exp)) {
                inputid.className = ("form-control is-valid")

                upid.innerHTML = "사용가능한 이메일 이름 입니다."
                upid.style.color = "green"
                next.removeAttribute("disabled")
            } else if (!id.match(exp)) {
                inputid.className = ("form-control is-invalid")


                upid.innerHTML = "잘못된 이메일 양식입니다."
                upid.style.color = "red"
                next.setAttribute("disabled","disabled")
            }
        }

        function telc() {
            let inputid = document.getElementById("mphone");
            let id = inputid.value;
            let upid = document.getElementById("up-phone")
            let next=document.getElementById("sub")
            //var exp = /^(?:|(01[0|1|6|7|8|9]))\[2-9]{1}[\d]{3}\$/;
            let exp = /^01(?:0|1|[0|6-9])(?:\d{3}|\d{4})\d{4}$/;


            if(id.length==0){
                inputid.className = ("form-control is-invalid")
                upid.innerHTML = "필수 입력입니다."
                upid.style.color = "red"
                next.setAttribute("disabled","disabled")
            }else{


                if (id.match(exp)) {
                    inputid.className = ("form-control is-valid")
                    upid.style.color = "green"
                    upid.innerHTML = "사용가능한 휴대폰 번호입니다."
                    next.removeAttribute("disabled")


                } else if (!id.match(exp)) {
                    inputid.className = ("form-control is-invalid")
                    upid.innerHTML = "잘못된 형식입니다."
                    upid.style.color = "red"
                    next.setAttribute("disabled","disabled")
                }}}

        function resetrepw() {
            let inputid = document.getElementById("repw");
            let id = document.getElementById("repw").value;
            let pw = document.getElementById("mpw").value;
            let upid = document.getElementById("up-repw")

            if (pw.length == 0) {
                upid.innerHTML = ""
                inputid.className = ("form-control")
                inputid.value = "";

            }
        }

        function re(){
            location.href="save-form"
        }

        function idck(){
            let midv=document.getElementById("mid").value;
            let mid=document.getElementById("mid");
            let upid=document.getElementById("up-id");
            let next=document.getElementById("mpw");
            let next1=document.getElementById("repw");
            console.log("idck호출 : "+midv);
            $.ajax({
                url:"/member/findid",
                type:"get",
                data:{"mid":midv},
                dataType:"text",
                success:function (e){
                    if(e=="no"){

                    console.log("ajax e: "+e);
                    upid.innerHTML="사용중인 아이디입니다."
                    mid.className = ("form-control is-invalid")
                    upid.style.color = "red"
                    next.setAttribute("disabled","disabled")
                    next1.setAttribute("disabled","disabled")}else{

                        upid.innerHTML = "사용가능한 아이디입니다."
                        upid.style.color = "green"
                        mid.className = ("form-control is-valid")
                        next.removeAttribute("disabled")
                        next1.removeAttribute("disabled");
                    }
                },
                error:function (e){
                    //
                    alert("ajax호출 error")
                    // upid.innerHTML = "사용가능한 아이디입니다."
                    // upid.style.color = "green"
                    // next.removeAttribute("disabled")
                    // next1.removeAttribute("disabled");
                    // next.removeAttribute("disabled")
                    // next1.removeAttribute("disabled")
                }
            })
        }
    </script>

</head>
<body>
    <div class="container mt-3" style="padding: 30px;width: 500px;background-color: rgba(253,253,253,0.8);" >
        <h2 class="gray" style="text-align: right"><i class="bi bi-gem"></i>&nbsp;&nbsp;Join us</h2>
        <form action="/member/save" method="post" enctype="multipart/form-data">
            <div class="item row g-1">
            <input  class="form-control" type="text" id="mid" name="mid" placeholder="아이디 입력" autofocus onclick="upid()" onkeyup="" onblur="idc(),idck()"><br>
            <p class="uptext" id="up-id"></p>
            </div>
            <div class="item row g-1">
            <input disabled="disabled" class="form-control" type="text" name="mpw" id="mpw" placeholder="비밀번호 입력" onclick="uppw()" onkeyup="pwc()" onblur="pwc()"><br>
            <p class="uptext" id="up-pw"></p>
            </div>
                <div class="item row g-1">
            <input disabled="disabled" class="form-control" type="text" id=repw placeholder="비밀번호 확인" onclick="uprepw()" onkeyup="repwc()" onblur="resetrepw(),repwc()"><br>
            <p class="uptext" id="up-repw"></p>
                </div>
                    <div class="item row g-1">
            <input disabled="disabled" class="form-control" type="text" id="mname" name="mname" placeholder="이름 입력" onclick="upname()" onkeyup="namec()" onblur="namec()"><br>
            <p class="uptext" id="up-name"></p>
                    </div>
                        <div class="item row g-1">
            <input disabled="disabled" class="form-control" type="text" id="memail" name="memail" placeholder="이메일 입력" onclick="upemail()" onkeyup="mailc()" onblur="mailc()"><br>
            <p class="uptext" id="up-email"></p>
                        </div>
                            <div class="item row g-1">
            <input disabled="disabled" class="form-control" type="text" name="mphone" id="mphone" placeholder="전화번호 입력" onclick="upphone()" onkeyup="telc()" onblur="telc()"><br>
            <p class="uptext" id="up-phone"></p>
                            </div>
                                <div class="item row g-1">
                                    <p class="uptext1">프로필 사진을 등록해주세요.(선택사항)</p>
                                    <input class="form-control" type="file" name="mf">
                                </div><br><br>
            <div>
            <input class="btn btn-outline-secondary input-group" id="sub" type="submit" value="가입하기" disabled="disabled">
            </div>
        </form>
        <button class="btn btn-secondary input-group" onclick="re()">취소</button>
    </div>


</body>
</html>
