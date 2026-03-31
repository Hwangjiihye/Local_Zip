<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<style>
        * {
            box-sizing: border-box;
        }

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

        button, body {
            font-family: 'GMarketSans', sans-serif;
            font-weight: bold;
        }

        body,html {
            margin: 0;
            padding: 0;
            background-color: #fbe5c0;
        }

        .container{
            width: 100%;
            min-height: 100vh;
            padding-bottom: 80px;
        }

        .topBar{ /* 상단바 고정 */
            width: 100%;
            padding-left: 20px;
            font-weight: bold;
            font-size: 50px;
            color: #A66A3F;
            border-bottom: 2px solid #A66A3F;
            background-color: #F2D3A2;
            height: 100px;
            z-index: 1000;
            position: fixed;
            display: fixed;
            top: 0;
            left: 0;
        }

        .loginBox{
            display: flex;
            justify-content: flex-end;
            align-items: flex-end;
            height: 0px;
            padding-right: 30px;
            gap: 0px;
        }

        /* .loginBtn{
            margin-left: 1400px;
            margin-top: 30px; 
        } */

        .joinBtn{
            margin-left: -1px;
        } 

        .logoutBtn{
            margin-left: 1400px;
        }

        .bottomBar{
            border: 2px solid #A66A3F;
            background-color: #F2D3A2;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            gap: 200px;
        }

        .notice {
            width: 90%;
            min-height: 100px;
            border-radius: 10px;
            margin-top: 10px;
            margin-left: 20px;
        }

        .postBox {
            width: 90%;
            min-height: 200px;
            margin-top: 10px;
            margin-left: 20px;
            border-radius: 10px;
            border: 1px solid black;
        }

        .centerBox{
            width: 100%;
            margin-top: 100px;
            position: relative;
            top: 10px;
        }

        .userBar {
            width: 1860px;
            height: 100px;
            margin-top: 20px;
            margin-left: 20px;
            border-radius: 10px;
            font-size: 30px;
            color: #A66A3F;
            border: 1px solid #A66A3F;
            background-color: #F2D3A2;
            display: flex;
        }

        /* userBar의 개인 사진 */
        .profile { 
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            /* 찌그러짐 방지 */
            margin-top: 10px;
            margin-left: 10px;
        }

        .welcome {
            margin-top: 20px;
            margin-left: 20px;
        }

        .categoryBtn {
            gap: 10px;
            height: 40px;
            margin-top: 10px;
            margin-left: 20px;
        }

        .leftBox{
            margin-left: 20px;
            width: 1500px;
        }

        .notice {
            width: 1500px;
            height: 150px;
            border-radius: 10px;
            margin-top: 0px;
            margin-left: 0px;
        }

        .postBox {
            width: 1500px;
            min-height: 200px;
            margin-top: 10px;
            margin-left: 0px;
            border-radius: 10px;
            border: 1px solid black;
        }

        .rightBox{
            width: 300px;
            height: 500px;
            border-radius: 10px;
            margin-left: 40px;
        }
        
        .subBox{
            width: 100%;
            display: flex;
        }

        .orderBy{
            text-align: right;
            line-height: 30px;
            height: 20px;
        }

        .popular{
            display: none;
        }
        
        .orderBtn{
        	border: none;
        	background-color: transparent;
        }
        
        .orderBtn:hover{
        	 background-color: #fecc56;
        }

        .localBanner { /* 이 범위안에서만 사용할 수 있게 고정 */
            position: relative;
            overflow: hidden;
            width: 1500px;
            height: 150px;

            border-radius: 10px;
            margin-top: 0px;
            margin-left: 0px;
        }

        .slideBanner {
            position: absolute;
            width: 100%;
            height: 100%;
            display: none;
        }

        .slideBanner.active {
            display: block;
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

        .writeBtn:hover,
        .loginBtn:hover,
        .logoutBtn:hover,
        .joinBtn:hover,
        .navicon:hover,  
        .categoryBtn button:hover{
            transform: translateY(-3px); /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }

        .writeBtn:active,
        .loginBtn:active,
        .logoutBtn:active,
        .joinBtn:active,
        .navicon:active,
        .categoryBtn button:active{
            transform: translateY(2px); /* 아래로 눌림 */
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .navBar{
            background-color: #fbe5c0;
            text-align: center;
        }
        
        .new


    </style>
</head>
	
<body>
	<div class="container">
        <div class="topBar">
                <div class="logo" style="font-size: 50px; background-color: #F2D3A2; color: #A66A3F">우리 동네.zip</div> <!-- 상단바 -->
            <div class="loginBox">
                    <a href="/members/login"><input type="button"  value="로그인" class="loginBtn" style="border: 0px; font-weight: bold;  background-color: #FFB300; color: #A66A3F; box-shadow: 0 4px 10px rgba(0,0,0,0.2); transition: all 0.2s ease;"></a>
                    <a href="/members/join"><input type="button"  value="회원가입" class="joinBtn" style="border: 0px; font-weight: bold; background-color: #FFB300; color: #A66A3F; box-shadow: 0 4px 10px rgba(0,0,0,0.2); transition: all 0.2s ease;"></a>

                <span class="logoutArea" style="display:none;">
                    <a href="/members/logout"><input type="button"  value="로그아웃" class="logoutBtn" style="border: 0px; font-weight: bold; background-color: #FFB300; color: #A66A3F; color: #A66A3F; box-shadow: 0 4px 10px rgba(0,0,0,0.2); transition: all 0.2s ease;"></a>
                </span>
            </div>
        </div>

        <div class="centerBox">
            <div class="userBar">
                <img class="profile" src="/resources/images/user1.png">
                <div class="welcome">환영합니다!</div>
            </div>

            <div class="categoryBtn">
                <button
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">전체</button>
                <button
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
                    <i class="fa-regular fa-lightbulb fa-sm" style="color: #3e5e40;"></i> 생활정보</button>
                <button
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
                    <i class="fa-solid fa-utensils fa-sm" style="color: #3e5e40;"></i> 맛집/카페</button>
                <button
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
                    <i class="fa-regular fa-comment-dots fa-sm" style="color: #3e5e40;"></i> 고민/이야기</button>
                <button
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px;">
                    <i class="fa-solid fa-shirt fa-sm" style="color: #3e5e40;"></i> 미용/패션</button>
            </div>

            <div class="subBox">
                <div class="leftBox">
                    <div class="localBanner">
                        <div class="notice"><img class="slideBanner" src="/resources/images/spring.jpg" style="border-radius: 10px;" width="100%;" height="100%;">
                        <img class="slideBanner" src="/resources/images/fleaMarket.jpg" style="border-radius: 10px;" width="100%;" height="100%;">
                        </div>
                    </div>
                    <div class="orderBy">
                    	<button class="newest orderBtn" style="font-size: 15px; color: #A66A3F">최신순</button>
                    	<button class="popular orderBtn" style="font-size: 15px; color: #A66A3F">인기순</button>
                    </div>
                    <div class="postBox">게시글 영역
                        
                    </div>
                    <div class="postBox">게시글 영역</div>
                    <div class="postBox">게시글 영역</div>
                    <div class="postBox">게시글 영역</div>
                    <div class="postBox">게시글 영역</div>
                    <div class="postBox">게시글 영역</div>
                    <div class="postBox">게시글 영역</div>
                    <div class="postBox">게시글 영역</div>
                    <div class="navBar">1 2 3 4 5 6 7 8 9 10</div>
                </div>

                <div class="rightBox"><img src="/resources/images/localCafe.jpg" style="border-radius: 10px;" width="298px" height="498px"></div>
                <button class="writeBtn"><i class="fa-solid fa-circle-plus fa-2xl" style="color: rgb(255, 179, 0);"></i></button>
            </div>
        </div>

        <div class="bottomBar" style="box-shadow: 0 4px 10px rgba(0,0,0,0.2);"> <!-- 하단바 -->
            <a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 홈 이모지-->
            <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 지도 이모지-->
            <i class="navicon fa-solid fa-people-group fa-2xl" style="color:#A66A3F"></i> <!-- 하단바 모임 이모지-->
            <i class="navicon fa-solid fa-volume-high fa-2xl" style="color: #A66A3F"></i> <!-- 하단바 건의사항 이모지-->
            <a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 마이페이지 이모지-->
        </div>
    </div>

    <script>
        $(".loginBtn").on("click", function(){
            $(".loginBtn").css({"display" : "none"});
            $(".joinBtn").css({"display" : "none"});
            $(".logoutArea").css({"display" : "flex"});
        })

        $(".logoutArea").on("click", function(){
            $(".loginBtn").css({"display" : "inline"});
            $(".joinBtn").css({"display" : "inline"});
            $(".logoutArea").css({"display" : "none"});
        })

        $(".newest").on("click", function(){
            $(".newest").css({"display" : "none"});
            $(".popular").css({"display" : "inline"});
        })

        $(".popular").on("click", function(){
            $(".newest").css({"display" : "inline"});
            $(".popular").css({"display" : "none"});
        })

        let index = 0;
        let slideBanner = $(".slideBanner"); // class가 slide인 요소 전부 가져와

        setInterval(function(){ // setInterval : 3초마다 코드 반복 실행
            slideBanner.eq(index).removeClass("active"); // 지금 보이는 이미지에서 active 제거
            // eq(index) 배열에서 index번째 가져옴

            index = (index + 1) % slideBanner.length; // 다음 이미지로 이동

            slideBanner.eq(index).addClass("active"); // 다음 이미지에 active 붙여서 보여줌
        }, 3000);

        // let recordTotalCount = ${recordTotalCount}
		// let recordCountPerPage = ${recordCountPerPage}
		// let naviCountPerPage = ${naviCountPerPage}
		// let currentPage = ${currentPage}
		// // js에서는 정수와 실수를 구분하지 않는다. (캐스팅 필요없음)
		// let pageTotalCount = Math.ceil(recordTotalCount/recordCountPerPage);
		
		// let startNavi = Math.floor(((currentPage - 1)/naviCountPerPage)) * naviCountPerPage + 1;
		// let endNavi = startNavi + naviCountPerPage - 1;
		
		// if(endNavi > pageTotalCount) {
		// 	endNavi = pageTotalCount;
		// }
		
		// let needPrev = true; // <<
		// let needNext = true; // >>
		
		// if(startNavi == 1) {needPrev = false;}
		// if(endNavi == pageTotalCount) {needNext = false;}
		// console.log("데이터 몇 개? : " + recordTotalCount);
		// console.log("몇 장? : " + recordCountPerPage);
		// console.log("쪽수 몇 개? : " + naviCountPerPage);
		// console.log("현재 페이지 : " + currentPage);
		// console.log("시작 Navi : "+ startNavi);
		// console.log("끝 Navi : " + endNavi);

		// if(needPrev) {
		// 	let prev = $("<a>"); // a 태그 생성
		// 	prev.attr("href", "/boards/list?cPage="+(startNavi-1)); // ex) 11페이지라면 <<을 누르면 10페이지로 이동
		// 	prev.html("<< ");
		// 	$(".page").append(prev);
		// }
			
		// for(let i = startNavi; i <= endNavi; i++) {
		// 	let navi = $("<a>");
		// 	navi.attr("href", "/boards/list?cPage="+i); // 현재 페이지가 i씩 넘어감
		// 	navi.html(i + " ");
		// 	$(".page").append(navi);
		// }
		// if(needNext) {
		// 	let next = $("<a>");
		// 	next.attr("href", "/boards/list?cPage="+(endNavi+1)); // ex) 10페이지라면 >>을 누르면 11페이지로 이동
		// 	next.html(">>");
		// 	$(".page").append(next);
		// }
    </script>

</body>
</html>