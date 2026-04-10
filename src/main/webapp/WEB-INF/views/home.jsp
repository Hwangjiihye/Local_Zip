<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
* {
	box-sizing: border-box;
}

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

input, button, body {
	font-family: 'GMarketSans', sans-serif;
}

body, html {
	margin: 0;
	padding: 0;
	background-color: #fbe5c0;
}

.container {
	width: 100%;
	min-height: 95vh;
	padding-bottom: 60px;
}

.topBar { /* 상단바 고정 */
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

.loginBox {
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
	height: 0px;
	padding-right: 30px;
	gap: 0px;
}


.joinBtn {
	margin-left: -1px;
}

.bottomBar {
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
	position: relative;
	height: 300px; /* 적당히 고정 */
	overflow: hidden;
}

.centerBox {
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

.leftBox {
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

.rightBox {
	width: 300px;
	height: 500px;
	border-radius: 10px;
	margin-left: 40px;
}

.subBox {
	width: 100%;
	display: flex;
}

.orderBy {
	display: flex;
	justify-content: right; /* 가로(수평) 오른쪽 정렬 */
	align-items: center; /* 세로(수직) 중앙 정렬 */
	
	gap: 15px;

	padding-right: 50px;
	height: auto;
	margin-top: 30px;
	margin-bottom: 10px;
}

.searchBox{
	width: 300px;
	border-radius: 10px;
	display: flex;
}

.inputSearch {
	/* 수정: 고정 1500px 제거 */
	width: 85%;
	max-width: 500px;
	min-height: 30px;
	padding-left: 10px;
	color: #5e361a;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	border: none;
	outline:none; /* 눌렀을 때 선 안보이게 */
	background-color: #FFEFD5;
}

.searchIconBox{
	width: 15%;
	
	display: flex;
	justify-content: center; /* 가로(수평) 오른쪽 정렬 */
	align-items: center; /* 세로(수직) 중앙 정렬 */
	
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	
	background-color: #FFB300;
	color: #3e5e40;
	
	transition: 0.2s;
}

.searchIconBox:hover{
	background-color: #fecc56;
	color: #A66A3F;
}

.searchIconBox:active{
	background-color: #FFB300;
}

.popular {
	display: none;
}

.orderBtn {
	border: none;
	background-color: transparent;
	border-radius: 30%;
	font-size: 15px;
	color: #A66A3F;
	font-size: 15px;
}

.orderBtn:hover {
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
	opacity: 0;
	transition: 0.5s;
	/* display: none; */
}

.slideBanner.active {
	opacity: 1;
	/* display: block; */
}

.writeBtn {
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
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	/* 애니메이션 부드럽게 */
	transition: all 0.2s ease;
}

.writeBtn:hover, .loginBtn:hover, .logoutBtn:hover, .joinBtn:hover,
	.navicon:hover, .categoryBtn button:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.writeBtn:active, .loginBtn:active, .logoutBtn:active, .joinBtn:active,
	.navicon:active, .categoryBtn button:active {
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.pageBox {
	width: 100%;
	text-align: center; /* 가운데 정렬 */
	/* 	padding: 20px 0; /* 상하 여백 */ */
	/* 	margin-bottom: 80px; /* 중요: 하단 바에 가려지지 않도록 아래쪽 여백 확보 */ */
	font-size: 18px;
	color: #A66A3F;
	font-weight: bold;
	/* 위쪽 여백은 늘리고(50px), 아래쪽 여백은 확 줄였습니다(10px) */
	padding: 50px 0 10px 0;
	/* 하단 바에 너무 붙지 않게 최소한의 마진만 부여 */
	margin-bottom: 10px;
	clear: both;
}

.welcome2 {
	font-size: 12px;
}

.logoutArea {
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
/* 	margin-top: 30px; */
	margin-bottom: 30px;
	border-radius: 10px;
	/*  border: 2px solid #A66A3F; */
	/* 그림자 효과 */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
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

.postInfoUp, .postInfoDown {
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
	color: #5e361a;
}

/* 신고 영역 스타일 */
.reportArea {
	position: relative;
	top: 10px;
	right: 12px;
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

.reportBtn {
	background-color: #ffb300;
	color: #5e361a;
	border: 1px solid #ffb300;
	border-radius: 10px;
	font-weight: bold;
	display: none;
	position: absolute;
	top: 60px;
	left: 20px;
	width: 90px;
}

.reportBtn:hover {
	transform: translateY(-3px); /* 살짝 위로 뜸 */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.reportBtn:active {
	transform: translateY(2px); /* 아래로 눌림 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.report-menu {
	font-family: 'GMarketSans';
	border: 1px solid #A66A3F;
	border-radius: 5px;
	background-color: #F2D3A2;
	color: #A66A3F;
	font-size: 12px;
	padding: 2px;
	outline: none;
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
	color: #5e361a;
}

.postContent {
	color: #5e361a;
	margin: auto;
	width: 95%;
	height: 1.5em; /* 한 줄 높이만큼 고정 */
	line-height: 1.5em;
	font-size: 15px;
	background-color: #f0d8af;
	border-radius: 5px;
	padding: 0 10px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis; /* 넘치는 부분을 ...으로 표시 */
	display: block;
}

.postDownBox {
	width: 95%;
	margin: auto;
	min-height: 40px;
	display: flex;
}

.postLikeBox, .postCommentBox {
	display: flex;
	align-items: center;
	min-width: 80px;
	width: auto;
	gap: 10px;
	cursor: pointer;
	transition: 0.3s;
}

.infoCount {
	color: #5e361a;
}

.comment {
	color: #5e361a;
}

.beforeHeart:hover, .comment:hover {
	color: #cdaa69;
}

.afterHeart {
	display: none;
	color: red;
}

/* active 클래스가 붙었을 때의 제어 */
.postLikeBox.active .beforeHeart {
	display: none;
}

.postLikeBox.active .afterHeart {
	display: inline;
}

.nowBtn {
	/* background-color: #fecc56; */
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

.contentProfile {
	margin-top: 4px;
	width: 80px;
	height: 80px;
	border-radius: 70%;
	object-fit: cover;
}

.pageBox {
	text-align: center;
	padding: 20px;
	font-size: 18px;
	color: #A66A3F;
	margin-bottom: 55px;
}

.pageBox a {
	display: inline-block;
	min-width: 35px;
	padding: 6px 10px;
	margin: 0 8px;
	text-decoration: none;
	color: #A66A3F;
	border-radius: 6px;
	transition: 0.2s;
	font-weight: normal;
	cursor: pointer;
}

.pageBox a.active {
	background-color: #fecc56;
	font-weight: bold;
	color: #5e361a;
}

.pageBox a:hover {
	background-color: #F2D3A2;
}

.popup-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.7); /* 배경을 조금 더 어둡게 */
	display: none; /* 기본은 숨김 */
	justify-content: center;
	align-items: center;
	z-index: 9999; /* 상단바보다 훨씬 높게 설정 */
}

.popup-content img {
	max-width: 100%; /* 이미지가 팝업창을 넘어가지 않도록 */
	border-radius: 20px;
	width: 500px;
}

/* 닫기 버튼 */
.close-btn {
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	background-color: #FFB300;
	color: #5e361a;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
	font-size: 20px;
}

.close-btn:hover {
	background-color: #fecc56;
}

.swal2-icon.swal2-info .swal2-icon-content {
          font-size: 50px;     /* i 크기 */
          transform: translateY(5px);
          line-height: 70px;   /* 세로 위치 (핵심🔥) */
}
.swal2-icon.swal2-warning .swal2-icon-content {
          font-size: 50px;     /* i 크기 */
          transform: translateY(5px);
          line-height: 70px;   /* 세로 위치 (핵심🔥) */
}   
</style>
</head>

<body>
	<div class="container">
		<div class="topBar">
			<div class="logo" style="font-size: 50px; background-color: #F2D3A2; color: #A66A3F">우리 동네.zip</div>
			<!-- 상단바 -->

			<c:choose>
				<c:when test="${loginId == null}">
					<div class="loginBox">
						<a href="/members/loginUi"><input type="button" value="로그인" class="loginBtn"
							style="border: 0px; font-weight: bold; background-color: #FFB300; color: #A66A3F; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); transition: all 0.2s ease;"></a>
						<a href="/members/join"><input type="button" value="회원가입" class="joinBtn"
							style="border: 0px; font-weight: bold; background-color: #FFB300; color: #A66A3F; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); transition: all 0.2s ease;"></a>
					</div>
				</c:when>
				<c:otherwise>
					<span class="logoutArea" style="display: inline;"> <a href="/members/logout"><input type="button"
							value="로그아웃" class="logoutBtn"
							style="border: 0px; font-weight: bold; background-color: #FFB300; color: #A66A3F; color: #A66A3F; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); transition: all 0.2s ease;"></a>
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
						<div class="welcome">${nickname}님
							환영합니다!<br>
							<div style="font-size: 12px;">우리 동네의 소식과 모임을 확인해보세요:)</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>



			<div class="categoryBtn">
				<a href="/"><button type="button" class="nowBtn"
						style="background-color: #fecc56; border-radius: 10px; height: 30px; margin-right: 10px;">
						<i class="navicon fa-solid fa-house fa-lg"></i> 전체
					</button></a> <a href="/board/lifeInfo"><button type="button"
						style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
						<i class="fa-regular fa-lightbulb fa-lg" style="color: #3e5e40;"></i> 생활정보
					</button></a> <a href="/board/food"><button type="button"
						style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
						<i class="fa-solid fa-utensils fa-lg" style="color: #3e5e40;"></i> 맛집/카페
					</button></a> <a href="/board/talk"><button type="button"
						style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px; margin-right: 10px;">
						<i class="fa-regular fa-comment-dots fa-lg" style="color: #3e5e40;"></i> 고민/이야기
					</button></a> <a href="/board/beauty"><button type="button"
						style="background-color: #FFB300; border-radius: 10px; border: 1px solid #FFB300; color: #3e5e40; height: 30px;">
						<i class="fa-solid fa-shirt fa-lg" style="color: #3e5e40;"></i> 미용/패션
					</button></a>

			</div>

			<div class="subBox">
				<div class="leftBox">
					<div class="localBanner">
						<div class="notice">
							<img class="slideBanner active" src="/resources/images/spring.jpg" style="border-radius: 10px;" width="100%;"
								height="100%;"> <img class="slideBanner" src="/resources/images/fleaMarket.jpg"
								style="border-radius: 10px;" width="100%;" height="100%;" loading="lazy">
						</div>
					</div>

					<c:choose>
						<c:when test="${empty list}">
							<div class="emptyBox">등록된 게시글이 없습니다.</div>
						</c:when>
						<c:otherwise>

							<div class="orderBy">
								<div class="searchBox">
									<input name="" class="inputSearch" placeholder="검색할 게시글의 제목을 입력해주세요.">
									<div class="searchIconBox">
										<i class="searchIcon fa-solid fa-magnifying-glass"></i>
									</div>
								</div>

								<!-- 버튼 하나만 쓰고 현재 상태를 클릭하면 반대로 이동 -->
								<button class="sortBtn orderBtn" type="button">${sort == 'latest' ? '최신순' : '인기순'}</button>
							</div>

							<!-- 게시글영역 -->
							<c:forEach var="i" items="${list}">
								<div class="postBox" data-seq="${i.post_seq}" data-writer="${i.mem_id}">
									<!-- data-seq는 ajax로 댓글 수 표시할 때 해당 게시글 번호를 기억하기 위해 달아놓음.	 -->
									<div class="postUpBox">

										<div class="postProfile">
											<img class="contentProfile" src="/resources/images/user1.png" width="60px">
										</div>

										<div class="postInfoBox">
											<div class="postInfoUp">
												<div class="profileName profileInfo">${i.mem_nickname}</div>
												<div class="profileLocal profileInfo">${i.mem_dong}</div>

												<div class="profileCatagory profileInfo">
													<!-- 카테고리에서 영어로 불러와지는걸 한글로 변환 -->
													<button class="topBtn">
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
												<div class="profileTime profileInfo">${i.post_date}</div>
											</div>
										</div>


										<c:if test="${loginId != null && loginId != i.mem_id}">
											<div class="reportArea">
												<img src="/resources/images/free-icon-siren1.png" class="reportIcon"
													style="width: 25px; height: 25px; margin-bottom: 5px"></img> <select class="reportSelect">
													<option class="report-menu" disabled selected>신고 사유</option>
													<option class="report-menu" value="badContents">부적절한 컨텐츠</option>
													<option class="report-menu" value="badWord">욕설/비방</option>
													<option class="report-menu" value="AD">광고/스팸</option>
												</select>
												<button type="button" class="reportBtn">신고하기</button>
											</div>
										</c:if>

									</div>

									<div class="postMidBox">

										<div class="postTitle">${i.post_title}</div>
										<div class="postContent">${i.post_contents}</div>

									</div>

									<c:if test="${loginId != null}">
										<div class="postDownBox">

											<div class="postLikeBox  ${i.post_like_check == 1 ? 'active' : ''}">
												<i class="fa-regular fa-heart fa-xl beforeHeart"></i> <i class="fa-solid fa-heart fa-xl afterHeart"></i>

												<div class="likeCount infoCount">${i.post_like }</div>
											</div>

											<div class="postCommentBox">
												<i class="fa-regular fa-comment fa-xl comment"></i>

												<div class="commentCount infoCount">${i.post_hit}</div>
											</div>

										</div>
									</c:if>

								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>

				<div class="rightBox">
					<img src="/resources/images/localCafe.jpg" style="border-radius: 10px;" width="298px" height="498px">
				</div>

				<a href="/board/write"><button type="button" class="writeBtn">
						<i class="fa-solid fa-circle-plus fa-2xl" style="color: rgb(255, 179, 0);"></i>
					</button></a>
			</div>

			<c:if test="${not empty list }">
				<div class="pageBox"></div>
			</c:if>
		</div>

		<div class="bottomBar">
			<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a> <a href="/map/test"><i
				class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a> <a href="/meeting/list?category=all"><i
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


	<!-- 팝업창 -->
	<div class="mainPopup popup-overlay" style="display: none;">
		<div class="popup-content">

			<div class="popup-body">
				<img src="/resources/images/seoul.png">
			</div>

			<div class="popup-footer">
				<button onclick="closePopup()" class="close-btn">닫기</button>
			</div>

		</div>
	</div>


	<script>
		
	    // 팝업 닫기 함수
	    function closePopup() {
	        $(".mainPopup").hide(); // jQuery 방식 (display: none 효과)
	    }
		    	
	    // 문서가 다 로딩 된 후 시작하는 함수
		$(function() {
			
			// 페이지 로드 시 팝업 열기
		    window.onload = function() {
		        $(".mainPopup").css("display", "flex");
		    };
	
			
		 	// 배경(어두운 부분) 클릭 시 팝업 닫기
// 		    $(".popup-overlay").on("click", function(e) {
// 		        // 클릭한 지점이 팝업 박스 내부(.popup-content)가 아닐 때만 닫기
// 		        if (!$(e.target).closest(".popup-content").length) {
// 		            $(this).hide();
// 		        }
// 		    });
		
			$(".loginBtn").on("click", function() {
				$(".loginBtn").css({"display" : "none"});
				$(".joinBtn").css({"display" : "none"});
				$(".logoutArea").css({"display" : "flex"});
			})

			$(".logoutArea").on("click", function() {
				$(".loginBtn").css({"display" : "inline"});
				$(".joinBtn").css({"display" : "inline"});
				$(".logoutArea").css({"display" : "none"});
			})
			
		    // 1. 게시글 상세 페이지 이동 (통합 제어)
		    // .postBox를 클릭했을 때, 클릭된 요소가 신고/좋아요 관련 요소가 아닐 때만 이동
		    $(document).on("click", ".postBox", function(e) {
		        // 클릭한 타겟이 신고 아이콘, 신고 선택창, 신고 버튼, 좋아요 박스 내부에 있다면 이동 금지
		        if ($(e.target).closest(".reportArea, .postLikeBox").length > 0) {
		            return;
		        }
		
		        // 게시글 상세보기 이동 제어
		        let loginId = "${loginId}";
		        if (loginId === "") {
		        	Swal.fire({
	                      icon: "info",
	                      title: "Wait  !",
	                      text: "로그인 후 이용 가능합니다.",
	                      iconColor: "#FFB300",
	                      confirmButtonColor: "#FFB300"
	                   }).then(() => {
	                	   location.href = "/members/loginUi";
	                   });
		            return;
		        }
		
		        let post_seq = $(this).data("seq");
		        location.href = "/postDetail?post_seq=" + post_seq + "&category=all";
		    });
		
		    // 신고 ---------------------------------------------
		    // 신고 아이콘 클릭 시 메뉴 표시
		    $(document).on("click", ".reportIcon", function(e) {
		        e.stopPropagation(); // 부모인 .postBox로 이벤트가 퍼지는 것을 막음 (중요)
		        
		        // 클릭한 아이콘이 속한 그 영역의 메뉴만 토글
		        let reportArea = $(this).closest(".reportArea");
		        
		        reportArea.find(".reportSelect, .reportBtn").toggle(); 
		    });
		
		    // 신고 사유 선택창 클릭 시 이동 방지
		    $(document).on("click", ".reportSelect", function(e) {
		        e.stopPropagation(); // 클릭 시 상세페이지 이동 방지
		    });
		
		    // 신고 버튼 클릭 (AJAX)
		    $(document).on("click", ".reportBtn", function(e) {
		        e.stopPropagation(); // 클릭 시 상세페이지 이동 방지
		        
		        let card = $(this).closest(".postBox"); 
		        let targetSeq = card.data("seq");
		        let targetId = card.data("writer"); 
		        let reportReason = card.find(".reportSelect").val(); 
		        
		        if(!reportReason || reportReason === "신고 사유"){
		        	Swal.fire({
		                icon: "info",
		                title: "Wait  !",
		                text: "신고 사유를 선택해 주세요",
		                iconColor: "#FFB300",
		                confirmButtonColor: "#FFB300"
		             });
		            return;
		        }
		        
		        Swal.fire({
		            icon: "question",
		            title: "Wait  !",
		            text: "정말 신고하시겠습니까?",
		            iconColor: "#FFB300",
		            confirmButtonColor: "#FFB300",
		               showCancelButton: true,
		               confirmButtonText: "신고",
		               cancelButtonText: "취소",
		               cancelButtonColor: "#d9d9d9"
		         }).then((result) => {
		        	 if(result.isConfirmed) {
		        		 $.ajax({
		            url : "/report/insert",
		            type : "post",
		            data : {
		                target_seq : targetSeq,
		                target_id : targetId,
		                reports_type : 0,
		                reports_reason : reportReason
		            }
		        }).done(function(resp){
		            if(resp == "success"){
		            	Swal.fire({
		                      icon: "success",
		                      title: "Success  !",
		                      text: "신고가 접수되었습니다.",
		                      iconColor: "#FFB300",
		                      confirmButtonColor: "#FFB300"
		                   });
		                card.find(".reportSelect, .reportBtn").hide();
		            } else {
		            	Swal.fire({
		                      icon: "info",
		                      title: "Already  !",
		                      text: "이미 신고한 글 입니다",
		                      iconColor: "#FFB300",
		                      confirmButtonColor: "#FFB300"
		                   });
		                card.find(".reportSelect, .reportBtn").hide();
		            }
		        }).fail(function(){
		        	Swal.fire({
		                  icon: "error",
		                  title: "Error  !",
		                  text: "서버와 통신 중 오류가 발생했습니다",
		                  iconColor: "#EB0000",
		                  confirmButtonColor: "#FFB300"
		               });
		        });
		  } else {
			  Swal.fire({
                  icon: "info",
                  title: "Cancel  !",
                  text: "취소 되었습니다",
                  iconColor: "#FFB300",
                  confirmButtonColor: "#FFB300"
			  });
		    }
		 });
	  });
		        	
		
		 	// 좋아요 버튼을 눌렀을 때
			$(".postLikeBox").on("click", function(e) {
				e.stopPropagation(); // 상세페이지 이동 방지
				let postLike = $(this);
				let post_seq = postLike.closest(".postBox").data("seq");	
				
				console.log("클릭된 게시글 번호: " + post_seq);
				
				// 하트 채워지고 비워지는 토글용 ajax
				$.ajax({
					url : "/like/toggle",
					data : {post_seq : post_seq},
					type : "post"
				}).done(function(likeCheck) {
					console.log("서버 응답:" + likeCheck);
					
					if(likeCheck == -1){
						Swal.fire({
		                    icon: "warning",
		                    title: "Wait !",
		                    text: "로그인 후 이용 가능합니다.",
		                    iconColor: "#FFB300",
		                    confirmButtonColor: "#FFB300"
		                }).then((result) => {
		                   if (result.isConfirmed) {
								location.href = "/members/loginUi";
		                   }
		                });
						return;
					}

					if (likeCheck == 1 || likeCheck == 0) { // 하트를 누를때마다 css 적용
						postLike.toggleClass("active"); // active 클래스를 넣었다 뺐다 함 
						// 서버 처리가 성공하면 화면의 하트 색깔을 토글(변경)함.
						
						// jsp 화면에 보여지는 전체 숫자용 ajax
						$.ajax({
							url : "/like/count",
							data : {post_seq : post_seq},
							type : "post"
						}).done(function(count){
							postLike.find(".likeCount").text(count);
						});
					}
				});
			});
		
		    // 배너 애니메이션
		    let index = 0;
		    let slideBanner = $(".slideBanner");
		    setInterval(function() {
		        slideBanner.eq(index).removeClass("active");
		        index = (index + 1) % slideBanner.length;
		        slideBanner.eq(index).addClass("active");
		    }, 3000);
		
		    // 댓글 수 갱신
		    $(".postBox").each(function(){
		        let postBox = $(this);
		        let post_seq = postBox.data("seq");
		        $.ajax({
		            url: "/board/getCommentCount",
		            data: { post_seq : post_seq},
		            type: "get"
		        }).done(function(count){
		            postBox.find(".commentCount").html(count);
		        	});
		    	});
			});
		
		// 최신순 인기순 정렬
        $(".sortBtn").on("click",function(){
        	
        	let currentSort = "${sort}";
        	
        	if(currentSort == "latest"){
        		location.href = "/?sort=like";
        	}else{
        		location.href = "/?sort=latest";
        	}
        });
		
     	// 하단 네비게이션 바 구현
        $(document).ready(function(){
        let recordTotalCount = Number("${recordTotalCount}"); // 전체 게시물 수
        let recordCountPerPage = Number("${recordCountPerPage}"); // 한 페이지에 몇 개 보여줄지
        let naviCountPerPage = Number("${naviCountPerPage}"); //  한 번에 몇 개 페이지 번호 보여줄지
        let currentPage = Number("${currentPage}"); // 현재 페이지
        
        let pageTotalCount = Math.ceil(recordTotalCount / recordCountPerPage); //  총 페이지 개수 구하기
        
       	let startNavi = Math.floor(((currentPage - 1)/naviCountPerPage)) * naviCountPerPage + 1;
        let endNavi = startNavi + naviCountPerPage - 1;
        
        if(endNavi > pageTotalCount) {
        	endNavi = pageTotalCount;
        }
        
        for(let i = startNavi; i <= endNavi; i++) {
        	let navi = $("<a>");
        	navi.attr("href", "/home?cPage="+i);
        	navi.html(i + " ");
        	
        	if(i == currentPage) {
        		navi.addClass("active");
        	}
        	
        	$(".pageBox").append(navi);
        }
    });
	</script>

</body>
</html>