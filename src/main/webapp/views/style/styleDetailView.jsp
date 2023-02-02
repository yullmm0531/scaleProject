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
    .pd-info>div{float: left; width: 70px; margin-right: 5px;}
    .pd-info img{width: 70px; height: 70px; box-sizing: border-box;}
    .pd-info div{width: 70px; font-size: 12px;text-overflow:ellipsis; 
    	overflow:hidden;
    	white-space:nowrap;}

    .like-td{font-size: 15px;}
    .like{padding:0px !important;}

    .text, .tag{
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	width:400px;
    	white-space:nowrap;
    }
    .tag-area{height: 27px;}

    .dropdown{
        background-color: white;
        border: 0px;
    }
    #title{
        width: 462px;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div class="set-container">
            <% for(int i=0; i< list.size() ; i++) { %>
            <table>
                <tr>
                    <td class="profile-td">
                        <input type='hidden' id='<%= no %>' value='<%= no %>'>
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
                              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">스타일 신고</a>
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
                        <% for(int p=0; p< plist.size(); p++) { %>
	                        <% if(list.get(i).getStyleNo() == plist.get(p).getStyleNo()) { %>
	                        <div>
	                            <img src='<%= contextPath %>/<%= plist.get(p).getProductImgM() %>'>
	                            <div><%= plist.get(p).getBrandName() %></div>
	                            <div><%= plist.get(p).getProductNameKo() %></div>
	                            <div><%= plist.get(p).getProductNameEng() %></div>
	                        </div>
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
            <form action="">
                신고할 아이디 : <span>xxxx</span>
                <br><br>
                제목*
                <br>
                <input type="text" name="title" id="title">
                <br><br>
                내용*
                <br>
                <textarea cols="60" rows="10" name="content" id="content"></textarea>
                </form>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-secondary">제출하기</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
    
        </div>
        </div>
    </div>
	
    <script>
        let cpage = <%= cpage %>;
        let no = <%= no %>;
        let view = "<%= view %>";

        $(window).scroll(function() {
            if($(window).scrollTop() + $(window).height() == $(document).height()){
                cpage++;
                StyleList();
            }
        });

        function StyleList(){
            $.ajax({
                url:"<%= contextPath %>/detail.ajax",
                type:"POST",
                data:{"cpage":cpage, "view":view},
                success:function(map){
                    let list = map.list;
                    let ilist = map.ilist;
                    let checkLike = map.checkLike;
                    let plist = map.plist;
                    
                    let value = "";
                    for(let i=0; i<list.length; i++){
                        value = "<table>"
                                + "<tr>"
                                    + "<td class='profile-td'>"
                                        + "<input type='hidden' id='<%= no %>' value='<%= no %>'>"
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
                                                    + "<img class='cimg' src='<%= contextPath %> /" + ilist[j].filePath + ilist[j].changeName + "'>"
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
                                    + "<td class='pd-tag' colspan='3'>";
                                        + "<span>상품태그</span>";
                                    + "</td>"
                                + "</tr>"
                                + "<tr>"
                                    + "<td colspan='3' class='pd-info'>";
                        for(let p=0; p<plist.length; p++){
                            if(list.get(i).getStyleNo() == plist.get(p).getStyleNo()) {
                                value += "<div>"
                                            + "<img src='<%= contextPath %>/" + plist[p].productImgM + "'>"
                                            + "<div> + " + plist[p].brandName + "</div>"
                                            + "<div>" + plist[p].productNameKo + "</div>"
                                            + "<div>" + plist[p].productNameEng + "</div>"
                                        + "</div>";
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
    </script>

</body>
</html>