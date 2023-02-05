<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>

#thumb_img{
            width: 50%;
            height: 50%;
            border-radius: 100%;
            border-top-left-radius: 100%;
            border-top-right-radius: 100%;
            border-bottom-right-radius: 100%;
            border-bottom-left-radius: 100%;

            border: 0;
    border-top-width: 0px;
    border-right-width: 0px;
    border-bottom-width: 0px;
    border-left-width: 0px;
    border-top-style: initial;
    border-right-style: initial;
    border-bottom-style: initial;
    border-left-style: initial;
    border-top-color: initial;
    border-right-color: initial;
    border-bottom-color: initial;
    border-left-color: initial;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    
    box-sizing: border-box;
        }
        
        .user_detail{
            border: 1px solid white;
            width: 100%;
            
            margin-left: 5%;
        }
        .user_thumb{
            border: 1px solid white;
            width: 20%;
            height: 80%;
            float: left;
            margin-top: 1.9%;
            margin-left: 1%;
        }
        #thumb_img{width: 100%; height: 100%;}
        .user_info{
            border: 1px solid gray;
            width:  70%;
            height: 100%;
        }
        .info_box{width: 50%;
                  margin-left: 15%;
                  margin-top: 5%;
        }
        
        .email{margin-left: 29%;}
        
        
        #toProfile{background-color: gray;}
        #toMyStyle{background-color: gray;}
        .outLine{position: relative;}
        #sellingList{margin-left: 6%;}
        #buyingList{margin-left: 5%;}

        .userSelling{
            border: 1px soild black;
            background-color: gray;
            height: 120px;
            width: 90%;
            position: absolute;
            left: 0;
            right: 0;
            margin-left: auto;
            margin-right: auto;
        }
        .userBuying{
            border: 1px soild black;
            background-color: gray;
            height: 120px;
            width: 90%;
            position: absolute;
            left: 0;
            right: 0;
            margin-left: auto;
            margin-right: auto;
            margin-top: 12%;
        }
        .userSellingBox{margin-left: 5%;}
        .userBuyingBox{margin-left: 5%;}
        #buyingList-div{float: left; margin-top: -6%; width: 150px;}
        .a{width: 100px; display: inline-block; margin-top: 1.6%; margin-right: 8%;}
        .b{width: 100px; display: inline-block; margin-top: 1.6%; margin-right: 12%;}
        .buttonDiv1{display: inline-block; float: right;margin-top: -5%;}
        .buttonDiv2{display: inline-block; float: right; margin-top: 7%;}
        #buttonDiv3{display: inline-block; float: right; margin-top: -2%;}

        .sideMenu-div{
            list-style-type:none; /*불릿기호 없애기*/
            padding: 0;
            margin: 0;
            width: 800px;
            height: 100%;

        }
        .sideMenu-div>li{
            border: 1px solid blue;
            float: left;
            width: 15%;
            height: 100%;
            transform: scale(1);
        }
        .sideMenu-div a{
            /*공백은 후손선택자*/
            border:1px solid orange;
            text-decoration:none;
            color: orange;
            font-size: 18px;
            font-weight: 900;
            width: 100%;
            height: 100%;
            display:block;
            text-align:center;
            /*vertical-align:middle;*/
            line-height: 35px;
        }
        .sideMenu-div a:hover{color: orangered;}

        .sideMenu-div>li>ul{
            list-style-type:none;
            padding:0;
            margin:0;
            display:none;
        }
        .sideMenu-div>li>ul a{ font-size:15px;}

        .sideMenu-div>li:hover>ul{
            display:block;
        }

        #likeList-div{margin-top: 30%;margin-left: 6%;}

        .sideMenu-area{margin-top: 30%;}




        div{
            box-sizing: border-box;
            
        }
        .wrap{
            width:1000px;
            height: auto;
            margin:auto;
        }

        .wrap>div{
            width: 100%;
        }
        
        #content{height:55%;}
       

         #content>div {
            height:100%;
            float:left;
        }

        #content-1{width:20%}
        #content-2{width:80%}
        
        .nickName{margin-left: 30%;}
        
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<%
		int userNo = loginUser.getUserNo();
	%>
	
	<div class="wrap">
        <div id="content">
            <div id="content-1">
                <div class="sideMenu-area">
                    <div class="sideMenu-div">
                        <li><a href="">쇼핑정보</a>
                            <ul>
                                <li><a href="<%=contextPath %>/userBuyList.us?userNo=<%=userNo%>">구매내역</a></li>
                                
                                <li>
                                	<a href="<%=contextPath %>/userSellList.us?userNo=<%=userNo%>">판매내역</a>
                                	<!-- 
                                	<form action="<%= contextPath %>/userSellList.us" method="post">
					        			<input type="hidden" name="userNo" value="<%=userNo%>">
					        	
					        			<button type="submit" class="btn btn-secondary btn-sm" class="moveList">판매내역</button>
				        			</form>
				        			 -->
                                </li>
                                
                                <li><a href="">구매입찰</a></li>

                                <li><a href="<%=contextPath %>/userSellBidding.us?userNo=<%=userNo%>">판매입찰</a></li>
                                
                                <li><a href="<%=contextPath %>/userLikeList.us">찜목록</a></li>
                            </ul>
                        </li>
                    </div>
                    <br><br><br><br><br><br><br><br><br><br><br>
                    <div class="sideMenu-div">
                        <li><a href="">내정보</a>
                            <ul>
                                <li><a href="<%=contextPath%>/userInfoUpdate.us">회원정보수정</a></li>
                                <li><a href="<%=contextPath%>/paymentAndShippingOnlyView.us?userNo=<%=userNo%>">결제 및 배송정보</a></li>
                                
                            </ul>
                        </li>
                    </div>
                </div>
            </div>
            
            <%
            	String userId = loginUser.getUserId();
            	String email = loginUser.getEmail();
            	String nickName = loginUser.getUserNickName();
            %>

            <div id="content-2">

                <div class="outer">
                    <div class="userMembership">
            
                        <div class="user_detail">
                            <div class="user_thumb">
                                <img src="" alt="사용자이미지" id="thumb_img">
                                
                            </div>
                            <div class="user_info">
                                <div class="info_box" align="center">
                                    <p class="name"><%=userId %></p>
                                    <p class="nickName"><%=nickName %></p>
                                    <p class="email"><%=email %></p>
                                    <a href="" class="btn btn outlinegrey small" type="button" id="toProfile">프로필 편집</a>
                                    <a href="<%= contextPath %>/profileView.st?cpage=1&userNo=<%= loginUser.getUserNo() %>" class="btn btn btn_my_style outlinegrey small" type="button" id="toMyStyle">내 스타일</a>
                                </div>
                            </div>
                        </div>
            
                    </div>
                    <br><br>
                    <div class="inside-outer">
                        <h4 id="sellingList">판매내역</h4>
                    <div class="buttonDiv1"><a href="<%=contextPath %>/userSellList.us" type="button" class="btn btn-dark" id="selligDetail">더보기</a></div>
                        <div class="outLine">  
                            <div class="userSelling">
                                <div class="userSellingBox" align="center">
                                    <div class="a">
                                        <span>발송중<br>0</span>
                                    </div>
                                    <div class="a">
                                        <span>발송중<br>0</span>
                                    </div>
                                    <div class="a">
                                        <span>발송중<br>0</span>
                                    </div>
                                    <div class="a">
                                        <span>발송중<br>0</span>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    <br><br><br><br>
                    </div>
                    
            
                    
                    <div class="inside-outer">
                        <div class="buttonDiv2"><a href="<%=contextPath %>/userBuyList.us" type="button" class="btn btn-dark">더보기</a></div>
                
                        <div class="outLine">
                            
                            <div class="userBuying">
                                <div id="buyingList-div"><h4 id="buyingList">구매내역</h4></div>
                                <div class="userBuyingBox" align="center">
                                    <div class="b">
                                        <span>발송중<br>0</span>
                                    </div>
                                    <div class="b">
                                        <span>발송중<br>0</span>
                                    </div>
                                    <div class="b">
                                        <span>발송중<br>0</span>
                                    </div>
                                    <div class="b">
                                        <span>발송중<br>0</span>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                        
            
                        <div id="likeList-div">
                            <h4 id="likeList">찜 목록</h4>
                            <a href="<%=contextPath %>/userLikeList.us" type="button" class="btn btn-dark" id="buttonDiv3">찜 더보기</a>
                        </div>
                </div>

            </div>
            
        </div>
    </div>
</body>
</html>