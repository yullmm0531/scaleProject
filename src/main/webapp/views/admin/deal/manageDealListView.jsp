<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.common.model.vo.PageInfo, java.util.ArrayList, com.scale.admin.bidding.model.vo.Bidding, java.text.DecimalFormat" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Bidding> list = (ArrayList<Bidding>)request.getAttribute("list");
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery는 slim버전이라 XXXX -->
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .outer{
        width:1200px;
        margin:auto;
    }
    .title{text-align: center;}
    .space{height: 10px;}
    .line{
        border: 0.5px solid gray;
        width: 1200px;
        margin-left: 250px;
    }
    .table{
        box-sizing: border-box;
        font-size: 15px;
    }
    .productNameKo{
        width: 260px;
        text-overflow:ellipsis; 
        overflow:hidden;
        white-space:nowrap;
    }
    .menu3 label{padding: 10px;}
    .status{
        height: 250px;
        width: 350px;
        margin: auto;
        padding-top: 20px;
    }
    input {
        border: none;
    }
</style>
</head>
<body>
    <%@ include file="../common/adminMenubar.jsp" %>

    <div class="outer">
        <br><br><br>        
        
        <div class="title">
            <h2><b>거래 리스트</b></h2>
            <br>
        </div>
        <div class="menu">
            <div class="menu1">
                <div class="btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-outline-secondary">
                        <input type="radio" name="options" id="biddingList" value="biddingList"> 입찰
                    </label>
                    <label class="btn btn-outline-secondary">
                        <input type="radio" name="options" id="dealList" value="dealList" checked> 체결거래
                    </label>
                </div>
            </div>    
            <div class="space"></div>
            <div class="line"></div>
            <div class="space"></div>
            
            
        </div>
        <script>
            var flag = true;
            const $dealStatus = $(".dealStatus input");

            // 거래상태 전체
            $("#all").click(function(){
                if($(this).is(":checked")){
                    $dealStatus.prop("checked", true);
                } else {
                    $dealStatus.prop("checked", false);
                }
                
            })

            // 거래상태 개별체크에 따른 전체 체크여부
            $dealStatus.click(function(){
                if($dealStatus.is(":checked").length == 7){
                    $("#all").prop("checked", true);
                } else{
                    $("#all").prop("checked", false);
                }
            })

            $("")

        </script>
        
        <div class="biddingList-area">
            <br>
            <table class="table table-hover" style="table-layout: fixed; width: 1100px">
                <thead class="thead-dark">
                    <tr>
                        <th style="width: 8%;">입찰번호</th>
                        <th style="width: 8%;">상품번호</th>
                        <th style="width: 26%;">상품명</th>
                        <th style="width: 8%;">판매자</th>
                        <th style="width: 8%;">구매자</th>
                        <th style="width: 10%;">입고완료일</th>
                        <th style="width: 10%;">검수완료일</th>
                        <th style="width: 10%;">출고일</th>
                        <th style="width: 12%;" colspan="2">진행상태</th>
                    </tr>
                    </thead>
                <tbody class="listSpace">
                    <% if(list.isEmpty()) { %>
                        <!-- 게시글 없을 경우-->
                        <tr>
                            <td colspan="9" class="noResult">체결된 거래가 없습니다.</td>
                        </tr>
                    <% }else { %>
                        <!-- 게시글 있을 경우-->
                        <% for(Bidding b : list) { %>
                            <tr class="rowNum" id="<%= b.getbNo() %>">
                                <input type="hidden" name="bNo" value="<%= b.getbNo() %>">
                                <input type="hidden" name="dStep" value="<%= b.getdStep() %>">
                                <input type="hidden" name="sellerNo" value="<%= b.getSellerNo() %>">
                                <td class="biddingNo"><%= b.getbNo() %></td>
                                <td><%= b.getpCode() %></td>
                                <td><div class="productNameKo"><%= b.getpNameKo() %></div></td>
                                <td><%= b.getSellerId() %></td>
                                <td><%= b.getBuyerId() %></td>
                                <td><%= b.getStoreDate() %></td>
                                <td><%= b.getInspectionDate() %></td>
                                <td><%= b.getShipDate() %></td>
                                <td class="dealStatus"><%= b.getdStep() %></td>
                                <td><input type="button" class="btn btn-outline-secondary btn-sm stepChange" value="변경" data-toggle="modal" data-target="#changeStep"></td>
                            </tr>
                        <% } %>
                    <% } %>
                </tbody>            
            </table>
        </div>

        <!-- 진행상태 변경 모달 -->
        <div class="modal" id="changeStep">
            <div class="modal-dialog">

                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h5 class="modal-title">진행 상태 변경</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="status"  class="form-group">
                            <div class="dealInfo">

                            </div>
                            <label for="dealStep">진행 상태 : </label>
                            <select name="dealStep" id="dealStep" class="form-control">
                                <option value="0">입고전</option>
                                <option value="1">입고완료</option>
                                <option value="2">검수중</option>
                                <option value="3">검수완료</option>
                                <option value="4">검수미통과</option>
                                <option value="5">발송완료</option>
                                <option value="6">거래완료</option>
                            </select>
                            
                        </div>
                        <div align="center">
                            <button type="button" class="btn btn-secondary" id="change-step-button" data-dismiss="modal" onclick="changeStep();">확인</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(".stepChange").click(function(){
                var val = $(this).parent().parent().children().eq(1).val();
                $("#dealStep").val(val);
                var info = "";
                info += "<input type='hidden' class='sellerNo' value='" + $(this).parent().parent().children().eq(2).val() + "'>";
                info += "입찰 번호 : <input type='text' name='biddingNo' value='" + $(this).parent().parent().children().eq(0).val() + "'><br>";
                info += "상품 번호 : " + $(this).parent().parent().children().eq(3).text() + "<br>";
                info += "상품명 : " + $(this).parent().parent().children().eq(4).text() + "<br>";
                info += "판매자 : " + $(this).parent().parent().children().eq(5).text() + "<br>";
                info += "구매자 : " + $(this).parent().parent().children().eq(6).text();
                $(".dealInfo").html(info);
            })

            function changeStep(){
                $.ajax({
                    url: "<%= contextPath %>/updateDealStep.ad",
                    data: {
                        bNo: $("input:text").val(),
                        dStep: $("#dealStep").val(),
                        seller: $(".sellerNo").val()
                    },
                    method: "post",
                    success: function(b){
                        //$('#changeStep').modal().hide();
                        console.log(b);
                        
                        let value = "";
                        value += "<input type='hidden' name='bNo' value='" + b.bNo + "'>";
                        value += "<input type='hidden' name='dStep' value='" + b.dStep + "'>";
                        value += "<input type='hidden' name='sellerNo' value='" + b.sellerNo + "'>";
                        value += "<td class='biddingNo'>" + b.bNo + "</td>";
                        value += "<td>" + b.pCode + "</td>";
                        value += "<td><div class='productNameKo'>" + b.pNameKo + "</div></td>";
                        value += "<td>" + b.sellerId + "</td>";
                        value += "<td>" + b.buyerId + "</td>";
                        value += "<td>" + b.storeDate + "</td>";
                        value += "<td>" + b.inspectionDate + "</td>";
                        value += "<td>" + b.shipDate + "</td>";
                        value += "<td class='dealStatus'>" + b.dStep + "</td>";
                        value += "<td><input type='button' class='btn btn-outline-secondary btn-sm stepChange' value='변경' data-toggle='modal' data-target='#changeStep'></td>";
                        $("#" + b.bNo).html(value);
                        
                        
                        
                    },
                    error:function(){
						console.log("거래 상태 변경용 ajax 통신 실패");	
					}
                })
            }
        </script>

        <br><br>
        <!-- 페이징 -->
        <div class="paging-area" align="center">
            <% if(pi.getCurrentPage() != 1) { %>
                <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/deealList.ad?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <% } %>
            
            <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/dealList.ad?cpage=<%=i%>';"><%= i %></button>
            <% } %>
            
            <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/dealList.ad?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <% } %>
        </div>
        <br><br>
    </div>
    <script>
        function toMoney(num) {
            return num.toLocaleString('ko-KR');
        }	
        
		
    </script>


</body>
</html>