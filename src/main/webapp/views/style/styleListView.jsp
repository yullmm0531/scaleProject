<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            margin: auto; 
            margin-top: 50px;
            /* border: 1px solid black; */
            text-align: center;
            width: 1200px;
        }
        .outer>div{margin: 10px;}
        .set{margin: 5px; float: left;}
        #hashtag{font-size: 40px; font: bold;}

        .style-img>img{width: 260px; height: 260px;}

        .nickname{height: 40px; text-align: left;}
        .nickname>img{width: 25px; height: 25px;}
        .nickname>a{margin-left: 3px;}

        .like{text-align: right;}
        .like>a{padding: 0;}

        .text{text-align: left;}

        #tag-search{width: 300px;}
        #standard>button{margin-left: 5px; margin-right: 5px;}
    </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div id="standard">
            <button type="button" class="btn btn-secondary">인기</button>
            <button type="button" class="btn btn-secondary">최신</button>
        </div>
        
        <div>
            <form action="" method="get">
                <input type="text" placeholder="해쉬태그 검색" id="tag-search">
            </form>
        </div>

        <div>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
            <button type="button" class="hashtag btn btn-light btn-sm">#ooo</button>
        </div>

        <div>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="2" class="style-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="nickname">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                        <a href="">닉네임</a>
                    </td>
                    <td class="like">
                        <a class="btn">😊</a>
                        <span>200</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">
                            <a href="">#xxxxx</a>
                            <a href="">#xxxxx</a>
                        </div>
                    </td>
                </tr>
            </table>
            
        </div>
    </div>
    
    <button id="up-btn" style="position: fixed; right: 50px; bottom: 20px;">올라가기</button>
    <br><br>

</body>
</html>