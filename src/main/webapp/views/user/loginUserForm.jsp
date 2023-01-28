<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	
    div{box-sizing:border-box;}
    .outer{
        width:1200px;
        margin:auto;
        margin-top:50px;
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
    #utilities-area{height:25%;}

    /*logo*/
    #logo-area{
        position:relative;
    }
    #logo-area>img{
        width:50%;
        margin:auto;
        position:absolute;
        top:0;
        bottom:0;
        left:0;
        right:0;
    }

    /* input */
    #input-area{padding:20px 10px;}
    #userId, #userPwd{
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
    #login-util-area>a{
        margin:20px;
        text-decoration:none;
        color:black;
        font-size:13px;
        font-weight:500;
    }
    #login-util-area>p{
        margin-top:25px;
        color:rgb(166, 166, 166);
        font-size:12px;
    }
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div class="outer" align="center">
        <div class="login-wrapper">
            <div id="logo-area">
                <img src="<%=contextPath%>/resources/images/logo_black.png">
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
                <a href="<%=contextPath%>/join.us">회원가입</a>
                <a href="<%=contextPath%>/findIdForm.us">아이디찾기</a>
                <a href="<%=contextPath%>/findPwdForm.us">비밀번호찾기</a>
                <br><br>
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
                url:"<%=contextPath%>/login.us",
                data:{userId:$("#userId").val(), userPwd:$("#userPwd").val()},
                success:function(loginUser){
                    if(loginUser == null){
                        $("#validateMsg").css("visibility", "visible")
                    }else{
                        location.href = "<%=contextPath%>";
                    }
                }, error:function(){
                    console.log("로그인 통신 실패")
                }
            })
        }
    </script>
</body>
</html>