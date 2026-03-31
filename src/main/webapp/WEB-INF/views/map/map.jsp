<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAP</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
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
    body{
        margin: 0;
        background-color: #fbe5c0;
    }
    .container{
        width: 100%;
        min-height: 100vh;
    }

    .top-section {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        background-color: #fbe5c0;
        z-index: 1000;
        border-bottom: 2px solid #A66A3F;
    }

    .mainTitle{
        width: 100%;
        font-weight: bold;
        font-size: 50px;
        color: #A66A3F;
        border-bottom: 2px solid #A66A3F;
        background-color: #F2D3A2;
        height: 100px;
        line-height: 100px;
        display: flex;
    }
    
    .categoryDiv{
        border: 1px solid #A66A3F;
        font-size: 15px;
        width: 100%;
        height: 50px;
        margin-top: 13px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .categoryBtnAll{
        margin-left: 10px;
        font-weight: bold;
        background-color: #FFB300;
        border-radius: 10px;
        border: 1px solid #FFB300;
        color: #3e5e40;
        height: 30px;
        padding: 0 15px;
        cursor: pointer;
    }
    .categoryBtnAll:first-child { margin-left: 25px; }

    .mapDiv{
        border: 1px solid #A66A3F;
        margin: 15px auto;
        width: 90%;
        max-width: 1800px;
        height: 380px; 
        background-color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .bottomBar{
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
    }

    .facilityDiv{
        width: 91%;
        max-width: 1800px;
        margin: 0 auto;
        padding-top: 570px; 
        padding-bottom: 80px;
    }

    .facilityAll{
        border: 1px solid #A66A3F;
        margin-left: 14px;
        width: 200px;
        height: 40px;
        margin-top: 20px;
        line-height: 48px;
    }

    .facility{
        border: 1px solid #A66A3F;
        margin-left: 14px;
        width: 98%;
        margin-top: 20px;
        line-height: 48px;
    }

</style>
</head>
<body>
	 <div class="container">
        <div class="top-section">
            <div class="mainTitle">우리 동네 지도.zip</div>
            <div class="categoryDiv">
                <button class="categoryBtnAll"><i class="fa-solid fa-house"> 전체</i></button>
                <button class="categoryBtnAll"><i class="fa-solid fa-shield-halved"> 치안</i></button>
                <button class="categoryBtnAll"><i class="fa-solid fa-person-running"> 대피소</i></button>
                <button class="categoryBtnAll"><i class="fa-solid fa-restroom"> 공중화장실</i></button>
            </div>
            
                <div class="mapDiv">
                    지도 위치
                </div>
        </div>

        <div class="facilityDiv">
        <div class="facilityAll">
            주변 시설 (0)
        </div>
        <div class="facility police">
            성수파출소<br>
            주소<br>
            250m
        </div>
          <div class="facility shelter">
            민방위 대피소<br>
            주소<br>
            400m
        </div>
          <div class="facility toilet">
            공중화장실<br>
            주소<br>
            1km
        </div>
        </div>
        

        <div class="bottomBar">
            하단바 위치
        </div>
    </div>
</body>
</html>
</body>
</html>