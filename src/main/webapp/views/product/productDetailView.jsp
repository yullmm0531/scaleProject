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
        .outer{
            width: 1200px;
            margin: auto;
        }
        .product-header{
            width: 100%;
            height: 700px;
        }
        #product-img, #product-info{
            float: left;
            height: 100%;
        }
        #product-img{width: 40%;}
        #product-info{width: 60%;}
        #product-info>div{width : 100%;}
        
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
        #price-button button{
            width: 32.9%;
        }
        #price-detail th{
            width: 30%;
        }
        #price-detail td{
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
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div class="product-header">
            <br><br>
            <div id="product-img">
                <img src="<%= contextPath %>/resources/images/product/nike1.png" alt="">
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
                                <th>최근거래가</th>
                                <th><div align="right">159,000원</div></th>
                            </tr>
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
                    <div id="detail-body">
                        <table id="product-info-detail" width="100%">
                            <tr>
                                <th colspan="4">상품정보</th>
                            </tr>
                            <tr>
                                <th style="width: 25%;">모델번호</th>
                                <th style="width: 25%;">출시일</th>
                                <th style="width: 25%;">컬러</th>
                                <th style="width: 25%;">발매가</th>
                            </tr>
                            <tr>
                                <td>DD1503-122</td>
                                <td>22/12/23</td>
                                <td>SUMMIT WHITE/WOLF GREY/BLACK/ROSEWOOD</td>
                                <td>129,000원</td>
                            </tr>
                        </table>
                    </div>
                    <div id="detail-bottom">
                        <div style="font-weight: bold;">시세</div>
                        <div id="price-button">
                            <button type="button" class="btn btn-secondary">체결거래</button>
                            <button type="button" class="btn btn-secondary">판매입찰</button>
                            <button type="button" class="btn btn-secondary">구매입찰</button>
                        </div>
                        <table id="price-detail" style="width: 100%;">
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
                                    <button type="button" class="btn btn-secondary view-more">체결 내역 더보기</button>
                                </th>
                            </tr>
                        </table>
                    </div>
                    
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
                            <td><img src="<%= contextPath %>/resources/images/style/city1.jpg" alt=""></td>
                            <td><img src="<%= contextPath %>/resources/images/style/city1.jpg" alt=""></td>
                            <td><img src="<%= contextPath %>/resources/images/style/city1.jpg" alt=""></td>
                            <td><img src="<%= contextPath %>/resources/images/style/city1.jpg" alt=""></td>
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