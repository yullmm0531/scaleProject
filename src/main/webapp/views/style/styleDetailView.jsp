<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder, java.util.ArrayList, com.scale.style.model.vo.*, com.scale.product.model.vo.Product" %>
<%
	int cpage = (int)request.getAttribute("cpage");
	String no = (String)request.getAttribute("no");
    String view = (String)request.getAttribute("view");
    ArrayList<Style> list = (ArrayList<Style>)request.getAttribute("list");
    ArrayList<StyleImg> ilist = (ArrayList<StyleImg>)request.getAttribute("ilist");
    ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("plist");
    int[] checkLike = (int[])request.getAttribute("checkLike");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        /* border: 1px solid black; */
        width:400px;
        margin: auto; 
        margin-top: 50px;
    }
    table{width: 400px; box-sizing: border-box; float: left; margin-bottom: 30px;}

    .profile-td{width: 70px; height: 85px;}
    .profile-td>img{width: 70px; height: 70px; box-sizing: border-box;}

    .nickname{
        font-size: 20px; 
        font-weight: bold; 
        margin-left: 10px;
        text-decoration: none;
        color: black;
    }
    .date{font-size: 12px; margin-left: 10px;}

    .cimg{width: 400px; height: 400px;} 

    .report-td{text-align: right;}

    .pd-tag{font-size: 20px; font-weight: bold;}
    .pd-info{width: 400px;}
    .pd-info>div{float: left; width: 70px; margin-right: 5px;}
    .pd-info img{width: 70px; height: 70px; box-sizing: border-box;}
    .pd-info>div>div{
        width: 70px; 
        font-size: 12px;
        text-overflow:ellipsis; 
    	overflow:hidden;
    	white-space:nowrap;
    }

    .like-td{font-size: 15px;}
    .like{padding:0px !important;}
    
    .text, .tag{
        width: 400px;
    }
    .tag-area{height: 27px;}

    .dropdown{
        background-color: white;
        border: 0px;
    }
    #title{
        width: 462px;
    }
    .style-img{
        width: 260px;
    }

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
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div class="set-container">
            <% for(int i=0; i< list.size() ; i++) { %>
            <table id="<%= list.get(i).getStyleNo() %>">
                <tr>
                    <td class="profile-td">
                        <img src="<%= contextPath %>/<%= list.get(i).getProfileImg() %>" class="rounded-circle">
                    </td>
                    <td class="nickname-td">
                        <a class="nickname" href="<%= contextPath %>/profileView.st?nickname=<%= list.get(i).getStyleWriter() %>"><%= list.get(i).getStyleWriter() %></a>
                        <div class="date"><%= list.get(i).getEnrollDate() %></div>
                    </td>
                    <td class="report-td">
                        <div class="dropdown">
                            <button type="button" data-toggle="dropdown" class="dropdown">❗</button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item report-btn" data-toggle="modal" data-target="#myModal">스타일 신고</a>
                              <input type="hidden" value="<%= list.get(i).getUserId() %>">
                              <input type="hidden" value="<%= list.get(i).getStyleNo() %>">
                              <input type="hidden" value="<%= list.get(i).getUserNo() %>">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style-img">
                        <div id='demo<%= list.get(i).getRowNum() %>' class='carousel' data-interval='false'>
                            <div class='carousel-inner'>
                        	<% for(int j=0; j < ilist.size(); j++) { %>
                                <% if(list.get(i).getStyleNo() == ilist.get(j).getStyleNo() && ilist.get(j).getFileLevel() == 1) { %>
                                <div class='carousel-item active'>
                                    <img class='cimg' src='<%= contextPath %>/<%= ilist.get(j).getFilePath() %><%= ilist.get(j).getChangeName() %>'>
                                </div>
                                <% } else if(list.get(i).getStyleNo() == ilist.get(j).getStyleNo() && ilist.get(j).getFileLevel() == 2) { %>
                                <div class='carousel-item'>
                                    <img class='cimg' src='<%= contextPath %>/<%= ilist.get(j).getFilePath() %><%= ilist.get(j).getChangeName() %>'>
                                </div>
                                <% } %>
                            <% } %>
                            </div>
                            <a class='carousel-control-prev' href='#demo<%= list.get(i).getRowNum() %>' data-slide='prev'>
                                <span class='carousel-control-prev-icon'></span>
                            </a>
                            <a class='carousel-control-next' href='#demo<%= list.get(i).getRowNum() %>' data-slide='next'>
                                <span class='carousel-control-next-icon'></span> 
                            </a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class='pd-tag' colspan="3">
                        <span>상품태그</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class='pd-info'>
                        <% if(plist != null) { %>
                            <% for(int p=0; p< plist.size(); p++) { %>
                                <% if(list.get(i).getStyleNo() == plist.get(p).getStyleNo()) { %>
                                <div onclick="goPdDetail(this);">
                                    <input type='hidden' value='<%= plist.get(p).getProductCode() %>'>
                                    <img src='<%= contextPath %>/<%= plist.get(p).getProductImgM() %>'>
                                    <div><%= plist.get(p).getBrandName() %></div>
                                    <div><%= plist.get(p).getProductNameKo() %></div>
                                    <div><%= plist.get(p).getProductNameEng() %></div>
                                </div>
                                <% } %>
                            <% } %>
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td colspan='3' class='like-td'>
                    	<% if(checkLike[i] == 0){ %>
                        <a class='like btn'>🤍</a>
                        <% } else { %>
                        <a class='btn like'>❤</a>
                        <% } %>
                        <input type='hidden' class='styleNo' value='<%= list.get(i).getStyleNo() %>'>
                        <span class="count"><%= list.get(i).getCount() %></span>
                    </td>
                </tr>
                <tr>
                    <td class="text-td" colspan="3">
                        <% if(list.get(i).getContent() != null) { %>
                        <div class="text"><%= list.get(i).getContent() %></div>
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td colspan='3' class='tag-area'>
                        <div class='tag'>
                        	<% if(list.get(i).getHashtag() != null){ %>
                        		<% String[] tagArr = list.get(i).getHashtag().split(" "); %>
	                        	<% for(int t=0; t<tagArr.length; t++){ %>
	                            <a href='<%= contextPath %>/search.st?keyword=<%= URLEncoder.encode(tagArr[t], "UTF-8") %>'><%= tagArr[t] %></a>
	                            <% } %>
                            <% } %>
                        </div>
                    </td>
                </tr>
            </table>
            <% } %>
        </div>

        <img id="up-btn" src="<%= contextPath %>/resources/images/style/up.jpg">
        <img id="insert-btn" src="<%= contextPath %>/resources/images/style/insert.jpg">
        <br><br>
    </div>
    
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">문의유형 - 스타일 신고</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                    <div class="modal-body">
                        <div>신고할 아이디 : <span id="reportedId"></span></div>
                        <input type="hidden" id="reportedStyleNo" value="">
                        <input type="hidden" id="reportedUserNo" value="">
                        <br>
                        제목*
                        <br>
                        <input type="text" id="title">
                        <br><br>
                        내용*
                        <br>
                        <textarea cols="60" rows="10" id="content" style="resize: none;"></textarea>
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="report();">제출하기</button>
                        <button type="button" id="close-btn" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                <script>
                    function report(){
                        let reportedUserNo = $("#reportedUserNo").val();
                        let reportedStyleNo = $("#reportedStyleNo").val();
                        let title = $("#title").val();
                        let content = $("#content").val();

                        if(title == "" || content == ""){
                            alert("제목과 내용을 입력해주세요.");
                            return;
                        }

                        $("#close-btn").click();
                        $.ajax({
                            url:"<%= contextPath %>/reportStyle.ajax",
                            data:{"title":title, "content":content, "reportedUserNo":reportedUserNo, "reportedStyleNo":reportedStyleNo},
                            success:function(result){
                                alert("문의하신 스타일 탭의 콘텐츠 신고가 접수되었습니다.");
                            },
                            error:function(){
                                console.log("통신 실패");
                            }
                        })
                    }
                </script>
            </div>
        </div>
    </div>
	
    <script>
        $(".report-btn").click(function(){
            <% if(loginUser == null) { %>
                $(this).attr("data-target", "");
                alert("로그인 후 이용가능한 서비스입니다.");
                location.href = "<%= contextPath %>/loginForm.us";
            <% } else { %>
                $("#reportedId").text($(this).next().val());
                $("#reportedStyleNo").val($(this).next().next().val());
                $("#reportedUserNo").val($(this).next().next().next().val());
                $("#title").val("");
                $("#content").val("");
            <% } %>
        })

        let cpage = <%= cpage %>;
        let no = <%= no %>;
        let view = "<%= view %>";
            
        $(document).ready(function() {
            $('html, body').animate({
                scrollTop: $('#<%= no %>').offset().top - (300 * (no / 10))
            }, 'fast');
        });

        $(window).scroll(function() {
            if($(window).scrollTop() + $(window).height() == $(document).height()){
                cpage++;
                StyleList();
            }
        });

        function StyleList(){
            $.ajax({
                url:"<%= contextPath %>/detailStyle.ajax",
                type:"POST",
                data:{"cpage":cpage, "view":view},
                async : false,
                success:function(map){
                    let list = map.list;
                    let ilist = map.ilist;
                    let checkLike = map.checkLike;
                    let plist = map.plist;
                    
                    let value = "";
                    for(let i=0; i<list.length; i++){
                        value = "<table id='" + list[i].styleNo + "'>"
                                + "<tr>"
                                    + "<td class='profile-td'>"
                                        + "<input type='hidden' value='<%= no %>'>"
                                        + "<img src='<%= contextPath %>/" + list[i].profileImg + "' class='rounded-circle'>"
                                    + "</td>"
                                    + "<td class='nickname-td'>"
                                        + "<a class='nickname' href='<%= contextPath %>/profileView.st?nickname=" + list[i].styleWriter + "'>" + list[i].styleWriter + "</a>"
                                        + "<div class='date'>" + list[i].enrollDate + "</div>"
                                    + "</td>"
                                    + "<td class='report-td'>"
                                        + "<div class='dropdown'>"
                                            + "<button type='button' data-toggle='dropdown' class='dropdown'>❗</button>"
                                            + "<div class='dropdown-menu'>"
                                                + "<a class='dropdown-item' data-toggle='modal' data-target='#myModal'>스타일 신고</a>"
                                                + "<input type='hidden' value='" + list[i].userId + "''>"
                                                + "<input type='hidden' value='" + list[i].styleNo + "'>"
                                                + "<input type='hidden' value='" + list[i].userNo + "'>"
                                            + "</div>"
                                        + "</div>"
                                    + "</td>"
                                + "</tr>"
                                + "<tr>"
                                    + "<td colspan='3' class='style-img'>"
                                        + "<div id='demo" + list[i].rowNum + "' class='carousel' data-interval='false'>"
                                            + "<div class='carousel-inner'>";
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
                                            + "<a class='carousel-control-prev' href='#demo" + list[i].rowNum + "' data-slide='prev'>"
                                                + "<span class='carousel-control-prev-icon'></span>"
                                            + "</a>"
                                            + "<a class='carousel-control-next' href='#demo" + list[i].rowNum + "' data-slide='next'>"
                                                + "<span class='carousel-control-next-icon'></span> "
                                            + "</a>"
                                        + "</div>"
                                    + "</td>"
                                + "</tr>"
                                + "<tr>"
                                    + "<td class='pd-tag' colspan='3'>"
                                        + "<span>상품태그</span>"
                                    + "</td>"
                                + "</tr>"
                                + "<tr>"
                                    + "<td colspan='3' class='pd-info'>";
                    if(plist != null) {
                        for(let p=0; p<plist.length; p++){
                            if(list[i].styleNo == plist[p].styleNo) {
                                value += "<div onclick='goPdDetail(this);'>"
                                            + "<input type='hidden' value='" +  plist[p].productCode + "'>"
                                            + "<img src='<%= contextPath %>/" + plist[p].productImgM + "'>"
                                            + "<div> + " + plist[p].brandName + "</div>"
                                            + "<div>" + plist[p].productNameKo + "</div>"
                                            + "<div>" + plist[p].productNameEng + "</div>"
                                        + "</div>";
                            }
                        }
                    }
                            value += "</td>"
                                + "</tr>"
                                + "<tr>"
                                    + "<td colspan='3' class='like-td'>";
                            if(checkLike[i] == 0){
                                value += "<a class='like btn'>🤍</a>";
                            } else {
                                value += "<a class='like btn'>❤</a>";
                            }
                                value += "<input type='hidden' class='styleNo' value='" + list[i].styleNo + "'>"
                                        + "<span class='count'>" + list[i].count + "</span>"
                                    + "</td>"
                                + "</tr>"
                                + "<tr>"
                                    + "<td class='text-td' colspan='3'>";
                            if(list[i].content != null) {
                                value += "<div class='text'>" + list[i].content + "</div>";
                            }
                            value += "</td>"
                                + "</tr>"
                                + "<tr>"
                                    + "<td colspan='3' class='tag-area'>"
                                        + "<div class='tag'>";
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

        $(document).on("click", ".like", function(){
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

        $(function(){
            $(".pd-info").each(function(){
                if($(this).children().length == 0){
                    $(this).parent().prev().children().children().remove();
                }
            })
        })

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

        function goPdDetail(e){
            location.href = "<%= contextPath %>/detail.pd?co=" + $(e).children().eq(0).val();
        }
    </script>

</body>
</html>