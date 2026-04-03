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
	margin-left: 20px;
	background-color: #FFB300;
	border-radius: 10px;
	border: 1px solid #FFB300;
	color: #286708;
	height: 30px;
	padding: 0 15px;
	cursor: pointer;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition: all 0.2s ease;
	line-height: 30px;
}

.categoryBtnAll:hover, .navicon:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.categoryBtnAll:active, .navicon:active {
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
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
	background-color: #fbe5c0;
	border-radius:20px;
	margin: 190px auto 0 auto;
	width: 90%;
	box-shadow: 0 4px 10px rgba(0,0,0,0.3);
	overflow: hidden;
}

.categoryAndWriterDiv{
	width: 100%;
	background-color:#F2D3A2;
	display:flex;
	justify-content: space-between;
	align-items: center;
	font-size: 14px;
	border:none;
	padding: 10px 15px;
	margin:0;
}

.replyAdminId{
	font-size: 14px;
}

.categoryAndWriter{
	display:flex;
	gap:20px;
	align-items: center;
}

.content{
	background-color:#F2D3A2;
}

.title{
	font-size: 25px;
	padding: 20px 5px 10px 5px;
	margin: 0 40px 0 40px;
}

.content{
	font-size: 18px;
	padding: 10px 5px 10px 5px;
	margin: 0 40px 0 40px;
	border-radius: 10px;
}

.inputQaReply{
	padding:5px;
	background-color: #fbe5c0;
	border-radius: 10px;
	border: 1px dotted #ffb300;
	font-size:15px;
	width: 700px;
	height: 40%;
	margin: 0 0 7px 10px;
	word-break: break-all;
	white-space: normal; 
	resize: none;
	outline: none;
	font-family: 'GMarketSans';
}

.replyBtn{
	 margin: 0 0 7px 20px;
	 background-color: #ffb300;
     color: #286708;
     border: 1px solid #ffb300;
     border-radius: 10px;
     width: 100px;
	 height: 40px;
	 box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}

.replyTextAndBtn{
	display:flex;
	align-items: center;
}

.qaReply{
	padding: 10px;
	margin: 10px 10px 10px 15px;
	border-radius: 10px;
}

.adminProfileDiv{
	display:flex;
	align-items:center;
	gap: 21px;
}

.category{
	font-size:14px;
    height: 25px;
	background-color: #FFB300;
	border-radius: 10px;
	border: 1px solid #FFB300;
	color: #3e5e40;
	align-items: center;
	vertical-align: middle;
	line-height: 17px;
	padding:5px;
}

.contentProfile{
   	margin-top: 4px;
    width: 80px;
    height: 80px;
    border-radius: 70%;
    object-fit: cover;
}

.profileImg{
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
		<div class="top-section">
			<div class="mainTitle">관리자.zip</div>
			<div class="categoryDiv">
				<a href="/admin/adminPage"><button class="categoryBtnAll">
					<i class="fa-solid fa-chart-column fa-lg"></i> 대시보드
				</button></a>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-user fa-lg"></i> 회원관리
				</button>
				<a href="/admin/adminQA"><button class="categoryBtnAll">
					<i class="fa-solid fa-headset fa-lg"></i> 고객지원
				</button></a>
				<button class="categoryBtnAll">
					<i class="fa-solid fa-bullhorn fa-lg"></i> 공지사항
				</button>
			</div>
		</div>
		
		
		<div class="qaReplyDiv">
				<div class="categoryAndWriterDiv">
		            <div class="categoryAndWriter">
		            <div class="postProfile">
                        <img class="contentProfile" src="/resources/images/user1.png" width="60px">
                    </div>
		           		<div class="writer">작성자:홍길동</div> 
		             	<div class="category">문의유형</div>
		             	
		           	</div>
		           	
		           	<div class="writeData">작성일시</div> 
	           	</div>
		           	
		        
				<div class="titleAndContent">
	                <div class="title">제목</div>
	                <div class="content">내용</div>
	            </div>
	             
	        <div class="qaReply">
	        	<div class="adminProfileDiv">
	        		<div class="replyProfile"><img src="/resources/images/adminProfile.png" width="60px" class="profileImg"></div>
	        		<div class="replyAdminId">관리자</div>
        		</div>
        		<div class="replyTextAndBtn">
	            	<textarea placeholder="댓글을 입력하세요." maxlength="1000" class="inputQaReply"></textarea>
					<button class="replyBtn" type="button">등록</button>
				</div>
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
	
	<script>
			$(".inputQaReply").on("input", function(){
			    this.style.height = "auto";              // 초기화
			    this.style.height = this.scrollHeight + "px";  // 내용만큼 늘림
			});
	
	</script>
</body>
</html>