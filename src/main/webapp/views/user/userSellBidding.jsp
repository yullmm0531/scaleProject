<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.scale.product.model.vo.Product"%>
    <%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	%>
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
        .sellingList-div{ width: 30%;}
        #sellingList-div1{float: left;}
        #sellingList-div2{float: left;}
        #sellingList-div3{float: left;}
        
        .wrap-div{
            
            width:60%;
            height:250px;
        }

        .sell-product-div1, .sell-product-div2, .sell-product-div3, .sell-product-div4{
            
            height:100%;
            box-sizing:border-box;
            /*display:inline-block;*/
            float:left;
        }
        #sell-img{
        	width:100%;
        	height:100%;
        	
        }
        .sell-product-div1{
            width:30%;
        }
        .sell-product-div2{
            width:25%;
        }
        .sell-product-div3{
            width:25%;
            text-align: center;
            padding: 100px 0;
            
        }
        .sell-product-div4{
            width:20%;
            text-align: center;
            padding: 100px 0;
        }
        
        

        
        .brand-name, .product-ex{
            
            width:100%;
            /*height:50%;*/
            box-sizing:border-box;
        }
        .brand-name{
            height:40%;
            text-align: center;
            padding: 20px 0;
            font-weight: 800;
        }
        .product-ex{
            height:60%;
            text-align: center;
            margin-top: -30%;
            font-weight: 500;
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
                                <li><a href="<%=contextPath %>/userBuyList.us?userNo=<%=userNo%>">구매내역</a></li>
                                <li><a href="<%=contextPath %>/userSellList.us?userNo=<%=userNo%>">판매내역</a></li>
                                
                                

                                <li><a href="<%=contextPath %>/userSellBidding.us?userNo=<%=userNo%>">판매입찰</a></li>
                                
                                
                            </ul>
                        </li>
                    </div>
                    <br><br><br><br><br><br><br><br><br><br><br>
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
	
	
	
	
	
	
	<!-- 영역구분 -->
	
	 <div id="content-2">
	 
	 	<div class="outer">
        
        <br><br>
        <div class="title-div">
        	<h4>판매한 상품 목록</h4>
        </div>
        
        
        <% for(Product p : list){ %>
         <div class="wrap-div" style=" cursor: pointer;" onclick="test1(<%=p.getProductCode2()%>,'<%=p.getProductSize() %>',<%=userNo%>);">
         		
         		<input type="hidden" value="<%= p.getBiddingNo() %>">
            <div class="sell-product-div1">
                <div class="img">
                    <img src="<%=p.getProductImgM() %>" alt="사용자이미지" id="sell-img">
                </div>
            </div>
            <div class="sell-product-div2">
                <div class="brand-name"><%=p.getBrandName() %></div>
                <br><br>
                <div class="product-ex"><%=p.getProductNameEng() %></div>
            </div>
            <div class="sell-product-div3"><%=p.getBiddingDate() %></div>
            
            
            
            
            
            
        </div>
        <button onclick="drop(<%=p.getBiddingNo()%>,<%=userNo%>);">입찰취소</button>
        <% } %>
        
        <script>
    	
    	
    	function test1(e1,e2,e3){
    		console.log(e2);
    		location.href = "<%=contextPath%>/userDetailSellBidding.us?productCode2=" + e1 + "&productSize=" + e2 + "&userNo=" + e3;
    	}
    </script>
    
    <script>
            	function drop(e1,e2){
            		location.href = "<%=contextPath%>/userSellBiddingDrop.us?biddingNo=" + e1 + "&userNo=" + e2;
            	}
            </script>
        
    </div>
	 
	 </div>

    
</body>
</html>