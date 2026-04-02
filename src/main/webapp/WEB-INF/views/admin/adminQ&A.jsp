<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ad57018f836bb74c10d919e862f189a&libraries=clusterer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
* {box-sizing: border-box;}

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
	border: none;
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
	padding-left: 20px;
}

.categoryDiv {
	border: 1px solid #A66A3F;
	font-size: 15px;
	width: 100%;
	height: 50px;
	margin-top: 13px;
	display: flex;
	align-items: center;
	gap: 10px;
	border: none;
}

.categoryBtnAll {
	margin-left: 10px;
	font-weight: bold;
	background-color: #FFB300;
	border-radius: 10px;
	border: 1px solid #FFB300;
	color: #3e5e40;
	height: 30px;
	padding: 0 15px;
	cursor: pointer;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition: all 0.2s ease;
}

.categoryBtnAll:hover, .navicon:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.categoryBtnAll:active, .navicon:active {
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.categoryBtnAll:first-child {
	margin-left: 25px;
}


.bottomBar {
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

.qaReplyDiv{
	border: 1px solid black;
	margin: 300px auto 0 auto;
	width: 97%;
}

.qaContainer{
	border: 2px solid #A66A3F;
	margin: 10px 10px 10px 10px;
}

.categoryAndWriterDiv{
	display:flex;
	justify-content: space-between;
	align-items: center;
	border: 1px solid black;
	margin: 10px 10px 10px 10px;
	font-size: 18px;
}

.categoryAndWriter{
	display:flex;
	gap:20px;
}

.titleAndContent>div{
	border: 1px solid black;
}

.titleAndContent, .qaReply, .title, .content{
	margin: 10px 5px 10px 5px;
}

.title, .content{
	font-size: 30px;
}

.inputQaReply{
	padding:5px;
	background-color: #fbe5c0;
	border-radius: 10px;
	border:none;
	font-size:15px;
	width: 400px;
	word-break: break-all;
	white-space: normal; 
}

.replyBtn{
	 margin-left:auto;
	 background-color: #ffb300;
     color: #5e361a;
     border: 1px solid #ffb300;
     border-radius: 10px;
     font-weight: bold;
     width: 100px;
	 height: 40px;
	 box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}
	
}

</style>
</head>

<body>

	<div class="container">
		<div class="top-section">
			<div class="mainTitle">관리자.zip</div>
			<div class="categoryDiv">
				<a href="/admin/adminPage"><button class="categoryBtnAll">
					<i class="fa-solid fa-chart-column"> 대시보드</i>
				</button></a>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-user"> 회원관리</i>
				</button>
				<a href="/admin/adminQA"><button class="categoryBtnAll">
					<i class="fa-solid fa-headset"> 고객지원</i>
				</button></a>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-bullhorn"> 공지사항</i>
				</button>
			</div>
		</div>
		
		
		<div class="qaReplyDiv">
			<div class="qaContainer">
				<div class="categoryAndWriterDiv">
		            <div class="categoryAndWriter">
		             	<div class="category">문의유형</div>
		             	<div class="writer">작성자:홍길동</div> 
		           	</div>
		           	
		           	<div class="writeData">작성일시</div> 
	           	</div>
		           	
		        
				<div class="titleAndContent">
	                <div class="title">제목</div>
	                <div class="content">내용</div>
	            </div>
	            
			</div>
	             
	             <div class="replyProfile"><img src="/resources/images/adminProfile.png" width="60px"></div>
	        <div class="qaReply">
	        		
	            	<input type="text" placeholder="댓글을 입력하세요." class="inputQaReply">
					<button class="replyBtn" type="button">등록</button>
	        </div>      
		</div>
                  


              

		<div class="bottomBar">
			<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> 
			<a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/meeting/test"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a> 
			<a><i class="fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a> 
			<a href="/admin/adminPage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
		</div>
	</div>
</body>
</html>