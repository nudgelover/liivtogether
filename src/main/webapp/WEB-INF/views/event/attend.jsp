<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

#calTitle {
    font-size: 1.4rem;
    font-weight: 800;
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    max-width: 35rem;
    margin: 0 auto; /* 좌우 마진을 auto로 설정하여 수평 중앙 정렬 */
    padding: 20px 20px 0 20px;
}


td {
	width: 5rem;
	height: 5rem;
}

.Calendar {
	text-align: center;
	margin-bottom: 2rem;
}

td div img {
	width: 3.5rem;
}

.pastDay {
	color: lightgray;
}

@keyframes scaleAnimation {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.2); }
}

.attend-animation {
	cursor: pointer;
    animation: scaleAnimation 2s ease-in-out infinite;
}

/*
@keyframes scaleAnimation {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.2); }
}

.attend-animation {
    animation: scaleAnimation 2s ease-in-out infinite;
}



*/
</style>
<script>
	window.onload = function() {

		var loginCust = document.getElementById('loginCustId').value;
		var cntThisMonth = document.getElementById('cntThisMonth');
	  

	    if (loginCust) {
	    	checkTodayDo();
	        getCntThisMonth();
	        //displayAttendance();
	    } else {
	    	buildCalendar();
	    }

	} 
	
	
	let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
	let today = new Date(); // 페이지를 로드한 날짜를 저장
	today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화
	
	let clicked = false; //출석도장을 눌렀는지 아닌 지 확인!

	let attendDays = []; //출석체크한 날짜 담는 배열
	
	let nowColumn; // 새 열 추가

	function checkTodayDo() {
		let loginCust = document.getElementById('loginCustId').value;
		let koreaToday = new Date(); 
		koreaToday.setHours(koreaToday.getHours() + 9);
		console.log('오늘 출석체크확인')
		
		// AJAX 호출
	    $.ajax({
	        url: '/api/event/check-today-do',
	        method: 'GET',
	        data: {
	            loginCust: loginCust,
	            eventName: 'attend',
	            today: koreaToday.toISOString().split('T')[0] //2023-09-01 이러식으로 오늘의 날짜가 들어가야함
	        },
	        success: function(response) {
	        		console.log('오늘 출석회수'+response);
	        		document.getElementById("toDayOrNot").value = response;
	        		//출석을 했는지를 먼저 불러와야, 에러가 안남
	        		displayAttendance();

	        },
	        error: function(xhr, status, error) {
	            console.error('AJAX 요청 실패:', error);
	            popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
	        }
	    });
		
	}

	function getCntThisMonth() {
		let loginCust = document.getElementById('loginCustId').value;
		console.log('이번달 출석체크')
		const offset = new Date().getTimezoneOffset() * 60000;
		//한국시간 9시간 차이나서!
	    var thisMonth = new Date(Date.now() - offset).toISOString().slice(0, 7) + '-01';
		
		// AJAX 호출
	    $.ajax({
	        url: '/api/event/thismonth',
	        method: 'GET',
	        data: {
	            loginCust: loginCust,
	            eventName: 'attend',
	            thisMonth: thisMonth
	        },
	        success: function(response) {
	        		console.log('이번달 출석회수'+response);
	        		cntThisMonth.innerText = response;

	        },
	        error: function(xhr, status, error) {
	            console.error('AJAX 요청 실패:', error);
	            popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
	        }
	    });
		
	}

	
	
	
	
	// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	function buildCalendar() {

		let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
		let lastDate = new Date(nowMonth.getFullYear(),
				nowMonth.getMonth() + 1, 0); // 이번달 마지막날

		let tbody_Calendar = document.querySelector(".Calendar > tbody");
		document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
		document.getElementById("calMonth").innerText = leftPad(nowMonth
				.getMonth() + 1); // 월 숫자 갱신

	
		let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가           

		for (let j = 0; j < firstDate.getDay(); j++) { // 이번달 1일의 요일만큼
			let nowColumn = nowRow.insertCell(); // 열 추가
		}

		for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay
				.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

			nowColumn = nowRow.insertCell(); // 새 열을 추가하고
		   	let newDIV = document.createElement("div");
		    newDIV.innerText = leftPad(nowDay.getDate());
		    nowColumn.append(newDIV);
			//nowColumn.innerText = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력

			if (nowDay.getDay() == 0) { // 일요일인 경우 글자색 빨강으로
				nowColumn.style.color = "#DC143C";
			}
			if (nowDay.getDay() == 6) { // 토요일인 경우 글자색 파랑으로 하고
				nowColumn.style.color = "#0000CD";
				nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
			}

			if (nowDay < today) { // 지난날인 경우
				if(attendDays.includes(nowDay.getDate())){
					newDIV.innerHTML = '<img src="/assets/img/event/컬러도장.png">';
				}
					nowColumn.className = "pastDay";
			
			} else if (nowDay.getFullYear() == today.getFullYear()
					&& nowDay.getMonth() == today.getMonth()
					&& nowDay.getDate() == today.getDate()) { // 오늘인 경우           
						
				let todayDo = document.getElementById("toDayOrNot").value
		 		if(todayDo> 0){
		 			newDIV.innerHTML = '<img src="/assets/img/event/컬러도장.png">';
		 		}else{
					newDIV.innerHTML = '<img class="attend-animation"  src="/assets/img/event/출석도장.png">';
		 		}
		
				
				nowColumn.onclick = function() {
					var loginCust = document.getElementById('loginCustId').value;
					if(!loginCust){
						 popup('로그인 후 이용하실 수 있습니다.<br> 로그인하러 가시겠습니까?', true , goToLogin, '');
					}else{
					 	if (!clicked) {
					 		if(todayDo == 0){
					 			addAttendDate();
				            	newDIV.innerHTML = '<img src="/assets/img/event/컬러도장.png">';
					 		}
					 		
			        	} else {
				            popup('이미 출석되었습니다. 내일 다시 만나요 ~!', false, '', '');
				        }
					}
				}
			} 
		}
	}

	// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	function leftPad(value) {
		if (value < 10) {
			value = "0" + value;
			return value;
		}
		return value;
	}
	
	function displayAttendance() {
	   
		let loginCust = document.getElementById('loginCustId').value;
	    const offset = new Date().getTimezoneOffset() * 60000;
		//한국시간 9시간 차이나서!
	    
	    var thisMonth = new Date(Date.now() - offset).toISOString().slice(0, 7) + '-01';
	    
	    // AJAX 호출
	    $.ajax({
	        url: '/api/event/eventdata',
	        method: 'GET',
	        data: {
	            loginCust: loginCust,
	            eventName: 'attend',
	            thisMonth: thisMonth
	        },
	        success: function(response) {
	        	
	        	 try {
	                 let attendList = JSON.parse(response); // JSON 문자열을 객체로 변환
	              

	                 attendList.forEach(function(event) {
	                     console.log(event.day + 'event.day');
	                     attendDays.push(event.day);
	                 });

	                 console.log(attendDays);
	                 //날짜 집어넣은 다음에..!! 
	             	buildCalendar();
	                 
	             } catch (error) {
	                 console.error('JSON 파싱 오류:', error);
	                 popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
	             }
	           
	        },
	        error: function(xhr, status, error) {
	            console.error('AJAX 요청 실패:', error);
	            popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
	        }
	    });
	}


	function addAttendDate() {
	    var loginCust = document.getElementById('loginCustId').value;

        
	    // AJAX 호출
	    
	    $.ajax({
	        url: '/api/event/eventdata', 
	        method: 'POST',
	        data: {
	            loginCust: loginCust,
	            eventName: 'attend',
            	pointsAwarded : 10
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
	            console.log('저장완료')
	            popup('출석완료되었습니다! 내일 10포인트가 지급될 예정입니다.', false, '', '');

	         	clicked = true;
	        },
	        error: function(xhr, status, error) {
		   		popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
	            console.error('AJAX 요청 실패:', error);
	        }
	    });
	}
</script>
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<input type="hidden" id="toDayOrNot" value="">

<div style="text-align: center;">
	<div style="width: 100%; background-color: #DBE9ED;">
		<img style="width:100%; max-width:35rem; height: 10rem;'" src="/assets/img/event/attendEvent.png">
	</div>

</div>


<div id="calTitle">
	<span style="display: none;" id="calYear"></span>
	<span><span id="calMonth"></span>월 출석체크</span>
	
	<span style="font-size:1rem; font-weight: 200;">출석횟수 <span id="cntThisMonth">0</span>회</span>
	
</div>
<div style="display: flex; justify-content: center;" class="col-12"
	id="CalBox">
	<table class="Calendar">
		<thead>
			<tr>
				<td>일</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				<td>토</td>
			</tr>
		</thead>

		<tbody>
		</tbody>
	</table>

</div>
