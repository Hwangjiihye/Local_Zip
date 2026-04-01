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
            color: #5e361a;
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
            position: relative;
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
        .userBarDiv{
        	width: 1750px;
            height: 180px;
            margin-top: 20px;
            margin-left: 20px;
            border-radius: 10px;
            font-size: 30px;
            color: #A66A3F;
            border: 1px solid #A66A3F;
            position: relative;
        }
        .userBar {
            width: 100%;
            height: 100%;
            border-radius: 10px;
            display: block;
        }
        
        .userBarContents{
            font-size: 30px;
            color: #A66A3F;
            font-weight: bold;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
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
        .adminPage:hover,
        .myInfoBtn:hover{
            transform: translateY(-3px); /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }

        .loginBtn:active,
        .logoutBtn:active,
        .joinBtn:active,
        .navicon:active,
        .adminPage:hover,
        .myInfoBtn:hover{
            transform: translateY(2px); /* 아래로 눌림 */
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        
        .myInfoBtn, .adminPage{
	        background-color: #ffb300;
	        color: #5e361a;
	        border: 1px solid #ffb300;
	        border-radius: 10px;
	        font-weight: bold;
    	}
    	.adminPageDiv{
    		width: 600px;
    		height: 50px;
    	}

    	.adminPage{
    		width: 100%;
    		height: 100%;
    		font-size: large;
    		line-height: 50px;
    	}
    	
    	.divContainer{
    		width: 1650px;
    		height: 500px;
    		background-color: #F2D3A2;
    		margin-left: 140px;
    		margin-top: 25px;
    		border-radius: 20px;
    		padding-top: 10px;
    		box-shadow: 0 6px 15px rgba(0,0,0,0.3);
    	}
    	
    	.myInfoDiv{
    		position: relative;
    		left: 1550px;
    	}
    	
    	.myActiveTitle, .FAQTitle{
    		height: 60px;
    		font-size: x-large;
    		font-weight: bold;
    		margin-top: 50px;
    		margin-left: 110px;
    	}
    	.FAQTitle{
    		margin-top: 60px;
    	}
    	.myActiveDiv, .FAQDiv{
    		display: flex;
    		gap: 40px;
    		width: 90%;
    		height: 125px;
    		margin-left: 115px;
    	}
    	
    	.myWrite, .myLike, .myClub{
    		width: 30%;
    		height: 100%;
    		background-color: #fbe5c0;
    		border-radius: 30px;
    	}
    	.myWriteIcon, .myLikeIcon, .myClubIcon{
    		width: 30%;
    		height: 100%;
    	}
    	.myWriteContents, .myLikeContents, .myClubContents{
    		width: 70%;
    		height: 100%;
    	}
    	.myWriteIcon, .myWriteContents, .myLikeIcon, .myLikeContents, .myClubIcon, .myClubContents{
    		float: left;
    	}
    	.myWriteTitle, .myWriteNum, .myLikeTitle, .myLikeNum, .myClubTitle, .myClubNum{
    		height: 50%;
    		font-size: x-large;
    		font-weight: bold;
    		line-height: 87px;
    	}
    	.myWriteTitle, .myLikeTitle, .myClubTitle{
    		font-size: x-large;
    	}
    	.myWriteNum, .myLikeNum, .myClubNum{
    		font-size: x-large;
    		color: #286708;
    		line-height: 45px;
    	}
    	.icon{
    		width: 60px;
    		height: 60px;
    		margin-left: 30px;
    		margin-top: 30px;
    	}
    	
    	.CS, .notice{
    		width: 688px;
    		height: 60px;
    		background-color: #fbe5c0;
    		border-radius: 15px;
    		font-size: x-large;
    		font-weight: bold;
    		padding-left: 30px;
    		padding-top: 10px;
    	}

     	.adminPage{
     		margin-left: 520px;
     	}
     	
     	.leftImg, .rightImg{
     		position: absolute;
     		height: 135px;
     	}
     	.leftImg{
     		left: 0;
     	}
     	.rightImg{
     		right: 0;
     	}
</style>
</head>
<body>
	<div class="topBar">내.zip</div>
	<div class="userBarDiv">
		<div class="userBarContents">닉네임님, 반가워요!</div>
<!-- 			<div class="myInfoDiv"> -->
<!-- 	        	<a href="/members/myInfo"> -->
<!-- 	        		<button class="myInfoBtn"><i class="fa-solid fa-user-gear"></i> 내 정보.zip</button> -->
<!-- 	        	</a> -->
<!-- 	        </div> -->
	    
	    <img class="userBar" src="/resources/images/userbar.png">
	</div>
    <hr>
    <div class="divContainer">
	    <div class="myActiveTitle">· 나의 활동</div>
	    <div class="myActiveDiv">
	    	<div class="myWrite">
	    		<div class="myWriteIcon"><img src="/resources/images/text1.png" class="icon"></div>
	    		<div class="myWriteContents">
	    			<div class="myWriteTitle">작성글</div>
	    			<div class="myWriteNum">10</div>
	    		</div>
	    	</div>
	    	<div class="myLike">
	    		<div class="myLikeIcon"><img src="/resources/images/love.png" class="icon"></div>
	    		<div class="myLikeContents">
		    		<div class="myLikeTitle">관심 게시글</div>
		    		<div class="myLikeNum">15</div>
		    	</div>
	    	</div>
	    	<div class="myClub">
	    		<div class="myClubIcon"><img src="/resources/images/people.png" class="icon"></div>
	    		<div class="myClubContents">
		    		<div class="myClubTitle">모임</div>
		    		<div class="myClubNum">3</div>
		    	</div>
	    	</div>
	    </div>
	    
	    <div class="FAQTitle">· 고객센터</div>
	    <div class="FAQDiv">
	    	<div class="CS">고객지원 ></div>
	    	<div class="notice">공지사항 ></div>
	    </div>
	    
	    <div class="adminPageDiv">
	    	<input class="adminPage" type="button" value="관리자 페이지">
	    </div>
    </div>
    	<img class="leftImg" src="/resources/images/왼쪽 모서리 풀.png">
    	<img class="rightImg" src="/resources/images/오른쪽 모서리 풀.png">
    <div class="bottomBar" style="box-shadow: 0 4px 10px rgba(0,0,0,0.2);"> <!-- 하단바 -->
    	<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 홈 이모지-->
        <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 지도 이모지-->
        <a href="/meeting/test"><i class="navicon fa-solid fa-people-group fa-2xl" style="color:#A66A3F"></i></a> <!-- 하단바 모임 이모지-->
        <i class="navicon fa-solid fa-volume-high fa-2xl" style="color: #A66A3F"></i> <!-- 하단바 건의사항 이모지-->
        <a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a> <!-- 하단바 마이페이지 이모지-->
    </div>
</body>
</html>