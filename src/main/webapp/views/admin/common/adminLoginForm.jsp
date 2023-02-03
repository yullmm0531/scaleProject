<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	
    div{box-sizing:border-box;}
    .outer{
        width:1200px;
        margin:auto;
        margin-top:150px;
        margin-bottom:70px;
    }
    /* area */
    .login-wrapper{
        width:500px;
        height:500px;
        margin:auto;
        padding:30px;
    }
    #logo-area{height:20%;}
    #input-area{height:35%;}
    #button-area{height:15%;}
    #login-util-area{height:25%;}

    /*logo*/
    #logo-area>div{
        display:inline-block;
    } 

    /* input */
    #input-area{padding:20px 10px;}
    #input-area>input{
        box-sizing:border-box;
        width:100%;
        height:48px;
        margin-bottom:20px;
        border-radius:6px;
        border:none;
        outline:none;
        font-size:15px;
        padding-left:23px;
        background:#f7f7f7;
    }
    ::placeholder{
        font-weight:400;
        color:darkgray;
    }

    /* validate */
    #validateMsg{
        color:red;
        font-size:12px;
        margin-bottom:5px;
        visibility:hidden;
    }
    /* login-btn */
    #button-area{padding:10px;}
    #login-btn{
        width:100%;
        height:48px;
        border-radius:6px;
        border:none;
        font-size:15px;
        font-weight:600;
        color:white;
        background:black;
    }
    #login-btn:disabled{
        background:lightgray;
    }
    #login-btn:hover:enabled{
        background:rgb(37, 37, 37);
    }

    /* etc-area */
    #login-util-area{padding:10px;}
    #login-util-area>p{
        margin-top:25px;
        color:rgb(166, 166, 166);
        font-size:12px;
    }
</style>
</head>
<body>
    <div class="outer" align="center">
        <div class="login-wrapper">
            <div id="logo-area">
                <h1>SCALE 관리자</h1>
            </div>
            <div id="input-area">
                <input type="text" id="userId" placeholder="아이디" required>
                <input type="password" id="userPwd" placeholder="비밀번호" required>
            </div>
            <div id="validateMsg">
                일치하는 회원정보가 없습니다. 다시 시도해주세요.
            </div>
            <div id="button-area">
                <button type="button" id="login-btn" disabled onclick="login();">로그인</button>
            </div>
            <div id="login-util-area">
                <p>Copyright © Scale Corp. All Rights Reserved.</p>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            let e = $("input").keypress();
            function enableBtn(e){
                if($("#userId").val() == "" || $("#userPwd").val() == ""){
                    $("#login-btn").attr("disabled", true);
                }else{
                    $("#login-btn").attr("disabled", false);
                    if(e.keyCode==13){
                        login();
                    }
                }
            }
            $("input").on({"keyup":enableBtn, "change":enableBtn});
        })
    </script>

    <script>
        function login(){
            
            $.ajax({
                url:"<%=request.getContextPath()%>/login.ad",
                data:{userId:$("#userId").val(), userPwd:$("#userPwd").val()},
                success:function(adminUser){
                    if(adminUser == null){
                        $("#validateMsg").css("visibility", "visible")
                    }else{
                        location.href = "<%=request.getContextPath()%>/noticeList.ad?cpage=1";
                    }
                }, error:function(){
                    console.log("로그인 통신 실패")
                }
            })
        }
    </script>
</body>
	
</body>
</html>