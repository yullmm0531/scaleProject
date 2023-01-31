<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.style.model.vo.*, java.util.ArrayList, java.net.URLEncoder" %>
<%
	String keyword = String.valueOf(request.getAttribute("keyword"));
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
        width: 1200px;
    }
    .set{
    	margin: 15px;
    	float: left;
    }
    

    .cimg{width: 260px; height: 260px; border-radius: 0.5em;}

    .nickname{height: 40px; text-align: left;}
    .nickname>img{width: 25px; height: 25px;}
    .nickname>a{margin-left: 3px;}
    
    .like{text-align: right;}
    .like>a{padding: 0;}

    .text{text-align: left;}
    
    .text{
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	width:260px;
    	white-space:nowrap;
    }
    .tag-area{height: 27px;}
    #keyword{
    	font-size: 30px;
    	font-weight: bold;
    }
    
    #nothing{
    	text-align: center;
    	font-size: 20px;
    	font-weight: bold;
    }
	#up-btn{
    	position: fixed; 
    	right: 50px; 
    	bottom: 30px;
    	z-index: 999;
        width: 50px;
        height: 50px;
    }
	#up-btn:hover{cursor: pointer;}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer">
    	<div align="center" id="keyword">
    		<% if(keyword.charAt(0) == '#') { %>
    			<%= keyword %>
    		<% } else { %>
    			#<%= keyword %>
    		<% } %>
    	</div>
    	
    	<br><br><br>
    	
        <div class="set-container">
        	
        </div>
    </div>
    
    <img id="up-btn" src="<%= contextPath %>/resources/images/style/up.jpg">
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

		let keyword = "<%= keyword %>";

        function StyleList(){
			$.ajax({
				url:"<%= contextPath %>/searchStyle.ajax",
				type:"get",
				data:{"cpage":cpage, "keyword":keyword},
				success:function(map){
					let list = map.list;
					let ilist = map.ilist;
					let maxPage = map.maxPage;
					let checkLike = map.checkLike;

					let value = "";
					if(list.length > 0) {
						if(cpage > maxPage){
							return;
						}
						$("#nothing").css("display", "none");
						for(let i=0; i<list.length; i++){
							value = "<table class='set'>"
										+ "<tr>"
											+ "<td colspan='2' class='style-img'>"
												+ "<div id='demo" + i + (12 * (cpage - 1)) + "' class='carousel'>"
													+ "<div class='carousel-inner' data-interval='false'>";
										for(let j=0; j<ilist.length; j++){
											if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 1) {
												value += "<div class='carousel-item active'>"
															+ "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "'>"
														+ "</div>";
											} else if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 2) {
												value += "<div class='carousel-item'>"
															+ "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "'>"
														+ "</div>";
											}
										}
											value += "</div>"
													+ "<a class='carousel-control-prev' href='#demo" +  i + (12 * (cpage - 1)) + "' data-slide='prev'>"
													+ "<span class='carousel-control-prev-icon'></span>"
													+ "</a>"
													+ "<a class='carousel-control-next' href='#demo" + i + (12 * (cpage - 1)) + "' data-slide='next'>"
													+ "<span class='carousel-control-next-icon'></span>" 
													+ "</a>"
												+ "</div>"
											+ "</td>"
										+ "</tr>"
										+ "<tr>"
											+ "<td class='nickname'>"
												+ "<img src='<%= contextPath %>/" + list[i].profileImg + "' class='rounded-circle'>"
												+ "<a href='<%= contextPath %>/profile.st?nickname=" + list[i].styleWriter + "&cpage=1'>" + list[i].styleWriter + "</a>"
											+ "</td>"
											+ "<td class='like'>"
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
											// let enco = URLEncoder.encode(tagArr[t], "UTF-8");
											let enco = tagArr[t].substring(1);
											value += "<a href='<%= contextPath %>/search.st?keyword=" + enco + "'>" + tagArr[t] + "</a>";
										}
									}
									value += "</div>"
										+ "</td>"
									+ "</tr>"
								+ "</table>";
							$(".set-container").append(value);
						}
					} else {
						if($(".set-container").children().length == 0){
							value = "<div id='nothing'>검색된 스타일이 없습니다.</div>";
							$(".set-container").append(value);
						}
					}
					
				},
				error:function(){
					console.log("통신실패");
				}
			})
			
        }

        $(document).ready(function() {      
            $('.carousel').carousel('pause');
        });

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
    </script>
    

</body>
</html>