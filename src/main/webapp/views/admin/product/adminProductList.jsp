<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.scale.admin.product.model.vo.*, com.scale.common.model.vo.PageInfo" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	ArrayList<Brand> blist = (ArrayList<Brand>)request.getAttribute("blist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자_상품목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>
         .outer{
        width:1200px;
        margin:auto;
   		}
        
        
        .searchbox{
            background-color: lightgray;
            border:1px solid black;
            width: 700px;
        }

        .table table-hover{
            width:700px;
        }
        
    </style>
</head>
<body>
		<%@ include file="../common/adminMenubar.jsp"%>
		<div class="outer" align="center">
		
	  <h1>상품목록</h1>

   	  <table class="searchbox">
        <tr>
            <th>카테고리</th>
            <td colspan="4"><input type="checkbox" name="cate" checked>전체 <input type="checkbox" name="cate">신발  <input type="checkbox" name="cate">지갑  <input type="checkbox" name="cate">테크</td>
        </tr>
        <tr>
            <th>브랜드</th>
            <td>
                <select name="brand" id="">
                    <option value="" selected>전체</option>
                     <% for(Brand b : blist){ %>
                    <option value=""><%= b.getBrandName() %></option>
                    <% } %>
                    <option value=""></option>
                </select>
            </td>
            <th>사이즈</th>
            <td>
                <select name="" id="">
                    <option value="" selected>전체</option>
                    <% for(Product p : list) { %>
                    <option value=""><%= p.getProductSize() %></option>
                    <% } %>

                </select>
            </td>
        </tr>
        <tr>
            <th>검색</th>
            <td>
                <div id="search-text">
                    <input type="text" name="keyword" placeholder="브랜드, 모델명 등">
                    <input type="submit" value="검색">
                </div>
            </td>
        </tr>
    </table>

    <br><br><br>
    <button type="button" class="btn btn-outline-primary" <%=contextPath%>/AdPenroll.apd>상품등록</button>
    <br><br><br>

    <table class="table table-hover">
        <tr class="thead-light">
            <th>상품번호</th>
            <th>카테고리</th>
            <th>상품명</th>
            <th>상품명(영)</th>
            <th>모델번호</th>
            <th>브랜드</th>
            <th>사이즈</th>
            <th>등록날짜</th>
            <th>블라인드</th>
            
        </tr>
         <% if(list.isEmpty()) { %>
           <!-- 게시글 없을 경우-->
            <tr>
               <td colspan="4">검색된 게시글이 없습니다.</td>
            </tr>
         <% }else { %>
                            <!-- 게시글 있을 경우-->
        	<%for(Product p : list) { %>
		        <tr class="line">
		            <td><%=p.getProductCode() %></td>
		            <td><%=p.getProductCategory() %></td>
		            <td><%=p.getProductNameKo() %></td>
		            <td><%=p.getProductNameEng() %></td>
		            <td><%=p.getModelCode() %></td>
		            <td><%=p.getBrandName() %></td>
		            <td><%=p.getProductSize() %></td>
		            <td><%=p.getEnrollDate() %></td>
		            <td><%=p.getBlindCheck() %></td>
		        </tr>
	        <% } %>
     	<% } %>
    </table>
    
     <script>
     		
		     $(document).on("click", ".line", function(){
		 		location.href = "<%= contextPath %>/AdPSelect.apd?co=" + $(this).children().eq(0).val();
		 	})
		     
     </script>
     
     <div class="paging-area">
            
            <% if(pi.getCurrentPage() != 1){ %>
            <button onclick="location.href='<%=contextPath%>/Adpsearch.apd?cpage=<%=pi.getCurrentPage() - 1%>';">&lt;</button>
			<%} %>
			
			<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
            <button onclick="location.href='<%=contextPath%>/Adpsearch.apd?cpage=<%=p%>';"><%= p %></button>
            <%} %>

			<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
            <button onclick="location.href='<%=contextPath%>/Adpsearch.apd?cpage=<%=pi.getCurrentPage() + 1%>';">&gt;</button>
			<%} %>

        </div>
      </div>
	
</body>
</html>