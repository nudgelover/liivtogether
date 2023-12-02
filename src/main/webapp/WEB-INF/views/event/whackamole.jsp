<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.catch-title {
	color: #f2ecff;
	text-align: center;
	line-height: 1.5;
}

.whack-a-mole {
	background: no-repeat center/cover url('/assets/img/event/gress.png'); 
    padding: 40px 10px 10px 10px;
	margin: 0 auto;
	width: 100%;
	border-radius: 20px;
	display: flex;
	flex-wrap: wrap; /* 요소가 넘치면 줄 바꿈하도록 설정 */
	justify-content: center;
	align-items: center;
}

.mole {
  width: calc(33.33% - 20px); /* 3개 요소가 한 줄에 들어가도록 너비 설정 */
  aspect-ratio: 1/1;
  margin: 10px;
  overflow: hidden;
  cursor: pointer;
  border-radius: 20px;
  background: no-repeat center/cover url('/assets/img/event/mole.png');
}


.mole>img {
  position: relative;
  bottom: -5px;
  display: block;
  width: 80%;
  margin: 0 10%;
  opacity: 0;
  transition: 0.05s ease-out;
}

.whack-a-mole .active {
  bottom: 3px;
  opacity: 1;
  animation: shake 0.5s;
  animation-iteration-count: infinite;
}

@keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}

.hammer {
	position: absolute;
	width: 30px;
	height: 30px;
	background-image: url('/assets/img/game/뿅망치.png');
	background-size: cover;
	pointer-events: none;
	transition: transform 0.1s ease-out; /* 추가된 부분 */
	transform-origin: 50% 100%; /* 추가된 부분 */
	transform: rotate(0deg); /* 추가된 부분 */
}

.point-wrap {
    display: flex;
    justify-content: center;
}


.start-btn {
	width: 50%;
	height: 70px;
	font-size: 20px;
	font-weight: 900;
	margin: 20px;
	background: #222;
	border: none;
	color: #f2ecff;
	border-radius: 20px;
}

.start-btn:hover {
	opacity: 0.5;
	color: #f9f871;
}

.point-box {
	background-color: #4e4e4e;
	width: 100%;
	margin: 10px 0 30px 0;
	text-align: center;
	border-radius: 20px;
}

#point-text {
	float: left;
	font-size: 24px;
	font-weight: bold;
	color: #f2ecff;
	margin: 15px 0 0 0;
}

#count-mole {
	float: left;
	font-size: 30px;
	font-weight: bold;
	color: #f9f871;
	margin: 10px 10px 0 60px;
}

#count-mole2 {
	float: left;
	font-size: 24px;
	font-weight: bold;
	color: #f2ecff;
	margin: 15px 0 0 0;
}


</style>

<div style="text-align: center;">
	<div style="width: 100%; background-color: #89C43E;">
		<img style="width:100%; max-width:35rem; height: 10rem;'" src="/assets/img/event/catchEvent.png">
	</div>

</div>
<section style="display: flex; flex-direction: column; align-items: center; padding: 10px;">	
	<div class="col-12 col-md-4 col-sm-6">
		<div>
			<div id="ending" class="ending">
				<p id="ending-box"></p>
			</div>
			<div id="ending-bg" class="ending-bg"></div>
			<ul id="gameContainer" class="whack-a-mole clearfix">
				<li class="mole"><img id="1" src="/assets/img/event/점프콜리.png">
				</li>
				<li class="mole"><img id="2" src="/assets/img/event/점프콜리.png">
				</li>
				<li class="mole"><img id="3" src="/assets/img/event/점프콜리.png">
				</li>
				<li class="mole"><img id="4" src="/assets/img/event/점프콜리.png">
				</li>
				<li class="mole"><img id="5" src="/assets/img/event/점프콜리.png">
				</li>
				<li class="mole"><img id="6" src="/assets/img/event/점프콜리.png">
				</li>
				<li class="mole"><img id="7" src="/assets/img/event/점프콜리.png">
				</li>
				<li class="mole"><img id="8" src="/assets/img/event/점프콜리.png">
				</li>
				<li class="mole"><img id="9" src="/assets/img/event/점프콜리.png">
				</li>
			</ul>
			<div class="point-box clearfix">
				<div class="point-wrap">
					<p id="point-text">포인트 :</p>
					<p id="count-mole">0</p>
					<p id="count-mole2">/10</p>
				</div>
				<div>
					<button id="start-btn" type="button" class="start-btn">게임시작</button>
				</div>
			</div>
		</div>
	</div>
</section>
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<script>
const loginCust = $("#loginCustId").val();
let flag = 0;
let moleNumber;
let randomNum;
let preNum;
let getPoint = 0; // getPoint 변수 초기화
let turn = 0; // turn 변수 초기화
let isClickable = true; //중복클릭이벤트방지
/*
let hammer;

const gameContainer = document.getElementById('gameContainer');

gameContainer.addEventListener('mouseenter', () => {

  hammer = document.createElement('div');
  hammer.classList.add('hammer');
  gameContainer.appendChild(hammer);

  gameContainer.addEventListener('mousemove', moveHammer);
});

gameContainer.addEventListener('mouseleave', () => {
	console.log('떠나갔따');
  if (hammer) {
    hammer.remove();
    gameContainer.removeEventListener('mousemove', moveHammer);
  }
});

gameContainer.addEventListener('click', () => {
	console.log('들어왔다 클릭');
	  if (hammer) {
	    hammer.style.transform = 'rotate(45deg)'; // 수정된 부분
	  }
	});
	
	
function moveHammer(e) {
	console.log('들어왔다2');
  if (hammer) {
		console.log('들어왔다3');
    hammer.style.left = `${e.clientX - 15}px`;
    hammer.style.top = `${e.clientY - 15}px`;
  }
}

*/

