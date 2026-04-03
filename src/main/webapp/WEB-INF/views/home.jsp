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

       /*  .logoutBtn{
            margin-left: 1400px;
        } */

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
        
        .centerBox{
            width: 100%;
            margin-top: 100px;
            position: relative;
            top: 10px;
        }

        .userBar {
            width: 1865px;
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
            margin-top: 10px;
            margin-left: 20px;
            font-weight: bold;
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
            line-height: 70px;
            padding-right: 50px;
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
        
        .welcome2{
        	font-size: 12px;
        }
        
        .logoutArea{
        	position: absolute;
		    right: 30px;
		    top: 30px;
        }
/*  ----------------------------------------------------------------------------------게시글       */ 
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
           /*  border: 2px solid #A66A3F; */
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
            position: relative;
            top: 10px;
            left: 10px;

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
        
        .nowBtn{
/*          	background-color: #fecc56; */
            color: #A66A3F;

            transform: translateY(-3px);
            /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            
            
            height: 25px;

            border-radius: 10px;
            border: 1px solid #FFB300;

            align-items: center;
            /* 수직 중앙 정렬 */

            vertical-align: middle;
            /* 버튼들끼리 줄이 안 맞을 때를 대비 */

            cursor: pointer;
            transition: 0.3s;
        }
        
		 .topBtn {
	     height: 25px;
		 background-color: #FFB300;
	     border-radius: 10px;
	     border: 1px solid #FFB300;
	     color: #3e5e40;
	     align-items: center;
	     vertical-align: middle;
	     }
	     
	     .contentProfile{
	     	margin-top: 4px;
            width: 80px;
            height: 80px;
            border-radius: 70%;
            object-fit: cover;
	     }

    </style>
</head>
	
<body>
	<div class="container">
        <div class="topBar">
                <div class="logo" style="font-size: 50px; background-color: #F2D3A2; color: #A66A3F">우리 동네.zip</div> <!-- 상단바 -->
               
     <c:choose>
     	<c:when test="${loginId == null}">
            <div class="loginBox">
                    <a href="/members/loginUi"><input type="button"  value="로그인" class="loginBtn" style="border: 0px; font-weight: bold;  background-color: #FFB300; color: #A66A3F; box-shadow: 0 4px 10px rgba(0,0,0,0.2); transition: all 0.2s ease;"></a>
                    <a href="/members/join"><input type="button"  value="회원가입" class="joinBtn" style="border: 0px; font-weight: bold; background-color: #FFB300; color: #A66A3F; box-shadow: 0 4px 10px rgba(0,0,0,0.2); transition: all 0.2s ease;"></a>
			</div>
		</c:when>	
		<c:otherwise>
	                <span class="logoutArea" style="display:inline;">
	                    <a href="/members/logout"><input type="button"  value="로그아웃" class="logoutBtn" style="border: 0px; font-weight: bold; background-color: #FFB300; color: #A66A3F; color: #A66A3F; box-shadow: 0 4px 10px rgba(0,0,0,0.2); transition: all 0.2s ease;"></a>
	                </span>
        </c:otherwise>  
     </c:choose>
        </div>
		
		<!-- 메인화면에서 비회원/로그인 일시 userBar 전환 -->
        <div class="centerBox">
        	<c:choose>
        		<c:when test="${loginId == null}">
		            <div class="userBar">
		            	<div class="welcome">환영합니다!</div>
		            </div>
		         </c:when>
			      <c:otherwise>
	            	 <div class="userBar">
	            	 	<img class="profile" src="/resources/images/user1.png">
		            	<div class="welcome">${nickname}님 환영합니다!<br><div style="font-size: 12px;">우리 동네의 소식과 모임을 확인해보세요:)</div></div>
		             </div>
	              </c:otherwise>   
           	  </c:choose>
                
           

            <div class="categoryBtn">
                <a href="/"><button type="button" class="nowBtn"
                    style="background-color: #fecc56; border-radius: 10px; height: 30px; margin-right: 10px;"><i class="navicon fa-solid fa-house fa-lg"></i> 전체</button></a>
                <a href="/board/list_lifeInfo"><button type="button"
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
                    <i class="fa-regular fa-lightbulb fa-lg" style="color: #3e5e40;"></i> 생활정보</button></a>
                <button type="button"
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
                    <i class="fa-solid fa-utensils fa-lg" style="color: #3e5e40;"></i> 맛집/카페</button>
                <a href="/board/concern"><button type="button"
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
                    <i class="fa-regular fa-comment-dots fa-lg" style="color: #3e5e40;"></i> 고민/이야기</button></a>
                <button type="button"
                    style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px;">
                    <i class="fa-solid fa-shirt fa-lg" style="color: #3e5e40;"></i> 미용/패션</button>
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
<!-- 게시글영역 -->	<div class="postBox">
                    	<div class="postUpBox">

                    <div class="postProfile">
                        <img class="contentProfile" src="/resources/images/user1.png" width="60px">
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
                        <!-- <i class="fa-solid fa-flag reportIcon"></i> -->
                        <img src="/resources/images/free-icon-siren1.png" class="reportIcon" style="width: 25px; height: 25px; margin-bottom:5px" ></img>
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
                <a href="/board/write"><button type="button" class="writeBtn"><i class="fa-solid fa-circle-plus fa-2xl" style="color: rgb(255, 179, 0);"></i></button></a>
            </div>
        </div>

        <div class="bottomBar" style="box-shadow: 0 4px 10px rgba(0,0,0,0.2);"> <!-- 하단바 -->
           
        <c:choose>
        <c:when test="${role == 1}">
        	<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 홈 이모지-->
            <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 지도 이모지-->
            <a href="/meeting/list"><i class="navicon fa-solid fa-people-group fa-2xl" style="color:#A66A3F"></i></a> <!-- 하단바 모임 이모지-->
           	<a href="/feedback/feedbackHome"><i class="navicon fa-solid fa-bullhorn fa-2xl" style="color:#A66A3F"></i></a> <!-- 하단바 건의사항 이모지-->
            <a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 마이페이지 이모지-->
       	</c:when>
       	<c:otherwise>
       		<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 홈 이모지-->
            <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 지도 이모지-->
            <a href="/meeting/list"><i class="navicon fa-solid fa-people-group fa-2xl" style="color:#A66A3F"></i></a> <!-- 하단바 모임 이모지-->
           	<i class="navicon fa-solid fa-bullhorn fa-2xl" style="color:#A66A3F"></i> <!-- 하단바 건의사항 이모지-->
       		<a href="/admin/adminPage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 마이페이지 이모지-->
       	</c:otherwise>
        </c:choose>
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
        
        // 좋아요 버튼
        $(".postLikeBox").on("click", function () {
            $(this).toggleClass("active"); // 클릭할 때마다 active 클래스를 넣었다 뺐다 함
        });

        // 신고버튼을 눌렀을 때, 신고 사유가 튀어나오게
        $(".reportIcon").on("click", function () {
            $(".reportSelect").css({ "display": "inline" });
        })

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