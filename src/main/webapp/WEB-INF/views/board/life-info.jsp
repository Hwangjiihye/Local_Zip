<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


    <style>
        /* 폰트 */
        @font-face {
            font-family: 'GMarketSans';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
            font-weight: 300;
            font-display: swap;
        }

        @font-face {
            font-family: 'GMarketSans';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: 500;
            font-display: swap;
        }

        @font-face {
            font-family: 'GMarketSans';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: 700;
            font-display: swap;
        }


        * {
            box-sizing: border-box;
        }

        body,
        html {
            margin: 0;
            padding: 0;
        }

        /* 폰트 지정 */
        button,
        body {
            font-family: 'GMarketSans', sans-serif;
        }

        .container {
            position: relative;
            top: 100px;

            width: 100%;
            min-height: 100vh;
            /* 최소 높이 지정 : 브라우저 */

            border: 1px solid black;
            background-color: #fbe5c0;
        }


        .headBox {
            position: fixed;
            top: 0;
            left: 0;

            width: 100%;
            height: 100px;

            padding-left: 20px;

            font-weight: bold;
            font-size: 50px;
            color: #A66A3F;
            background-color: #F2D3A2;
            border-bottom: 2px solid #A66A3F;
            /* 아래쪽만 줄 그음 */

            line-height: 100px;
            z-index: 1000;

        }

        .categoryBtnBox {

            width: 100%;
            height: 70px;
        }

        .categoryBtns {

            position: relative;
            top: 20px;
            left: 20px;

            /* 수정: 고정 800px 대신 화면의 90%만 차지하게 */
            width: 90%;
            max-width: 800px;
        }


        .topBtn {
            height: 25px;

            background-color: #FFB300;
            border-radius: 10px;
            border: 1px solid #FFB300;
            color: #3e5e40;

            align-items: center;
            /* 수직 중앙 정렬 */

            vertical-align: middle;
            /* 버튼들끼리 줄이 안 맞을 때를 대비 */

            cursor: pointer;
            transition: 0.3s;
        }

        .categoryBtn {
            margin-right: 10px;
            height: 30px;

            /* 그림자 효과 */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);

            /* 애니메이션 부드럽게 */
            transition: all 0.2s ease;
        }

        .categoryBtn:hover {
            background-color: #fecc56;
            color: #A66A3F;

            transform: translateY(-3px);
            /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        .categoryBtn:active {
            transform: translateY(2px);
            /* 아래로 눌림 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .bodyBox {
            width: 100%;
            min-height: 100vh;
            /* 최소 높이 지정 : 브라우저 */

            margin-top: -40px;
        }


        .orderBox {
            text-align: right;
            font-size: 14px;

            position: relative;
            top: 30px;

            width: 95%;
            max-width: 1500px;

            margin: auto;

            border-radius: 10px;
        }

        .orderNew {
            display: none;
        }

        .orderBtn {
            border: none;
            border-radius: 30%;
            background-color: transparent;

            font-size: 15px;

            color: #A66A3F;
        }

        .orderBtn:hover {
            background-color: #fecc56;
        }


        .postBox {
            /* 수정: 고정 1500px 제거 */
            width: 95%;
            max-width: 1500px;
            /* 적당히 보기 좋은 최대 너비 설정 */

            min-height: 200px;
            height: auto;

            margin: auto;
            margin-top: 30px;

            border-radius: 10px;
            
            /* 그림자 효과 */
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);

        }

        .postUpBox {
            width: 100%;
            height: 95px;
            display: flex;
            
            border-radius: 10px 10px 0 0;
            background-color: #F2D3A2;
        }


        .postProfile {
            width: 75px;
            height: 75px;
            border: 4px solid #A66A3F;
            border-radius: 50%;

            position: relative;
            top: 10px;
            left: 10px;

        }

        .contentProfile {
            margin-top: -10px;
            margin-left: 2px;
        }

        .postInfoBox {
            width: 300px;
            min-height: 50px;

            position: relative;
            left: 20px;
            top: 23px;

            flex-grow: 1;
            /* 신고박스 오른쪽으로 딱 붙게 하기 위해 빈공간을 쭉 늘려주는 코드 */
        }

        .postInfoUp,
        .postInfoDown {
            display: flex;
        }


        .profileInfo {
            width: auto;
            margin-right: 15px;
            /* 정보 사이의 간격 일정하게 부여 */

            /*수직 정렬*/
            display: flex;
            align-items: center;

            font-size: 14px;
            color: #333;
        }


        /* 신고 영역 스타일 */
        .reportArea {
            position: relative;
            top: 15px;
            right: 20px;

            display: flex;
            flex-direction: column;
            /* 아이콘과 선택창을 세로로 배치 */
            align-items: flex-end;
            /* 오른쪽 정렬 */
            gap: 5px;
        }

        .reportIcon {
            color: #A66A3F;
            font-size: 20px;
            cursor: pointer;
        }

        .reportSelect {
            font-family: 'GMarketSans';
            border: 1px solid #A66A3F;
            border-radius: 5px;
            background-color: #F2D3A2;
            color: #A66A3F;
            font-size: 12px;
            padding: 2px;
            outline: none;

            display: none;
        }


        .postMidBox {
            width: 100%;
            height: auto;
        }

        .postTitle {
            margin: auto;

            width: 95%;
            height: 40px;

            font-size: 25px;
            margin-bottom: 10px;
        }

        .postContent {
            margin: auto;

            width: 95%;
            min-height: 40px;
            height: auto;

            font-size: 18px;

            background-color: #f0d8af;
            border-radius: 5px;
        }


        .postDownBox {
            width: 95%;
            margin: auto;

            min-height: 40px;
            display: flex;
        }

        .postLikeBox,
        .postCommentBox {
            display: flex;
            align-items: center;

            min-width: 80px;
            width: auto;

            gap: 10px;

            cursor: pointer;
            transition: 0.3s;
        }


        .beforeHeart:hover,
        .afterHeart:hover,
        .comment:hover {
            color: #cdaa69;
        }

        .afterHeart {
            display: none;
        }

        /* active 클래스가 붙었을 때의 제어 */
        .postLikeBox.active .beforeHeart {
            display: none;
        }

        .postLikeBox.active .afterHeart {
            display: inline;
            color: red;
        }

        .navicon:hover {
            transform: translateY(-3px);
            /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        .navicon:active {
            transform: translateY(2px);
            /* 아래로 눌림 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .bottomBox {
            border: 1px solid #A66A3F;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            border-top: 2px solid #A66A3F;
            background-color: #F2D3A2;

            gap: 200px;
        }

        hr {
            width: 97%;

            margin-bottom: 40px;
            border: 1px solid #cdaa69;
            ;
        }
        
        .pageBox{
            width: 100%;
    		text-align: center;   /* 가운데 정렬 */
    		padding: 20px 0;      /* 상하 여백 */
    		margin-bottom: 80px;  /* 중요: 하단 바에 가려지지 않도록 아래쪽 여백 확보 */
    
    		font-size: 18px;
    		color: #A66A3F;
    		font-weight: bold;
        }
        
        
        .writeBtn{
            width: 50px;
            height: 50px;
            right: 30px;
            bottom: 90px;
            cursor: pointer;
            margin-top: 90%;
            border-radius: 50%;
            background-color: #A66A3F;
            border: #fbe5c0;
            color: #fbe5c0;
            font-size: 30px;
            position: fixed; /* 버튼 따라다니게 만들기 */

            align-items: center;
            display: flex;
            justify-content: center;

            /* 그림자 효과 */
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);

            /* 애니메이션 부드럽게 */
            transition: all 0.2s ease;
        }
        
        .writeBtn:hover{
        	transform: translateY(-3px); /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }
        
        
    </style>

