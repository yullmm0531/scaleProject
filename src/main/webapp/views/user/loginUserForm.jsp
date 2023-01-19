<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
        font-family: 'Noto Sans KR', sans-serif;
        width:1200px;
        min-width:650px;
        margin:auto;
        margin-top:100px;
        margin-bottom:70px;
    }
    .login-wrapper{
        width:25%;
        margin:auto;
        margin-top:50px;
    }
    .login-wrapper>img{
        width:60%;
        margin:30px;
    }
    #login-form>input, #login-form>button{
        width:100%;
        height:48px;
        box-sizing:border-box;
        margin-bottom:20px;
        border-radius:6px;
        border:none;
        font-size:15px;
    }
    #login-form>input{
        padding-left:23px;
        outline:none;
        background:#f7f7f7;
    }
    #login-form>input::placeholder{
        font-weight:400;
        color:darkgray;
    }
    #login-form>button{
        margin-top:3px;
        font-weight:900;
        background:#0c033d;
        color:#ffff;
    }
    .login-util-wrap{
        margin:10px;
        text-align:center;
    }
    #login-util>a{
        margin:20px;
        text-decoration:none;
        color:black;
        font-size:13px;
        font-weight:500;
    }
    #login-util>p{
        margin-top:35px;
        color:rgb(166, 166, 166);
        font-size:12px;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class=".outer">
        <div class="login-wrapper" align="center">
        <img src="<%=contextPath%>/resources/images/logo_navy.png">
            <form action="/login.us" method="post" id="login-form">
                <input type="text" name="userId" placeholder="아이디" required>
                <input type="password" name="userPwd" placeholder="비밀번호" required>
                <br>
                <button type="submit">로그인</button>
                
                <div class="login-util-wrap">
                    <div id="login-util">
                        <a href="">회원가입</a> 
                        <a href="">아이디찾기</a> 
                        <a href="">비밀번호찾기</a>
                        <p>Copyright © Scale Corp. All Rights Reserved.</p>
                    <div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>