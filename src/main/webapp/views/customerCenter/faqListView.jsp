<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>
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
    .mb-3 button{
        background:black;
        color:white;
    }
    .table{
        text-align:center;
    }
    .paging-area button{
        border:0.5px solid lightgray;
        margin:3px;
    }
    .page-active{
        background:black;
        color:white;
    }

    .category{width:100%; height:50px; margin-left:100px;}
    .category-tabs{
        list-style-type:none;
        padding:0;
        margin:0;
        width:100%;
        height:100%;
    }
    .category-tabs>li{
        border:0.5px solid lightgray;
        float:left;
        width:15%;
        height:100%;
    }
    .category-tabs a{
        text-decoration:none;
        color:black;
        font-size:12px;
        font-weight:900;
        display:block;
        width:100%;
        height:100%;
        text-align:center;
        line-height:50px;
    }
    .category-tabs a:hover{
        color:gray;
    }
    
    .faq{
        font-size:14px;
    }
    .faq-q:hover{
        cursor:pointer;
    }
    .faq-a{
        display:none;
        background:rgb(240, 240, 240);
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="outer" align="center">
        <div class="submenu-area" align="left">
            <ul>
                <li class="depth1"><a><b>고객센터</b></a></li><br>
                <li class="depth2"><a href="<%=contextPath%>/list.no?cpage=1"><b>공지사항</b></a></li>
                <li class="depth2"><a href="<%=contextPath%>/list.faq" style="background:black; color:white;">자주묻는질문</a></li>
                <li class="depth2"><a href="">1:1문의</a></li>
                <li class="depth2"><a href="">검수정책</a></li>
            </ul>
        </div>
        <div class="outer-2">
            <div class="title">
                <h2><b>자주묻는질문</b></h2>
                <br>
            </div>
            <form class="input-group mb-3" style="width:400px" action="<%=contextPath%>/search.no" method="get">
                <input type="text" class="form-control" placeholder="검색어를 입력하세요." id="search-input" name="keyword">
                <input type="hidden" name="cpage" value="1">
                <div class="input-group-append">
                <button class="btn" type="submit" id="search-btn">검색</button>
                </div>
            </form>
            <br><br>
            <div class="category">
                <ul class="category-tabs">
                    <li><a href="">전체</a></li>
                    <li><a href="">이용정책</a></li>
                    <li><a href="">공통</a></li>
                    <li><a href="">구매</a></li>
                    <li><a href="">판매</a></li>
                </ul>
            </div>
            <br>
            <table class="table faq">
                <tr class="faq-q">
                    <th class="q-category">구매</th>
                    <th class="q-content">이상시세 입찰/거래 취소 정책</th>
                    <th class="down-arrow"><img src="<%=contextPath%>/resources/images/down_arrow.png" width="35"></th>
                </tr>
                <tr class="faq-a">
                    <td colspan="3">
                        KREAM은 이용약관 제21조 제3항부터 제6항까지의 규정에 따라 회원의 조작 실수, 착오로 인한 사고 발생을 예방하고,
                        회원의 조작 실수를 유도하거나 상품 시세를 조작하여 건전한 거래 질서를 어지럽히려는 시도 등 각종 거래 사고와 부정거래 등을 방지하기 위하여 다음과 같이 이상시세 입찰 또는 거래 취소 정책을 실시하고 있습니다.
                    </td>
                </tr>
                <tr class="faq-q">
                    <th class="q-category">구매</th>
                    <th class="q-content">이상시세 입찰/거래 취소 정책</th>
                    <th class="down-arrow"><img src="<%=contextPath%>/resources/images/down_arrow.png" width="35"></th>
                </tr>
                <tr class="faq-a">
                    <td colspan="3">
                        KREAM은 이용약관 제21조 제3항부터 제6항까지의 규정에 따라 회원의 조작 실수, 착오로 인한 사고 발생을 예방하고,
                        회원의 조작 실수를 유도하거나 상품 시세를 조작하여 건전한 거래 질서를 어지럽히려는 시도 등 각종 거래 사고와 부정거래 등을 방지하기 위하여 다음과 같이 이상시세 입찰 또는 거래 취소 정책을 실시하고 있습니다.
                    </td>
                </tr>
            </table>

            <button class="btn btn-outline-dark">더보기</button>

            <script>
                $(function(){
                    $(".faq-q").click(function(){
                        const $a = $(this).next()
                        $a.slideToggle();
                    })
    
                })
                </script>
                 <%--
                        <% if(list.isEmpty()) { %>
                        <!-- 게시글 없을 경우-->
                        <tr>
                            <td colspan="4">등록된 게시글이 없습니다.</td>
                        </tr>
                        <% }else { %>
                            <!-- 게시글 있을 경우-->
                            <% for(Notice n : list) { %>
                                <tr>
                                    <td><%= n.getNoticeNo() %></td>
                                    <td><%= n.getNoticeTitle() %></td>
                                    <td><%= n.getCount() %></td>
                                    <td><%= n.getCreateDate() %></td>
                                </tr>
                            <% } %>
                        <% } %>
                </table>
            </div>
            <br><br>
            <!-- 페이징 -->
            <div class="paging-area">
                <% if(pi.getCurrentPage() != 1) { %>
                    <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <% } %>
                
                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                    <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=i%>';"><%= i %></button>
                <% } %>
                
                <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                    <button onclick="location.href='<%=contextPath%>/list.no?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <% } %>
            </div>
            <br><br>
        </div>
    </div>
   
    <script>
        $(function(){
            $(".paging-area>button").each(function(){
                if($(this).text() == "<%=pi.getCurrentPage()%>"){
                    $(this).addClass("page-active");
                }
            })

            $("#search-input").on("keypress", function(e){
                if(e.keyCode == 13){
                    $("#search-btn").click();
                }
            })
        })
    </script>
     --%>
</body>
</html>