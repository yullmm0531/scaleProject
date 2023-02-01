<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<style>
    .outer{
        width:1200px;
        margin:auto;
        margin-top:50px;
    }
    .submenu-area, .outer-2{float:left;}
    .submenu-area{width:20%; padding-left:60px;}
    .submenu-area ul{
        list-style:none;
        padding-left:0px;
    }
    .submenu-area li{
        line-height:40px;
    }
    .submenu-area a{
        color:black;
    }
    .depth1>a{
        font-size:25px;
        text-decoration:none;
    }
    .outer-2{width:80%;}
    .title{
        text-align:center;
        margin-bottom:30px;
    }
    #notiTitle{
        font-weight:800;
        font-size:14pt;
    }
    #notiContent{
        line-height:28px;
    }
    .inquire-btn{
        margin-bottom:10px;
    }
    .table{
        text-align:center;
    }
    .table>tbody>tr:hover{
        cursor: pointer;
    }
    .inquire-content-wrap{
        display:none;
    }
    .paging-area button{
        border:0.5px solid lightgray;
    }
    </style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer" align="center">
        <div class="submenu-area" align="left">
            <ul>
                <li class="depth1"><a><b>고객센터</b></a></li><br>
                <li class="depth2"><a href="<%=contextPath%>/list.no?cpage=1">공지사항</a></li>
                <li class="depth2"><a href="<%=contextPath%>/listForm.faq">자주묻는질문</a></li>
                <li class="depth2"><a href="<%=contextPath%>/listForm.inq" style="background:black; color:white;">1:1 문의</a></li>
                <li class="depth2"><a href="">검수정책</a></li>
            </ul>
        </div>
        <div class="outer-2">
            <div class="title">
                <h2><b>1:1 문의</b></h2>
                <br>
            </div>
            <div class="noti" align="left">
                <p id="notiTitle">상담 시간</p>
                <p id="notiContent">
                    평일(월 ~ 금) 10:00 ~ 17:00 (토/일/공휴일 휴무) <br>
                    한번 등록한 상담내용은 수정이 불가능합니다.
                </p>
                <br>
            </div>

            <div class="inquire-btn" align="right">
                <a href="" class="btn btn-outline-dark">1:1 문의하기</a>
                <br>
            </div>
            <form action="">
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>구분</th>
                            <th width="600">문의 제목</th>
                            <th>작성일</th>
                            <th>답변유무</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- case1. 문의 내역 없을 때 -->
                        <tr>
                            <td colspan="5" align="center">문의한 내역이 없습니다.</td>
                        </tr>

                        <!-- case2. 문의 내역 있을 때 -->
                        <tr class="my-inquire">
                            <td>구매</td>
                            <td>
                                <div>
                                    <p class="inquire-title">샀는데 안 왔어요 12일이 지났습니다.</p>
                                    <div class="inquire-content-wrap">
                                        <div class="inquire-content">
                                            왜안와요~!!~!~!!~!!~!~!~!!~!~!~~!
                                            <!-- 답변 있을 때만... -->
                                            <div class="inquire-answer">
                                                <hr>
                                                <p>답뵨</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                                                    et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                                                    dolore eu fugiat nulla pariatur.</p>
                                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                                                        laborum.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </td>
                            <td>2022-12-12</td>
                            <td>YES</td>
                            <td>
                                <button type="submit" class="btn btn-sm btn-secondary">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br><br>
            </form>
            <script>
            $(function(){
                    $(".my-inquire").click(function(){
                        $(this).find($(".inquire-content-wrap")).slideToggle();
                    })

            })
            </script>
            <!-- 페이징 -->
            <div class="paging-area">
                <button>&lt</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>&gt</button>
            </div>
            <br><br>
        </div>
    </div>
</html>