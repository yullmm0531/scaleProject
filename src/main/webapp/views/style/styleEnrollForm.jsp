<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>form>table{width: 400px; height: 600px}

    #style-img>img{width: 300px; height: 300px; box-sizing: border-box;}
    #style-img{width: 300px;}
    #input-box{height: 70px; padding: 15px;}
    #thumbnail-td{vertical-align: top; padding-left: 15px;}
    #thumbnail-td>div{width: 420px; height: 165px; border: 1px solid lightgray;}
    #content{border-top: 1px solid lightgray;}

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer" align="center">
        <br>
        <h2 style="font-size: 30px;"><b>스타일 등록</b></h2>
        <br>

        <form action="<%= contextPath %>/insert.bo" method="post" enctype="multipart/form-data">
		<!-- 첨부파일 정보를 넘기고싶으면 반드시 enctype="multipart/form-data" 속성 작성해야함 -->
            <table border="1">
                <tr>
                    <td rowspan="2" id="style-img">
                        
                    </td>
                    <td id="input-box">
                        <input multiple="multiple" type="file" id="files" name="files[]" style="display: none;" onchange="loadImg(this);" />
                        <button type="button" class="btn btn-outline-primary btn-sm" id="file-btn" onclick="clickFile();">파일 선택

                        <script>
                            function clickFile(){
                                $("#files").click();
                            }

                            function loadImg(inputFile){
                                let fileArr = inputFile.files;
                                let fileURLs = [];
                                let fileLength = fileArr.length > 10 ? 10 : fileArr.length; // 최대 10개까지만 가능

                                for (let i = 0; i < fileLength; i++) {
                                    let file = fileArr[i];
                                    let reader = new FileReader();
                                    
                                    reader.onload = function(e){
                                        console.log(e.target.result);
                                    }

                                }
                                
                            };

                        </script>
                    </td>
                </tr>
                <tr>
                    <td id="thumbnail-td">
                        <div>
                            <div style="display: inline-block; position: relative; width: 70px; height: 70px; margin: 5px; z-index: 1;">
                                <img src="resource/img/city1.jpg" style="width: 100%; height: 100%; z-index: none;">
                                <div style="width: 20px; height: 20px; position: absolute; font-size: 10px; right: 0px; top: 0px; z-index: 999; background-color: none; text-align: center;">🗑</div>
                            </div>
                            
                        </div>
                            
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="search">
                        <a href="" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#myModal">상품태그 검색</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="pd-thumbnail">
                        <div style="display: inline-block; position: relative; width: 80px; height: 80px; margin: 5px; z-index: 1;">
                            <img src="resource/img/city1.jpg" style="width: 100%; height: 100%; z-index: none;">
                            <div style="width: 30px; height: 30px; position: absolute; font-size: 10px; right: 0px; top: 0px; z-index: 999; text-align: right;">🗑</div>
                            <span>상품설명</span>
                        </div>
                        <div style="display: inline-block; position: relative; width: 80px; height: 80px; margin: 5px; z-index: 1;">
                            <img src="resource/img/city1.jpg" style="width: 100%; height: 100%; z-index: none;">
                            <div style="width: 30px; height: 30px; position: absolute; font-size: 10px; right: 0px; top: 0px; z-index: 999; text-align: right;">🗑</div>
                            <span>상품설명</span>
                        </div>
                        <div style="display: inline-block; position: relative; width: 80px; height: 80px; margin: 5px; z-index: 1;">
                            <img src="resource/img/city1.jpg" style="width: 100%; height: 100%; z-index: none;">
                            <div style="width: 30px; height: 30px; position: absolute; font-size: 10px; right: 0px; top: 0px; z-index: 999; text-align: right;">🗑</div>
                            <span>상품설명</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="content">
                        <textarea name="" id="" cols="130" rows="3" style="resize: none; border: none;" placeholder="#아이템과 #스타일을 자랑해보세요..."></textarea>
                    </td>
                </tr>
            </table>
            <br>

            <div>
                <button type="submit" class="btn btn-secondary">작성하기</button>
                <button type="reset" class="btn btn-secondary">취소하기</button>
            </div>

        </form>
    </div>

    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <input type="text" placeholder="상품이름 검색" style="width: 470px; margin: 10px;">
                <!-- Modal body -->
                <div style="margin: 10px;">
                    <img src="resource/img/city1.jpg" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <div style="margin: 10px;">
                    <img src="resource/img/city1.jpg" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <div style="margin: 10px;">
                    <img src="resource/img/city1.jpg" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <div style="margin: 10px;">
                    <img src="resource/img/city1.jpg" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <div style="margin: 10px;">
                    <img src="resource/img/city1.jpg" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <div style="margin: 10px;">
                    <img src="resource/img/city1.jpg" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <div style="margin: 10px;">
                    <img src="resource/img/city1.jpg" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <div style="margin: 10px;">
                    <img src="resource/img/city1.jpg" style="width: 60px; height: 60px;">
                    <span>상품정보~~~~~~~~~~~~~~~</span>
                </div>
                <!-- Modal footer -->
                    <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
        
            </div>
        </div>
    </div>
</body>
</html>