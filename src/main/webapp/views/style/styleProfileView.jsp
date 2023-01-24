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
        width: 1000px;
    }
    .profile{width: 1000px;}
    .header>td{height: 150px;}
    .etc{height: 70px;}
    .header>td>img{width: 100px; height: 100px;}
    .header>td>span{font-size: 30px; font-weight: bolder; padding-left: 10px;}
    .id, .introduce, .count{height: 70px;}
    .id>div, .introduce>div, .count>div{margin-left: 10px;}
    .edit{text-align: right;}

    .set{
        box-sizing: border-box;
        /* border: 1px solid red; */
        float: left;
        margin: 2px;
    }

    #hashtag{font-size: 40px; font: bold;}

    .style-img>img{width: 240px; height: 240px;}

    .profile-img{height: 40px;}
    .profile-img>img{width: 25px; height: 25px;}

    .text{text-align: left;}

    .nickname{text-align: left;}
    .smile{text-align: right;}
    .smile>a{padding: 0%;}
    .like{text-align: left;}
    .report>a{padding: 0px;}

    #tag-search{width: 300px;}
    #standard>button{margin-left: 5px; margin-right: 5px;}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer">
        <table class="profile">
            <tr class="header">
                <td>
                    <img src="resource/img/city1.jpg" class="rounded-circle">
                    <span>닉네임</span>
                </td>
                <td class="edit">
                    <a href="" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#profile-edit">프로필 편집</a>
                </td>
            </tr>
            <tr>
                <td class="id">
                    <div>아이디</div>
                </td>
            </tr>
            <tr>
                <td class="introduce">
                    <div>소개</div>    
                </td>
            </tr>
            <tr>
                <td class="count">
                    <div>게시물 100개</div>
                </td>
            </tr>
        </table>

        <div id="style-content">
            <table class="set">
                <tr>
                    <td colspan="5" class="style-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="profile-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                    </td>
                    <td class="nickname">
                        <a href="">닉네임</a>
                    </td>
                    <td class="smile">
                        <a class="btn">😊</a>
                    </td>
                    <td class="like">
                        <span>200</span>
                    </td>
                    <td class="report">
                        <a class="btn">❕</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">색감대박 #xxxxx #xxxxx</div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="5" class="style-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="profile-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                    </td>
                    <td class="nickname">
                        <a href="">닉네임</a>
                    </td>
                    <td class="smile">
                        <a class="btn">😊</a>
                    </td>
                    <td class="like">
                        <span>200</span>
                    </td>
                    <td class="report">
                        <a class="btn">❕</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">색감대박 #xxxxx #xxxxx</div>
                    </td>
                </tr>
            </table>

            <table class="set">
                <tr>
                    <td colspan="5" class="style-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="profile-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                    </td>
                    <td class="nickname">
                        <a href="">닉네임</a>
                    </td>
                    <td class="smile">
                        <a class="btn">😊</a>
                    </td>
                    <td class="like">
                        <span>200</span>
                    </td>
                    <td class="report">
                        <a class="btn">❕</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">색감대박 #xxxxx #xxxxx</div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="5" class="style-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="profile-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                    </td>
                    <td class="nickname">
                        <a href="">닉네임</a>
                    </td>
                    <td class="smile">
                        <a class="btn">😊</a>
                    </td>
                    <td class="like">
                        <span>200</span>
                    </td>
                    <td class="report">
                        <a class="btn">❕</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">색감대박 #xxxxx #xxxxx</div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="5" class="style-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="profile-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                    </td>
                    <td class="nickname">
                        <a href="">닉네임</a>
                    </td>
                    <td class="smile">
                        <a class="btn">😊</a>
                    </td>
                    <td class="like">
                        <span>200</span>
                    </td>
                    <td class="report">
                        <a class="btn">❕</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">색감대박 #xxxxx #xxxxx</div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="5" class="style-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="profile-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                    </td>
                    <td class="nickname">
                        <a href="">닉네임</a>
                    </td>
                    <td class="smile">
                        <a class="btn">😊</a>
                    </td>
                    <td class="like">
                        <span>200</span>
                    </td>
                    <td class="report">
                        <a class="btn">❕</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">색감대박 #xxxxx #xxxxx</div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="5" class="style-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="profile-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                    </td>
                    <td class="nickname">
                        <a href="">닉네임</a>
                    </td>
                    <td class="smile">
                        <a class="btn">😊</a>
                    </td>
                    <td class="like">
                        <span>200</span>
                    </td>
                    <td class="report">
                        <a class="btn">❕</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">색감대박 #xxxxx #xxxxx</div>
                    </td>
                </tr>
            </table>
            <table class="set">
                <tr>
                    <td colspan="5" class="style-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="style-img">
                    </td>
                </tr>
                <tr>
                    <td class="profile-img">
                        <img src="C:\workspaces\04_front-workspace\01_HTML5\resources\image/city1.jpg" class="rounded-circle">
                    </td>
                    <td class="nickname">
                        <a href="">닉네임</a>
                    </td>
                    <td class="smile">
                        <a class="btn">😊</a>
                    </td>
                    <td class="like">
                        <span>200</span>
                    </td>
                    <td class="report">
                        <a class="btn">❕</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="text">색감대박 #xxxxx #xxxxx</div>
                    </td>
                </tr>
            </table>
        </div>

    <div class="modal" id="profile-edit">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">프로필 편집</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <form class="modal-body">
                <div>
                    <img src="resource/img/city1.jpg" class="rounded-circle" style="width: 70px; height: 70px;">
                    <br><br>
                    <input type="file">
                </div>
                <br>
                <div>닉네임*</div>
                <input type="text" name="nickname" value="xxx">
                <br>
                <div>소개</div>
                <textarea name="introduce" cols="22" rows="5" style="resize: none;">xxx</textarea>
                <br><br>
                <button type="submit" class="btn btn-secondary" data-dismiss="modal">변경</button>
                <button type="reset" class="btn btn-secondary">초기화</button>
            </form>
      
          </div>
        </div>
      </div>
    
</body>
</html>