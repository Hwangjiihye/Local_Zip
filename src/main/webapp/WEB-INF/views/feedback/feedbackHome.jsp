<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>feedbackHome</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<style>
	@font-face {
		font-family: 'GMarketSans';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
			format('off');
		font-weight: 300;
		font-display: swap;
	}
	
	@font-face {
		font-family: 'GMarketSans';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
			format('woff');
		font-weight: 500;
		font-display: swap;
	}
	
	@font-face {
		font-family: 'GMarketSans';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
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
		display: grid;
		grid-template-columns:repeat(4, 1fr);
		gap:20px;
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

</style>
</head>
<body>
	<div class="container">
		<div class="top-section">
			<div class="mainTitle">
				<span>동네 건의.zip</span>
			</div>
		</div>
		
		
		
		
		
		<div class="bottomBar">
			<a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/meeting/list"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a>
			<a><i class="navicon fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>
			<a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
		</div>
		
		
		
		
	</div>
</body>
</html>