<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.scale.style.model.vo.*
			  , java.util.ArrayList
			  , com.scale.product.model.vo.Product" 
%>
<%
	Style st = (Style)request.getAttribute("st");
    ArrayList<StyleImg> ilist = (ArrayList<StyleImg>)request.getAttribute("ilist");
    ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("plist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1200px;
        margin:auto;
    }
    table{width: 400px; box-sizing: border-box;}

    .profile-td{width: 70px; height: 85px;}
    .profile-td>img{width: 70px; height: 70px; box-sizing: border-box;}

    .nickname-td>div{margin-left: 10px;}
    .nickname{
        font-size: 20px; 
        font-weight: bold; 
        margin-left: 10px;
        text-decoration: none;
        color: black;
    }
    .date{font-size: 12px; margin-left: 10px;}

    .cimg{width: 400px; height: 400px;} 
    
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

    .text, .tag{width: 400px;}
    .tag-area{width: 400px;}
</style>
</head>
<body>

    <%@ include file="../common/adminMenubar.jsp" %>

    <div class="outer" align="center">

        <table>
            <tr>
                <td class="profile-td">
                    <img src="<%= contextPath %>/<%= st.getProfileImg() %>" class="rounded-circle">
                </td>
                <td class="nickname-td">
                    <div class="nickname"><%= st.getStyleWriter() %></div>
                    <div class="date"><%= st.getEnrollDate() %></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style-img">
                    <div id='demo<%= st.getStyleNo() %>' class='carousel' data-interval='false'>
                        <div class='carousel-inner'>
                        <% for(int j=0; j<ilist.size(); j++) { %>
                            <% if(st.getStyleNo() == ilist.get(j).getStyleNo() && ilist.get(j).getFileLevel() == 1) { %>
                                <div class='carousel-item active'>
                                    <img class='cimg' src='<%= contextPath %>/<%= ilist.get(j).getFilePath() %><%= ilist.get(j).getChangeName() %>' onclick='detail(this);'>
                                </div>
                            <% } else if(st.getStyleNo() == ilist.get(j).getStyleNo() && ilist.get(j).getFileLevel() == 2) { %>
                                <div class='carousel-item'>
                                    <img class='cimg' src='<%= contextPath %>/<%= ilist.get(j).getFilePath() %><%= ilist.get(j).getChangeName() %>' onclick='detail(this);'>
                                </div>
                            <% } %>
                        <% } %>
                        </div>
                        <a class="carousel-control-prev" href="#demo<%= st.getStyleNo() %>" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#demo<%= st.getStyleNo() %>" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="pd-tag">상품태그</td>
            </tr>
            <tr>
                <td colspan="3" class='pd-info'>
                    <% if(plist != null) { %>
                        <% for(int p=0; p< plist.size(); p++) { %>
                            <% if(st.getStyleNo() == plist.get(p).getStyleNo()) { %>
                            <div>
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
                <td colspan="3">
                    <div><%= st.getContent() %></div>
                </td>
            </tr>
            <tr>
                <td colspan='3' class='tag-area'>
                    <div class='tag'>
                        <% if(st.getHashtag() != null){ %>
                            <% String[] tagArr = st.getHashtag().split(" "); %>
                            <% for(int t=0; t<tagArr.length; t++){ %>
                            <span><%= tagArr[t] %></span>
                            <% } %>
                        <% } %>
                    </div>
                </td>
            </tr>
        </table>

        <br><br>

        <div align="center">
        	<a href="<%= contextPath %>/deleteStyle.ad?no=<%= st.getStyleNo() %>" class="btn btn-danger">삭제하기</a>
            <a class="btn btn-secondary" onclick="history.back()">목록가기</a>
        </div>

    </div>

    <script>
        $(function(){
            if($(this).children().length == 0){
                $(this).parent().prev().children().children().remove();
            }
        })
    </script>
</body>
</html>