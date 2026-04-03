<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원(Q&A)</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
    /* 기존 폰트 및 기본 스타일 유지 */
    @font-face {
        font-family: 'GMarketSans';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
        font-weight: 300;
    }
    @font-face {
        font-family: 'GMarketSans';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: 500;
    }
    @font-face {
        font-family: 'GMarketSans';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
        font-weight: 700;
    }

    * { box-sizing: border-box; }
    body, html { margin: 0; padding: 0; font-family: 'GMarketSans', sans-serif; }

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
        top: 0; left: 0;
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
        box-shadow: 0 4px 6px rgba(0,0,0,0.3);
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
        margin-bottom: 10px;
        padding: 10px;
        border-radius: 5px;
        background-color: #F2D3A2;
    }

    .rowItem2 {
        border: 0px solid #ccc;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        margin-bottom: 10px;
        padding: 10px;
        border-radius: 5px;
    }
    
    .labelName {
        font-size: 12px;
        color: #5e361a;;
        display: block;
        margin-bottom: 5px;
    }

    .titleContent { font-weight: bold; font-size: 18px; color: #5e361a; }
    .textContent { font-size: 15px; color: #444; min-height: 60px; color: #5e361a;}

    /* 답변 영역 (와이어프레임의 하단 칸) */
    .answerBox {
        background-color: #F2D3A2;
        border-top: 1px solid #A66A3F;
        padding: 15px;
        color : #5e361a;
    }
    .answerLabel {
        font-weight: bold;
        color: #5e361a;
        margin-bottom: 5px;
        display: block;
    }

    /* 하단 페이지네이션 */
    .pageBox {
        text-align: center;
        padding: 20px;
        font-size: 18px;
        color: #A66A3F;
        transform: translateX(-20px);
    }
    .pageBox span { margin: 0 10px; cursor: pointer; }

    /* 글쓰기 버튼 */
    .writeBtn {
        position: fixed;
        right: 30px;
        bottom: 90px;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background-color: #A66A3F;
        border: none;
        color: white;
        font-size: 30px;
        cursor: pointer;
        box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        z-index: 999;
    }

    /* 하단바 */
    .bottomBox {
        position: fixed;
        bottom: 0; left: 0;
        width: 100%;
        height: 60px;
        display: flex;
        align-items: center;
        justify-content: space-around;
        background-color: #F2D3A2;
        border-top: 2px solid #A66A3F;
        z-index: 1000;
    }
    .bottomBox i { color: #A66A3F; cursor: pointer; }
</style>
</head>
<body>

<div class="container">
    <div class="headBox">고객지원(Q&A)</div>

    <div class="userInfoSection">
        <i class="fa-solid fa-circle-user userIcon"></i>
        <span class="userName">든든이</span>
    </div>

    <div class="postBox">
        <div class="postHeader">
            작성일자 : 1945-08-15
        </div>
        <div class="postBody">
            <div class="rowItem1">
                <span class="labelName">제목</span>
                <div class="titleContent">우리 동네 보안등 관련 문의드립니다.</div>
            </div>
            <div class="rowItem2">
                <span class="labelName">내용</span>
                <div class="textContent">
                    밤마다 골목길이 너무 어두워요. 보안등 추가 설치가 가능한지 궁금합니다.
                </div>
            </div>
        </div>
        <div class="answerBox">
            <span class="answerLabel">답변 댓글</span>
            <div class="answerText">현재 해당 지역 확인 중이며, 다음 주 내로 조치 예정입니다.</div>
        </div>
    </div>

    <div class="postBox">
        <div class="postHeader">
            작성일자 : 1945-08-15
        </div>
        <div class="postBody">
            <div class="rowItem1">
                <span class="labelName">제목</span>
                <div class="titleContent">앱 결제 오류 관련</div>
            </div>
            <div class="rowItem2">
                <span class="labelName">내용</span>
                <div class="textContent">
                    카드 결제 시 자꾸 튕기는 현상이 발생합니다.
                </div>
            </div>
        </div>
    </div>

    <div class="pageBox">
        <i class="fa-solid fa-chevron-left"></i>
        <span>1</span> <span>2</span> <span>3</span>
        <i class="fa-solid fa-chevron-right"></i>
    </div>
    
    <button class="writeBtn" type="button" onclick="location.href='/board/write'">
        <i class="fa-solid fa-pencil"></i>
    </button>

    <div class="bottomBox">
        <i class="fa-solid fa-house fa-2xl"></i>
        <i class="fa-solid fa-map-location-dot fa-2xl"></i>
        <i class="fa-solid fa-people-group fa-2xl"></i>
        <i class="fa-solid fa-bullhorn fa-2xl"></i>
        <i class="fa-solid fa-user fa-2xl"></i>
    </div>
</div>

</body>
</html>