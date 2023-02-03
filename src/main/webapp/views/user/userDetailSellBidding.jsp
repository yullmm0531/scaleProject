<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.scale.bidding.model.vo.Bidding"%>
    
    <%
	Bidding b = (Bidding)request.getAttribute("b");
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
<style>
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
        
        .outer{margin-left: 30%;}
        
        #payment-fee-div{width: 800px;}
        #payment-fee-tag{width: 30%;  float: left;}
        #payment-fee{width: 70%; }

        #shipping-address-div{width: 800px;}
        #shipping-address-tag{width: 30%;  float: left;}
        #shipping-address{width: 70%;}

        #selling-account-div{width: 800px;}
        #selling-account-tag{width: 30%; float: left;}
        #selling-account{width: 70%; }

        #payment-info-div{width: 800px;}
        #payment-info{width: 30%;float: left;}
        
        
        .wrap-div{
            
            width:60%;
            height:250px;
        }

        .sell-product-div1, .sell-product-div2{
            
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
                                <li><a href="<%=contextPath%>/paymentAndShippingOnlyView.us">결제 및 배송정보</a></li>
                                
                            </ul>
                        </li>
                    </div>
                </div>
            </div>
            
            
            
            <!-- 영역구분 -->
            
       <div>
       	 <div class="outer">	    
		    <div id="content-2">
		    		
		    		<div class="title-div">
				            <h5>입찰중 거래</h5>
				            <div class="underline"></div>
				            
				            <span></span>
				            <div class="underline"></div>
				        </div>
				        
				        <br><br>
				        
				        <div class="wrap-div">
		         
				            <div class="sell-product-div1">
				                <div class="img">
				                    <img src="<%= b.getProductImgM() %>" alt="사용자이미지" id="sell-img">
				                </div>
				            </div>
				            <div class="sell-product-div2">
				                <div class="brand-name"><%= b.getProductNameEng() %></div>
				                <br><br>
				                <div class="product-ex"></div>
				            </div>
				        </div>
				        <br><br>
				
				        <div id="payment-form">
				            <div class="title-div">
				                <h5>판매입찰내역</h5>
				                <div class="underline"></div>
				            </div>
				                <div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>상품이름</span></div>
				                    <div id="payment-fee"><span><%= b.getProductNameKo() %></span></div>
				                </div>
				
				                <div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>사이즈</span></div>
				                    <div id="payment-fee"><span><%= b.getProductSize() %></span></div>
				                </div>
				
				                <div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>입찰가격</span></div>
				                    <div id="payment-fee"><span><%= b.getBiddingPrice() %></span></div>
				                </div>
				
				                <div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>입찰일</span></div>
				                    <div id="payment-fee"><span><%= b.getBiddingDate() %></span></div>
				                </div>
				                
				                <div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>검수비</span></div>
				                    <div id="payment-fee"><span><%= b.getInspectionCost() %></span></div>
				                </div>
				                
				                <div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>수수료</span></div>
				                    <div id="payment-fee"><span><%= b.getCommission() %></span></div>
				                </div>
				                
				                <%if(b.getDealCheck() == "N") { %>
				
				                <div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>배송비</span></div>
				                    <div id="payment-fee"><span>구매자부담</span></div>
				                </div>
				                
				                <% }else{ %>
				                	<div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>배송비</span></div>
				                    <div id="payment-fee"><span><%= b.getDeliveryFee() %></span></div>
				                </div>
				                <% } %>
				                
				                <div id="payment-fee-div">
				                    <div id="payment-fee-tag"><span>판매정산금액</span></div>
				                    <div id="payment-fee"><span><%= b.getAdjustmentPrice() %></span></div>
				                </div>
				
				                
				                <div class="underline"></div>
				        </div>
				    
				        <br>
				
				        <div id="shipping-request-form">
				            <div class="title-div">
				                <h5>판매정산계좌</h5>
				                <div class="underline"></div>
				            </div>
				            
				                <div id="selling-account-div">
				                    <div id="selling-account-tag"><span><%= b.getBankName() %></span></div>
				                    <div id="selling-account-tag"><span><%= b.getBankOwnerName() %></span></div>
				                    <div id="selling-account"><span><%= b.getBankAccount() %></span></div>
				                </div>
				                
				                <br>
				                
				        </div>
				
				        <div id="shipping-address-form">
				            <div class="title-div">
				                <h5>반송주소</h5>
				            </div>
				            <div class="underline"></div>
				                <div id="shipping-address-div">
				                    <div id="shipping-address-tag"><span>받는사람</span></div>
				                    <div id="shipping-address"><span><%= b.getRecipientName() %></span></div>
				                </div>
				
				                <div id="shipping-address-div">
				                    <div id="shipping-address-tag"><span>연락처</span></div>
				                    <div id="shipping-address"><span><%= b.getRecipientPhone() %></span></div>
				                </div>
				
				                <div id="shipping-address-div">
				                    <div id="shipping-address-tag"><span>주소</span></div>
				                    <div id="shipping-address-tag"><span><%= b.getRecipientZipCode() %></span></div>
				                    <div id="shipping-address"><span><%= b.getRecipientAddress() %></span></div>
				                </div>
				                <div class="underline"></div>
				        </div>
				        
				        <br><br>
				
				        <div id="shipping-request-form">
				            <div class="title-div">
				                <h5>배송 요청 사항</h5>
				                <div class="underline"></div>
				            </div>
				            
				                <div id="shipping-request-div">
				                    <div id="shipping-request-tag"><span>요청사항</span></div>
				                    <div id="shipping-request"><span><%= b.getRecipientShippingMsg() %></span></div>
				                </div>
				                
				                
				        </div>
		    		
		    </div>  
		 </div>   
	</div> 
</body>
</html>