<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자_</title>
  
    <style>
        #header-1{width:500px; height:30px;}
        #header-1{position:relative;}
        #search-form>div{
            height:100%;
            float:left;
        }
        #search-text{width:80%;}
        #search-btn{width:20%;}
        #search-form input{
            width:100%; 
            height:100%;
            box-sizing: border-box;
        }

        .img-box > img {
            width:100%;
            display:block;
        }
        .row::after {
            content:"";
            display:block;
            clear:both;
        }
        .cell {
            float:left;
            box-sizing:border-box
        }
        .list-box-1 .cell {
            width:20%;
            padding:0 10px;
            margin-top:20px;
            cursor:pointer;
        }
        .list-box-1 .row {
            margin:0 -10px;
        }
        .list-box-1 .cell > .prod-name, .list-box-1 .cell > .prod-price {
            text-align:center;
            font-weight:bold;
            margin-top:5px;
        }
    </style>
</head>
<body>
		<%@ include file="../common/adminMenubar.jsp"%>
	
		 <h1>브랜드 관리</h1>
    <div id="header-1">
        <form action="" id="search-form">
            <div id="search-text">
                <input type="text" name="keyword" placeholder="브랜드명 검색">
            </div>
            <div id="search-btn">
                <input type="submit" value="검색">
            </div>
        </form>
    </div>

    <button type="submit" class="btn btn-primary" name="btn">추가</button>

    <div class="list-box-1">
        <ul class="row">
            <li class="cell">
                <div class="img-box">
                    <img src="resources/s_sample.jpg" alt="">
                </div>
                <div class="brand_name">Jordan</div>
                <div class="modify"><img src="" alt=""></div>
                <div class="delete"><img src="" alt=""></div>
            </li>
            <li class="cell">
                <div class="img-box">
                    <img src="resources/s_sample.jpg" alt="">
                </div>
                <div class="brand_name">Jordan</div>
                <div class="modify"><img src="" alt=""></div>
                <div class="delete"><img src="" alt=""></div>
            </li>
            <li class="cell">
                <div class="img-box">
                    <img src="resources/s_sample.jpg" alt="">
                </div>
                <div class="brand_name">Jordan</div>
                <div class="modify"><img src="" alt=""></div>
                <div class="delete"><img src="" alt=""></div>
            </li>
            <li class="cell">
                <div class="img-box">
                    <img src="resources/s_sample.jpg" alt="">
                </div>
                <div class="brand_name">Jordan</div>
                <div class="modify"><img src="" alt=""></div>
                <div class="delete"><img src="" alt=""></div>
            </li>
        </ul>
        <ul class="row">
            <li class="cell">
                <div class="img-box">
                    <img src="resources/s_sample.jpg" alt="">
                </div>
                <div class="brand_name">Jordan</div>
                <div class="modify"><img src="" alt=""></div>
                <div class="delete"><img src="" alt=""></div>
            </li>
            <li class="cell">
                <div class="img-box">
                    <img src="resources/s_sample.jpg" alt="">
                </div>
                <div class="brand_name">Jordan</div>
                <div class="modify"><img src="" alt=""></div>
                <div class="delete"><img src="" alt=""></div>
            </li>
            <li class="cell">
                <div class="img-box">
                    <img src="resources/s_sample.jpg" alt="">
                </div>
                <div class="brand_name">Jordan</div>
                <div class="modify"><img src="" alt=""></div>
                <div class="delete"><img src="" alt=""></div>
            </li>
            <li class="cell">
                <div class="img-box">
                    <img src="resources/s_sample.jpg" alt="">
                </div>
                <div class="brand_name">Jordan</div>
                <div class="modify"><img src="" alt=""></div>
                <div class="delete"><img src="" alt=""></div>
            </li>
        </ul>
    </div>
    
</body>
</html>