<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.before-start {
    position: relative; /* 부모 요소를 상대 위치로 설정합니다. */
    text-align: center; /* 텍스트를 가운데 정렬합니다. */
    margin-top: 30px;
}

.start-img {
    width: 70%;
    position: relative; /* 이미지를 상대 위치로 설정합니다. */
}

#startButton {
  position: absolute;
  top: 45%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  background-size: cover;
  background-position: center center;
  background-image: url(https://cdn-icons-png.flaticon.com/512/5359/5359566.png);
  cursor: pointer;
  width: 10rem;
  height: 5rem;
  animation: shake 0.5s ease-in-out infinite; 
}

#startButton:hover {
  animation: none;
}

@keyframes shake {
  0%, 100% {
    transform: translate(-50%, -50%); /* 원래 크기와 위치 */
  }
  25% {
    transform: translate(-55%, -50%); /* 왼쪽으로 흔들리며 확대 */
  }
  75% {
    transform: translate(-45%, -50%); /* 오른쪽으로 흔들리며 확대 */
  }
}


.card {
	display: inline-block;
	width: calc(25% - 20px);
	min-width:100px;
	aspect-ratio: 3/4; 
	padding: 20px;
	perspective: 140px;
}


@media ( max-width : 1200px) {
	.card {
		padding: 10px;
	}

}

/* 화면 크기가 768px 이하일 때 카드 크기 조정 */
@media ( max-width : 768px) {
	.card {
		padding: 5px;
	}
	
	#startButton {
		 font-size: 30px;
	}
	
	.start-img {
	    width: 100%;
	}
}

.card-inner {
	/* position: absolute를 이용하여 카드 앞뒤를 곂쳐지게 함*/
	position: relative;
	width: 100%;
	height: 100%;
	text-align: center;
	transition: transform 0.8s;
	transform-style: preserve-3d;
}

.card.flipped .card-inner {
	transform: rotateY(180deg);
}

.card-front, .card-back {
	position: absolute;
	width: 100%;
	height: 100%;
	backface-visibility: hidden;
	border: 1px solid #F3EAEA;
	border-radius: 10px;
}

.card-front {
	background-image: url(/assets/img/game/cardfront.png);
	background-size: cover;
	background-position: center center;
}

.card-back {
	transform: rotateY(180deg);
}

.start-game{
    flex-direction: column;
    align-items: center;
}

#timer {
  text-align: center;
  font-weight: bold;
}


@keyframes blink {
  0% {
    opacity: 1;
  }
  50% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

#timer.blink {
	animation: blink 1s infinite;
	color: red; 
}
.card-progress-container {
	width: 70%;
	height: 20px;
	background-color: #f0f0f0;
	border-radius: 10px;
	margin: 20px 0;
	overflow: hidden;
}
.card-progress-bar {
	width: 0;
	height: 100%;
	background-color: #FFBF00;
	border-radius: 10px;
}


.progress-animation{
  animation: progressAnimation 60s linear 1s; /* 1초 지연 후에 애니메이션 시작 */;
}

@keyframes progressAnimation {
  0% {
    width: 0;
  }
  100% {
    width: 100%;
  }
}



</style>

