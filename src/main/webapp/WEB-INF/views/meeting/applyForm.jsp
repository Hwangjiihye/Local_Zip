<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

	<style>
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
	
	.title {
		width: 100%;
		font-weight: bold;
		font-size: 40px;
		color: #A66A3F;
		border-bottom: 2px solid #A66A3F;
		background-color: #F2D3A2;
		height: 50px;
		line-height: 100px;
		display: flex;
		padding: 0 20px;
		justify-content: space-between; 
		align-items: center;
		box-sizing: border-box;
		font-weight: bold;
	    font-size: 23px;
	    color: #5e361a;
	}
	
	.centerBox{
		margin: auto;
	    width: 80%;
	    border-radius: 10px;
	    background-color: #fbe5c0;
	    padding: 35px;
	 	margin-top: 30px;
	    background-color: #F2D3A2;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	}
	
	.centerBoxTitle{
		margin-left: 20px;
		margin-top: 10px;
		font-weight: bold;
		font-size: 20px;
		color: #5e361a;
	}
	
	.introWrite{
		width: 620px;
		/* height: 35px; */
		top: 30px;
		left: 0;
		box-shadow: 0 4px 10px rgba(0,0,0,0.2);
		z-index: 10;
		font-family: 'GMarketSans';
		border-radius: 5px;
		background-color: #fbe5c0;
		color: #A66A3F;
		font-size: 12px;
		padding: 2px;
		outline: none;
		resize: none;
	}
	
	.okBtn{
		width: 50px;
		height: 30px;
		background-color: #FFB300;
		border:none;
		border-radius: 10px;
		color: #5e361a;
		font-size: 17px;
		font-weight: bold;
		box-shadow: 0 4px 10px rgba(0,0,0,0.2);
		display: flex;
		margin-left: 370px;
		margin-top: 15px;
	}
	
	.okBtn:hover {
		transform: translateY(-3px);
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
	}
		
	.okBtn:active {
		transform: translateY(2px);
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	}
	
	
	
	</style>
</head>
<body>
<form action="/meetingMember/insert" class="frm" method="post">
	<div class="container">
		<div class="top-section">
			<div class="title">
				<span>새 모임 신청서</span>
			</div>
		</div>
		<input type="hidden" name="meet_seq" value="${meet_seq}">
		<input type="hidden" name="mem_nickname" value="${nickname}">
		<div class="centerBoxTitle">한 줄 소개  <i class="fa-solid fa-file-pen" style="color: #A66A3F"></i></div>
		<div class="centerBox">
			<div><textarea id="intro" name="meetmem_contents" class="introWrite" minlength="30" maxlength="100" style=" border: 0px solid #fbe5c0" placeholder="모임 주최자에게 보낼 한 줄 소개를 작성해주세요"></textarea></div>
		</div>
		<input id="use" class="okBtn" type="submit" value="완료">
	</div>
</form>	
	
	<script>
	$(".okBtn").on("click", function(){
		
		let intro = document.getElementById("intro").value;
		
		if(intro == ""){
			alert("한 줄 소개를 작성해주세요")
			return false;
		} else {
			return true;
		}
	})
	
	</script>

</body>
</html>