function randomHole(){
	  randomNum = Math.floor(Math.random() * 10);
	  if (preNum !== randomNum && randomNum > 0) {
	    preNum = randomNum; 
	    return randomNum;
	  }
	  
	  return randomHole();
	 }




let startBtn = document.getElementById('start-btn');

//startBtn.addEventListener('click', startMole);

startBtn.addEventListener('click', function() {
	if (!loginCust) {
		popup('로그인 후 이용하실 수 있습니다.<br> 로그인하러 가시겠습니까?', true, goToLogin, '');
	} else {
		checkTodayDo();
	}
});

function checkTodayDo() {
	
	let koreaToday = new Date(); 
	koreaToday.setHours(koreaToday.getHours() + 9);
	
	// AJAX 호출
    $.ajax({
        url: '/api/event/check-today-do',
        method: 'GET',
        data: {
            loginCust: loginCust,
            eventName: 'whackamole',
            today: koreaToday.toISOString().split('T')[0] //2023-09-01 이러식으로 오늘의 날짜가 들어가야함
        },
        success: function(response) {
        		console.log('오늘  참여회수'+response);
				if(response=='0'){
					console.log('미참여');
					 startMole();
				}else{
					popup('오늘은 이미 <콜리를 잡아라>게임에 참여하셨습니다. 내일 다시 참여해주세요~!',false,'','');
				}

        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', error);
            popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
        }
    });
	
}


function startMole() {
	startBtn.removeEventListener('click', startMole);
	startBtn.style.color = '#3d3f43';
	getPoint = 0;
	turn = 0;
	setTimeout(showingMole, 1000);
}

function moleActive(num) {
	num.classList.add('active');
}
function moleHide(num) {
	num.classList.remove('active');
}
var moleCatch = 0;




function showingMole() {
	isClickable = true; 

	if (turn < 10 && isClickable) {
		isClickable = false; 

		moleNumber = document.getElementById(randomHole().toString()); // 문자열 연결 사용
		moleNumber.src = '/assets/img/event/점프콜리.png';
		moleActive(moleNumber);
		moleNumber.addEventListener('click', catchMole);
		moleCatch = setTimeout(seeMole, 3000); // 함수 이름 수정
		turn++;
	} else {
		resultModal();
	}
}

function restart() {
	startBtn.addEventListener('click', startMole);
	startBtn.textContent = '다시 도전하기'; 
	startBtn.style.color = '#f2ecff';
}

var cntBox = document.querySelector('#count-mole');

function seeMole() { // 함수 이름 수정
	moleNumber.removeEventListener('click', catchMole);
	moleHide(moleNumber);
	clearTimeout(moleCatch);
	setTimeout(showingMole, 1000);
}

function catchMole() {
	
	if (!isClickable) {
		isClickable = true; // 클릭 가능한 상태로 변경
		event.target.removeEventListener('click', catchMole);
		moleNumber.src = '/assets/img/event/우는콜리.png';
		getPoint++;
		cntBox.innerHTML = getPoint;
	
		setTimeout(() => {
		  		seeMole();
			clearTimeout(moleCatch);
		   }, 300);
		 }
}



function resultModal() {
	let point = (getPoint / 10) * 100;
	if (point < 50) {
		popup('안타깝지만 '+ point +'점으로 게임 실패에요. 다시 도전해보세요!',false,restart(),'');

	} else {
		savePoint(point);
	}
}

function savePoint(point) {
	let pointsAwarded;

	if(point == 100) {
		pointsAwarded = 30;
	} else {
		pointsAwarded = 10;
	}
	 
    $.ajax({
        url: '/api/event/eventdata', 
        method: 'POST',
        data: {
            loginCust: loginCust,
            eventName: 'whackamole',
        	pointsAwarded : pointsAwarded
        },
    	beforeSend : function(xhr,set){
			let token = $("meta[name='_csrf']").attr("content");
			let header =$("meta[name='_csrf_header']").attr("content");
		
	        xhr.setRequestHeader("X-CSRF-Token", token);
			xhr.setRequestHeader(header,token);
		},
        success: function(response) {
        	if(point == 100) {
        	   	popup('축하합니다! 모든 콜리를 잡으셨네요!</br>' + point + '점으로 30포인트리가 내일 적립됩니다!',false,'','');
        	} else {
        		popup('축하합니다!</br>' + point + '점으로 10포인트리가 내일 적립됩니다!',false,'','');
        	}
        },
        error: function(xhr, status, error) {
	   		popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
            console.error('AJAX 요청 실패:', error);
        }
    });
	

}
</script>