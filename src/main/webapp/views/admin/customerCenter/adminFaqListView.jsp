<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 관리</title>
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
    .category{width:100%; height:50px;}
   
    .c-btn{
        border-radius:0;
        border:0.5px solid lightgray;
        font-size:14px;
        font-weight:900;
        width:15%;
        height:100%;
        line-height:35px;
        display:block;
        float:left;
        position:relative;
        left:12%;
        background:white;
        color:black;
    }
    .active{
        background:black;
        color:white;
    }

    #accordion{
        font-size:14px;
        text-align:left;
    }
    #accordion span:first-child{
        margin-right:50px;
        font-weight:600;
    }
    #accordion a{
        text-decoration:none;
        color:black;
        display:inline-block;
        width:100%;
    }
    .card{
        background:white !important;
        border:none !important;
    }
    .card-header{
        background:white !important;
        border-bottom:0.5px solid lightgray !important;
        height:60px;
        line-height:40px;
        position:relative;
    }
    .card-body{
        background:rgb(247, 247, 247) !important;
    }

    .edit-btn, .delete-btn, .writer, .modify-date{
        position:absolute;
        width:60px;
        height:33px;
        font-size:13px !important;
    }
    .edit-btn{
        right:70px;
    }
    .delete-btn{
        right:0px;
    }
    .writer{
        width:200px;
        right:60px;
        font-size:12px !important;
    }
    .modify-date{
        width:200px;
        right:200px;
        font-size:12px !important;
    }
    #search-more-btn{
        display:none;
    }
