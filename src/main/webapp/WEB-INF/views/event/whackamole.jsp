<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.title {
	color: #f2ecff;
	text-align: center;
	line-height: 1.5;
}

.main {
	position: relative;
	width: 100%;
}

.whack-a-mole {
	background-color: #028f3f;
	margin: 0 auto;
	width: 600px;
	border-radius: 20px;
}

.mole {
	float: left;
	width: 160px;
	height: 160px;
	margin: 10px;
	overflow: hidden;
	cursor: pointer;
	border-radius: 20px;
	background: no-repeat center/cover
		url('https://emojis.wiki/thumbs/emojis/hole.webp');
}

.mole>img {
	position: relative;
	bottom: -5px;
	display: block;
	width: 100%;
	opacity: 0;
	transition: 0.05s ease-out;
}

.whack-a-mole .active {
	bottom: 0;
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
	float: left;
	width: 100%;
	height: 60px;
	margin: 20px 0 0 0;
}

.btn-wrap {
	float: right;
	width: 100%;
}

.start-btn {
	width: 50%;
	height: 70px;
	font-size: 20px;
	font-weight: 900;
	margin: 20px 0 30px 0;
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
	width: 600px;
	margin: 30px auto 0 auto;
	text-align: center;
	border-radius: 20px;
}

#point-text {
	float: left;
	font-size: 24px;
	font-weight: bold;
	color: #f2ecff;
	margin: 15px 0 0 20%;
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

.ending {
	display: none;
	position: absolute;
	border-radius: 20px;
	font-size: 20px;
	text-align: center;
	top: 20%;
	left: 30%;
	width: 400px;
	height: 250px;
	margin: 0 auto;
	background: #3d3f43;
	z-index: 2;
}

#ending-box {
	margin: 50px 0 0 0;
	font-size: 30px;
	line-height: 1.8;
	color: #f2ecff;
}

#ending-box .last {
	color: #fbb666;
}

.ending-bg {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	z-index: 1;
}

.finalEnding {
	display: block;
}
</style>

<h1 class="title">
	콜리를 잡아라~!
	
</h1>
지금 콜리 여러면 누르면 점수쭉쭉올라감,,,에러해결필요
<div class="main">
	<div id="ending" class="ending">
		<p id="ending-box"></p>
	</div>
	<div id="ending-bg" class="ending-bg"></div>
	<ul id="gameContainer" class="whack-a-mole clearfix">
		<li class="mole"><img id="1" src="/assets/img/starfriends/점프콜리.png">
		</li>
		<li class="mole"><img id="2" src="/assets/img/starfriends/점프콜리.png">
		</li>
		<li class="mole"><img id="3" src="/assets/img/starfriends/점프콜리.png">
		</li>
		<li class="mole"><img id="4" src="/assets/img/starfriends/점프콜리.png">
		</li>
		<li class="mole"><img id="5" src="/assets/img/starfriends/점프콜리.png">
		</li>
		<li class="mole"><img id="6" src="/assets/img/starfriends/점프콜리.png">
		</li>
		<li class="mole"><img id="7" src="/assets/img/starfriends/점프콜리.png">
		</li>
		<li class="mole"><img id="8" src="/assets/img/starfriends/점프콜리.png">
		</li>
		<li class="mole"><img id="9" src="/assets/img/starfriends/점프콜리.png">
		</li>
	</ul>
	<div class="point-box clearfix">
		<div class="point-wrap">
			<p id="point-text">포인트 :</p>
			<p id="count-mole">0</p>
			<p id="count-mole2">/10</p>
		</div>
		<div class="btn-wrap">
			<button id="start-btn" type="button" class="start-btn">START</button>
		</div>
	</div>
</div>
<script>
let flag = 0;
let moleNumber;
let randomNum;
let preNum;
let getPoint = 0; // getPoint 변수 초기화
let turn = 0; // turn 변수 초기화
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


function bling(){

  if (flag === 0) {
    document.querySelector('h1').style.color = '#d6806e';
    flag ++;
  } else if(flag === 1) {
    document.querySelector('h1').style.color = '#fbb666';
    flag ++;
  }else if(flag === 2){
    document.querySelector('h1').style.color = '#f9f871';
    flag ++;
  }else{
    document.querySelector('h1').style.color = '#f2ecff';
    flag = 0;
  }
}

setInterval(bling, 1000);


let startBtn = document.getElementById('start-btn');

startBtn.addEventListener('click', startMole);

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
	
	if (turn < 10) {
		moleNumber = document.getElementById(randomHole().toString()); // 문자열 연결 사용
		moleNumber.src = '/assets/img/starfriends/점프콜리.png';
		moleActive(moleNumber);
		moleNumber.addEventListener('click', catchMole);
		moleCatch = setTimeout(seeMole, 3000); // 함수 이름 수정
		turn++;
	} else {
		modalEvent();
		startBtn.addEventListener('click', startMole);
		startBtn.textContent = 'PRESS AGAIN';
		startBtn.style.color = '#f2ecff';
	}
}

var cntBox = document.querySelector('#count-mole');

function seeMole() { // 함수 이름 수정
	moleNumber.removeEventListener('click', catchMole);
	moleHide(moleNumber);
	clearTimeout(moleCatch);
	setTimeout(showingMole, 1000);
}

function catchMole() {
	//console.log('잡았따'+moleNumber);
	moleNumber.src = '/assets/img/starfriends/우는콜리.png';
	getPoint++;
	cntBox.innerHTML = getPoint;
	
	setTimeout(() => {
    // 1초 후에 다시 원래의 이미지로 변경
   		seeMole();
		clearTimeout(moleCatch);
    }, 300);
}

var endingBtn = document.querySelector('#ending-bg');
var finalEnding = "finalEnding";

endingBtn.addEventListener('click', hideModal);

function modalEvent() {
	let point = (getPoint / 10) * 100;
	if (point <= 70) {
		ending.children[0].innerHTML = "<span>GAME OVER </span></br>YOUR SCORE IS&nbsp;&nbsp;<span class='last'>" + point + '</span>!';
	} else {
		ending.children[0].innerHTML = "<span>YOU WIN</span></br>YOUR SCORE IS&nbsp;&nbsp;<span class='last'>" + point + '</span>!';
	}
	ending.classList.add(finalEnding);
	endingBtn.classList.add(finalEnding);
}
function hideModal() {
	ending.classList.remove(finalEnding);
	endingBtn.classList.remove(finalEnding);
}

</script>