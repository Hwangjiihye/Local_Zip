<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>postDetail</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


<style>
/* 폰트 */
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

* {
	box-sizing: border-box;
}

body, html {
	margin: 0;
	padding: 0;
}

/* 폰트 지정 */
button, body {
	font-family: 'GMarketSans', sans-serif;
}

.container {
	position: relative;
	padding-top: 150px;
	width: 100%;
	min-height: 100vh;
	/* 최소 높이 지정 : 브라우저 */
	border: 1px solid black;
	background-color: #fbe5c0;
}

.headBoxDiv {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100px;
	padding: 0 30px;
	background-color: #F2D3A2;
	border-bottom: 2px solid #A66A3F;

	z-index: 1000;
	display: flex;
    align-items: center;         /* 세로 중앙 정렬 */
    justify-content: space-between;
}

.headBox {
	font-weight: bold;
	font-size: 50px;
	color: #A66A3F;
    padding-top: 11px;
    line-height: normal;
}

.backBtnDiv {
	width: 90px;
	height: 50px;
	display: flex;
    align-items: center;
margin-top: 31px;
}

.backBtn {
	background-color: #ffb300;
	color: #5e361a;
	border: 1px solid #ffb300;
	border-radius: 10px;
	font-weight: bold;
	height: 30px;
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
	min-height: 100vh;
	/* 최소 높이 지정 : 브라우저 */
	margin-top: 30px;
	color: #5e361a;
	padding-bottom: 50px;
}

.postBox {
	/* 수정: 고정 1500px 제거 */
	width: 95%;
	max-width: 1150px;
	/* 적당히 보기 좋은 최대 너비 설정 */
	min-height: 200px;
	height: auto;
	margin: 30px auto;
	border-radius: 10px;
	/* 그림자 효과 */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    overflow: hidden;
}

.postUpBox {
    
	width: 100%;
	display: flex;
    align-items: center;
    padding: 30px 20px;
	border-radius: 10px 10px 0 0;
	background-color: #F2D3A2;
}

.postInfoBox {
	width: 100%;
	/* 신고박스 오른쪽으로 딱 붙게 하기 위해 빈공간을 쭉 늘려주는 코드 */
}


.postMidBox {
    padding: 40px 0;
    width: 100%;
	height: auto;
}

.postTitle {
	
	font-size: 24px;
    font-weight: bold;
	margin: 0;
}

.postContents {
	margin: 0 auto;
	width: 90%;
	font-size: 16px;
	background-color: #f0d8af;
	border-radius: 5px;
	padding: 0 10px;
    line-height: 1.6;
    word-break: break-all; 
    white-space: pre-wrap;
}

 .afterHeart {
	display: inline;
	color: red;
}

.navicon:hover, .backBtn:hover, .upBtn:hover,
	.delBtn:hover, .OBtn:hover, .XBtn:hover {
	transform: translateY(-3px);
	/* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.navicon:active, .backBtn:active,.upBtn:active,
	.delBtn:active, .OBtn:active, .XBtn:active {
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

a {
	color: #5e361a;
	text-decoration: none;
}

 .delBtn, .XBtn {
	margin-left: 5px;
}

.upBtn, .delBtn, .OBtn,
	.XBtn {
	background-color: #ffb300;
	color: #5e361a;
	border: 1px solid #ffb300;
	border-radius: 10px;
	font-weight: bold;
}

 .OBtn, .XBtn {
	display: none;
}

.writerName {
	margin-top: 10px;
}

.writeTime {
	margin-top: 6px;
}

hr {
	border: 1px dotted #5e361a;
}
</style>

</head>
<body>
	<div class="container">

		<div class="headBoxDiv">
			<div class="headBox">공지사항</div>
			<div class="backBtnDiv">
<!-- 			게시글을 누르기 전에 보고있었던 목록의 페이지를 기억해서, 누르면 전으로 돌아가는 기능 : onclick="history.back();" -->
				<input class="backBtn" type="button" value="목록으로" onclick="location.href='/'">
			</div>
		</div>
		<div class="bodyBox">
			<div class="postBox">

				<div class="postUpBox">

					<div class="postInfoBox">

						<div class="postInfoDown">
							<div class="postTitle" style="color: #5e361a;">${dto.post_title }</div>
						</div>
                        
					</div>
				</div>

				<div class="postMidBox">

					<div class="postContents">${dto.post_contents }${dto.post_contents }${dto.post_contents }${dto.post_contents }</div>

				</div>

			</div>
			
			<div class="bottomBox">
				<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> <a href="/map/test"><i
					class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a> <a href="/meeting/list"><i
					class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a> <a><i
					class="navicon fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a> <a href="/members/mypage"><i
					class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>

			</div>
		</div>
	</div>

	<script>
		
		let loginId = "${loginId}";
		let post_seq = "${dto.post_seq}"
		let postTitle = $(".postTitle");
		let postContents = $(".postContents");
		
		
	
		
        
        
    </script>
</body>
</html>