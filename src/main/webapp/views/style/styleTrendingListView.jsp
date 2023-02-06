<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.style.model.vo.Hashtag, java.util.ArrayList" %>
<%
	ArrayList<Hashtag> tag = (ArrayList<Hashtag>)request.getAttribute("tag");
%>
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
    .set{margin: 15px; float: left;}

    .cimg{width: 260px; height: 260px; border-radius: 0.5em;}

    .nickname{height: 40px; text-align: left;}
    .nickname>img{width: 25px; height: 25px;}
    .nickname>a{margin-left: 3px;}

    .like{text-align: right;}
    .like>a{padding: 0;}

    .text{text-align: left;}

    #tag-search{
    	width: 330px;
        height: 32px;
        border: 1px solid gray;
        border-radius: 0.3em;
        padding-left: 10px;
   	}
   	#tag-search:focus {outline:none;}
    #trending{
    	margin-left: 5px; 
    	margin-right: 5px;
    	background-color: black;
    	color: white;
    	width: 70px;
    	height: 40px;
    	font-size: 20px;
    	font-weight : bold;
    	border-radius: 1em;
    }
    #newest{
    	margin-left: 5px; 
    	margin-right: 5px;
    	background: none;
    	border: 0px;
    	color: black;
    	width: 70px;
    	height: 40px;
    	font-size: 20px;
    	border-radius: 1em;
    }
    .text{
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	width:260px;
    	white-space:nowrap;
    }
    .tag-area{height: 27px;}
    
    #up-btn{
    	position: fixed; 
    	right: 50px; 
    	bottom: 30px;
    	z-index: 999;
        width: 50px;
        height: 50px;
    }
    #up-btn{cursor: pointer;}
    #insert-btn{
    	position: fixed; 
    	right: 130px; 
    	bottom: 30px;
    	z-index: 999;
        width: 50px;
        height: 50px;
    }
    #insert-btn{cursor: pointer;}
    
    .style-img{
        width: 260px;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <script>
        $(function(){
            <% if(loginUser != null && loginUser.getStyleBlockDate() != null) { %>
                alert("스타일 신고 누적으로 STYLE 차단되었습니다.");
                location.href = "<%= contextPath %>";
            <% } %>
        })
    </script>

	<div class="outer">
        <div id="standard">
            <button type="button" id="trending">인기</button>
            <button type="button" id="newest" onclick="location.href='<%= contextPath %>/stylelist.st?view=newest'">최신</button>
        </div>

        <div>
            <form action="<%= contextPath %>/search.st" method="get">
                <div>
                    <input type="search" placeholder="해쉬태그 검색" id="tag-search" name="keyword">
                </div>
            </form>
        </div>

        <div>
        	<% for(Hashtag t : tag){ %>
            	<button type="button" class="hashtag btn btn-light btn-sm" onclick="search(this);"><%= t.getKeyword() %></button>
            <% } %>
        </div>
		
		<br>
		
        <div class="set-container">
        	
        </div>
    </div>
    
    <img id="up-btn" src="<%= contextPath %>/resources/images/style/up.jpg">
    <img id="insert-btn" src="<%= contextPath %>/resources/images/style/insert.jpg">
    <br><br>
    
    <script>
        $(document).ready(function() {      
            $('.carousel').carousel('pause');
        });

        function search(btn){
    		const text = encodeURIComponent(btn.innerText);
    		location.href = "<%= contextPath %>/search.st?keyword=" + text;
    	}

        $("#up-btn").click(function(){
            window.scrollTo({ top: 0, behavior: "smooth" });
        })

    	$(function(){
    		$("#insert-btn").click(function(){
        		 <% if(loginUser == null) { %>
	        		 	alert("로그인 후 이용가능한 페이지입니다.");
	        		 	location.href = "<%= contextPath %>/loginForm.us";
        		 <% } else { %>
        		 		location.href = "<%= contextPath %>/enrollForm.st";
        		 <% } %>
        	})
    	})
    	
        let cpage = 0;

        $(function(){
            $(window).scroll();
        })

        $(window).scroll(function() {
            if($(window).scrollTop() + $(window).height() == $(document).height()){
                cpage++;
                StyleList();
            }
        });

        function StyleList(){
            $.ajax({
                url:"<%= contextPath %>/trendinglist.ajax",
                type:"get",
                data:{"cpage":cpage},
                success:function(map){
                    let list = map.list;
                    let ilist = map.ilist;
                    let checkLike = map.checkLike;
                    
                    let value = "";
                    for(let i=0; i<list.length; i++){
                        value = "<table class='set'>"
                                    + "<tr>"
                                        + "<td colspan='2' class='style-img'>"
                                            + "<div id='demo" + Number(i + (12 * (cpage - 1))) + "' class='carousel' data-interval='false'>"
                                                + "<div class='carousel-inner'>";
                                    for(let j=0; j<ilist.length; j++){
                                        if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 1) {
                                            value += "<div class='carousel-item active'>"
                                                        + "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "' onclick='detail(this);'>"
                                                        + "<input type='hidden' id='" + list[i].styleNo + "' value='" + list[i].styleNo + "'>"
                                                        + "<input type='hidden' value='" + cpage + "'>"
                                                    + "</div>";
                                        } else if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 2) {
                                            value += "<div class='carousel-item'>"
                                                        + "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "' onclick='detail(this);'>"
                                                        + "<input type='hidden' id='" + list[i].styleNo + "' value='" + list[i].styleNo + "'>"
                                                        + "<input type='hidden' value='" + cpage + "'>"
                                                    + "</div>";
                                        }
                                    }
                                        value += "</div>"
                                                + "<a class='carousel-control-prev' href='#demo" +  Number(i + (12 * (cpage - 1))) + "' data-slide='prev'>"
                                                + "<span class='carousel-control-prev-icon'></span>"
                                                + "</a>"
                                                + "<a class='carousel-control-next' href='#demo" + Number(i + (12 * (cpage - 1))) + "' data-slide='next'>"
                                                + "<span class='carousel-control-next-icon'></span>" 
                                                + "</a>"
                                            + "</div>"
                                        + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                        + "<td class='nickname'>"
                                            + "<img src='<%= contextPath %>/" + list[i].profileImg + "' class='rounded-circle'>"
                                            + "<a href='<%= contextPath %>/profileView.st?userNo=" + list[i].userNo + "'>" + list[i].styleWriter + "</a>"
                                        + "</td>"
                                        + "<td class='like'>";
                                if(checkLike[i] == 0){
                                    value += "<a class='btn smile'>🤍</a>"
                                } else {
                                    value += "<a class='btn smile'>❤</a>"
                                }     
                                    value += "<input type='hidden' class='styleNo' value='" + list[i].styleNo + "'>"
                                            + "<span>" + list[i].count + "</span>"
                                        + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                        + "<td colspan='2' class='tag-area'>"
                                            + "<div class='text'>";
                                if(list[i].hashtag != null){
                                    let tagArr = list[i].hashtag.split(" ");
                                    for(let t=0; t<tagArr.length; t++){
                                        const enco= encodeURIComponent(tagArr[t]);
                                        value += "<a href='<%= contextPath %>/search.st?keyword=" + enco + "'>" + tagArr[t] + "</a>";
                                    }
                                }
                                value += "</div>"
                                    + "</td>"
                                + "</tr>"
                            + "</table>";
                        $(".set-container").append(value);
                    }
                },
                error:function(){
                    console.log("통신실패");
                }
            })
            
        }

        $(document).on("click", ".smile", function(){
            let e = $(this);
            let like = e.text();
            <% if(loginUser == null) { %>
                alert("로그인 후 이용가능한 페이지입니다.");
                location.href = "<%= contextPath %>/loginForm.us";
            <% } else { %>
                let userNo = <%= loginUser.getUserNo() %>;
                $.ajax({
                    url:"increaselike.ajax",
                    data:{"userNo":userNo, "styleNo":$(this).next().val()},
                    async : false,
                    success:function(result){
                        if(like == "🤍"){
                            e.text("❤");
                            e.next().next().text(Number(e.next().next().text()) + 1);
                        } else {
                            e.text("🤍");
                            e.next().next().text(Number(e.next().next().text()) - 1);
                        }
                    },
                    error:function(){
                        console.log("실패");
                    }
                })
            <% } %>
        })

        function detail(e){
            let no = $(e).next().val();
            let cpage = $(e).next().next().val();
            
            location.href = "<%= contextPath %>/detail.st?no=" + no + "&view=trending&cpage=" + cpage;
        }
    </script>

	</body>
</html>