<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

</head>
<body>
   <%@ include file="../common/adminMenubar.jsp"%>
   
   <div class="outer" align="center">
        <div id="title"><h4>전체 회원 관리</h4></div>
        <br><br>
            <table class="list-area">
                <thead>
                    <tr>
                        <th width="90">회원번호</th>
                        <th width="120">아이디</th>
                        <th width="90">이름</th>
                        <th width="150">연락처</th>
                        <th width="90">구매중</th>
                        <th width="90">판매중</th>
                        <th width="90">구매입찰</th>
                        <th width="90">판매입찰</th>
                        <th width="90">구매완료</th>
                        <th width="90">판매완료</th>
                        <th width="90">스타일차단</th>
                        <th width="90">SHOP차단</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()){ %>
                        <!-- case1. 게시글이 없을 경우 -->
                        <tr>
                            <!--<td colspan="6">조회된 게시글이 없습니다.</td>-->
                        </tr>
                    <% }else{ %>
                        <!-- case2. 게시글이 있을 경우 -->
                        <tr>
                            <td>100</td>
                            <td>user01</td>
                            <td>홍길동</td>
                            <td>010-1111-2222</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>N</td>
                            <td>N</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
    </div>
</body>
</html>