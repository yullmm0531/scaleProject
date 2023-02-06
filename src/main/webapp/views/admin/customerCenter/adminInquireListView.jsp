<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.scale.customerCenter.model.vo.Inquire, com.scale.common.model.vo.PageInfo" %>
<% 
	ArrayList<Inquire> list = (ArrayList<Inquire>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 관리</title>
<style>
     .outer{
        width:1200px;
        margin:auto;
    }
    .outer-2{float:left; width:80%;}
    .title{
        margin:70px 0px;
    }
    .mb-3 button{
        background:black;
        color:white;
    }
    input[type=radio]{
        margin:10px;
    }
    .table{
        text-align:center;
        font-size:14px;
    }
    .table>tbody>tr:hover{
        cursor: pointer;
    }
    .inquire-content-wrap{
        display:none;
    }
    .paging-area button{
        border:0.5px solid lightgray;
    }
    .page-active{
        background:black;
        color:white;
    }
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>

    <div class="outer" align="center">
        <div class="outer-2">
            <div class="title">
                <h2><b>1:1문의 관리</b></h2>
                <br>
            </div>
            <div align="left">
                <input type="radio" name="category" value="all" checked>전체
                <input type="radio" name="category" value="buy" onclick="filtering($(this).val(), 1);">구매
                <input type="radio" name="category" value="sell" onclick="filtering($(this).val(), 1);">판매
                <input type="radio" name="category" value="payment" onclick="filtering($(this).val(), 1);">결제
                <input type="radio" name="category" value="shipping" onclick="filtering($(this).val(), 1);">배송
                <input type="radio" name="category" value="product" onclick="filtering($(this).val(), 1);">상품
                <input type="radio" name="category" value="site" onclick="filtering($(this).val(), 1);">사이트이용
            </div>
            <br>
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                    	<th>번호</th>
                        <th>구분</th>
                        <th width="600">문의 제목</th>
                        <th>문의일</th>
                        <th>문의자</th>
                        <th>답변유무</th>
                        <th>답변자</th>
                        <th>답변일</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()) {%>
                        <!-- case1. 문의 내역 없을 때 -->
                        <tr>
                            <td colspan="5" align="center">문의 내역이 없습니다.</td>
                        </tr>
                    <%}else {%>
                        <% for(Inquire iq : list) {%>
                            <% switch(iq.getCategory()){ 
                            case "buy": iq.setCategory("구매"); break;
                            case "sell": iq.setCategory("판매"); break;
                            case "site": iq.setCategory("사이트이용"); break;
                            case "payment": iq.setCategory("결제"); break;
                            case "shipping": iq.setCategory("배송"); break;
                            case "product": iq.setCategory("상품"); break;
                            }	
                            %>
                        <!-- case2. 문의 내역 있을 때 -->
                           <tr class="my-inquire">
                           	   <td><%= iq.getInquireNo() %></td>
                               <td><%= iq.getCategory() %></td>
                               <td class="inquire-title">
                                   <div>
                                       <p><%= iq.getInquireTitle() %></p>
                                   </div>
                               </td>
                               <td><%= iq.getInquireDate() %></td>
                               <td><%= iq.getInquireUser() %></td>
                               <td><%= iq.getAnswerStatus() %></td>
                               <% if(iq.getAnswerUser() == null){%>
                               	<td>-</td>
                               <%}else{ %>
                               	<td><%= iq.getAnswerUser() %></td>
                               <%} %>
                               <% if(iq.getAnswerModifyDate() == null){%>
                               	<td>-</td>
                               <%}else{ %>
                               	<td><%= iq.getAnswerModifyDate() %></td>
                               <%} %>
                           </tr>
                        <%} %>
                    <%} %>
                </tbody>
            </table>
            <br><br>

            <!-- 페이징 -->
            <div class="paging-area">
                <% if(pi.getCurrentPage() != 1) { %>
                    <button onclick="location.href='<%=contextPath%>/inquireList.ad?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                <% } %>
                
                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
                    <button onclick="location.href='<%=contextPath%>/inquireList.ad?cpage=<%=i%>';"><%= i %></button>
                <% } %>
                
                <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                    <button onclick="location.href='<%=contextPath%>/inquireList.ad?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                <% } %>
            </div>
            <br><br>
        </div>
    </div>

    <script>
        let category = "";
        let cpage = 0;

        $(function(){
            $(".paging-area>button").each(function(){
                if($(this).text() == "<%=pi.getCurrentPage()%>"){
                    $(this).addClass("page-active");
                }
            })

            $("input[name=category]:first").on("change", function(){
                location.href = "<%=contextPath%>/inquireList.ad?cpage=1";
            })
            
            $(".table tr:not(:first)").on("click", function(){
                let inquireNo = $(this).children(":first").text();
                location.href = "<%=contextPath%>/detailInquire.ad?inquireNo=" + inquireNo;
            })

        })

        function filtering(e, c){
            category = e;
            cpage = c;
            $("tbody").empty();
            $(".paging-area").empty();
            $.ajax({
                url:"<%=contextPath%>/inquireFilter.ad",
                data:{"category":category, "cpage":cpage},
                success:function(map){
                    let list = map.list;
                    let pi = map.pi;
                    let value = "";
                    let paging = "";
                    if(list.length == 0){
                        value = "<tr><td colspan='5' align='center'>등록된 문의가 없습니다.</td></tr>";
                    }else{
                        for(let i=0; i<list.length; i++){{
                        switch(list[i].category){
                            case "buy": list[i].category = "구매"; break;
                            case "sell": list[i].category = "판매"; break;
                            case "payment": list[i].category = "결제"; break;
                            case "shipping": list[i].category = "배송"; break;
                            case "product": list[i].category = "상품"; break;
                            case "site": list[i].category = "사이트이용"; break;
                        }

                        value += "<tr class='my-inquire'>";
                        value += "<td>" + list[i].inquireNo + "</td>";
                        value += "<td>" + list[i].category + "</td>";
                        value += "<td class='inquire-title'>";
                        value += "<div><p>" + list[i].inquireTitle + "</p></div></td>";
                        value += "<td>" + list[i].inquireDate + "</td>";
                        value += "<td>" + list[i].inquireUser + "</td>";
                        value += "<td>" + list[i].answerStatus + "</td>";
                        
                        if(list[i].answerStatus == 'N'){
                            value += "<td>-</td>";
                            value += "<td>-</td>";
                        }else{
                            value += "<td>" + list[i].answerUser + "</td>"
                            value += "<td>" + list[i].answerModifyDate + "</td>";
                        }
                        value += "</tr>"

                        switch(list[i].category){
                            case "구매": list[i].category = "buy"; break;
                            case "판매": list[i].category = "sell"; break;
                            case "결제": list[i].category = "payment"; break;
                            case "배송": list[i].category = "shipping"; break;
                            case "상품": list[i].category = "product"; break;
                            case "사이트이용": list[i].category = "site"; break;
                        }

                        category = list[i].category;
                    }}
                        if(pi.currentPage != 1){
                            paging += "<button onclick='filtering(`"+category+"`,"+(cpage-1)+");'>&lt;</button>";
                        }
                        for(let i=pi.startPage; i<=pi.endPage; i++){
                            paging += "<button onclick='filtering(`"+category+"`,"+i+");'>"+i+"</button>";
                        }

                        if(pi.currentPage != pi.maxPage && pi.maxPage != 0){
                            paging += "<button onclick='filtering(`"+category+"`,"+(cpage+1)+");'>&gt;</button>";
                        }
                    }
                    
                    $("tbody").append(value);
                    $(".paging-area").append(paging);

                    $(".table tr:not(:first)").on("click", function(){
                        let inquireNo = $(this).children(":first").text();
                        location.href = "<%=contextPath%>/detailInquire.ad?inquireNo=" + inquireNo;
                    })
                }, error:function(){
                    console.log("필터링 통신 실패");
                }
            })
        }

            
       

    </script>
</body>
</html>