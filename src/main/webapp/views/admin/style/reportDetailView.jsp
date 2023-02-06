<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.style.model.vo.*, java.util.ArrayList, com.scale.product.model.vo.Product" %>
<%
	Style st = (Style)request.getAttribute("st");
	ArrayList<StyleImg> ilist = (ArrayList<StyleImg>)request.getAttribute("ilist");
	ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("plist");
    StyleReport rep = (StyleReport)request.getAttribute("rep");
    int cpage = (int)request.getAttribute("cpage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
    }
    #btn{width: 1200px;}
    #btn1{width: 600px;}
    #btn2{width: 600px; text-align: right;}

    #report{
        width: 1200px; 
        border: 1px solid black;
        text-align: center;
    }
    
    #title, #user>td{height: 50px; font-weight: bold;}
    #title{font-size: 17px;}
        
    #content{height: 350px; padding-left: 50px; }
    #content>div{
        width: 1100px;
        height: 300px;
        background-color: lightgray;
        line-height: 300px;
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

    <%@ include file="../common/adminMenubar.jsp"%>

    <div class="outer">
        <br><br><br><br><br>
        <table id="btn">
            <tr>
                <td id="btn1">
                    <button class="btn btn-secondary" data-toggle="modal" data-target="#myModal">신고게시글 보기</button>
                </td>
                <td id="btn2">
                    <a class="btn btn-info" id="report-btn">신고처리</a>
                    <a class="btn btn-danger" id="reject-btn">반려</a>
                </td>
            </tr>
        </table>
        
        <br>

        <table id="report">
            <tr>
                <td colspan="7" id="title">
                    <span>제목 : </span><%= rep.getTitle() %><span></span>
                </td>
            </tr>
            <tr id="user">
                <td >
                    <span>피신고자 : </span>
                    <span><%= rep.getReportedId() %></span>
                </td>
                <td>|</td>
                <td>
                    <span>신고일 : </span>
                    <span><%= rep.getReportedDate() %></span>
                </td>
                <td>|</td>
                <td>
                    <span>신고자 : </span>
                    <span><%= rep.getReportingId() %></span>
                </td>
                <td>|</td>
                <td>
                    <span>처리상태 : </span>
                    <% switch(rep.getReportCheck()) { 
                        case "0": rep.setReportCheck("신고접수"); break;
                        case "1": rep.setReportCheck("처리완료"); break;
                        case "2": rep.setReportCheck("반려"); break;
                     } %>
                    <span>
                    	<%= rep.getReportCheck() %>
                    </span>
                </td>
            </tr>
            <tr>
                <td colspan="7" id="content">
                    <div>
                        <%= rep.getContent() %>
                    </div>
                </td>
            </tr>
        </table>

        <br><br>

        <div align="center">
            <a onclick="location.href='<%= contextPath %>/stylereport.ad?cpage=<%= cpage %>';" class="btn btn-secondary">목록 보기</a>
        </div>

    </div>

    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
    
                <!-- Modal body -->
                <div class="modal-body" align="center">
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
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
  
            </div>
        </div>
    </div>

    <script>
        $(function(){
            if($(".pd-info").children().length == 0){
                $(".pd-tag").remove();
            }
        })

        $("#reject-btn").click(function(){
            location.href = "<%= contextPath %>/rejectReport.ad?repNo=<%= rep.getReportNo() %>&styleNo=<%= st.getStyleNo() %>&cpage=<%= cpage %>";
        })

        $("#report-btn").click(function(){ 
            location.href = "<%= contextPath %>/processreport.ad?repNo=<%= rep.getReportNo() %>&userNo=<%= rep.getReportedUser() %>&styleNo=<%= st.getStyleNo() %>&cpage=<%= cpage %>";
        })
    </script>
    
</body>
</html>