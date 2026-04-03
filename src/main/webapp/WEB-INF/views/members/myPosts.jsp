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

            width: 100%;

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
        
        .nowBtn{
         	background-color: #fecc56;
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
            /* 수직 중앙 정렬 */

            vertical-align: middle;
            /* 버튼들끼리 줄이 안 맞을 때를 대비 */

            cursor: pointer;
            transition: 0.3s;
        }

         .bodyBox { 
            width: 100%;
            min-height: 80vh;
			
			position:relative;
            top: 120px;
            color: #5e361a;
         }

/* 바디박스 수정 */

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
/*             margin-top: 30px; */

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

        .postMidBox {
            width: 100%;
            height: auto;
        }

        .postTitle {
            margin: auto;

            width: 95%;
            height: 40px;

            font-size: 20px;
            margin-top: 5px;
            
            line-height: 40px;
        }

        .postContent {
            margin: auto;

            width: 95%;
            height: 1.5em;       /* 한 줄 높이만큼 고정 */
    		line-height: 1.5em;

            font-size: 18px;

            background-color: #f0d8af;
            border-radius: 5px;
            
            padding: 0 10px;
             
            white-space: nowrap;
            overflow: hidden;
    		text-overflow: ellipsis; /* 넘치는 부분을 ...으로 표시 */
    		display: block;
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
        
        .pageBox{
            width: 100%;
    		text-align: center;   /* 가운데 정렬 */
    		padding: 20px 0;      /* 상하 여백 */
    		margin-bottom: 80px;  /* 중요: 하단 바에 가려지지 않도록 아래쪽 여백 확보 */
    
    		font-size: 18px;
    		color: #A66A3F;
    		font-weight: bold;
        }
        
  		.emptyBox{
 			
  			width: 100%;
  			height: 600px;
  			
  			font-size: 25px;
  			
  			color: #5e361a;
  			
  			text-align: center;
  		}
        
        
    </style>

</head>
<body>

    <div class="container">

        <div class="headBox">내 작성글.zip</div>

<%-- 		<c:choose> --%>
<%-- 			<c:when test="${empty lifeInfo}"> --%>
			
<!-- 				<div class="emptyBox">등록된 게시글이 없습니다.</div> -->
			
<%-- 			</c:when> --%>
			
<%-- 			<c:otherwise> --%>
		        <div class="bodyBox">
		
<%-- 				<c:forEach var="i" items="${lifeInfo}"> --%>
		            <div class="postBox">
					
		                <div class="postUpBox">
		
		                    <div class="postProfile">
		                        <img class="contentProfile" src="/resources/images/Profile.png" width="60px">
		                    </div>
		
		                    <div class="postInfoBox">
		                        <div class="postInfoUp">
		                            <div class="profileName profileInfo" style=color:#5e361a;>${i.mem_nickname}</div>
		                            <div class="profileLocal profileInfo" style=color:#5e361a;>${i.mem_dong}</div>
		                            <div class="profileCatagory profileInfo">
		                                <button class="topBtn" type="button" >카테고리</button>
		                            </div>
		                        </div>
		
		                        <div class="postInfoDown">
		                            <div class="profileTime profileInfo" style=color:#5e361a;>${i.post_date}</div>
		                        </div>
		                    </div>
		
		                </div>
		
		                <div class="postMidBox">
		
		                    <div class="postTitle">${i.post_title}</div>
		                    <div class="postContent">${i.post_contents}</div>
		
		                </div>
		
		
						</div>
<%-- 					</c:forEach> --%>
		          </div>
		          
		          <div class="pageBox">1 2 3</div>
		          
<%-- 	           </c:otherwise> --%>
<%-- 	        </c:choose>    --%>

        <div class="bottomBox">
            <a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/meeting/list"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a>
            <a><i class="navicon fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>

        </div>

    </div>

</body>
</html>