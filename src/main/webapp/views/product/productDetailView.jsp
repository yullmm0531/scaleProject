<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.product.model.vo.*, java.util.ArrayList, com.scale.bidding.model.vo.Bidding, java.text.DecimalFormat" %>
<% 
	Product p = (Product)request.getAttribute("p");
	ArrayList<Bidding> dList = (ArrayList<Bidding>)request.getAttribute("dList");
	ArrayList<ProductImg> pImgList = (ArrayList<ProductImg>)request.getAttribute("pImgList");
	ArrayList<Bidding> bList = (ArrayList<Bidding>)request.getAttribute("bList");
	ArrayList<Bidding> sList = (ArrayList<Bidding>)request.getAttribute("sList");
	DecimalFormat formatter = new DecimalFormat("###,###");
%> 
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{
            /*border: 1px solid red;*/ 
            box-sizing: border-box;
        }
        .line{
            border: 0.1px solid lightgray;
            width: 700px;
            margin: auto;
        }
        .outer{
            width: 1200px;
            margin: auto;
        }
        .product-header{
            width: 100%;
            height: 900px;
        }
        #product-img, #product-info{
            float: left;
            height: 100%;
        }
        #product-img{width: 40%;}
        #product-info{width: 60%;}
        #product-info>div{width : 100%;}
        #product-img img{
            width: 450px;
        }
        
        #product-deal button{
            width: 100%;
            font-size: 12px;
        }

        #product-deal button th{
            font-size: 15px;
        }


        #product-like button{
            width: 100%;
            height: 30px;
        }
        
        #product-info-detail td{
            font-size: 12px;
            color: gray;
        }
        .price-detail th{
            width: 30%;
        }
        .price-detail td{
            padding-left: 15px;
            padding-right: 25px;
        }
        .modalList{
            height: 280px;
        }
        .view-more{
            width: 100%;
        }

        .product-footer{
            width: 100%;
         
        }
        #style-preview{
            width: 100%;
        }
        #style-preview td{
            width: 25%;
        }
        #style-preview img{
            width: 100%;
            padding: 20px;
        }
        #style-preview th{
            padding-top: 10px;
            padding-left: 25px;
        }
        #style-preview tbody td{
            padding-left: 25px;
            font-size: 12px;
            color: gray;
        }
        .product-info{height: 150px; padding-left: 30px; padding-top: 15px;}
        .product-info img{width: 130px;}
        #product-brand{font-weight: bold;}
        #product-eng-name{font-size: 14px;}
        #product-kor-name{
            font-size: 14px;
            color: gray;
        }
        .viewMoreRadio{width: 100%;}
        .product-detail-title{
            width: 25%;
            color: rgb(99, 99, 99);
            font-size: 13px;
        }
        #style-preview img{
            width: 300px;
            height: 300px;
            
        }
        .carousel-control-prev-icon { 
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E"); 
        }
        .carousel-control-next-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E"); 
        }
        .modal-content{
            height: 600px;
        }
        .modal-dialog{
            max-width: 1000px;
        }
        #product-eng-name, #product-kor-name{
            width: 280px;
            text-overflow:ellipsis; 
            overflow:hidden;
            white-space:nowrap;
        }
        
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div class="product-header">
            <br><br>
            <div id="product-img">
                <div id="demo" class="carousel" data-ride="carousel">

                    <!-- Indicators -->
                    <ul class="carousel-indicators">
                      <li data-target="#demo" data-slide-to="0" class="active"></li>
                      <li data-target="#demo" data-slide-to="1"></li>
                      <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                  
                    <!-- The slideshow -->
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="<%= contextPath %>/<%= p.getProductImgM() %>">
                      </div>
	                      <% if(pImgList != null && pImgList.size() != 0) { %>
		                      <% for (ProductImg pi : pImgList) { %>
			                      <div class="carousel-item">
			                        <img src="<%= contextPath %>/<%= pi.getFilePath() %>">
			                      </div>
		                      <% } %>
	                      <% } %>
                    </div>
                  
                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                      <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                      <span class="carousel-control-next-icon"></span>
                    </a>
                  
                  </div>
            </div>
            <div id="product-info">
                <div id="product-name">
                    <h3><%= p.getBrandName() %></h3>
                    <h4><%= p.getProductNameEng() %></h4>
                    <h6><%= p.getProductNameKo() %></h6>
                </div>
                <div id="product-detail">
                    <div id="detail-header">
                        <table id="product-deal">
                            <tr>
                                <td style="width: 360px;">사이즈</td>
                                <td style="width: 360px;">
                                    <div align="right">
                                        <select name="pSize" id="pSize" style="width: 120px;" onchange="ajaxSelectSizeResult();">
                                            
                                        </select>
                                    </div>
                                    <script>
		                            	$(function(){
		                            		var arr = "<%= p.getProductSize() %>".split(", ");
		                            		var sizeOption = "<option value='allSize'>모든 사이즈</option>";
		                            		for(let i=0; i<arr.length; i++){
		                            			sizeOption += "<option value='" + arr[i] + "'>" + arr[i] + "</option>"
		                            		}
		                            		$("#pSize").html(sizeOption);
		               
		                            	})
		                            </script>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 30px;"><div class="line"></div></td>
                            </tr>
                            <tr>
                                <th>최근거래가</th>
                                <th>
                                	<div align="right">
                                		<% if(dList != null && dList.size() != 0) { %>
                                			<%= formatter.format(dList.get(0).getbPrice()) %> 원
                                		<% } else{ %>
                                			- 원
                                		<% } %>
                                	</div>
                                </th>
                            </tr>
                            <tr><td colspan="2"><div><br></div></td></tr>
                            <tr>
                                <td>
                                    <button type="button" id="buy-btn" class="btn btn-warning" onclick="buy();">
                                        <table>
                                            <tr>
                                                <th rowspan="2" width="150">구매</th>
                                                <td width="100">
                                                	<% if(sList != null && sList.size() != 0) { %>
			                                			<%= formatter.format(sList.get(0).getbPrice()) %>원
			                                		<% } else{ %>
			                                			-
			                                		<% } %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>즉시구매</td>
                                            </tr>
                                        </table>
                                    </button>
                                </td>
                                <td>
                                    <button type="button" id="sell-btn" class="btn btn-success" onclick="sell();">
                                        <table>
                                            <tr>
                                                <th rowspan="2" width="150">판매</th>
                                                <td width="100">
                                                	<% if(bList != null && bList.size() != 0) { %>
			                                			<%= formatter.format(bList.get(0).getbPrice()) %>원
			                                		<% } else{ %>
			                                			-
			                                		<% } %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>즉시판매</td>
                                            </tr>
                                        </table>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2" id="product-like">
                                    <button type="button" id="like-button" class="btn btn-secondary">♡찜 | 2,157</button>
                                </th>
                            </tr>
                        </table>
                    </div>
                    <script>
                        function buy(){
                            <% if(loginUser == null) { %>
                                alert("로그인 후 이용가능한 페이지입니다.");
                                    location.href = "<%= contextPath %>/loginForm.us";
                            <% } else { %>
                                location.href='<%= contextPath %>/buy.bi?co=<%= p.getProductCode() %>';        
                            <% } %>
                                
                        }
                        function sell(){
                            <% if(loginUser == null) { %>
                                alert("로그인 후 이용가능한 페이지입니다.");
                                    location.href = "<%= contextPath %>/loginForm.us";
                            <% } else { %>
                                location.href='<%= contextPath %>/sell.bi?co=<%= p.getProductCode() %>';
                            <% } %>  
                        }
                    </script>
                    <br>
                    <div id="detail-body">
                        <table id="product-info-detail" width="100%">
                            <tr>
                                <th colspan="4" style="font-size:17px">상품정보</th>
                            </tr>
                            <tr>
                                <td colspan="4"><br><div class="line"></div></td>
                            </tr>
                            <tr>
                                <th class="product-detail-title" style="width: 25%;">모델번호</th>
                                <th class="product-detail-title" style="width: 25%;">출시일</th>
                                <th class="product-detail-title" style="width: 25%;">컬러</th>
                                <th class="product-detail-title" style="width: 25%;">발매가</th>
                            </tr>
                            <tr>
                                <td><%= p.getModelCode() %></td>
                                <td><%= p.getReleaseDate() %></td>
                                <td><%= p.getColor() %></td>
                                <td><%= formatter.format(p.getReleasePrice()) %>원</td>
                            </tr>
                            <tr>
                                <td colspan="4"><div class="line"></div></td>
                            </tr>
                        </table>
                    </div>
                    <br>
                    <div id="detail-bottom">
                        <div style="font-weight: bold;">시세</div>
                        <br>
                        <div id="price-button">
                            <div class="frame-wrap">
                                <div class="btn-group btn-group-toggle viewMoreRadio" data-toggle="buttons">
                                    <label class="btn btn-outline-secondary">
                                        <input type="radio" name="options" class="deal" checked> 체결거래
                                    </label>
                                    <label class="btn btn-outline-secondary">
                                        <input type="radio" name="options" class="sellBidding"> 판매입찰
                                    </label>
                                    <label class="btn btn-outline-secondary">
                                        <input type="radio" name="options" class="buyBidding"> 구매입찰
                                    </label>
                                </div>
                            </div>
                        </div>
                        <br>
                        
                        <!-- 체결거래 클릭시 -->
                        <div id="deal">
                            <table id="deal-size" class="price-detail" style="width: 100%; height: 150px">
                                <tr>
                                    <th style="padding-left:15px;">사이즈</th>
                                    <th style="padding-left:15px;">거래가</th>
                                    <th style="padding-left:15px;">거래일</th>
                                </tr>
                                <% if(dList != null && dList.size() != 0) { %>
                                	<% if(dList.size() < 5) { %>
                                		<% for(int i=0; i<dList.size(); i++){ %>
                                			<tr style="height:26px">
		                                		<td><%= dList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(dList.get(i).getbPrice()) %>원</td>
			                                    <td align="right"><%= dList.get(i).getdDate() %></td>
		                                	</tr>
                                		<% } %>
                                		<% for(int i=dList.size(); i<5; i++) { %>
                                			<tr style="height:26px">
		                                		<td></td>
			                                    <td align="right"></td>
			                                    <td align="right"></td>
		                                	</tr>
                                		<% } %>
                                	<% } else { %>
	                                	<% for(int i=0; i<5; i++){ %>
		                                	<tr style="height:26px">
		                                		<td><%= dList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(dList.get(i).getbPrice()) %>원</td>
			                                    <td align="right"><%= dList.get(i).getdDate() %></td>
		                                	</tr>
		                                <% } %>
	                                <% } %>
                                <% } else{ %>
                                	<tr class="selectDealList">
                                		<td colspan="3" style="height: 130px; text-align:center;">
                                			체결된 거래가 아직 없습니다.
                                		</td>
                                	</tr>
                                <% } %>
                             </table>
                             <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th colspan="3">
                                        <button type="button" class="btn btn-secondary view-more" data-toggle="modal" data-target="#view-more">체결 내역 더보기</button>
                                    </th>
                                </tr>
                            </table>
                        </div>

                        <!-- 판매입찰 클릭시 -->
                        <div id="sellBidding" hidden>
                            <table id="sellBidding-size" class="price-detail" style="width: 100%; height: 150px">
                                <tr>
                                    <th style="padding-left:15px;">사이즈</th>
                                    <th style="padding-left:15px;">판매희망가</th>
                                    <th style="padding-left:15px;">수량</th>
                                </tr>
                                <% if(sList != null && sList.size() != 0) { %>
                                	<% if(sList.size() < 5) { %>
                                		<% for(int i=0; i<sList.size(); i++) { %>
                                			<tr style="height:26px">
		                                		<td><%= sList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(sList.get(i).getbPrice()) %>원</td>
			                                    <td align="right"><%= sList.get(i).getCount() %></td>
	                                		</tr>
                                		<% } %>
                                		<% for(int i=sList.size(); i<5; i++) { %>
                                			<tr style="height:26px">
		                                		<td></td>
			                                    <td align="right"></td>
			                                    <td align="right"></td>
	                                		</tr>
                                		<% } %>
                                	<% } else {%>
	                                	<% for(int i=0; i<5; i++){ %>
		                                	<tr style="height:26px">
		                                		<td><%= sList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(sList.get(i).getbPrice()) %>원</td>
			                                    <td align="right"><%= sList.get(i).getCount() %></td>
		                                	</tr>
		                                <% } %>
	                                <% } %>
                                <% } else{ %>
                                	<tr>
                                		<td colspan="3" style="height: 130px; text-align:center;">
                                			판매 희망가가 아직 없습니다.
                                		</td>
                                	</tr>
                                <% } %>
                            </table>
                            <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th colspan="3">
                                        <button type="button" class="btn btn-secondary view-more" data-toggle="modal" data-target="#view-more">체결 내역 더보기</button>
                                    </th>
                                </tr>
                            </table>
                        </div>

                        <!-- 구매입찰 클릭시 -->
                        <div id="buyBidding" hidden>
                            <table id="buyBidding-size" class="price-detail" style="width: 100%; height: 150px">
                                <tr>
                                    <th style="padding-left:15px;">사이즈</th>
                                    <th style="padding-left:15px;">구매희망가</th>
                                    <th style="padding-left:15px;">수량</th>
                                </tr>
                                <% if(bList != null && bList.size() != 0) { %>
                                	<% if(bList.size() < 5){  %>
                                		<% for(int i=0; i<bList.size(); i++){ %>
		                                	<tr style="height:26px">
		                                		<td><%= bList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(bList.get(i).getbPrice()) %>원</td>
			                                    <td align="right"><%= bList.get(i).getCount() %></td>
		                                	</tr>
		                                <% } %>
		                                <% for(int i=bList.size(); i<5; i++){ %>
		                                	<tr style="height:26px">
		                                		<td></td>
			                                    <td align="right"></td>
			                                    <td align="right"></td>
		                                	</tr>
		                                <% } %>
                                	<% } else{ %>
	                                	<% for(int i=0; i<5; i++){ %>
		                                	<tr style="height:26px">
		                                		<td><%= bList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(bList.get(i).getbPrice()) %>원</td>
			                                    <td align="right"><%= bList.get(i).getCount() %></td>
		                                	</tr>
		                                <% } %>
	                                <% } %>
                                <% } else{ %>
                                	<tr>
                                		<td colspan="3" style="height: 130px; text-align:center;">
                                			구매 희망가가 아직 없습니다.
                                		</td>
                                	</tr>
                                <% } %>
                            </table>
                            <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th colspan="3">
                                        <button type="button" class="btn btn-secondary view-more" data-toggle="modal" data-target="#view-more">체결 내역 더보기</button>
                                    </th>
                                </tr>
                            </table>
                        </div>
                        
                    </div>

                    <!-- 체결내역 더보기 모달 -->
                    <div class="modal" id="view-more">
                        <div class="modal-dialog">

                            <div class="modal-content">
                        
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h5 class="modal-title">시세</h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                
                                </div>
                                
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div class="product">
                                        <div class="product-info row">
                                            <div class="product-img col-sm-4">
                                                <img src="<%= contextPath %>/<%= p.getProductImgM() %>">
                                            </div>
                                            <div class="product-name col-sm-8">
                                                <div id="product-brand"><%= p.getBrandName() %></div>
                                                <div id="product-eng-name"><%= p.getProductNameEng() %></div>
                                                <div id="product-kor-name"><%= p.getProductNameKo() %></div>
                                                <span id="product-size">
                                                    <select id="modalPdSize" style="width: 120px;" onchange="ajaxSelectSizeResult();">
                                                        
                                                    </select>
                                                    <script>
						                            	$(function(){
						                            		var arr = "<%= p.getProductSize() %>".split(", ");
						                            		var sizeOption = "<option value='allSize'>모든 사이즈</option>";
						                            		for(let i=0; i<arr.length; i++){
						                            			sizeOption += "<option value='" + arr[i] + "'>" + arr[i] + "</option>"
						                            		}
						                            		$("#modalPdSize").html(sizeOption);
						               
						                            	})
						                            </script>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="" align="center">
                                            <div class="frame-wrap">
                                                <div class="btn-group btn-group-toggle viewMoreRadio" data-toggle="buttons">
                                                    <label class="btn btn-outline-secondary">
                                                        <input type="radio" name="options" class="modalDeal" checked> 체결거래
                                                    </label>
                                                    <label class="btn btn-outline-secondary">
                                                        <input type="radio" name="options" class="modalSellBidding"> 판매입찰
                                                    </label>
                                                    <label class="btn btn-outline-secondary">
                                                        <input type="radio" name="options" class="modalBuyBidding"> 구매입찰
                                                    </label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="modalList" style="overflow: auto;">
                                                <!--체결거래 클릭시-->
                                                <div id="modalDeal">
                                                    <table id="modalDeal-size" class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">사이즈</th>
                                                            <th style="padding-left:15px;">거래가</th>
                                                            <th style="padding-left:15px;">거래일</th>
                                                        </tr>
                                                        <% if(dList != null && dList.size() != 0) { %>
						                                	<% for(int i=0; i<dList.size(); i++){ %>
							                                	<tr>
							                                		<td><%= dList.get(i).getpSize() %></td>
								                                    <td align="right"><%= formatter.format(dList.get(i).getbPrice()) %>원</td>
								                                    <td align="right"><%= dList.get(i).getdDate() %></td>
							                                	</tr>
							                                	
							                                <% } %>
						                                <% } else{ %>
						                                	<tr class="selectDealList">
						                                		<td colspan="3" style="height: 130px; text-align:center;">
						                                			체결된 거래가 아직 없습니다.
						                                		</td>
						                                	</tr>
						                                <% } %>
                                                    </table>
                                                </div>
                        
                                                <!-- 판매입찰 클릭시 -->
                                                <div id="modalSellBidding" hidden>
                                                    <table id="modalSellBidding-size" class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">사이즈</th>
                                                            <th style="padding-left:15px;">판매희망가</th>
                                                            <th style="padding-left:15px;">수량</th>
                                                        </tr>
                                                        <% if(sList != null && sList.size() != 0) { %>
						                                	<% for(int i=0; i<sList.size(); i++){ %>
							                                	<tr>
							                                		<td><%= sList.get(i).getpSize() %></td>
								                                    <td align="right"><%= formatter.format(sList.get(i).getbPrice()) %>원</td>
								                                    <td align="right"><%= sList.get(i).getCount() %></td>
							                                	</tr>
							                                <% } %>
						                                <% } else{ %>
						                                	<tr>
						                                		<td colspan="3" style="height: 130px; text-align:center;">
						                                			판매 희망가가 아직 없습니다.
						                                		</td>
						                                	</tr>
						                                <% } %>
                                                    </table>
                                                </div>
                        
                                                <!-- 구매입찰 클릭시 -->
                                                <div id="modalBuyBidding" hidden>
                                                    <table id="modalBuyBidding-size" class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">사이즈</th>
                                                            <th style="padding-left:15px;">구매희망가</th>
                                                            <th style="padding-left:15px;">수량</th>
                                                        </tr>
                                                        <% if(bList != null && bList.size() != 0) { %>
						                                	<% for(int i=0; i<bList.size(); i++){ %>
							                                	<tr>
							                                		<td><%= bList.get(i).getpSize() %></td>
								                                    <td align="right"><%= formatter.format(bList.get(i).getbPrice()) %>원</td>
								                                    <td align="right"><%= bList.get(i).getCount() %></td>
							                                	</tr>
							                                <% } %>
						                                <% } else{ %>
						                                	<tr>
						                                		<td colspan="3" style="height: 130px; text-align:center;">
						                                			구매 희망가가 아직 없습니다.
						                                		</td>
						                                	</tr>
						                                <% } %>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>


                    <script>
	                    function toMoney(num) {
	                        return num.toLocaleString('ko-KR');
	                    }	
	                    
                        $(function(){
                            $(".deal").click(function(){
                                $("#deal").attr("hidden", false);
                                $("#buyBidding").attr("hidden", true);
                                $("#sellBidding").attr("hidden", true);
                            })
                            $(".buyBidding").click(function(){
                                $("#deal").attr("hidden", true);
                                $("#buyBidding").attr("hidden", false);
                                $("#sellBidding").attr("hidden", true);
                            })
                            $(".sellBidding").click(function(){
                                $("#deal").attr("hidden", true);
                                $("#buyBidding").attr("hidden", true);
                                $("#sellBidding").attr("hidden", false);
                            })
                            $(".modalDeal").click(function(){
                                $("#modalDeal").attr("hidden", false);
                                $("#modalBuyBidding").attr("hidden", true);
                                $("#modalSellBidding").attr("hidden", true);
                            })
                            $(".modalBuyBidding").click(function(){
                                $("#modalDeal").attr("hidden", true);
                                $("#modalBuyBidding").attr("hidden", false);
                                $("#modalSellBidding").attr("hidden", true);
                            })
                            $(".modalSellBidding").click(function(){
                                $("#modalDeal").attr("hidden", true);
                                $("#modalBuyBidding").attr("hidden", true);
                                $("#modalSellBidding").attr("hidden", false);
                            })
                        })
                        
                        var dCount = <%= dList.size() %>;
                        var sCount = <%= sList.size() %>;
                        var bCount = <%= bList.size() %>;

                        function ajaxSelectSizeResult(){

                            var pSize = $(window.event.target).val();
                            $.ajax({
                        		url:"<%= contextPath %>/bSizeList.bi",
            					data:{
            						co: <%= p.getProductCode() %>,
            						size: pSize
            					},
            					success:function(list){            					
            						if(list.length != 0){
            							var dSizeList = list[0];
                                        var sSizeList = list[1];
                                        var bSizeList = list[2];
                                        if(dCount != 0 && sCount != 0 && bCount != 0){
                                            // 페이지
                                        	for(let i=1; i<=5; i++){
	                                            $("#deal-size tbody").children().eq(i).html("");
	                                            $("#sellBidding-size tbody").children().eq(i).html("");
	                                            $("#buyBidding-size tbody").children().eq(i).html("");
                                        	}
                                            // 모달
                                            for(let i=1; i<= dCount; i++){
                                                $("#modalDeal-size tbody").children().eq(i).html("");
                                            }
                                            for(let i=1; i<= sCount; i++){
                                                $("#modalSellBidding-size tbody").children().eq(i).html("");
                                            }
                                            for(let i=1; i<= bCount; i++){
                                                $("#modalBuyBidding-size tbody").children().eq(i).html("");
                                            }
                                        }
                                        
            							if(dSizeList.length != 0){
            								// 페이지
            								if(dSizeList.length < 5){
            									for(let i=0; i<dSizeList.length; i++){
            										$("#deal-size tbody").children().eq(i+1).html("<td>" + dSizeList[i].pSize + "</td>"
																								+ "<td align='right'>" + toMoney(dSizeList[i].bPrice) + "원</td>"
																								+ "<td align='right'>" + dSizeList[i].dDate + "</td>");
            										
            									}
            								} else{
            									for(let i=0; i<5; i++){
            										$("#deal-size tbody").children().eq(i+1).html("<td>" + dSizeList[i].pSize + "</td>"
																								+ "<td align='right'>" + toMoney(dSizeList[i].bPrice) + "원</td>"
																								+ "<td align='right'>" + dSizeList[i].dDate + "</td>");
            									}
            								}
                                            // 모달
            								for(let i=0; i<dSizeList.length; i++){
        										$("#modalDeal-size tbody").children().eq(i+1).html("<td>" + dSizeList[i].pSize + "</td>"
																							+ "<td align='right'>" + toMoney(dSizeList[i].bPrice) + "원</td>"
																							+ "<td align='right'>" + dSizeList[i].dDate + "</td>");
        									}
            								
            							} else{
                                            // 페이지
                                            $("#deal-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>체결된 거래가 아직 없습니다.</td>");
                                            // 모달
                                            $("#modalDeal-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>체결된 거래가 아직 없습니다.</td>");

                                        }

                                        if(sSizeList.length != 0){
            								// 페이지
            								if(sSizeList.length < 5){
            									for(let i=0; i<sSizeList.length; i++){
            										$("#sellBidding-size tbody").children().eq(i+1).html("<td>" + sSizeList[i].pSize + "</td>"
                                                                                                        + "<td align='right'>" + toMoney(sSizeList[i].bPrice) + "원</td>"
                                                                                                        + "<td align='right'>" + sSizeList[i].count + "</td>");
            										
            									}
            								} else{
            									for(let i=0; i<5; i++){
            										$("#sellBidding-size tbody").children().eq(i+1).html("<td>" + sSizeList[i].pSize + "</td>"
                                                                                                        + "<td align='right'>" + toMoney(sSizeList[i].bPrice) + "원</td>"
                                                                                                        + "<td align='right'>" + sSizeList[i].count + "</td>");
            									}
            								}
                                            // 모달
                                            for(let i=0; i<sSizeList.length; i++){
        										$("#modalSellBidding-size tbody").children().eq(i+1).html("<td>" + sSizeList[i].pSize + "</td>"
                                                                                                    + "<td align='right'>" + toMoney(sSizeList[i].bPrice) + "원</td>"
                                                                                                    + "<td align='right'>" + sSizeList[i].count + "</td>");
        									}
            								
            							} else{
                                            // 페이지
                                            $("#sellBidding-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>판매 희망가가 아직 없습니다.</td>");
                                            // 모달
                                            $("#modalSellBidding-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>판매 희망가가 아직 없습니다.</td>");

                                        }

                                        if(bSizeList.length != 0){
            								// 페이지
            								if(bSizeList.length < 5){
            									for(let i=0; i<bSizeList.length; i++){
            										$("#buyBidding-size tbody").children().eq(i+1).html("<td>" + bSizeList[i].pSize + "</td>"
                                                                                                        + "<td align='right'>" + toMoney(bSizeList[i].bPrice) + "원</td>"
                                                                                                        + "<td align='right'>" + bSizeList[i].count + "</td>");
            										
            									}
            								} else{
            									for(let i=0; i<5; i++){
            										$("#buyBidding-size tbody").children().eq(i+1).html("<td>" + bSizeList[i].pSize + "</td>"
                                                                                                        + "<td align='right'>" + toMoney(bSizeList[i].bPrice) + "원</td>"
                                                                                                        + "<td align='right'>" + bSizeList[i].count + "</td>");
            									}
            								}
                                            // 모달
                                            for(let i=0; i<bSizeList.length; i++){
        										$("#modalBuyBidding-size tbody").children().eq(i+1).html("<td>" + bSizeList[i].pSize + "</td>"
                                                                                                    + "<td align='right'>" + toMoney(bSizeList[i].bPrice) + "원</td>"
                                                                                                    + "<td align='right'>" + bSizeList[i].count + "</td>");
        										
        									}
            								
            							} else{
                                            // 페이지
                                            $("#buyBidding-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>구매 희망가가 아직 없습니다.</td>");
                                            // 모달
                                            $("#modalBuyBidding-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>구매 희망가가 아직 없습니다.</td>");

                                        }



            						} else{
                                        console.log("사이즈별 조회용 ajax 결과조회 실패")
                                    }
            						
            					},
            					error:function(){
            						console.log("사이즈별 조회용 ajax 통신 실패");	
            					}
                        	})

                            $("#modalPdSize").val(pSize);
                            $("#pSize").val(pSize);
                        }

                        /*
                        function selectSize(){
                        	var pSize = $("#pSize").val();
                        	$("#modalPdSize").val(pSize);
                        	ajaxSelectSizeResult(); 
                        	
                            
                        }

                        function modalSelectSize(){
                            var pSize = $("#modalPdSize").val();
                        	$("#pSize").val(pSize);
                            ajaxSelectSizeResult(); 
                        }
                        */

                    </script>
                    
                </div>
            </div>
            
        </div>
        
        <div class="product-footer">
            
            <div class="style-feed">
                <table id="style-preview">
                    <thead>
                        <tr>
                            <th colspan="4" style="font-size: 20px;">스타일</th>
                        </tr>
                        <tr>
                            <td><img src="<%= contextPath %>/resources/images/style/style_upfiles/1-1.jpg" alt=""></td>
                            <td><img src="<%= contextPath %>/resources/images/style/style_upfiles/1-2.jpg" alt=""></td>
                            <td><img src="<%= contextPath %>/resources/images/style/style_upfiles/17.jpg" alt=""></td>
                            <td><img src="<%= contextPath %>/resources/images/style/style_upfiles/18.jpg" alt=""></td>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr>
                            <th>user01</th>
                            <th>user01</th>
                            <th>user01</th>
                            <th>user01</th>
                        </tr>
                        <tr>
                            <td>#해쉬태그1 #해쉬태그2 #해쉬태그3</td>
                            <td>#해쉬태그1 #해쉬태그2 #해쉬태그3</td>
                            <td>#해쉬태그1 #해쉬태그2 #해쉬태그3</td>
                            <td>#해쉬태그1 #해쉬태그2 #해쉬태그3</td>
                        </tr>
                    </tbody>
                </table>
                <br><br><br>
                <div style="text-align: center;"><button type="button" class="btn btn-secondary btn-sm">더보기</button></div>
            </div>
        </div>
		<br><br>
    </div>
    
</body>
</html>