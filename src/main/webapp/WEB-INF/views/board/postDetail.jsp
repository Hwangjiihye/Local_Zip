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
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
            font-weight: 300;
            font-display: swap;
        }

        @font-face {
            font-family: 'GMarketSans';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: 500;
            font-display: swap;
        }

        @font-face {
            font-family: 'GMarketSans';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: 700;
            font-display: swap;
        }


        * {
            box-sizing: border-box;
        }

        body,
        html {
            margin: 0;
            padding: 0;
        }

        /* 폰트 지정 */
        button,
        body {
            font-family: 'GMarketSans', sans-serif;
        }

        .container {
            position: relative;
            top: 100px;

            width: 100%;
            min-height: 100vh;
            /* 최소 높이 지정 : 브라우저 */

            border: 1px solid black;
            background-color: #fbe5c0;
        }


        .headBox {
            position: fixed;
            top: 0;
            left: 0;

            width: 100%;
            height: 100px;

            padding-left: 20px;

            font-weight: bold;
            font-size: 50px;
            color: #A66A3F;
            background-color: #F2D3A2;
            border-bottom: 2px solid #A66A3F;
            /* 아래쪽만 줄 그음 */

            line-height: 100px;
            z-index: 1000;

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
            max-width: 1500px;
            /* 적당히 보기 좋은 최대 너비 설정 */

            min-height: 200px;
            height: auto;

            margin: auto;
            margin-top: 30px;

            border-radius: 10px;
            
            /* 그림자 효과 */
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);

        }

        .postUpBox {
            width: 100%;
            height: 95px;
            display: flex;
            border-radius: 10px 10px 0 0;
            background-color: #F2D3A2;
        }
		.replyUpBox {
			width: 100%;
			min-height: 95px;
			height: auto;
            display: flex;
            background-color: #fbe5c0;
		}

        .postProfile, .replyProfileBox {
            width: 75px;
            height: 75px;
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
        
        .replyProfile{
        	margin-top: -3px;
            margin-left: -5px;
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
		.replyInfoBox{
			width: 300px;
		    min-height: 50px;
			position: relative;
			flex-grow: 1;
    		margin-top: 5px;
    		margin-right:5px;
    		margin-left: 20px;
		}
        .postInfoUp,
        .postInfoDown,
        .replyInfoUp{
            display: flex;
        }
        .replyInfoUP{
    		align-items: center;
    		width: 100%;
    		padding-right: 40px;
        }
		.replyInfoDown{
			margin-top: 0px;
			width: 70%;
			min-height: 40px;
			border-radius: 5px;
			background-color: #f0d8af;
			color: #5e361a;
			padding: 10px;
		    line-height: normal;
		    word-break: break-all;
		}
        .profileInfo,
        .replyInfo {
            width: auto;
            margin-right: 15px;
            /* 정보 사이의 간격 일정하게 부여 */

            /*수직 정렬*/
            display: flex;
            align-items: center;

            font-size: 14px;
            color: #333;
        }


        /* 신고 영역 스타일 */
        .reportArea {
            display: flex;
            flex-direction: column;
            /* 아이콘과 선택창을 세로로 배치 */
            align-items: flex-end;
            margin-left: auto;
            position: absolute;
		    top: 5px;     /* 위에서 살짝 띄움 */
		    right: 20px;  /* 오른쪽에서 살짝 띄움 */
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
            outline: none;
            display: none;
        }
		.reportBtn{
			background-color: #ffb300;
			color: #5e361a;
			border: 1px solid #ffb300;
			border-radius: 10px;
			font-weight: bold;
			display: none;
		}
		.reportBtn:hover{
			transform: translateY(-3px); /* 살짝 위로 뜸 */
			box-shadow: 0 6px 15px rgba(0,0,0,0.3);
		}
		
		.reportBtn:active{
			transform: translateY(2px); /* 아래로 눌림 */
			box-shadow: 0 2px 5px rgba(0,0,0,0.2);
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
        }

        .postContent {
            margin: auto;

            width: 95%;

            font-size: 15px;

            background-color: #f0d8af;
            border-radius: 5px;
            
            padding: 0 10px;
        }


        .postDownBox {
            width: 95%;
            margin: auto;
            min-height: 40px;
            display: flex;
        }

        .postLikeBox,
        .postCommentBox {
            display: flex;
            align-items: center;

            min-width: 80px;
            width: auto;

            gap: 10px;

            cursor: pointer;
            transition: 0.3s;
        }


        .beforeHeart:hover,
        .afterHeart:hover,
        .comment:hover {
            color: #cdaa69;
        }

        .afterHeart {
            display: none;
        }

        /* active 클래스가 붙었을 때의 제어 */
        .postLikeBox.active .beforeHeart {
            display: none;
        }

        .postLikeBox.active .afterHeart {
            display: inline;
            color: red;
        }

        .navicon:hover,
        .applyBtn:hover {
            transform: translateY(-3px);
            /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        .navicon:active,
        .applyBtn:active {
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
        
        a{
     		color: #5e361a;
     		text-decoration: none;
     	}
     	.replyContainer{
     		width
     	}
     	.replyBox{
     		width: 95%;
            max-width: 1500px;
            /* 적당히 보기 좋은 최대 너비 설정 */

            min-height: 200px;
            height: auto;

            margin: auto;
            margin-top: 30px;
            
            /* 그림자 효과 */
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            border-radius: 10px;
     	}
     	.replyTitle{
     		width: 100%;
            height: 15px;
            font-size: x-large;
            font-weight: bold;
            color: #A66A3F;
            margin-top: 20px;
            margin-left: 210px;
     	}
     	.newReplyBox{
     		display: flex;
     		background-color: #F2D3A2;
     	}
     	.newReplyDiv{
     		width: 90%;
            border-radius: 10px;
            margin: 15px;
            margin-left: 65px;
            margin-top: 20px;
     	}
     	.newReply{
     		width: 100%;
     		background-color: #fbe5c0;
     		border-radius: 10px;
     		border: none;
     		font-family: 'GMarketSans';
     		color: #5e361a;
     		outline: none;
     		resize: none;
     	}
     	.applyBtnDiv{
     		width: 10%;
     	}
     	.applyBtn{
     		background-color: #ffb300;
	        color: #5e361a;
	        border: 1px solid #ffb300;
	        border-radius: 10px;
	        font-weight: bold;
	        margin-left: 10px;
    		margin-top: 20px;
    		width: 60px;
    		height: 40px;
    		font-size: medium;
     	}
     	.writerName{
     		margin-top: 10px;
     	}
     	.writeTime{
     		margin-top: 6px;
     	}
     	hr{
     		border: 1px dotted #5e361a;
     	}
    </style>

</head>
<body>
	<div class="container">

        <div class="headBox">게시글 자세히보기</div>

        <div class="bodyBox">
	            <div class="postBox">
	
	                <div class="postUpBox">
	
	                    <div class="postProfile">
	                        <img class="contentProfile" src="/resources/images/Profile.png" style="width: 60px;">
	                    </div>
	
	                    <div class="postInfoBox">
	                        <div class="postInfoUp">
	                            <div class="profileName profileInfo" style="color: #5e361a;">${dto.mem_nickname }</div>
	                            <div class="profileLocal profileInfo" style="color: #5e361a;">${dto.mem_dong }</div>
	                        </div>
	
	                        <div class="postInfoDown">
	                            <div class="profileTime profileInfo" style="color: #5e361a;">${dto.post_date }</div>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="postMidBox">
	
	                    <div class="postTitle">${dto.post_title }</div>
	                    <div class="postContent">${dto.post_contents }</div>
	
	                </div>
	
	                <div class="postDownBox">
	
	                    <div class="postLikeBox">
	                        <i class="fa-regular fa-heart fa-xl beforeHeart"></i>
	                        <i class="fa-solid fa-heart fa-xl afterHeart"></i>
	
	                        <div>갯수</div>
	                    </div>
	
	                    <div class="postCommentBox">
	                        <i class="fa-regular fa-comment fa-xl comment"></i>
	
	                        <div>갯수</div>
	                    </div>
	
	                </div>
	
	            </div>
	            <div class="replyContainer">
					<div class="replyTitle">댓글</div>
					<div class="replyBox">
						<div class="newReplyBox">
							<div class="newReplyDiv">
								<textarea class="newReply" type="text" placeholder="댓글을 입력하세요."></textarea>
							</div>
							<div class="applyBtnDiv">
								<input class="applyBtn" type="submit" value="등록">
							</div>
						</div>
						<div class="replyUpBox">
							<div class="replyProfileBox">
			                	<img class="replyProfile" src="/resources/images/birdprofile.png" style="width: 80px;">
			                </div>
		
		                    <div class="replyInfoBox">
		                        <div class="replyInfoUp">
		                            <div class="writerName replyInfo" style="color: #5e361a;">댓글작성자</div>
		                            <div class="writeTime replyInfo" style="color: #5e361a;">00시간 전</div>
		                            <div class="reportArea">
									<img src="/resources/images/free-icon-siren1.png" class="reportIcon" style="width: 25px; height: 25px; margin-bottom:5px"></img>
			                        <select class="reportSelect" name="reports_reason">
			                            <option value="" disabled selected>신고 사유</option>
			                            <option value="badContents" class="reportOption">부적절한 콘텐츠</option>
			                            <option value="badWord" class="reportOption">욕설/비방</option>
			                            <option value="AD" class="reportOption">광고/스팸</option>
			                        </select>
			                        <input class="reportBtn" type="submit" value="신고하기">
			                    </div>
		                        </div>
		                        <div class="replyInfoDown">
		                            <div class="replyContents replyInfo" style="color: #5e361a;">댓글 내용</div>
		                        </div>
								
		                    </div>
		                 </div>
		                 <hr>
					</div>
				</div>
	        <div class="bottomBox">
	            <a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a>
	            <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
	            <a href="/meeting/list"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a>
	            <a><i class="navicon fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>
	            <a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
	
	        </div>
		</div>
    </div>

    <script>

        // 좋아요 버튼
        $(".postLikeBox").on("click", function () {
            $(this).toggleClass("active"); // 클릭할 때마다 active 클래스를 넣었다 뺐다 함
        });

        // 신고버튼을 눌렀을 때, 신고 사유가 튀어나오게
        $(".reportIcon").on("click", function () {
            $(".reportSelect").css({ "display": "inline" });
            $(".reportBtn").css({"display": "inline"});
        })
    </script>
</body>
</html>