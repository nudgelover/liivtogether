<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

#calTitle {
	font-size: large; 
	font-weight: 800;

}

td {
	width: 5rem;
	height: 5rem;
}

.Calendar {
	text-align: center;
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
		buildCalendar();
	} 

	let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
	let today = new Date(); // 페이지를 로드한 날짜를 저장
	today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화
	let clicked = false;
	
	
	const testData = [
	    {"id": 1, "user-id": "tested", "username": "jinhee", "year": 2023, "month": 8, "day": 10},
	    {"id": 2, "user-id": "tested", "username": "jinhee", "year": 2023, "month": 8, "day": 20},
	    {"id": 3, "user-id": "tested", "username": "jinhee", "year": 2023, "month": 8, "day": 22}
	];

	let attendDays = [];
	testData.forEach(item => {
	    attendDays.push(item.day);
	});

	console.log(attendDays);
	
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

			let nowColumn = nowRow.insertCell(); // 새 열을 추가하고
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
					console.log('출석')
					newDIV.innerHTML = '<img src="/assets/img/starfriends/컬러도장.png">';
				}
					nowColumn.className = "pastDay";
			
			} else if (nowDay.getFullYear() == today.getFullYear()
					&& nowDay.getMonth() == today.getMonth()
					&& nowDay.getDate() == today.getDate()) { // 오늘인 경우           
				newDIV.innerHTML = '<img class="attend-animation"  src="/assets/img/starfriends/출석도장.png">';
				nowColumn.onclick = function() {
				   if (!clicked) {
			            popup('출석완료되었습니다! 10포인트가 지급 되었습니다.', false, '', '');
			            newDIV.innerHTML = '<img src="/assets/img/starfriends/컬러도장.png">';
			            clicked = true;
			        } else {
			            popup('이미 출석되었습니다. 내일 다시 만나요 ~!', false, '', '');
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
</script>
<div id="calTitle" style="display: flex; justify-content: center;">
	<span id="calYear"></span> 년  <span style="margin-left: 10px;" id="calMonth"></span> 월
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
