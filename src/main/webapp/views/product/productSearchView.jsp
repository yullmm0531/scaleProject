<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.scale.product.model.vo.*, java.util.ArrayList"%>
<%
	String keyword = String.valueOf(request.getAttribute("keyword"));
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
    </style>
</head>
<body>
    
		<%@ include file="../common/menubar.jsp" %> 
		
		<!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
		   검색
		</button>
		
	      <!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
            
            <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">상품검색</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
            
            <!-- Modal body -->
     		 <div class="modal-body">
                <form action="" id="search-form" action="<%=contextPath%>/psearch.pd">
                    <div id="search-text">
                        <input type="text" id="productInput" name="keyword" placeholder="상품명을 입력하세요" onkeyup="search(this);">
                    </div>
                    <div id="search-btn"><button>검색</button></div>
                    
                    <% if(list.isEmpty()){ %>
                        <div id="nolsit">검색하신 결과가 없습니다.</div>
                    <%} else {%>
                    	<% for(Product p : list) { %>
                         <div id="productlist">
                            <tr>
                                <td colspan="2"><img src="<%= contextPath %>/<%= p.getProductImgM() %>" width="50px;"></td>
                                <td><%= p.getProductNameEng() %></td>
                                <td><%= p.getProductNameKo() %></td>
                                <input type="hidden" value="<%= p.getProductCode() %>">
                            </tr>
                         </div>
                    	<% } %>
                     <% } %>
                    <h5 id="selected"></h5>
                </form>
            </div>

            <br>
            <div  class="p-cate">
                <h4>카테고리</h4>
                <table>
                    <tr>
                        <td><img src="resources/images/product/SS-1.jpg"  width=100px></td>
                        <td><img src="resources/images/product/WT-17.jpg" width=100px></td>
                        <td><img src="resources/images/product/WT-26.jpg" width=100px></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신발</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지갑</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;테크</td>
                    </tr>
                </table>
            </div>
        
            <br><br>
            
            <div class="b-popular">
                <h4>인기브랜드</h4>
                <table>
                    <tr>
                        <td><img src="resources/images/product/brand/pb13.jpg" width=100px></td>
                        <td><img src="resources/images/product/brand/pb8.jpg" width=100px></td>
                        <td><img src="resources/images/product/brand/pb18.jpg" width=100px></td>
                    </tr>
                    <tr>
                        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nike</td>
                        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jordan</td>
                        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UGG</td>
                    </tr>
                </table>
            </div>
        
            <br><br>
           
        </div>
     <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
</div>
    <script>
    	
    

    
	    $(document).on("click", "#productlist", function(){
			location.href = "<%= contextPath %>/detail.pd?co=" + $(this).children().eq(0).val();
		})
    </script>
</body>
</html>	