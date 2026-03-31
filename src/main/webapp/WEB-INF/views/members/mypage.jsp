<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
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
            line-height: 100px;
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
        
        .userBar {
            width: 1879px;
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

        .id {
            margin-top: 30px;
            margin-left: 20px;
        }
        
        hr{
        	margin-top: 20px;
        	width: 97%;
        	border-color: #A66A3F;
    	}
    	
        .loginBtn:hover,
        .logoutBtn:hover,
        .joinBtn:hover,
        .navicon:hover,  
        .categoryBtn button:hover{
            transform: translateY(-3px); /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }

        .loginBtn:active,
        .logoutBtn:active,
        .joinBtn:active,
        .navicon:active,
        .categoryBtn button:active{
            transform: translateY(2px); /* 아래로 눌림 */
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
    	
</style>
</head>
<body>
	<div class="topBar">내.zip</div>
	<div class="userBar">
    	<img class="profile" src="/resources/images/birdprofile.png">
        <div class="id">${loginId }</div>
    </div>
    <hr>
    <div class="bottomBar" style="box-shadow: 0 4px 10px rgba(0,0,0,0.2);"> <!-- 하단바 -->
    	<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 홈 이모지-->
        <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 지도 이모지-->
        <i class="navicon fa-solid fa-people-group fa-2xl" style="color:#A66A3F"></i> <!-- 하단바 모임 이모지-->
        <i class="navicon fa-solid fa-volume-high fa-2xl" style="color: #A66A3F"></i> <!-- 하단바 건의사항 이모지-->
        <a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 마이페이지 이모지-->
    </div>
</body>
</html>