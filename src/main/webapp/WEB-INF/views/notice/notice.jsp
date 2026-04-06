<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* 기존 폰트 및 기본 스타일 유지 */
@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: 300;
}

@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: 500;
}

@font-face {
	font-family: 'GMarketSans';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: 700;
}

* {
	box-sizing: border-box;
}

body, html {
	margin: 0;
	padding: 0;
	font-family: 'GMarketSans', sans-serif;
}

.container {
	position: relative;
	padding-top: 100px;
	width: 100%;
	min-height: 100vh;
	background-color: #fbe5c0;
	padding-bottom: 80px; /* 하단바 여백 */
}

/* 헤더 스타일 */
.headBox {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100px;
	padding-left: 20px;
	font-weight: bold;
	font-size: 35px; /* 와이어프레임 느낌에 맞춰 소폭 조정 */
	color: #A66A3F;
	background-color: #F2D3A2;
	border-bottom: 2px solid #A66A3F;
	line-height: 100px;
	z-index: 1000;
}

/* 상단 사용자 정보 섹션 */
.userInfoSection {
	display: flex;
	align-items: center;
	padding: 20px;
	margin-top: 10px;
}

.userIcon {
	font-size: 50px;
	color: #A66A3F;
	margin-right: 15px;
}

.userName {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

/* 게시글 박스 (와이어프레임 구조) */
.postBox {
	width: 95%;
	max-width: 1000px;
	margin: 20px auto;
	background-color: #fbe5c0; /* 와이어프레임의 흰색 배경 느낌 */
	border-radius: 5px;
	overflow: hidden;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
}
.postBox:hover{
	cursor: pointer;
}
.postHeader {
	background-color: #F2D3A2;
	padding: 10px 15px;
	font-size: 14px;
	border-bottom: 1px solid #A66A3F;
	color: #A66A3F;
}

.postBody {
	padding: 15px;
}

.rowItem1 {
	border: 0px solid #ccc;
	padding: 10px;
	border-radius: 5px;
	background-color: #F2D3A2;
}

.titleContent {
	font-weight: bold;
	font-size: 18px;
	color: #5e361a;
}

.textContent {
	font-size: 15px;
	color: #444;
	min-height: 60px;
	color: #5e361a;
}


/* 하단 페이지네이션 */
.pageBox {
	text-align: center;
	padding: 20px;
	font-size: 18px;
	color: #A66A3F;
	transform: translateX(-20px);
}

.pageBox span {
	margin: 0 10px;
	cursor: pointer;
}

/* 하단바 */
.bottomBox {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 60px;
	display: flex;
	align-items: center;
	justify-content: space-around;
	background-color: #F2D3A2;
	border-top: 2px solid #A66A3F;
	z-index: 1000;
}

.bottomBox i {
	color: #A66A3F;
	cursor: pointer;
}

.emptyBox {
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
		<div class="headBox">공지사항</div>


		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach var="i" items="${list}">
				<div class="postBox" onclick="location.href='https://www.naver.com'">
					<input type="hidden" name="notice_seq" value="${i.notice_seq}">
					<div class="postHeader">${i.notice_date}</div>
					<div class="postBody">
						<div class="rowItem1">
							<div class="titleContent">${i.notice_title}</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="emptyBox">등록된 공지사항이 없습니다.</div>
			</c:otherwise>
		</c:choose>

		<div class="pageBox">
			 <span class="page"></span>
		</div>
		
		<div class="bottomBox">
			<a href="/"><i class="fa-solid fa-house fa-2xl"></i></a>
			<a href="/map/test"><i class="fa-solid fa-map-location-dot fa-2xl"></i></a>
			<a href="/meeting/list"><i class="fa-solid fa-people-group fa-2xl"></i></a>
			<a href="/feedback/feedbackHome"><i class="fa-solid fa-bullhorn fa-2xl"></i> </a>
			<a href="/members/mypage"><i class="fa-solid fa-user fa-2xl"></i></a>
		</div>
	</div>
	<script>
	let recordTotalCount = ${totalCount};
	let recordCountPerPage = 10;
	let naviCountPerPage = 5;
	let currentPage = ${cPage};

	let pageTotalCount = Math.ceil(recordTotalCount/recordCountPerPage);
	
	let startNavi = Math.floor(((currentPage - 1)/naviCountPerPage)) * naviCountPerPage + 1;
	let endNavi = startNavi*naviCountPerPage;
	
	if(endNavi > pageTotalCount) {
		endNavi = pageTotalCount;
	}
	$(".page").empty();	
	
	let needPrev = true; // <<
	let needNext = true; // >>
	
	if(startNavi == 1) {needPrev = false;}
	if(endNavi == pageTotalCount) {needNext = false;}
	
	
	
	if(needPrev) {
		let prev = $("<a>"); 
		prev.attr("href", "/notice/toNotice?cPage="+(startNavi-1)); 
		prev.html("<i class='fa-solid fa-chevron-left'></i>");
		$(".page").append(prev);
	}else{
		$(".page").append("<i class='fa-solid fa-chevron-left'></i>");
	}
		
	for(let i = startNavi; i <= endNavi; i++) {
		let navi = $("<a>");
		navi.attr("href", "/notice/toNotice?cPage="+i);
		navi.html(i + " ");
		if (i === currentPage) {
	        navi.css({"font-weight": "bold"}); 
	    }
		$(".page").append(navi);
	}
	if(needNext) {
		let next = $("<a>");
		next.attr("href", "/notice/toNotice?cPage="+(endNavi+1));
		next.html("<i class='fa-solid fa-chevron-right'></i>");
		$(".page").append(next);
	}else{
		$(".page").append("<i class='fa-solid fa-chevron-right'></i>");
	}
	</script>
	
</body>
</html>