</head>
<body>

    <div class="container">

        <div class="headBox">우리 동네.zip</div>

        <div class="categoryBtnBox">
            <div class="categoryBtns">
                <a href="/"><button class="categoryBtn topBtn"><i class="fa-solid fa-house fa-lg"></i> 전체</button></a>
                <button class="categoryBtn topBtn"><i class="fa-regular fa-lightbulb fa-lg"></i> "생활정보"</button>
                <button class="categoryBtn topBtn"><i class="fa-solid fa-utensils fa-lg"></i> 맛집/카페</button>
                <button class="categoryBtn topBtn"><i class="fa-regular fa-comment-dots fa-lg"></i> 고민/이야기</button>
                <button class="categoryBtn topBtn"><i class="fa-solid fa-shirt fa-lg"></i> 미용/패션</button>
            </div>
        </div>

        <hr>

        <div class="bodyBox">

            <div class="orderBox">
                <button class="orderNew orderBtn">최신순</button>
                <button class="orderPopular orderBtn">인기순</button>
            </div>

            <div class="postBox">

                <div class="postUpBox">

                    <div class="postProfile">
                        <img class="contentProfile" src="/resources/images/Profile.png" width="60px">
                    </div>

                    <div class="postInfoBox">
                        <div class="postInfoUp">
                            <div class="profileName profileInfo">홍길동</div>
                            <div class="profileLocal profileInfo">지역(동)</div>
                            <div class="profileCatagory profileInfo">
                                <button class="topBtn">카테고리</button>
                            </div>
                        </div>

                        <div class="postInfoDown">
                            <div class="profileTime profileInfo">00시간 전</div>
                        </div>
                    </div>


                    <div class="reportArea">
                        <i class="fa-solid fa-flag reportIcon"></i>
                        <select class="reportSelect">
                            <option value="" disabled selected>신고 사유</option>
                            <option value="1" class="reportOption">부적절한 콘텐츠</option>
                            <option value="2" class="reportOption">욕설/비방</option>
                            <option value="3" class="reportOption">광고/스팸</option>
                        </select>
                    </div>


                </div>

                <div class="postMidBox">

                    <div class="postTitle">제목이 들어가는 곳</div>
                    <div class="postContent">내용들이 들어가는 곳</div>

                </div>

                <div class="postDownBox">

                    <div class="postLikeBox">
                        <i class="fa-regular fa-heart fa-xl beforeHeart"></i>
                        <i class="fa-solid fa-heart fa-xl afterHeart"></i>

                        <div>갯수</div>
                    </div>

                    <div class="postCommentBox">
                        <i class="fa-regular fa-comment fa-xl comment"></i>

                        <div>갯수</div>
                    </div>

                </div>

            </div>

        </div>

        <div class="pageBox">1 2 3</div>
        
        <button class="writeBtn"><i class="fa-solid fa-circle-plus fa-2xl" style="color: rgb(255, 179, 0);"></i></button>
        

        <div class="bottomBox">
            <a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
            <a><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a>
            <a><i class="navicon fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>

        </div>

    </div>


    <script>

        // 최신순, 인기순 버튼
        $(".orderNew").on("click", function () {
            $(".orderNew").css({ "display": "none" });
            $(".orderPopular").css({ "display": "inline" });
        })

        $(".orderPopular").on("click", function () {
            $(".orderNew").css({ "display": "inline" });
            $(".orderPopular").css({ "display": "none" });
        })


        // 좋아요 버튼
        $(".postLikeBox").on("click", function () {
            $(this).toggleClass("active"); // 클릭할 때마다 active 클래스를 넣었다 뺐다 함
        });

        // 신고버튼을 눌렀을 때, 신고 사유가 튀어나오게
        $(".reportIcon").on("click", function () {
            $(".reportSelect").css({ "display": "inline" });
        })


    </script>

</body>
</html>