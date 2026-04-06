<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>feedbackHome</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

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
            padding-top: 100px;
 			padding-bottom: 90px;
            width: 100%;
            min-height: 100vh;
            /* 최소 높이 지정 : 브라우저 */
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
        
        .writeBtn {
            width: 1730px;
            height: 100px;
            margin-left: 80px;
            cursor: pointer;
            margin-top: 1%;
            margin-bottom: 1%;
            border: #fbe5c0;
            color:  #5e361a;
            font-size: 30px;
            font-weight: bold;
			background-color:  #FFB300;
			border-radius: 5px;
            align-items: center;
            display: flex;
            justify-content: center;

            /* 그림자 효과 */
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);

            /* 애니메이션 부드럽게 */
            transition: all 0.2s ease;
        }
        
        .writeBtn:hover{
        	transform: translateY(-3px); /* 살짝 위로 뜸 */
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
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
        
        .suggestionBox{
        	width: 1600px;
        	height: 300px;
        }
        
        a {
		    text-decoration: none;
		    color: inherit;
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
        
        .postProfile {
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
        
        .postInfoBox {
            width: 300px;
            min-height: 50px;
            position: relative;
            left: 20px;
            top: 30px;

            flex-grow: 1;
            /* 신고박스 오른쪽으로 딱 붙게 하기 위해 빈공간을 쭉 늘려주는 코드 */
        }
        
        .postInfoUp,
        .postInfoDown {
            display: flex;
        }
        
        /* 신고 영역 스타일 */
        .reportArea {
            position: relative;
            top: 8px;
            right: 20px;

            display: flex;
            flex-direction: column;
            /* 아이콘과 선택창을 세로로 배치 */
            align-items: flex-end;
            /* 오른쪽 정렬 */
            gap: 5px;
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
	    
	    .profileInfo {
            width: auto;
            margin-right: 15px;
            /* 정보 사이의 간격 일정하게 부여 */

            /*수직 정렬*/
            display: flex;
            align-items: center;

            font-size: 14px;
            color: #333;
        }
        
        .postTitle {
            margin: auto;

            width: 95%;
            height: 40px;

            font-size: 20px;
            margin-top: 5px;
            
            line-height: 40px;
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
            color: #5e361a;
            line-height: 40px;
        }

        .postContent {
            margin: auto;

            width: 95%;
            height: 1.5em;       /* 한 줄 높이만큼 고정 */
    		line-height: 1.5em;

            font-size: 18px;

            background-color: #f0d8af;
            border-radius: 5px;
            color: #5e361a;
            padding: 0 10px;
             
            white-space: nowrap;
            overflow: hidden;
    		text-overflow: ellipsis; /* 넘치는 부분을 ...으로 표시 */
    		display: block;
        }
        
        .postDownBox {
            width: 95%;
            margin: auto;
			margin-top: 5px;
            min-height: 40px;
            display: flex;
            gap: 20px;
        }
        
        .navicon2 {
        	font-size: 15px;
        }
        
        .navicon3{
        	margin-right: 10px;
        }
        
        .postLikeBox,
        .postCommentBox {
            display: flex;
            align-items: center;

            min-width: 80px;
            width: auto;

            gap: 10px;
			color: #5e361a;
            cursor: pointer;
            transition: 0.3s;
        }
        
        .profileTime {
        	margin-top: 5px;
        }
        
        .agreeIcon.active {
        	color: #5e361a;
        }
        
        .noIcon.active {
        	color: #5e361a;
        }
        
    </style>

</head>
<body>
    <div class="container">

        <div class="headBox">동네 건의.zip</div>
		<a href="/feedback/feedbackWrite"><button class="writeBtn" type="button"><i class="navicon3 fa-solid fa-bullhorn fa-xl" style="color: #A66A3F"></i>  새 건의 작성하기</button></a>

<c:forEach var="i" items="${list}">
		<div class="postBox">
				
	                <div class="postUpBox">
	
	                    <div class="postProfile">
	                        <img class="contentProfile" src="/resources/images/Profile.png" width="60px">
	                    </div>
	
	                    <div class="postInfoBox">
	                        <div class="postInfoUp">
	                            <div class="profileName profileInfo" style=color:#5e361a;>${i.mem_nickname}</div>
	                        </div>
	
	                        <div class="postInfoDown">
	                            <div class="profileTime profileInfo" style=color:#5e361a;>${i.suggestion_writedate}</div>
	                        </div>
	                    </div>
	
						<form action="">
		                    <div class="reportArea">
								<img src="/resources/images/free-icon-siren1.png" class="reportIcon" style="width: 25px; height: 25px; margin-bottom:5px" ></img>
								<select class="reportSelect" name="reports_reason">
	                               <option value="" disabled selected>신고 사유</option>
	                               <option value="badContents" class="reportOption">부적절한 콘텐츠</option>
	                               <option value="badWord" class="reportOption">욕설/비방</option>
	                               <option value="AD" class="reportOption">광고/스팸</option>
	                           	</select>
		                        <input class="reportBtn" type="button" value="신고하기" data-seq="${i.suggestion_seq}">
		                    </div>
						</form>
	
	                </div>
	
	                <div class="postMidBox">
	
	                    <div class="postTitle">${i.suggestion_title}</div>
	                    <div class="postContent">${i.suggestion_contents}</div>
	
	                </div>
	
	                <div class="postDownBox" data-seq="${i.suggestion_seq}">
	
	                    <div class="postLikeBox">
							<i class="navicon2 fa-regular fa-thumbs-up fa-2xl agreeIcon"></i> 동의해요
							<span class="agreeCount">${i.suggestion_like}</span>
	                    </div>
	
	                    <div class="postCommentBox">
	                         <i class="navicon2 fa-regular fa-thumbs-down fa-2xl noIcon" style="color: #5e361a;"></i> 잘 모르겠어요
	                         <span class="noCount">${i.suggestion_unlike}</span>
	                    </div>
	               </div>
				</div>
			</c:forEach>
		</div>
		
		 <div class="bottomBox">
            <a href="/"><i class="navicon fa-solid fa-house fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/map/test"><i class="navicon fa-solid fa-map-location-dot fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/meeting/list?category=all"><i class="navicon fa-solid fa-people-group fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/feedback/feedbackHome"><i class="navicon fa-solid fa-bullhorn fa-2xl" style="color: #A66A3F"></i></a>
            <a href="/members/mypage"><i class="navicon fa-solid fa-user fa-2xl" style="color: #A66A3F"></i></a>
        </div>
    
    <script>
        // 좋아요 버튼
        // container가 감시하고 있다가 postLikeBox가 눌리면 함수를 실행
        $(".postLikeBox").on("click", function () {
        	
        	let btn = $(this).off("click");
        	// this : .postLikeBox 자기 자신
			// ex) this는 그 5번째 게시글 안의 .postLikeBox가 됨.
			// closest(".postBox") : 나를 감싸는 가장 가까운 .postBox를 찾아라
        	let postDownBox = $(this).closest(".postDownBox");
			
			// suggestion_seq : 지금 클릭한 게시글 번호 들어감
			let suggestion_seq = postDownBox.data("seq");
			
            let countSpan = $(this).find(".agreeCount");
			
			console.log("글번호:", suggestion_seq);
        	
        	// jqeury의 ajax함수 시작
        	// 페이지 새로고침 없이 서버랑 통신하겠다는 의미
        	$.ajax({
        		url: "/feedback/like",  // 좋아요 버튼을 누르면 /feedback/like로 요청을 보냄
        		type: "post",
        		data: {
        			suggestion_seq: suggestion_seq
        		},
        		success: function(resp) { // 서버가 성공적으로 응답했을때, resp: 서버가 돌려준 결과값
        			console.log("서버응답:", resp);
        			
        			// ⭐ 숫자 +1
                    let current = Number(countSpan.text());
                    countSpan.text(current + 1);
                    
                 	// 아이콘 변경 ⭐
                    btn.find("i")
                       .removeClass("fa-regular")
                       .addClass("fa-solid")
                       .css("color", "#5e361a");

                    // ⭐ 중복 클릭 방지
                    btn.off("click");
                },
            error: function() {
                alert("에러 발생");
            }
        });	
    });
        	$(".postCommentBox").on("click", function(){
        		let btn = $(this).off("click");
        		let postDownBox = $(this).closest(".postDownBox");
        		let suggestion_seq = postDownBox.data("seq");
        		let countSpan = $(this).find(".noCount");
        		console.log("글번호 :", suggestion_seq);
        		
        		$.ajax({
        			url: "/feedback/unlike",
        			type: "post",
        			data: {
        				suggestion_seq: suggestion_seq
        			},
        			success: function(resp) {
        				console.log("서버응답", resp);
        				
        				// ⭐ 숫자 +1
                        let current = Number(countSpan.text());
                        countSpan.text(current + 1);
                        
                     	// 아이콘 변경 ⭐
                        btn.find("i")
                           .removeClass("fa-regular")
                           .addClass("fa-solid")
                           .css("color", "#5e361a");

                        // ⭐ 중복 클릭 방지
                        btn.off("click");
        			},
        			error: function(){
        				alert("에러 발생");
        			}
        		});
        	});

        // 신고버튼을 눌렀을 때, 내가 누른 게시글 신고버튼만 눌림
        $(".reportIcon").on("click", function () {
        	$(this).siblings(".reportSelect, .reportBtn").css({"display" : "inline"});
        })
        
        //
        $(".reportBtn").on("click", function(e){
        	 e.preventDefault();
        	 
        	let target_seq = $(this).data("seq");
        	let reports_type = $(this).closest(".postBox").find(".reportSelect").val();

            console.log("target_seq :", target_seq);
            console.log("reports_type :", reports_type);
            
        	$.ajax({
        		url:"/report/insert",
        		type:"post",
        		data: {
        			target_seq: target_seq,
                    reports_type: reports_type
        		},
        		success: function(resp) {
        			 if(resp === "success") {
        	                alert("신고가 접수되었습니다.");
        	            } else if(resp === "fail") {
        	                alert("이미 신고한 글입니다.");
        	            } else if(resp === "login") {
        	                location.href = "/members/loginUi";
        	            } else {
        	                alert("신고 실패");
        	            }
                },
                error: function(xhr, status, error) {
                    console.log("status :", xhr.status);
                    console.log("responseText :", xhr.responseText);
                    console.log("error :", error);
                    alert("에러 발생");
                }
        	})
        })
        
        // 좋아요 버튼, 신고버튼 클릭 시에는 페이지 이동 X
        $(".postLikeBox, .reportArea, .reportIcon, .reportSelect, .reportBtn").on("click", function (e) {
		    e.stopPropagation();
		});
    </script>

</body>
</html>