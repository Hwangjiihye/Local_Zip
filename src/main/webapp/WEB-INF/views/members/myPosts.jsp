<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	width: 100%;
	min-height: 100vh; /* 화면 전체 높이를 확보해서 배경색이 끊기지 않게 함 */
	border: 1px solid black;
	background-color: #fbe5c0;
}

.headBox {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%; /* 1919px 대신 100%로 수정 */
	height: 100px;
	padding: 0 30px; /* 좌우 여백 살짝 부여 */
	background-color: #F2D3A2;
	border-bottom: 2px solid #A66A3F;
	z-index: 1000;
	display: flex; /* 가로 정렬 시작 */
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: space-between; /* 제목은 왼쪽, 버튼은 오른쪽 끝으로! */
}

.backBtn {
	background-color: #ffb300;
	color: #5e361a;
	border: 1px solid #ffb300;
	border-radius: 10px;
	font-weight: bold;
	height: 30px;
	position: relative;
	right: 30px;
	cursor: pointer;
}

.backBtn:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.mainTitle {
	font-weight: bold;
	font-size: 50px;
	color: #A66A3F;
	white-space: nowrap; /* 글자가 아래로 절대 안 떨어지게 고정 */
}

.nowBtn {
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
	transition: 0.3s;
}

.bodyBox {
	width: 100%;
	min-height: auto;
	padding-top: 120px;
	color: #5e361a;
	padding-bottom: 20px; /* 타이틀박스와 문구 사이 여백 */
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

.titleIdBox {
	/* 수정: 고정 1500px 제거 */
	width: 95%;
	max-width: 1500px;
	/* 적당히 보기 좋은 최대 너비 설정 */
	min-height: 100px;
	height: auto;
	margin: auto;
	margin-bottom: 30px;
	border-radius: 10px;
	display: flex;
}

.profileName {
	font-size: 45px;
	display: flex;
	align-items: center; /* height 정렬 */
	margin: 30px;
}

.profileLocal {
	font-size: 30px;
	display: flex;
	align-items: center; /* height 정렬 */
}

.postBox {
	/* 수정: 고정 1500px 제거 */
	width: 95%;
	max-width: 1500px;
	/* 적당히 보기 좋은 최대 너비 설정 */
	min-height: 200px;
	height: auto;
	margin: auto;
	margin-bottom: 30px;
	border-radius: 10px;
	/* 그림자 효과 */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}

.postUpBox {
	width: 100%;
	height: 95px;
	display: flex;
	border-radius: 10px 10px 0 0;
	background-color: #F2D3A2;
}

.postProfile {
	width: 100px;
	height: 100px;
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

.postInfoUp, .postInfoDown {
	display: flex;
}

.postMidBox {
	width: 100%;
	height: auto;
}

.profileTime {
	font-size: 20px;
	display: flex;
	align-items: center;
	width: auto;
	height: 45px;
	margin-left: 7px;
}

.postTitle {
	margin: auto;
	width: 95%;
	height: 40px;
	font-size: 30px;
	margin-top: 5px;
	line-height: 40px;
}

.postContent {
	margin: auto;
	width: 95%;
	height: 1.5em; /* 한 줄 높이만큼 고정 */
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

.pageBox {
	width: 100%;
	text-align: center; /* 가운데 정렬 */
	padding: 20px 0; /* 상하 여백 */
	margin-bottom: 80px; /* 중요: 하단 바에 가려지지 않도록 아래쪽 여백 확보 */
	font-size: 18px;
	color: #A66A3F;
	font-weight: bold;
}

.emptyBox {
	width: 100%;
	height: auto;
	padding: 50px 0;
	font-size: 25px;
	color: #5e361a;
	text-align: center;
}
</style>

</head>
<body>

	<div class="container">

		<div class="headBox">
			<div class="mainTitle">내 작성글.zip</div>
			<div class="backBtnDiv">
				<a href="/members/mypage"> <input class="backBtn" type="button" value="내.zip으로 가기">
				</a>
			</div>
		</div>

		<div class="bodyBox">

			<div class="titleIdBox">
				<div class="postProfile">
					<img class="contentProfile" src="/resources/images/Profile.png" width="80px">
				</div>
				<div class="profileName profileInfo" style="color: #5e361a;">${nickname}</div>
				<div class="profileLocal profileInfo" style="color: #5e361a;">( 지역(동) : ${dong} )</div>
			</div>

			<c:choose>
				<c:when test="${empty listAll}">

					<div class="emptyBox">등록된 게시글이 없습니다.</div>

				</c:when>

				<c:otherwise>
	
					<c:forEach var="i" items="${listAll}">

						<div class="postBox">

							<div class="postUpBox">

								<div class="postInfoBox">
									<div class="postInfoUp">

										<div class="profileCatagory profileInfo">
											<button class="topBtn" type="button">
												<c:choose>
													<c:when test="${i.post_category == 'lifeInfo'}">생활정보</c:when>
													<c:when test="${i.post_category == 'food'}">맛집/카페</c:when>
													<c:when test="${i.post_category == 'talk'}">고민/이야기</c:when>
													<c:when test="${i.post_category == 'beauty'}">미용/패션</c:when>
													<c:otherwise>${i.post_category}</c:otherwise>
												</c:choose>
											</button>
										</div>
									</div>

									<div class="postInfoDown">
										<div class="profileTime profileInfo" style="color: #5e361a;">${i.post_date}</div>
									</div>
								</div>

							</div>

							<div class="postMidBox">
								<div class="postTitle">${i.post_title}</div>
								<div class="postContent">${i.post_contents}</div>
							</div>

						</div>

					</c:forEach>
					<div class="pageBox">1 2 3</div>

				</c:otherwise>
			</c:choose>
		</div>

		<div class="bottomBox">
			<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> <a href="/map/test"><i
				class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a> <a href="/meeting/list"><i
				class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a> <a href="/feedback/feedbackHome"><i
				class="fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>

			<c:choose>
				<c:when test="${loginId == null}">
					<a href="/members/loginUi"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
				</c:when>
				<c:when test="${role == 1}">
					<a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
				</c:when>
				<c:otherwise>
					<a href="/admin/adminPage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
				</c:otherwise>
			</c:choose>

		</div>

	</div>

</body>
</html>