<script>
$(document).ready(function() {
	const loginCust = $("#loginCustId").val();
	
    const startButton = $("#startButton");
    const progressBar = $("#progress"); 

    
    let timer; // 타이머 변수
    let totalTime = 60; // 총 시간 (60초)
    let remainingTime = totalTime; // 남은 시간 초기화
    
    const x = 4;
    const y = 3;
    
    //카드 뒤 색깔 7개 2개씩 미리 설정
    let backImg = ['back1','back2','back3','back4','back5','back6','back1','back2','back3','back4','back5','back6']

    let colors = backImg.slice(); //백업 복사


    //클릭 flag: 카드 세팅하는 동안에 클릭 기능 방지(flag가 true일 경우에만 클릭 가능)
    let clickFlag = true;
    //카드 오픈은 2개씩 가능, 카드끼리 색깔이 같은지 다른지 판단
    let clickedOne = [];
    //카드 2개 매치했을 경우, 클릭 방지를 위해
    let completedOne = [];
    let start; //시작시간

    //위의 색깔 랜덤 섞기 - 피셔예이츠 방식
    let chosenColor = [];
    
    
    function startTimer() {
   	  timer = setInterval(function () {
   	    if (remainingTime <= 0) {
   	      clearInterval(timer);
   	      endGame(); 
   	    } else {
   	    	if (remainingTime <= 11) {
   	    	  $('#timer').text(remainingTime - 1 + '초 남았어요! 서둘러주세요!!!!');
   	    	  $('#timer').addClass('blink'); // 깜빡이는 애니메이션을 활성화
   	    	} else {
   	    	  $('#timer').text(remainingTime - 1 + '초 남았어요!');
   	    	  $('#timer').removeClass('blink'); // 깜빡이는 애니메이션을 비활성화
   	    	}


   	      remainingTime--;
   	    }
   	  }, 1000); 
   	}

   	function endGame() {
   	  popup('안타깝게도 시간이 초과되어 게임 종료되었어요. 재도전하시겠어요?',true,restart,"");
   	}

   	function restart() {
   		remainingTime = totalTime;
   		
   		//prograss바에 애니메이션도 다시시작
		progressBar.removeClass("progress-animation");
		 setTimeout(function () {
		   progressBar.addClass("progress-animation");
		 }, 0);
		 
	    document.querySelector('#cardZone').innerHTML = ''; //전체 초기화
	    completedOne = [];
	    clickedOne = [];
	    start;
	    chosenColor = [];
	    colors = backImg.slice();
	    shuffle();
	    cardSetting(x, y);
	}
   	
    function shuffle() {
      while (colors.length > 0) {
        let color = Math.floor(Math.random() * colors.length);
        let mixedColor = colors.splice(color, 1)[0];
        chosenColor.push(mixedColor);
      }
      console.log(chosenColor+'chosenColor');
    }

    function cardSetting(x, y) {
    	
   		startTimer(); //60초 재기!
    	clickFlag = false;
   		
      //카드 세팅
      for (let i = 0; i < x * y; i++) {
        const card = document.createElement('div');
        card.className = 'card';

        const cardInner = document.createElement('div');
        cardInner.className = 'card-inner';
        const cardFront = document.createElement('div');
        cardFront.className = 'card-front';
        const cardBack = document.createElement('div');
        cardBack.className = 'card-back';
        cardBack.style.backgroundImage = 'url(/assets/img/game/' + chosenColor[i] + '.png)';
        cardBack.style.backgroundSize = 'cover';
        cardBack.style.backgroundPosition = 'center center';
        
        cardInner.appendChild(cardFront);
        cardInner.appendChild(cardBack);
        card.appendChild(cardInner);
        document.querySelector('#cardZone').appendChild(card);

        //클릭하여 카드 뒤집기
        card.addEventListener('click', function() {
          if (clickFlag && !completedOne.includes(card)) { //clickFlag가 true, 매치 안된 카드일 경우,
            card.classList.toggle('flipped');
            clickedOne.push(card); //선택한 카드 배열에 추가
            if (clickedOne.length == 2) { //선택한 카드가 2개일때
              //색깔이 같으면 계속 오픈 시킴
              if (clickedOne[0].querySelector('.card-back').style.backgroundImage ===
                clickedOne[1].querySelector('.card-back').style.backgroundImage) {
                console.log('matched!');
                completedOne.push(clickedOne[0]); //매치된 카드를 완성카드로 넣기
                completedOne.push(clickedOne[1]);
                clickedOne = [] //초기화

                if (completedOne.length === x * y) { //모두 매치했을 경우 성공 메시지
                    clearInterval(timer);
                    progressBar.removeClass("progress-animation");
                    
	                let end = new Date(); //끝시간 재기
	                let progressTime = (end - start) / 1000; 
	         
	                getPoint(progressTime)
                  

                }
              } else { //색깔이 다르면 1초 후 카드 닫기
                clickFlag = false; //미리 클릭 방지
                setTimeout(
                  () => {
                    clickedOne[0].classList.remove('flipped');
                    clickedOne[1].classList.remove('flipped');
                    clickFlag = true;
                    clickedOne = [] //초기화
                  }, 1000
                );
              }
            }
          }
        });

        //카드 세팅되면 몇초 보여주기(*카드 index별 시간차를 주고 오픈)
        document.querySelectorAll('.card').forEach((ele, index) =>
          setTimeout(() => {
            ele.classList.add('flipped')
          }, 1000 + 100 * index)
        );
        //5초뒤에 닫기
        setTimeout(() => {
          document.querySelectorAll('.card').forEach((ele) => ele.classList.remove('flipped'));
          clickFlag = true;
          start = new Date(); //시작시간 재기
        }, 3000);
      }
    }
    
    
    function getPoint(progressTime) {
		let point;

		if(progressTime <= 21){
			point = 30;
		}else if(21<progressTime<= 41){
			point = 20;
		}else if(41<progressTime<= 60){
			point = 10;
		}
		console.log(progressTime)	
		console.log(point)	
		 
	    $.ajax({
	        url: '/api/event/eventdata', 
	        method: 'POST',
	        data: {
	            loginCust: loginCust,
	            eventName: 'card',
            	pointsAwarded : point
	        },
	    	beforeSend : function(xhr,set){
	    		console.log('beforeSend 탄다. csrf 토큰확인');
				let token = $("meta[name='_csrf']").attr("content");
				//let token = 'fd6d1c70-afcd-4f76-80b1-69bba0910809' //내가 임의로 토큰값 수정해서 보내면 오류난다..!!신기함
				let header =$("meta[name='_csrf_header']").attr("content");
				
			
		        xhr.setRequestHeader("X-CSRF-Token", token);
				xhr.setRequestHeader(header,token);
			},
	        success: function(response) {
	       	  	let result = '축하합니다👏👏👏' + progressTime + '초 걸렸습니다</br>'+point+'포인트 적립되셨습니다.';
	    		popup(result,false,'','');

	        },
	        error: function(xhr, status, error) {
		   		popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
	            console.error('AJAX 요청 실패:', error);
	        }
	    });
		
	
	}

    startButton.click(function() {
   		console.log(loginCust);
   		if(!loginCust){
			 popup('로그인 후 이용하실 수 있습니다.<br> 로그인하러 가시겠습니까?', true , goToLogin, '');
		}else{
			checkTodayDo();
		}
    });
    
    
    function checkTodayDo() {
		
		let koreaToday = new Date(); 
		koreaToday.setHours(koreaToday.getHours() + 9);
		console.log('오늘 카드게임 참여 확인')
		
		// AJAX 호출
	    $.ajax({
	        url: '/api/event/check-today-do',
	        method: 'GET',
	        data: {
	            loginCust: loginCust,
	            eventName: 'card',
	            today: koreaToday.toISOString().split('T')[0] //2023-09-01 이러식으로 오늘의 날짜가 들어가야함
	        },
	        success: function(response) {
	        		console.log('오늘  참여회수'+response);
					if(response=='0'){
						console.log('미참여');
						progressBar.addClass("progress-animation");
				        startButton.prop("disabled", true);
				        
				
				        document.querySelector('.before-start').style.display = 'none';
				    	document.querySelector('.start-game').style.display = 'flex';
				    	
				        shuffle();
				        cardSetting(x, y);
						
					}else{
						popup('오늘은 이미 카드게임에 참여하셨습니다. 내일 다시 참여해주세요~!',false,'','');
					}

	        },
	        error: function(xhr, status, error) {
	            console.error('AJAX 요청 실패:', error);
	            popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
	        }
	    });
		
	}
    
    
    


});
</script>

<input type="hidden" id="loginCustId" value="${logincust.custId}">

<section class="pt-7 pb-12">
	<div style="text-align: center;">
		<div style="width: 100%; background-color: #ECEBF1;">
			<img style="width:100%; max-width:35rem; height: 10rem;'" src="/assets/img/event/cardEvent.png">
		</div>
	
	</div>
	<div class="container">
	
		<div class="row">

			<div style="display: flex; justify-content: center;" class="col-12">

				<div class="col-12 col-md-8" style="text-align: center;" id="cardZone"></div>
			</div>
		</div>
		<div class="before-start">
			<img class="start-img" src="/assets/img/event/cardgame.png">
			<div id="startButton"></div>
		</div>
		

			<div style="display: none;" class="start-game">
			   	<div id="timer">60초 시작!</div>
				<div  class="card-progress-container">
					<div class="card-progress-bar" id="progress"></div>
					  <div class="running-character" id="character"></div>
				</div>
			</div>
	</div>
</section>
