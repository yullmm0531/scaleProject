<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #thumb_img{
        width: 50%;
        height: 50%;
        border-radius: 100%;
        border-top-left-radius: 100%;
        border-top-right-radius: 100%;
        border-bottom-right-radius: 100%;
        border-bottom-left-radius: 100%;

        border: 0;
border-top-width: 0px;
border-right-width: 0px;
border-bottom-width: 0px;
border-left-width: 0px;
border-top-style: initial;
border-right-style: initial;
border-bottom-style: initial;
border-left-style: initial;
border-top-color: initial;
border-right-color: initial;
border-bottom-color: initial;
border-left-color: initial;
border-image-source: initial;
border-image-slice: initial;
border-image-width: initial;
border-image-outset: initial;
border-image-repeat: initial;

box-sizing: border-box;
    }
    .user_detail{
        border: 1px solid blue;
        width: 1000px;
        height: 200px;
        margin-left: 30%;
    }
    .user_thumb{
        border: 1px solid white;
        width: 20%;
        height: 80%;
        float: left;
        margin-top: 1.9%;
        margin-left: 1%;
    }
    #thumb_img{width: 100%; height: 100%;}
    .user_info{
        border: 1px solid gray;
        width:  70%;
        height: 100%;
    }
    .info_box{width: 50%;
              margin-left: 15%;
              margin-top: 5%;
    }
    #toProfile{background-color: gray;}
    #toMyStyle{background-color: gray;}
    #pwd-box{border: 1px solid yellow;width: 800px; margin-left: 30%;}
    #pwdBox-title-div{margin-left: auto;}
    #edit-pwd{margin-left: 73%; background-color: gray;}

    #user-info{border: 3px solid black;width: 800px; margin-left: 30%;}
    #info-title{margin-left: auto;}
    .tag{margin-left: 5%;}
    .info-main{margin-left: 5%;}
    .box{border: 1px solid red;}
    #edit-phone{margin-left: 73%; background-color: gray;}
    #edit-email{margin-left: 73%; background-color: gray;}
    #user-leave-div{border: 3px solid blue;width: 800px; margin-left: 30%;}
    #user-leave{margin-left: 73%; background-color: red; color: white;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<% 
		String userId = loginUser.getUserId(); 
		String userEmail = loginUser.getEmail();
	%>

    <div class="userMembership">

        <div class="user_detail">
            <div class="user_thumb">
                <img src="resources/111500268.2.jpg" alt="사용자이미지" id="thumb_img">
                
            </div>
            <div class="user_info">
                <div class="info_box" align="center">
                    <p class="name"><%= userId %></p>
                    <p class="email"><%=userEmail %></p>
                    <a href="" class="btn btn outlinegrey small" type="button" id="toProfile">프로필 편집</a>
                    <a href="" class="btn btn btn_my_style outlinegrey small" type="button" id="toMyStyle">내 스타일</a>
                </div>
            </div>
        </div>
        <br><br>

        <div id="pwd-box">
            <div id="pwdBox-title-div">
                <h4 id="pwd-title">로그인 정보</h4>
            </div>
            <br><br>
            <div id="edit-pwd-div">
                <a href="" class="btn btn outlinegrey small" type="button" id="edit-pwd">비밀번호 변경</a>
            </div>
        </div>
        <br><br>

        <div id="user-info">
            <div id="user-info-title-div">
                <h4 id="info-title">개인정보</h4>
            </div>
            <br>

            <div id="user-name-box" class="box">
                <div id="name-tag" class="tag">
                    <p>이름</p>
                </div>
                <div id="user-name-div" class="info-main">
                    <span id="user-name">홍길동</span>
                </div>
            </div>
            <br>

            <div id="user-phone-box"class="box">
                <div id="phone-tag" class="tag">
                    <p>연락처</p>
                </div>
                <div id="user-phone-div"class="info-main">
                    <span id="user-phone">010-1111-2222</span>
                </div>
                <div id="edit-phone-div">
                    <a href="" class="btn btn outlinegrey small" type="button" id="edit-phone">연락처 변경</a>
                </div>
            </div>
            <br>

            <div id="user-email-box"class="box">
                <div id="email-tag" class="tag">
                    <p>이메일</p>
                </div>
                <div id="user-email-div"class="info-main">
                    <span id="user-email">aaabbb@naver.com</span>
                </div>
                <div id="edit-email-div">
                    <a href="" class="btn btn outlinegrey small" type="button" id="edit-email">이메일 변경</a>
                </div>
            </div>
        </div>
        <br>

        <div id="user-leave-div">
            <a href="" class="btn btn outlinegrey small" type="button" id="user-leave">회원탈퇴</a>
        </div>
</body>
</html>