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
        .outer{margin-left: 30%;}
        #list-outLine{width: 800px;height: 100px;}
        #list-outLine2{margin-left: 15%; }
        .buyingList-div{ width: 30%;}
        #buyingList-div1{float: left;}
        #buyingList-div2{float: left;}
        #buyingList-div3{float: left;}
        
        .outer{margin-left: 30%;}
        #list-outLine{width: 800px;height: 100px;}
        #list-outLine2{margin-left: 15%; }
        .sellingList-div{ width: 30%;}
        #sellingList-div1{float: left;}
        #sellingList-div2{float: left;}
        #sellingList-div3{float: left;}
        
        .wrap-div{
            border:5px solid red;
            width:60%;
            height:250px;
        }

        .buy-product-div1, .buy-product-div2, .buy-product-div3, .buy-product-div4{
            border:5px solid blue;
            height:100%;
            box-sizing:border-box;
            /*display:inline-block;*/
            float:left;
        }
        .buy-product-div1{
            width:30%;
        }
        .buy-product-div2{
            width:25%;
        }
        .buy-product-div3{
            width:25%;
        }
        .buy-product-div4{
            width:20%;
        }

        
        .product-name, .product-ex{
            border:5px solid yellow;
            width:100%;
            /*height:50%;*/
            box-sizing:border-box;
        }
        .product-name{
            height:40%;
        }
        .product-ex{
            height:60%;
        }
        
        
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
        

        .underline{border: 3px solid gray; width: 800px;}
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
			                                <li><a href="<%=contextPath %>/userBuyList.us">구매내역</a></li>
			                                <li><a href="<%=contextPath %>/userSellList.us?userNo=<%=userNo%>">판매내역</a></li>
			                                <li><a href="<%=contextPath %>/userLikeList.us">찜목록</a></li>
			                            </ul>
			                        </li>
			                    </div>
			                    <br><br><br><br><br><br><br><br>
			                    <div class="sideMenu-div">
			                        <li><a href="">내정보</a>
			                            <ul>
			                                <li><a href="<%=contextPath%>/userInfoUpdate.us">회원정보수정</a></li>
			                                <li><a href="<%=contextPath%>/UserPaymentAndShipping.us">">결제 및 배송정보</a></li>
			                                
			                            </ul>
			                        </li>
			                    </div>
			                </div>
			            </div>
	


	 <div id="content-2">
	 
				 <div class="outer">
			        <div class="title-div"><h4>구매내역</h4></div>
			
			            <div id="list-outLine">
			                <div id="list-outLine2">
			                    <div id="buyingList-div1" class="buyingList-div">
			                        <div class="buying-count" align="center"><span>0</span></div>
			                        <div class="buying-tag" align="center"><span>구매입찰</span></div>
			                    </div>
			                    <div id="buyingList-div2" class="buyingList-div">
			                        <div class="buying-count" align="center"><span>0</span></div>
			                        <div class="buying-tag" align="center"><span>진행중</span></div>
			                    </div>
			                    <div id="buyingList-div3" class="buyingList-div">
			                        <div class="buying-count" align="center"><span>0</span></div>
			                        <div class="buying-tag" align="center"><span>종료</span></div>
			                    </div>
			                </div>
			                
			        </div>
			        <div class="underline"></div>
			        <br><br>
			        <div class="title-div"><h4>구매한 상품 목록</h4></div>
			        
				        <div class="wrap-div">
				            <div class="buy-product-div1">
				                <div class="img">
				                    <img src="" alt="사용자이미지" id="buy-img">
				                </div>
				            </div>
				            <div class="buy-product-div2">
				                <div class="product-name"></div>
				                <div class="product-ex"></div>
				            </div>
				            <div class="buy-product-div3"></div>
				            <div class="buy-product-div4"></div>
				        </div>
			        
			        
			    </div>
	 
	 </div>
    
</body>
</html>