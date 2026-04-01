<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meeting Detail</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ad57018f836bb74c10d919e862f189a&libraries=clusterer"></script>
<style>
@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: 300;
	font-display: swap;
}

@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: 500;
	font-display: swap;
}

@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: 700;
	font-display: swap;
}

button, body {
	font-family: 'GMarketSans', sans-serif;
}

body {
	margin: 0;
	background-color: #fbe5c0;
}

.container {
	width: 100%;
}

.mainTitle {
	width: 100%;
	font-weight: bold;
	font-size: 50px;
	color: #A66A3F;
	border-bottom: 2px solid #A66A3F;
	background-color: #F2D3A2;
	height: 100px;
	line-height: 100px;
	display: flex;
	padding: 0 20px;
	justify-content: space-between; 
	align-items: center;
	box-sizing: border-box;
}

.meetingDetail {
    width: 93%;
    border-radius: 10px;
    background-color: #fbe5c0;
    padding: 35px;
    margin-left: 30px;
    margin-top: 220px;
    background-color: #F2D3A2;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: bold;
    font-size:20px;
    color: #5e361a;
}

.titleDiv, .categoryDiv, .descDiv, .descTextDiv, .locationDiv{
	border : 1px solid black;
}

.titleDiv{
	height: 100px;
}

.categoryDetail {
    display: inline-block;
    line-height : 23px;
    font-size: 12px;
    padding: 3px 8px;
    border-radius: 5px;
    background-color: #FFB300;
    height: 20px;
    color: #5e361a;
}

.desc {
    margin-bottom: 10px;
    color: #5e361a;
}

.info {
    font-size: 13px;
    color: #555;
    margin-bottom: 10px;
    color: #5e361a;
}

.card-footer {
    text-align: center;
    color: #5e361a;
}




</style>
</head>
<body>

	<div class="container">
		<div class="top-section">
			<div class="mainTitle">
			<span>모임 상세</span>
			</div>
			
			
			</div>
			
				<div class="meetingDetail">
					<div class="titleDiv">
						<div class="title">모임명</div>
						<div class="titleDetail">주말 운동할 사람 구함~ ^^</div>
					</div>
					
					<div class="categoryDiv">
						<div class="category">카테고리</div>
						<div class="categoryDetail">운동</div>
					</div>
					
					<div class="descDiv">
						<div class="desc">간단한 한 줄 소개</div>
						<div class="descDetail">주말에 운동할 사람 구해욘~</div>
					</div>
					
					<div class="descTextDiv">
						<div class="descText">자세한 소개글</div>
						<div class="descTextDetail">자세한 소개글임ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
					</div>
					
					<div class="locationDiv">	
						<div class="location">활동지역</div>	
						<div class="locationDetail">봉천동</div>
					</div>
			
			
		</div>
	</div>
		<div class="bottomBtn">
			<button>신청하기</button>
			<button>뒤로가기</button>
		</div>
</body>
</html>