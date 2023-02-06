<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
    }
    #btn{width: 1200px;}
    #btn1{width: 600px;}
    #btn2{width: 600px; text-align: right;}

    #report{
        width: 1200px; 
        border: 1px solid black;
        text-align: center;
    }
    
    #title, #user>td{height: 50px; font-weight: bold;}
    #title{font-size: 17px;}
        
    #content{height: 350px; padding-left: 50px; }
    #content>div{
        width: 1100px;
        height: 300px;
        background-color: lightgray;
        line-height: 300px;
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

    <%@ include file="../common/adminMenubar.jsp"%>

    <div class="outer">
        <br><br><br><br><br>
        <table id="btn">
            <tr>
                <td id="btn1">
                    <button class="btn btn-secondary" data-toggle="modal" data-target="#myModal">신고게시글 보기</button>
                </td>
                <td id="btn2">
                    <a href="" class="btn btn-info" id="report-btn">신고처리</a>
                    <a href="" class="btn btn-danger" id="reject-btn">반려</a>
                </td>
            </tr>
        </table>
        
        <br>

        <table id="report">
            <tr>
                <td colspan="7" id="title">
                    <span>제목 : </span><span>이상한 사진을 올렸어요. 정말 이상한 사람이 많아요. 처리 부탁!!!!</span>
                </td>
            </tr>
            <tr id="user">
                <td >
                    <span>신고자 : </span><span>user1</span>
                </td>
                <td>|</td>
                <td>
                    <span>신고일 : </span><span>2023-01-17</span>
                </td>
                <td>|</td>
                <td>
                    <span>작성자 : </span><span>user01</span>
                </td>
                <td>|</td>
                <td>
                    <span>작성일 : </span><span>2023-01-17</span>
                </td>
            </tr>
            <tr>
                <td colspan="7" id="content">
                    <div>
                        스타일탭에 이상한 사진을 올렷슴 보자마자 기분이 나빠졌어요 빨리 처리해주세요 게시글 삭제해주시던가...
                    </div>
                </td>
            </tr>
        </table>

        <br><br>

        <div align="center">
            <a onclick="history.back()" class="btn btn-secondary">목록 보기</a>
        </div>

    </div>

    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
    
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <table>
                        <tr>
                            <td class="profile">
                                <img src="resource/img/city1.jpg" class="rounded-circle">
                            </td>
                            <td class="n-d">
                                <div class="nickname">닉네임</div>
                                <div class="date">작성일</div>
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

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
  
            </div>
        </div>
    </div>
    
</body>
</html>