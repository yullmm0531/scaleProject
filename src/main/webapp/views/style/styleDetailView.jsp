<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.scale.style.model.vo.*, com.scale.product.model.vo.Product"%>
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

    .nickname-td>div{margin-left: 10px;}
    .nickname{font-size: 20px; font-weight: bold;}
    .date{font-size: 12px;}

    .cimg{width: 400px; height: 400px;} 

    .report-td{text-align: right;}

    
    
    .pd-tag{font-size: 20px; font-weight: bold;}
    .pd-info>div{float: left; width: 70px; margin-right: 5px;}
    .pd-info img{width: 70px; height: 70px; box-sizing: border-box;}
    .pd-info div{width: 70px; font-size: 12px;}

    .like-td{font-size: 15px;}
    .like{padding:0px !important;}

    .text, .tag{
    	text-overflow:ellipsis; 
    	overflow:hidden;
    	width:400px;
    	white-space:nowrap;
    }
    .tag-area{height: 27px;}
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
                        <div class="nickname"><%= list.get(i).getStyleWriter() %></div>
                        <div class="date"><%= list.get(i).getEnrollDate() %></div>
                    </td>
                    <td class="report-td">
                        <button type="button">!</button>
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
                        <a class='btn smile'>❤</a>
                        <% } %>
                        <span class="count"><%= list.get(i).getCount() %></span>
                    </td>
                </tr>
                <tr>
                    <td class="text-td" colspan="3">
                        <div class="text"><%= list.get(i).getContent() %></div>
                    </td>
                </tr>
                <tr>
                    <td colspan='3' class='tag-area'>
                        <div class='tag'>
                        	<% if(list.get(i).getHashtag() != null){ %>
                        		<% String[] tagArr = list.get(i).getHashtag().split(" "); %>
	                        	<% for(int t=0; t<tagArr.length; t++){ %>
	                            <a href=''><%= tagArr[t] %></a>
	                            <% } %>
                            <% } %>
                        </div>
                    </td>
                </tr>
            </table>
            <% } %>
        </div>
        <table>
            <tr>
                <td class="profile-td">
                    <input type='hidden' id='1' value='1'>
                    <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                </td>
                <td class="nickname-td">
                    <div class="nickname">닉네임</div>
                    <div class="date">작성일</div>
                </td>
                <td class="report-td">
                    <button type="button">!</button>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="style-img">
                    <div id='demo1' class='carousel' data-interval='false'>
                        <div class='carousel-inner'>
                            <div class='carousel-item active'>
                                <img class='cimg' src='<%= contextPath %>/resources/images/style/city1.jpg'>
                            </div>
                            <div class='carousel-item'>
                                <img class='cimg' src='<%= contextPath %>/resources/images/style/city1.jpg'>
                            </div>
                            <div class='carousel-item'>
                                <img class='cimg' src='<%= contextPath %>/resources/images/style/city1.jpg'>
                            </div>
                            <div class='carousel-item'>
                                <img class='cimg' src='<%= contextPath %>/resources/images/style/city1.jpg'>
                            </div>
                        </div>
                        <a class='carousel-control-prev' href='#demo1' data-slide='prev'>
                            <span class='carousel-control-prev-icon'></span>
                        </a>
                        <a class='carousel-control-next' href='#demo1' data-slide='next'>
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
                    <div>
                        <img src='<%= contextPath %>/resources/images/style/city1.jpg'>
                        <div>브랜드</div>
                        <div>한글이름</div>
                        <div>영어이름</div>
                    </div>
                    <div class='pd-img'>
                        <img src='<%= contextPath %>/resources/images/style/city1.jpg'>
                        <div>브랜드</div>
                        <div>한글이름</div>
                        <div>영어이름</div>
                    </div>
                    <div class='pd-img'>
                        <img src='<%= contextPath %>/resources/images/style/city1.jpg'>
                        <div>브랜드</div>
                        <div>한글이름</div>
                        <div>영어이름</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan='3' class='like-td'>
                    <a class='like btn'>🤍</a>
                    <span class="count">100</span>
                </td>
            </tr>
            <tr>
                <td class="text-td" colspan="3">
                    <div class="text">xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</div>
                </td>
            </tr>
            <tr>
                <td colspan='3' class='tag-area'>
                    <div class='tag'>
                        <a href=''>#xxx</a>
                        <a href=''>#xxx</a>
                        <a href=''>#xxx</a>
                        <a href=''>#xxx</a>
                        <a href=''>#xxx</a>
                        <a href=''>#xxx</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
	
    <script>
        let cpage = <%= cpage %>;
        let no = <%= no %>;
        let view = "<%= view %>";

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
                        value = "<table class='set'>"
                                    + "<tr>"
                                        + "<td class='profile-td'>"
                                            + "<input type='hidden' id='" + list[i].styleNo + "' value='" + list[i].styleNo + "'>"
                                            + "<img src='<%= contextPath %>/" + list[i].profileImg + "' class='rounded-circle'>"
                                        + "</td>"
                                        + "<td class='nickname-td'>"
                                            + "<div class='nickname'>" + list[i].userNickName + "</div>"
                                            + "<div class='date'>" + list[i].modifyDate + "</div>"
                                        + "</td>"
                                        + "<td class='report-td'>"
                                            + "<button type='button'>!</button>"
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
                                                + "<a class='carousel-control-prev' href='#demo" +  list[i].rowNum + "' data-slide='prev'>"
                                                + "<span class='carousel-control-prev-icon'></span>"
                                                + "</a>"
                                                + "<a class='carousel-control-next' href='#demo" + list[i].rowNum + "' data-slide='next'>"
                                                + "<span class='carousel-control-next-icon'></span>" 
                                                + "</a>"
                                            + "</div>"
                                        + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                        + "<td colspan='3' class='pd-tag'>상품태그</td>"
                                    + "</tr>"
                                    + "<tr>"
                                        + "<td colspan='3'>"
                        for(let p=0; p<plist.length; p++){
                                    value += "<div class='pd-img'>"
                                                + "<img src='<%= contextPath %>/" + plist[p].productImgM + "'>"
                                                + "<div>" + plist[p].brandName + "</div>"
                                                + "<div>" + plist[p].productNameKo + "</div>"
                                                + "<div>" + plist[p].productNameEng + "</div>"
                                            + "</div>"
                        }
                                value =+ "</td>"
                                    + "</tr>";
                                    + "<tr>"
                                        + "<td colspan='3' class='like'>";
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
                                        + "<div>내용</div>"
                                    + "</tr>"
                                    + "<tr>"
                                        + "<td colspan='3' class='tag-area'>"
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