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
    /* .table{
        text-align:center;
    } */
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
    .category-tabs button{
        text-decoration:none;
        color:black;
        font-size:14px;
        font-weight:900;
        display:block;
        width:100%;
        height:100%;
        text-align:center;
        line-height:35px;
    }

    #accordion{
        font-size:14px;
        text-align:left;
    }
    #accordion span{
        margin-right:50px;
    }
    #accordion a{
        text-decoration:none;
        color:black;
        font-weight:600;
        display:inline-block;
        width:100%;
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
                <li class="depth2"><a href="<%=contextPath%>/listForm.faq" style="background:black; color:white;">자주묻는질문</a></li>
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
                    <li><button class="btn" value="all" onclick="categoryFilter(this);">전체</button></li>
                    <li><button class="btn" value="policy" onclick="categoryFilter(this);">이용정책</button></li>
                    <li><button class="btn" value="common" onclick="categoryFilter(this);">공통</button></li>
                    <li><button class="btn" value="buy" onclick="categoryFilter(this);">구매</button></li>
                    <li><button class="btn" value="sell" onclick="categoryFilter(this);">판매</button></li>
                </ul>
            </div>
            <br>
            <!-- 아코디언 -->
            <div id="accordion">
            </div>
            <br><br><br>
            <!-- 버튼 -->
            <div class="btn-area">
                <button class="btn btn-outline-dark" id="more-btn">더보기</button>
            </div>
        </div>
        </div>
    </div>

   </div>
    <script>
        let cpage = 0;
        $(function(){
            $("#accordion").empty();
            categoryFilter($(".category-tabs button").eq(0));
            
            $("#search-input").on("keypress", function(e){
                if(e.keyCode == 13){
                    $("#search-btn").click();
                }
            })
        })

        function categoryFilter(e){
            $("#accordion").empty();
            let cpage = 1;
            let category = $(e).val();

            $.ajax({
                url:"<%=contextPath%>/list.faq",
                type:"post",
                data:{"cpage":cpage, "category":category},
                success:function(map){
                    let list = map.list;
                    let pi = map.pi;

                    let value = "";
                    if(list.length == 0){
						$("#accordion").append("<div>작성된 글이 없습니다.</div>");
					}else{
                        if(cpage > pi.MaxPage){
                            return;
                        }
                        if(list.length < 10){
                            $("#more-btn").css("display", "none");
                        }else{
                            $("#more-btn").css("display", "block");
                        }
                        for(let i=0; i<list.length; i++){{
                            value += "<div class='card'>";
                            value += "<div class='card-header'>";
                            value += "<a class='card-link' data-toggle='collapse' href='#collapseOne'>";
                            value += "<span>[" + list[i].category + "]</span>" + list[i].faqQuestion + "</a></div>";
                            value += "<div id='collapseOne' class='collapse' data-parent='#accordion'>";
                            value += "<div class='card-body'>";
                            value += list[i].faqAnswer;
                            value += "</div></div></div>";
                        }}
                        $("#accordion").append(value);
                        $("#more-btn").click(function(){
                            ++cpage;
                            $.ajax({
                                url:"<%=contextPath%>/list.faq",
                                type:"post",
                                data:{"cpage":cpage, "category":category},
                                success:function(result){
                                    let list = result;
                                    let value = "";
                                    if(list.length == 0){
                                        $("#accordion").append("없어 나오지마 제발");
                                        $("#more-btn").css("display", "none");
                                    }else{
                                            
                                        for(let i=0; i<list.length; i++){{
                                            value += "<div class='card'>";
                                            value += "<div class='card-header'>";
                                            value += "<a class='card-link' data-toggle='collapse' href='#collapseOne'>";
                                            value += "<span>[" + list[i].category + "]</span>" + list[i].faqQuestion + "</a></div>";
                                            value += "<div id='collapseOne' class='collapse' data-parent='#accordion'>";
                                            value += "<div class='card-body'>";
                                            value += list[i].faqAnswer;
                                            value += "</div></div></div>";
                                        }}
                                        $("#accordion").append(value);
                                    }
                                }, error:function(){
                                    console.log("더보기 통신 실패");
                                }
                            })
                        })
                    }

                }, error:function(){
                    console.log("faq 리스트 가져오기 통신 실패");
                }
            })
        }
            
    </script>
</body>
</html>