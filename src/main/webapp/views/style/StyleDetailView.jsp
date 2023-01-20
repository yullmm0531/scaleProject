<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            /* border: 1px solid black; */
            width:400px;
            margin: auto; 
            margin-top: 50px;
        }
        table{width: 400px; box-sizing: border-box;}

        .profile{width: 40px; height: 70px;}
        .profile>img{width: 40px; height: 40px;}

        .n-d>div{margin-left: 10px;}
        .nickname{font-size: 20px; font-weight: bold;}
        .date{font-size: 12px;}
        .report{text-align: right;}

        .style-img>img{width: 400px; height: 400px;}
        
        .pd-tag{font-size: 20px; font-weight: bold;}
        .pd-img{float: left; width: 70px;}
        .pd-img>img{width: 60px; height: 60px;}
        .pd-img>div{width: 100px; font-size: 12px;}

        .like{font-size: 15px;}
        .like>span{margin-left: 10px;}
    </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <table>
            <tr>
                <td class="profile">
                    <img src="resource/img/city1.jpg" class="rounded-circle">
                </td>
                <td class="n-d">
                    <div class="nickname">닉네임</div>
                    <div class="date">작성일</div>
                </td>
                <td class="report">
                    <button type="button">!</button>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="style-img">
                    <img src="resource/img/city1.jpg">
                </td>
            </tr>
            <tr>
                <td colspan="3" class="pd-tag">상품태그</td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="pd-img">
                        <img src="resource/img/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="resource/img/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="resource/img/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="resource/img/city1.jpg">
                        <div>상품정보</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="like">😊<span>좋아요 100개</span></td>
            </tr>
            <tr>
                <td colspan="3">
                    <div>올블랙 최고~! #결산템챌린지 #셋업코디</div>
                </td>
            </tr>
        </table>
        <br>
        <table>
            <tr>
                <td class="profile">
                    <img src="resource/img/city1.jpg" class="rounded-circle">
                </td>
                <td class="n-d">
                    <div class="nickname">닉네임</div>
                    <div class="date">작성일</div>
                </td>
                <td class="report">
                    <button type="button">!</button>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="style-img">
                    <img src="resource/img/city1.jpg">
                </td>
            </tr>
            <tr>
                <td colspan="3" class="pd-tag">상품태그</td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="pd-img">
                        <img src="resource/img/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="resource/img/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="resource/img/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="resource/img/city1.jpg">
                        <div>상품정보</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="like">😊<span>좋아요 100개</span></td>
            </tr>
            <tr>
                <td colspan="3">
                    <div>올블랙 최고~! #결산템챌린지 #셋업코디</div>
                </td>
            </tr>
        </table>
    </div>
	

</body>
</html>