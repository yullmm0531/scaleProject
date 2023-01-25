<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <img src="<%= contextPath %>/resources/images/product/nike1.png">
                      </div>
                      <div class="carousel-item">
                        <img src="<%= contextPath %>/resources/images/product/nike2.png">
                      </div>
                      <div class="carousel-item">
                        <img src="<%= contextPath %>/resources/images/product/img10.jpg">
                      </div>
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
                    <h3>NIKE</h3>
                    <h4>(W) Nike Dunk Low Wolf Grey Rosewood</h4>
                    <h6>(W) 나이키 덩크 로우 울프 그레이 로즈우드</h6>
                </div>
                <div id="product-detail">
                    <div id="detail-header">
                        <table id="product-deal">
                            <tr>
                                <td style="width: 360px;">사이즈</td>
                                <td style="width: 360px;">
                                    <div align="right">
                                        <select name="size" id="size" style="width: 120px;">
                                            <option value="220">220</option><option value="225">225</option>
                                            <option value="230">230</option><option value="235">235</option>
                                            <option value="240">240</option><option value="245">245</option>
                                            <option value="250">250</option><option value="255">255</option>
                                            <option value="260">260</option><option value="265">265</option>
                                            <option value="270">270</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 30px;"><div class="line"></div></td>
                            </tr>
                            <tr>
                                <th>최근거래가</th>
                                <th><div align="right">159,000원</div></th>
                            </tr>
                            <tr><td colspan="2"><div><br></div></td></tr>
                            <tr>
                                <td>
                                    <button type="button" id="buy-btn" class="btn btn-warning">
                                        <table>
                                            <tr>
                                                <th rowspan="2" width="150">구매</th>
                                                <td width="100">158,000원</td>
                                            </tr>
                                            <tr>
                                                <td>즉시구매</td>
                                            </tr>
                                        </table>
                                    </button>
                                </td>
                                <td>
                                    <button type="button" id="sell-btn" class="btn btn-success">
                                        <table>
                                            <tr>
                                                <th rowspan="2" width="150">판매</th>
                                                <td width="100">158,000원</td>
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
                                    <button type="button" id="like-button" class="btn btn-secondary">♥찜 | 2,157</button>
                                </th>
                            </tr>
                        </table>
                    </div>
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
                                <td>DD1503-122</td>
                                <td>22/12/23</td>
                                <td>SUMMIT WHITE/WOLF GREY/BLACK/ROSEWOOD</td>
                                <td>129,000원</td>
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
                            <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th style="padding-left:15px;">사이즈</th>
                                    <th style="padding-left:15px;">거래가</th>
                                    <th style="padding-left:15px;">거래일</th>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">2022/12/29</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">2022/12/29</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">2022/12/29</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">2022/12/29</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">2022/12/29</td>
                                </tr>
                                <tr>
                                    <th colspan="3">
                                        <button type="button" class="btn btn-secondary view-more" data-toggle="modal" data-target="#view-more">체결 내역 더보기</button>
                                    </th>
                                </tr>
                            </table>
                        </div>

                        <!-- 판매입찰 클릭시 -->
                        <div id="sellBidding" hidden>
                            <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th style="padding-left:15px;">사이즈</th>
                                    <th style="padding-left:15px;">판매희망가</th>
                                    <th style="padding-left:15px;">수량</th>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">3</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">160,000원</td>
                                    <td align="right">1</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">161,000원</td>
                                    <td align="right">1</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">166,000원</td>
                                    <td align="right">1</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">169,000원</td>
                                    <td align="right">1</td>
                                </tr>
                                <tr>
                                    <th colspan="3">
                                        <button type="button" class="btn btn-secondary view-more" data-toggle="modal" data-target="#view-more">체결 내역 더보기</button>
                                    </th>
                                </tr>
                            </table>
                        </div>

                        <!-- 구매입찰 클릭시 -->
                        <div id="buyBidding" hidden>
                            <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th style="padding-left:15px;">사이즈</th>
                                    <th style="padding-left:15px;">구매희망가</th>
                                    <th style="padding-left:15px;">수량</th>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">1</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">1</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">1</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">1</td>
                                </tr>
                                <tr>
                                    <td>270</td>
                                    <td align="right">159,000원</td>
                                    <td align="right">1</td>
                                </tr>
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
                                                <img src="<%= contextPath %>/resources/images/product/nike1.png" alt="">
                                            </div>
                                            <div class="product-name col-sm-8">
                                                <span id="product-brand">NIKE</span><br>
                                                <span id="product-eng-name">(W) Nike Dunk Low Wolf Grey Rosewood</span><br>
                                                <span id="product-kor-name">(W) 나이키 덩크 로우 울프 그레이 로즈우드</span> <br>
                                                <span id="product-size">
                                                    <select name="size" style="width: 120px;">
                                                        <option value="220">220</option><option value="220">220</option>
                                                        <option value="225">225</option><option value="230">230</option>
                                                        <option value="235">235</option><option value="240">240</option>
                                                        <option value="245">245</option><option value="250">250</option>
                                                        <option value="255">255</option><option value="260">260</option>
                                                        <option value="265">265</option><option value="270">270</option>
                                                    </select>
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
                                            <div>
                                                <!--체결거래 클릭시-->
                                                <div id="modalDeal">
                                                    <table class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">사이즈</th>
                                                            <th style="padding-left:15px;">거래가</th>
                                                            <th style="padding-left:15px;">거래일</th>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">2022/12/29</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">2022/12/29</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">2022/12/29</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">2022/12/29</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">2022/12/29</td>
                                                        </tr>
                                                    </table>
                                                </div>
                        
                                                <!-- 판매입찰 클릭시 -->
                                                <div id="modalSellBidding" hidden>
                                                    <table class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">사이즈</th>
                                                            <th style="padding-left:15px;">판매희망가</th>
                                                            <th style="padding-left:15px;">수량</th>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">3</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">160,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">161,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">166,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">169,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
                                                    </table>
                                                </div>
                        
                                                <!-- 구매입찰 클릭시 -->
                                                <div id="modalBuyBidding" hidden>
                                                    <table class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">사이즈</th>
                                                            <th style="padding-left:15px;">구매희망가</th>
                                                            <th style="padding-left:15px;">수량</th>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
                                                        <tr>
                                                            <td>270</td>
                                                            <td align="right">159,000원</td>
                                                            <td align="right">1</td>
                                                        </tr>
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