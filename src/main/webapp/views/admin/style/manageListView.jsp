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
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    #period{
        border: 1px solid gray; 
        width: 85px;
        height: 30px;
        text-align: center; 
        display: inline-block;
        border-radius: 5%;
    }
    #standard{
        width: 85px; 
        height: 30px;
        text-align: center;
    }
    #search{
        border: 1px solid gray; 
        height: 30px;
        border-radius: 5%;
        width: 277px;
    }

    .style-img>img{width: 260px; height: 260px;}

    .nickname{height: 40px; text-align: left;}
    .nickname>img{width: 25px; height: 25px;}
    .nickname>a{margin-left: 3px;}

    .like{text-align: right;}
    .like>a{padding: 0;}

    .text{text-align: left;}

    #tag-search{width: 300px;}
    #standard>button{margin-left: 5px; margin-right: 5px;}

    #feed>div{
        width: 260px;
        position: relative;
        display: inline-block;
        margin: 10px;
    }
    .check{
        position: absolute;
        zoom: 2;
        top: 2px;
        right: 2px;
    }

</style>
</head>
<body>
    <div class="outer">
        <div>
            <div>
                <div id="period">기간 설정</div>
                <input type="date"> - <input type="date">
            </div>
            <br>
            <select name="" id="standard">
                <option value="bannerName" selected>닉네임</option>
                <option value="category">해쉬태그</option>
            </select>
            <input type="search" id="search">
        </div>
    
        <br><br>
    
        <div align="right">
            <button type="button" class="btn btn-outline-danger" id="delete">삭제</button>
        </div>

        <hr>

        <div id="feed">
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>
            <div>
                <table class="set">
                    <tr>
                        <td colspan="2" class="style-img">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                        </td>
                    </tr>
                    <tr>
                        <td class="nickname">
                            <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
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
                <input type="checkbox" class="check">
            </div>

        </div>

        <br>

        <div class="paging-area">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
            </ul>
        </div>
        
        
    </div>

</body>
</html>