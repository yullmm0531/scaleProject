<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cpage = (int)request.getAttribute("cpage");
	String no = (String)request.getAttribute("no");
    String view = (String)request.getAttribute("view");
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
    table{width: 400px; box-sizing: border-box;}

    .profile{width: 40px; height: 70px;}
    .profile>img{width: 40px; height: 40px;}

    .n-d>div{margin-left: 10px;}
    .nickname{font-size: 20px; font-weight: bold;}
    .date{font-size: 12px;}
    .report{text-align: right;}

    .style-img>img{width: 400px; height: 400px;}
    
    .pd-tag{font-size: 20px; font-weight: bold;}
    .pd-img{float: left; width: 70px;}
    .pd-img>img{width: 60px; height: 60px;}
    .pd-img>div{width: 100px; font-size: 12px;}

    .like{font-size: 15px;}
    .like>span{margin-left: 10px;}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div class="set-container">

        </div>
        <table>
            <tr>
                <td class="profile">
                    <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                </td>
                <td class="n-d">
                    <div class="nickname">닉네임</div>
                    <div class="date">작성일</div>
                </td>
                <td class="report">
                    <button type="button">!</button>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="style-img">
                    <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                </td>
            </tr>
            <tr>
                <td colspan="3" class="pd-tag">상품태그</td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="pd-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                        <div>상품정보</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="like">😊<span>좋아요 100개</span></td>
            </tr>
            <tr>
                <td colspan="3">
                    <div>올블랙 최고~!</div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div>#결산템챌린지 #셋업코디</div>
                </td>
            </tr>
        </table>
        <br>
        <table>
            <tr>
                <td class="profile">
                    <img src="<%= contextPath %>/resources/images/style/city1.jpg" class="rounded-circle">
                </td>
                <td class="n-d">
                    <div class="nickname">닉네임</div>
                    <div class="date">작성일</div>
                </td>
                <td class="report">
                    <button type="button">!</button>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="style-img">
                    <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                </td>
            </tr>
            <tr>
                <td colspan="3" class="pd-tag">상품태그</td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="pd-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                        <div>상품정보</div>
                    </div>
                    <div class="pd-img">
                        <img src="<%= contextPath %>/resources/images/style/city1.jpg">
                        <div>상품정보</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="like">😊<span>좋아요 100개</span></td>
            </tr>
            <tr>
                <td colspan="3">
                    <div>올블랙 최고~! #결산템챌린지 #셋업코디</div>
                </td>
            </tr>
        </table>
    </div>
	
    <script>
        let cpage = <%= cpage %>;
        let no = <%= no %>;
        let view = <%= view %>;

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
                                        + "<td class='profile'>"
                                            + "<input type='hidden' id='" + list[i].styleNo + "' value='" + list[i].styleNo + "'>"
                                            + "<img src='" + list[i].profileImg + "' class='rounded-circle'>"
                                        + "</td>"
                                        + "<td class='n-d'>"
                                            + "<div class='nickname'>" + list[i].userNickName + "</div>"
                                            + "<div class='date'>" + list[i].modifyDate + "</div>"
                                        + "</td>"
                                        + "<td class='report'>"
                                            + "<button type='button'>!</button>"
                                        + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                        + "<td colspan='2' class='style-img'>"
                                            + "<div id='demo" + list[i].rowNum + "' class='carousel' data-interval='false'>"
                                                + "<div class='carousel-inner'>";
                                    for(let j=0; j<ilist.length; j++){
                                        if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 1) {
                                            value += "<div class='carousel-item active'>"
                                                        + "<img class='cimg' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "'>"
                                                    + "</div>";
                                        } else if(list[i].styleNo == ilist[j].styleNo && ilist[j].fileLevel == 2) {
                                            value += "<div class='carousel-item'>"
                                                        + "<img class='cimg' vlaue='dd' src='<%= contextPath %>/" + ilist[j].filePath + ilist[j].changeName + "'>"
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
                                        + "<td colspan='3' class='pd-tag'>상품태그</td>"
                                    + "</tr>";
                                    
                        for(let p=0; p<plist.length; p++){
                            value += "<tr>"
                                        + "<td colspan='3'>"
                                            + "<div class='pd-img'>"
                                                + "<img src='" + plist[i].productImg + "'>"
                                                + "<div>" + plist[i].brand + "</div>"
                                                + "<div>" + plist[i].nameKo + "</div>"
                                                + "<div>" + plist[i].nameEng + "</div>"
                                            + "</div>"
                                        + "</td>"
                                    + "</tr>";
                        }
                                    
                            value =+ "<tr>"
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