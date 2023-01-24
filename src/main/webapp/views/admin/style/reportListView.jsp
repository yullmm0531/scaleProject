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
    #period>div{
        border: 1px solid gray; 
        width: 85px;
        height: 30px;
        text-align: center; 
        display: inline-block;
        border-radius: 5%;
    }
    #period>input{
        height: 30px;
        vertical-align: middle;
        margin-left: 5px;
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
        margin-left: 5px;
    }

    #report-list{
        text-align: center;
    }
    #no{width: 70px;}
    #enroll-date{width: 100px;}
    #reported{width: 100px;}
    #title{width: 400px;}
    #report-date{width: 100px;}
    #reporting{width: 100px;}
    #status{width: 100px;}
</style>
</head>
<body>
    <div class="outer">

        <div>
            <div id="period">
                <div>기간 설정</div>
                <input type="date">-<input type="date">
            </div>
            <br>
            <select name="" id="standard">
                <option value="bannerName" selected>제목</option>
                <option value="category">작성자</option>
            </select>
            <input type="search" id="search" placeholder="제목을 입력해주세요(키워드)">
        </div>

        <br><br>

        <table id="report-list" class="table table-hover" border="1">
            <thead class="table-active">
                <tr>
                    <th id="no">No.</th>
                    <th id="enroll-date">등록일</th>
                    <th id="reported">작성자</th>
                    <th id="title">제목</th>
                    <th id="report-date">신고일</th>
                    <th id="reporting">신고자</th>
                    <th id="status">처리현황</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>처리완료</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>반려</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>신고접수</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>처리완료</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>처리완료</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>처리완료</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>처리완료</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>처리완료</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>처리완료</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>이상한 사진을 올렸어요</td>
                    <td>2023-01-17</td>
                    <td>user01</td>
                    <td>처리완료</td>
                </tr>
     
            </tbody>
        </table>

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