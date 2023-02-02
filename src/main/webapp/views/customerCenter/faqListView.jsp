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
    .paging-area button{
        border:0.5px solid lightgray;
        margin:3px;
    }
    .page-active{
        background:black;
        color:white;
    }

    .category{width:100%; height:50px;}
   
    .c-btn{
        border-radius:0;
        border:0.5px solid lightgray;
        font-size:14px;
        font-weight:900;
        width:15%;
        height:100%;
        line-height:35px;
        display:block;
        float:left;
        position:relative;
        left:12%;
        background:white;
        color:black;
    }
    .active{
        background:black;
        color:white;
    }

    #accordion{
        font-size:14px;
        text-align:left;
    }
    #accordion span{
        margin-right:50px;
        font-weight:600;
    }
    #accordion a{
        text-decoration:none;
        color:black;
        display:inline-block;
        width:100%;
    }
    
    .card{
        background:white !important;
        border:none !important;
    }
    .card-header{
        background:white !important;
        border-bottom:0.5px solid lightgray !important;
        height:60px;
        line-height:40px;
    }
    .card-body{
        background:rgb(247, 247, 247) !important;
    }
    #search-more-btn{
        display:none;
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
                <li class="depth2"><a href="<%=contextPath%>/listForm.faq" style="background:black; color:white;"><b>자주묻는질문</b></a></li>
                <li class="depth2"><a href="<%=contextPath%>/list.inq?cpage=1">1:1 문의</a></li>
                <li class="depth2"><a href="<%=contextPath%>/inspection.po">검수정책</a></li>
            </ul>
        </div>
        <div class="outer-2">
            <div class="title">
                <h2><b>자주묻는질문</b></h2>
                <br>
            </div>
            <div class="input-group mb-3" style="width:400px">
                <input type="text" class="form-control" placeholder="검색어를 입력하세요." id="search-input" name="keyword">
                <div class="input-group-append">
                    <button class="btn" type="button" id="search-btn">검색</button>
                </div>
            </div>
            <br><br>
            <div class="category">
                    <button class="c-btn active" value="all" onclick="categoryFilter(this);">전체</button>
                    <button class="c-btn" value="policy" onclick="categoryFilter(this);">이용정책</button>
                    <button class="c-btn" value="common" onclick="categoryFilter(this);">공통</button>
                    <button class="c-btn" value="buy" onclick="categoryFilter(this);">구매</button>
                    <button class="c-btn" value="sell" onclick="categoryFilter(this);">판매</button>
            </div>
            <br><br>
            <!-- 아코디언 -->
            <div id="accordion">
            </div>
            <br><br><br>
            <!-- 버튼 -->
            <div class="btn-area">
                <button class="btn btn-outline-dark" id="more-btn">더보기</button>
                <button class="btn btn-outline-dark" id="search-more-btn">더보기</button>
            </div>
            <br><br>
        </div>
        </div>
    </div>

   </div>
    <script>
        let cpage = 0;
        let category = "";
        let keyword = "";
        
        $(function(){
            $("#accordion").empty();
            categoryFilter($(".category>button").eq(0));

            $(".c-btn").click(function(){
                $(this).addClass("active");
                $(this).siblings().removeClass("active");
            })

            $("#search-input").on("keypress", function(e){
                if(e.keyCode == 13){
                    $("#search-btn").click();
                }
            })

        })

        function categoryFilter(e){
            $("#accordion").empty();
            cpage = 1;
            category = $(e).val();

            $.ajax({
                url:"<%=contextPath%>/list.faq",
                type:"post",
                data:{"cpage":cpage, "category":category},
                success:function(map){
                    let list = map.list;
                    let pi = map.pi;
                    
                    let value = "";
                    
                    if(list.length < 10){
                        $("#more-btn").css("display", "none");
                    }

                    if(list.length == 0){
						$("#accordion").append("<div align='center'>작성된 글이 없습니다.</div>");
					}else{
                        
                        for(let i=0; i<list.length; i++){{
                            switch(list[i].category){
                                case "policy": list[i].category = "이용정책"; break;
                                case "common": list[i].category = "공통"; break;
                                case "buy": list[i].category = "구매"; break;
                                case "sell": list[i].category = "판매"; break;
                            }

                            value += "<div class='card'>";
                            value += "<div class='card-header'>";
                            value += "<a class='card-link' data-toggle='collapse' href='#collapse" + [i] + "'>";
                            value += "<span>[" + list[i].category + "]</span>" + list[i].faqQuestion + "</a></div>";
                            value += "<div id='collapse" + [i] +"' class='collapse' data-parent='#accordion'>";
                            value += "<div class='card-body'>";
                            value += list[i].faqAnswer;
                            value += "</div></div></div>";
                        }}
                        $("#accordion").append(value);
                        cpage++;
                    }
                }, error:function(){
                    console.log("faq 리스트 가져오기 통신 실패");
                }
            })
        }

        $("#more-btn").click(function(){
           $.ajax({
                url:"<%=contextPath%>/list.faq",
                type:"post",
                data:{"cpage":cpage, "category":category},
                success:function(map){
                    let list = map.list;
                    let pi = map.pi;
                    let value = "";
                        
                    if(list.length < 10){
                        $("#more-btn").css("display", "none");
                    }else{
                        $("#more-btn").css("display", "block");
                    }

                    for(let j=0; j<list.length; j++){{
                        switch(list[j].category){
                            case "policy": list[j].category = "이용정책"; break;
                            case "common": list[j].category = "공통"; break;
                            case "buy": list[j].category = "구매"; break;
                            case "sell": list[j].category = "판매"; break;
                        }
                        value += "<div class='card'>";
                        value += "<div class='card-header'>";
                        value += "<a class='card-link' data-toggle='collapse' href='#collapse" + (j+(10*(cpage-1))) + "'>";
                        value += "<span>[" + list[j].category + "]</span>" + list[j].faqQuestion + "</a></div>";
                        value += "<div id='collapse" + (j+(10*(cpage-1))) +"' class='collapse' data-parent='#accordion'>";
                        value += "<div class='card-body'>";
                        value += list[j].faqAnswer;
                        value += "</div></div></div>";
                    }}
                    $("#accordion").append(value);
                    cpage++;
                    
                }, error:function(){
                    console.log("faq 리스트 가져오기 통신 실패");
                }
            })
        })
          
        // 검색
        $("#search-btn").click(function(){
            $("#accordion").empty();
            $("#more-btn").css("display", "none");
            
            keyword = $("#search-input").val();
            cpage = 1;

            $.ajax({
                url:"<%=contextPath%>/search.faq",
                type:"get",
                data:{"cpage":cpage, "keyword":keyword},
                success:function(map){
                    let searchList = map.searchList;
                    let pi = map.pi;
                    let value = "";
                    
                    if(searchList.length < 10){
                        $("#search-more-btn").css("display", "none");
                    }else{
                        $("#search-more-btn").css("display", "block");
                    }

                    if(searchList.length == 0){
						$("#accordion").append("<div align='center'>검색 결과가 없습니다.</div>");
					}else {

                        for(let i=0; i<searchList.length; i++){{
                            switch(searchList[i].category){
                                case "policy": searchList[i].category = "이용정책"; break;
                                case "common": searchList[i].category = "공통"; break;
                                case "buy": searchList[i].category = "구매"; break;
                                case "sell": searchList[i].category = "판매"; break;
                            }

                            value += "<div class='card'>";
                            value += "<div class='card-header'>";
                            value += "<a class='card-link' data-toggle='collapse' href='#collapse" + [i] + "'>";
                            value += "<span>[" + searchList[i].category + "]</span>" + searchList[i].faqQuestion + "</a></div>";
                            value += "<div id='collapse" + [i] +"' class='collapse' data-parent='#accordion'>";
                            value += "<div class='card-body'>";
                            value += searchList[i].faqAnswer;
                            value += "</div></div></div>";
                        }}
                        
                        $("#accordion").append(value);
                        cpage++;
                    }
                }, error:function(){
                    console.log("faq 검색 통신 실패");
                }
            })
        })

        $("#search-more-btn").click(function(){
            
            $.ajax({
                url:"<%=contextPath%>/search.faq",
                type:"get",
                data:{"cpage":cpage, "keyword":keyword},
                success:function(map){
                    let searchList = map.searchList;
                    let pi = map.pi;
                    let value = "";
                        
                    if(searchList.length < 10){
                        $("#search-more-btn").css("display", "none");
                    }else{
                        $("#search-more-btn").css("display", "block");
                    }

                    if(searchList.length == 0){
						$("#accordion").append("<div align='center'>검색 결과가 없습니다.</div>");
					}else {

                        for(let j=0; j<searchList.length; j++){{
                            switch(searchList[j].category){
                                case "policy": searchList[j].category = "이용정책"; break;
                                case "common": searchList[j].category = "공통"; break;
                                case "buy": searchList[j].category = "구매"; break;
                                case "sell": searchList[j].category = "판매"; break;
                            }

                            value += "<div class='card'>";
                            value += "<div class='card-header'>";
                            value += "<a class='card-link' data-toggle='collapse' href='#collapse" + (j+(10*(cpage-1))) + "'>";
                            value += "<span>[" + searchList[j].category + "]</span>" + searchList[j].faqQuestion + "</a></div>";
                            value += "<div id='collapse" + (j+(10*(cpage-1))) +"' class='collapse' data-parent='#accordion'>";
                            value += "<div class='card-body'>";
                            value += searchList[j].faqAnswer;
                            value += "</div></div></div>";

                        }}
                        
                        $("#accordion").append(value);
                        cpage++;
                    }
                }, error:function(){
                    console.log("faq 검색리스트 더 가져오기 통신 실패");
                }
            })
        })
    
    </script>

</body>
</html>