</style>
</head>
<body>
    <%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer" align="center">
        <div class="outer-2">
            <div class="title">
                <h2><b>자주묻는질문 관리</b></h2>
                <br>
            </div>
            <div class="list-area">
                <div class="input-group mb-3" style="width:400px">
                    <input type="text" class="form-control" placeholder="검색어를 입력하세요." id="search-input" name="keyword">
                    <div class="input-group-append">
                        <button class="btn" type="button" id="search-btn">검색</button>
                    </div>
                    <input type="hidden" name="cpage" value="1">
                </div>
                <br>
            
                <div class="category">
                    <button class="c-btn active" value="all" onclick="categoryFilter(this);">전체</button>
                    <button class="c-btn" value="policy" onclick="categoryFilter(this);">이용정책</button>
                    <button class="c-btn" value="common" onclick="categoryFilter(this);">공통</button>
                    <button class="c-btn" value="buy" onclick="categoryFilter(this);">구매</button>
                    <button class="c-btn" value="sell" onclick="categoryFilter(this);">판매</button>
                </div>
                <br><br>

                <div align="right">
                    <a class="btn btn-dark" data-toggle="modal" data-target="#edit-modal">+ 추가</a>
                    <hr>
                </div>

                <!-- The Modal -->
                <div class="modal" id="edit-modal" align="left">
                    <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">자주묻는질문 등록</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->
                        <form action="insertFaq.ad" method="post">
                            <div class="modal-body">
                                * 카테고리 :
                                <select name="category">
                                    <option value="none">선택하세요</option>
                                    <option value="policy">이용정책</option>
                                    <option value="common">공통</option>
                                    <option value="buy">구매</option>
                                    <option value="sell">판매</option>
                                </select>
                                <br><br><br>
                                * 질문 : <br>
                                <input type="text" style="width:750px" name="question" required><br><br>
                                * 답변 : <br>
                                <textarea name="answer" cols="100" rows="10" style="resize:none" required></textarea>
                            </div>
                    
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" onclick='return validate();'>등록</button>
                            </div>
                        </form>
                
                    </div>
                    </div>
                </div>

                <!-- 리스트 -->
                <div id="accordion">
                
                </div>
                <br><br><br>
                <!-- 페이징 -->
                <div class="btn-area">
                    <button class="btn btn-outline-dark" id="more-btn">더보기</button>
                    <button class="btn btn-outline-dark" id="search-more-btn">더보기</button>
                </div>
                <br><br>
            
            </div>
        </div>
    </div>

    <script>
        let cpage = 0;
        let category = "";
        let keyword = "";

        $(function(){
            $("#search-input").on("keypress", function(e){
                if(e.keyCode == 13){
                    $("#search-btn").click();
                }
            })

            $(".c-btn").click(function(){
                $(this).addClass("active");
                $(this).siblings().removeClass("active");
                $("#search-input").val("");
            })

            // 진입 시 전체 로드
            categoryFilter($(".category>button").eq(0));

        })

        // 삭제
        function deleteFaq(e){
            let faqNo = $(e).attr("id");
            if(confirm("삭제하시겠습니까?")){
                location.href = "<%=contextPath%>/deleteFaq.ad?faqNo=" + faqNo;
            }
        }

        // 등록 유효성검사
        function validate(){
            if($("select[name=category]").val() == "none"){
                alert("카테고리를 선택해주세요.");
                return false;
            }
        }

        function categoryFilter(e){
            $("#accordion").empty();
            cpage = 1;
            category = $(e).val();

            $.ajax({
                url:"<%=contextPath%>/faqFilter.ad",
                type:"post",
                data:{"cpage":cpage, "category":category},
                success:function(map){
                    let list = map.list;
                    let pi = map.pi;
                    
                    let value = "";
                    
                    if(list.length < 10){
                        $("#more-btn").css("display", "none");
                    }else{
                        $("#more-btn").css("display", "block");
                    }

                    if(list.length == 0){
						value += "<div align='center'>작성된 글이 없습니다.</div>";
                        $("#accordion").append(value);
					}else{
                        
                        for(let i=0; i<list.length; i++){{
                            switch(list[i].category){
                                case "policy": list[i].category = "이용정책"; break;
                                case "common": list[i].category = "공통"; break;
                                case "buy": list[i].category = "구매"; break;
                                case "sell": list[i].category = "판매"; break;
                            }

                            value += "<div class='card'>";
                            value += "<div class='card-header'>";
                            value += "<a class='card-link' data-toggle='collapse' href='#collapse" + [i] + "'>";
                            value += "<span>[" + list[i].category + "]</span>" + list[i].faqQuestion + "</a>";
                            value += "<span class='writer'>작성자 : " + list[i].faqWriter + "</span>";
                            value += "<span class='modify-date'>최종수정일 : " + list[i].modifyDate + "</span>";
                            value += "<button type='button' class='btn btn-outline-primary edit-btn' data-toggle='modal' data-target='#edit-modal" + [i] + "'>수정</button>";
                            value += "<button class='btn btn-outline-danger delete-btn' id='"+ list[i].faqNo +"' onclick='deleteFaq(this);'>삭제</button></div>";
                            value += "<div id='collapse" + [i] +"' class='collapse' data-parent='#accordion'>";
                            value += "<div class='card-body'>";
                            value += list[i].faqAnswer;
                            value += "</div></div></div>";
                            
                            // 수정 모달
                            // 모달 헤더
                            value += "<div class='modal' id='edit-modal" + [i] + "'>";
                            value += "<div class='modal-dialog modal-lg'><div class='modal-content'>";
                            value += "<div class='modal-header'><h4 class='modal-titl'>자주묻는질문 수정</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div>";
                            
                            // 모달 바디
                            value += "<form action='updateFaq.ad' method='post'><div class='modal-body'>";
                            value += "* 카테고리 : <select name='category' id='category"+list[i].faqNo+"'>"; 
                            value += "<option value='policy'>이용정책</option>";
                            value += "<option value='common'>공통</option>";
                            value += "<option value='buy'>구매</option>";
                            value += "<option value='sell'>판매</option>";
                            value += "</select><br><br><br>* 질문 : <br><input type='text' style='width:750px' name='question' value='" + list[i].faqQuestion + "' required><br><br>"        
                            value += "* 답변 : <br><textarea name='answer' cols='115' rows='10' style='resize:none' required>" + list[i].faqAnswer  + "</textarea></div>";
                            value += "<input type='hidden' name='faqNo' value='" + list[i].faqNo + "'>";
                                
                            // 모달 푸터
                            value += "<div class='modal-footer'><button type='submit' class='btn btn-primary'>수정</button></div></form></div></div></div>";
                            
                        }}
                        
                        $("#accordion").append(value);

                        for(let i=0; i<list.length; i++){{
                            switch(list[i].category){
                                case "이용정책": list[i].category = "policy"; break;
                                case "공통": list[i].category = "common"; break;
                                case "구매": list[i].category = "buy"; break;
                                case "판매": list[i].category = "sell"; break;
                            }

                            $("#category"+list[i].faqNo).val(list[i].category);
                        }}
                        cpage++;
                    }
                }, error:function(){
                    console.log("faq 리스트 가져오기 통신 실패");
                }
            })
        }
        $("#more-btn").click(function(){
           $.ajax({
                url:"<%=contextPath%>/faqFilter.ad",
                type:"post",
                data:{"cpage":cpage, "category":category},
                success:function(map){
                    let list = map.list;
                    let pi = map.pi;
                    let value = "";
                        
                    if(list.length < 10){
                        $("#more-btn").css("display", "none");
                    }else{
                        $("#more-btn").css("display", "block");
                    }

                    for(let j=0; j<list.length; j++){{
                        switch(list[j].category){
                            case "policy": list[j].category = "이용정책"; break;
                            case "common": list[j].category = "공통"; break;
                            case "buy": list[j].category = "구매"; break;
                            case "sell": list[j].category = "판매"; break;
                        }

                        value += "<div class='card'>";
                        value += "<div class='card-header'>";
                        value += "<a class='card-link' data-toggle='collapse' href='#collapse" + (j+(10*(cpage-1))) + "'>";
                        value += "<span>[" + list[j].category + "]</span>" + list[j].faqQuestion + "</a>";
                        value += "<span class='writer'>작성자 : " + list[j].faqWriter + "</span>";
                        value += "<button type='button' class='btn btn-outline-primary edit-btn' data-toggle='modal' data-target='#edit-modal" + (j+(10*(cpage-1))) +"'>수정</button>";
                        value += "<button class='btn btn-outline-danger delete-btn' onclick='deleteFaq();'>삭제</button></div>";
                        value += "<div id='collapse" + (j+(10*(cpage-1))) +"' class='collapse' data-parent='#accordion'>";
                        value += "<div class='card-body'>";
                        value += list[j].faqAnswer;
                        value += "</div></div></div>";

                        // 수정 모달
                        // 모달 헤더
                        value += "<div class='modal' id='edit-modal" + (j+(10*(cpage-1))) +"'>";
                        value += "<div class='modal-dialog modal-lg'><div class='modal-content'>";
                        value += "<div class='modal-header'><h4 class='modal-titl'>자주묻는질문 수정</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div>";

                        // 모달 바디
                        value += "<form action='updateFaq.ad' method='post'><div class='modal-body'>";
                        value += "* 카테고리 : <select name='category' id='category"+list[j].faqNo+"'>";
                        value += "<option value='policy'>이용정책</option>";
                        value += "<option value='common'>공통</option>";
                        value += "<option value='buy'>구매</option>";
                        value += "<option value='sell'>판매</option>";
                        value += "</select><br><br><br>* 질문 : <br><input type='text' style='width:750px' name='question' value='" + list[j].faqQuestion + "' required><br><br>"        
                        value += "* 답변 : <br><textarea name='answer' cols='115' rows='10' style='resize:none' required>" + list[j].faqAnswer  + "</textarea></div>";
                        value += "<input type='hidden' name='faqNo' value='" + list[j].faqNo + "'>";
                            
                        // 모달 푸터
                        value += "<div class='modal-footer'><button type='submit' class='btn btn-primary'>수정</button></div></form></div></div></div>";
                    }}
                    $("#accordion").append(value);
                    
                    for(let j=0; j<list.length; j++){{
                            switch(list[j].category){
                                case "이용정책": list[j].category = "policy"; break;
                                case "공통": list[j].category = "common"; break;
                                case "구매": list[j].category = "buy"; break;
                                case "판매": list[j].category = "sell"; break;
                            }

                            $("#category"+list[j].faqNo).val(list[j].category);
                    }}

                    cpage++;

                }, error:function(){
                    console.log("faq 리스트 가져오기 통신 실패");
                }
            })
        })
          
        // 검색
        $("#search-btn").click(function(){
            $("#accordion").empty();
            $("#more-btn").css("display", "none");
            
            keyword = $("#search-input").val();
            cpage = 1;

            $.ajax({
                url:"<%=contextPath%>/searchFaq.ad",
                type:"get",
                data:{"cpage":cpage, "keyword":keyword},
                success:function(map){
                    let searchList = map.searchList;
                    let pi = map.pi;
                    let value = "";
                 
                    if(searchList.length < 10){
                        $("#search-more-btn").css("display", "none");
                    }else{
                        $("#search-more-btn").css("display", "block");
                    }

                    if(searchList.length == 0){
                        value += "<div align='center'>검색 결과가 없습니다.</div>";
                        $("#accordion").append(value);
					}else {

                        for(let i=0; i<searchList.length; i++){{
                            switch(searchList[i].category){
                                case "policy": searchList[i].category = "이용정책"; break;
                                case "common": searchList[i].category = "공통"; break;
                                case "buy": searchList[i].category = "구매"; break;
                                case "sell": searchList[i].category = "판매"; break;
                            }

                            value += "<div class='card'>";
                            value += "<div class='card-header'>";
                            value += "<a class='card-link' data-toggle='collapse' href='#collapse" + [i] + "'>";
                            value += "<span>[" + searchList[i].category + "]</span>" + searchList[i].faqQuestion + "</a>";
                            value += "<span class='writer'>작성자 : " + searchList[i].faqWriter + "</span>";
                            value += "<span class='modify-date'>최종수정일 : " + searchList[i].modifyDate + "</span>";
                            value += "<button type='button' class='btn btn-outline-primary edit-btn' data-toggle='modal' data-target='#edit-modal" + [i] + "'>수정</button>";
                            value += "<button class='btn btn-outline-danger delete-btn' id='"+ searchList[i].faqNo +"' onclick='deleteFaq(this);'>삭제</button></div>";
                            value += "<div id='collapse" + [i] +"' class='collapse' data-parent='#accordion'>";
                            value += "<div class='card-body'>";
                            value += searchList[i].faqAnswer;
                            value += "</div></div></div>";
                            
                            // 수정 모달
                            // 모달 헤더
                            value += "<div class='modal' id='edit-modal" + [i] + "'>";
                            value += "<div class='modal-dialog modal-lg'><div class='modal-content'>";
                            value += "<div class='modal-header'><h4 class='modal-titl'>자주묻는질문 수정</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div>";
                            
                            // 모달 바디
                            value += "<form action='updateFaq.ad' method='post'><div class='modal-body'>";
                            value += "* 카테고리 : <select name='category' id='category"+searchList[i].faqNo+"'>"; 
                            value += "<option value='policy'>이용정책</option>";
                            value += "<option value='common'>공통</option>";
                            value += "<option value='buy'>구매</option>";
                            value += "<option value='sell'>판매</option>";
                            value += "</select><br><br><br>* 질문 : <br><input type='text' style='width:750px' name='question' value='" + searchList[i].faqQuestion + "' required><br><br>"        
                            value += "* 답변 : <br><textarea name='answer' cols='115' rows='10' style='resize:none' required>" + searchList[i].faqAnswer  + "</textarea></div>";
                            value += "<input type='hidden' name='faqNo' value='" + searchList[i].faqNo + "'>";
                                
                            // 모달 푸터
                            value += "<div class='modal-footer'><button type='submit' class='btn btn-primary'>수정</button></div></form></div></div></div>";
                            
                        }}
                        
                        $("#accordion").append(value);

                        for(let i=0; i<searchList.length; i++){{
                            switch(searchList[i].category){
                                case "이용정책": searchList[i].category = "policy"; break;
                                case "공통": searchList[i].category = "common"; break;
                                case "구매": searchList[i].category = "buy"; break;
                                case "판매": searchList[i].category = "sell"; break;
                            }

                            $("#category"+searchList[i].faqNo).val(searchList[i].category);
                        }}

                        cpage++;
                    }

                }, error:function(){
                    console.log("faq 검색 통신 실패");
                }
            })
        })

        $("#search-more-btn").click(function(){
            
            $.ajax({
                url:"<%=contextPath%>/searchFaq.ad",
                type:"get",
                data:{"cpage":cpage, "keyword":keyword},
                success:function(map){
                    let searchList = map.searchList;
                    let pi = map.pi;
                    let value = "";
                        
                    if(searchList.length < 10){
                        $("#search-more-btn").css("display", "none");
                    }else{
                        $("#search-more-btn").css("display", "block");
                    }

                    if(searchList.length == 0){
						value += "<div align='center'>검색 결과가 없습니다.</div>";
                        $("#accordion").append(value);
					}else {

                        for(let j=0; j<searchList.length; j++){{
                            switch(searchList[j].category){
                                case "policy": searchList[j].category = "이용정책"; break;
                                case "common": searchList[j].category = "공통"; break;
                                case "buy": searchList[j].category = "구매"; break;
                                case "sell": searchList[j].category = "판매"; break;
                            }

                            value += "<div class='card'>";
                            value += "<div class='card-header'>";
                            value += "<a class='card-link' data-toggle='collapse' href='#collapse" + (j+(10*(cpage-1))) + "'>";
                            value += "<span>[" + searchList[j].category + "]</span>" + searchList[j].faqQuestion + "</a>";
                            value += "<span class='writer'>작성자 : " + searchList[j].faqWriter + "</span>";
                            value += "<button type='button' class='btn btn-outline-primary edit-btn' data-toggle='modal' data-target='#edit-modal" + (j+(10*(cpage-1))) +"'>수정</button>";
                            value += "<button class='btn btn-outline-danger delete-btn' onclick='deleteFaq();'>삭제</button></div>";
                            value += "<div id='collapse" + (j+(10*(cpage-1))) +"' class='collapse' data-parent='#accordion'>";
                            value += "<div class='card-body'>";
                            value += searchList[j].faqAnswer;
                            value += "</div></div></div>";

                            // 수정 모달
                            // 모달 헤더
                            value += "<div class='modal' id='edit-modal" + (j+(10*(cpage-1))) +"'>";
                            value += "<div class='modal-dialog modal-lg'><div class='modal-content'>";
                            value += "<div class='modal-header'><h4 class='modal-titl'>자주묻는질문 수정</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div>";

                            // 모달 바디
                            value += "<form action='updateFaq.ad' method='post'><div class='modal-body'>";
                            value += "* 카테고리 : <select name='category' id='category"+searchList[j].faqNo+"'>";
                            value += "<option value='policy'>이용정책</option>";
                            value += "<option value='common'>공통</option>";
                            value += "<option value='buy'>구매</option>";
                            value += "<option value='sell'>판매</option>";
                            value += "</select><br><br><br>* 질문 : <br><input type='text' style='width:750px' name='question' value='" + searchList[j].faqQuestion + "' required><br><br>"        
                            value += "* 답변 : <br><textarea name='answer' cols='115' rows='10' style='resize:none' required>" + searchList[j].faqAnswer  + "</textarea></div>";
                            value += "<input type='hidden' name='faqNo' value='" + searchList[j].faqNo + "'>";
                                
                            // 모달 푸터
                            value += "<div class='modal-footer'><button type='submit' class='btn btn-primary'>수정</button></div></form></div></div></div>";
                        }}
                    
                        $("#accordion").append(value);
                    
                        for(let j=0; j<searchList.length; j++){{
                            switch(searchList[j].category){
                                case "이용정책": searchList[j].category = "policy"; break;
                                case "공통": searchList[j].category = "common"; break;
                                case "구매": searchList[j].category = "buy"; break;
                                case "판매": searchList[j].category = "sell"; break;
                            }

                            $("#category"+searchList[j].faqNo).val(searchList[j].category);
                        }}

                        cpage++;
                    }
                }, error:function(){
                    console.log("faq 검색리스트 더 가져오기 통신 실패");
                }
            })
        })
    
       

        
    </script>
</body>
</html>