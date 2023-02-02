<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.bidding.model.vo.Bidding, java.text.DecimalFormat" %>
<% 
	Bidding success = (Bidding)request.getAttribute("success"); 
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        
        .sell-success{width: 500px; height: 650px; margin: auto; border: 1px solid gray; background-color: whitesmoke;}
        .title{
            font-size: 30px;
            font-weight: bold;
        }
        .sell-success img{
            width: 200px;
            height: 200px;
        }
        .space{
            height: 20px;
        }
        .line{
            border: 0.5px solid gray;
            width: 400px;
            margin: auto;
        }
        #price-detail th{width: 140px;}
        #price-detail td{
            width: 200px;
            text-align: right;
        }
        .total-price-tag{
            font-size: 25px;
        }
        .total-price-info{
            padding-left: 50px;
        }
        .total-price{
            color: green;
            font-size: 25px;
            font-weight: bold;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<br><br><br><br><br><br>
    
    <div class="sell-success" align="center">
        <br><br>
        <div class="title">판매 입찰이 완료되었습니다.</div>
        <div class="space"></div>
        <div><img src="<%= contextPath %>/<%= success.getProductImg() %>" alt=""></div>
        <br>
        <a href="" class="btn btn-outline-secondary">내역 상세보기</a>
        <a href="" class="btn btn-outline-secondary">SHOP 바로가기</a>
        <br><br><br>
        <div class="order-info">
            <table id="price-detail">
                <tr>
                    <th class="total-price-tag" id="total-price">총 정산 금액</th>
                    <td class="total-price"><%= formatter.format(success.getbPrice() - success.getInspectionCost() - success.getCommission()) %>원</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="space"></div>
                        <div class="line"></div>
                        <div class="space"></div>
                    </td>
                </tr>
                    <tr>
                        <th>판매 입찰가</th>
                        <td><%= formatter.format(success.getbPrice()) %>원</td>
                    </tr>
                    <tr>
                        <th>검수비</th>
                        <td><%= formatter.format(success.getInspectionCost()) %>원</td>
                    </tr>
                    <tr>
                        <th>수수료</th>
                        <td><%= formatter.format(success.getCommission()) %>원</td>
                    </tr>
                    <tr>
                        <th>배송비</th>
                        <td>선불/판매자부담</td>
                    </tr>
            </table>
        </div>

        <br><br><br><br><br>

    </div>
	
	
</body>
</html>