<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.join-tab-content {
	display: none;
}

#joinBox {
	background-color: #FBFBFB;
	padding: 3rem 1rem;
	border-radius: 10px;
	border: 1px solid #F7F7F8;
}

#joinBox button {
	width: 100%;
	padding: 1rem;
	border-radius: 5px;
	font-weight: 700;
	color: white;
	height: 3.5rem;
	border: none;
	background-color: #FFBF00;
	margin: 5px;
}

#timeSlotsContainer button {
	width: 30%;
	padding: 1rem;
	border-radius: 5px;
	font-weight: 700;
	color: black;
	height: 3.5rem;
	border: none;
	background-color: #E6E6E6;
	margin: 5px;
}

#tab1 p {
	margin: 10px;
	font-size: large;
}

#tab2 strong {
	font-weight: 800;
}

.grayBtn {
	background-color: #E6E6E6 !important;
	cursor: default !important;
}
.timeSelectBtn {
	background-color: #b0aeae !important;
	cursor: default !important;
}

.starcoin {
    width: 10rem;
    animation: rotate 2s infinite linear; /* 회전 애니메이션 적용 */
}

@keyframes rotate {
    from {
        transform: rotate(0deg); /* 시작 각도 */
    }
    to {
        transform: rotate(360deg); /* 종료 각도 (한 바퀴 회전) */
    }
}

.running-img{
  width: 130px;

}

/* 스피너의 배경 레이어 */
.loading-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000; /* 적절한 z-index 값으로 조정 */
}

/* 로딩 스피너 컨테이너 */
.loading-spinner {
	/* 로딩 스피너의 스타일 설정 */
	background-color: rgba(0, 0, 0, 0.5);
	width: 50px;
	height: 50px;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
    flex-direction: column;
}

/* 로딩 텍스트 스타일 */
.loading-spinner div {
	color: white;
}



</style>
<script>
$(document).ready(function() {
	let currentTabIndex = 1;

	var volunteerDateStr = "${volunteer.ddate}"; // 날짜 문자열
	var volunteerDate = new Date(volunteerDateStr);
	var days = [ '일', '월', '화', '수', '목', '금', '토' ];
	var volunteerDayOfWeek = days[volunteerDate.getDay()]; // 0~6을 요일로 매핑
	var formattedDate = volunteerDateStr + ' / '+ volunteerDayOfWeek + '요일';

	$("#volunteer-date").html(formattedDate);
	
	generateTimeSlots();
});
</script> 
<section class="py-8">
	<div class="container">
		<div class="row justify-content-center">

			<div id="joinBox"
				class="col-12 col-md-10 col-lg-8 col-xl-6 row text-center">


				<div style="display: block;" class="join-tab-content" id="tab1">
					<h3>💡신청하시는 봉사의 정보입니다.</h3>
					<img style="width: 90%" src="/uimg/${volunteer.imageMain}">
					<p style="font-size: 1.5rem;">${volunteer.title}</p>
					<p><br><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/10691/10691802.png">
						봉사일자 : <span id="volunteer-date"></span>
					</p>
					<br>
					<p>
						${volunteer.comment}<br><br>
						${volunteer.content}						
					</p>
				</div>
				<br>
				<div class="join-tab-content" id="tab2">
					<!-- 개인정보 이용동의 탭 내용 -->
					<h2>개인정보 이용동의 [필수]</h2>
					<div class="mt-6" style="text-align: left;">
						<p>
							<strong>1. 개인 정보 수집 목적</strong>
						</p>
						<p>당사는 이 봉사 신청을 위해 아래의 개인 정보를 수집하고자 합니다.</p>
						<ul>
							<li>성명</li>
							<li>연락처 정보 (전화번호, 이메일 주소 등)</li>
							<li>기타 신청 관련 정보</li>
						</ul>

						<p>
							<strong>2. 개인 정보 수집 및 이용 목적</strong>
						</p>
						<p>당사는 수집한 개인 정보를 다음과 같은 목적으로 이용합니다.</p>
						<ul>
							<li>봉사 참가 신청 및 관리</li>
							<li>봉사 안내 및 업데이트 제공</li>
							<li>봉사 관련 서비스 제공 및 운영</li>
						</ul>

						<p>
							<strong>3. 개인 정보 보유 기간</strong>
						</p>
						<p>수집한 개인 정보는 봉사 종료 후 최대 5년까지 보관됩니다. 보유 기간 이후에는 해당 정보를 즉시
							파기합니다.</p>

						<p>
							<strong>4. 개인 정보의 제공 및 위탁</strong>
						</p>
						<p>당사는 수집한 개인 정보를 본 목적 외에 다른 용도로 제공하지 않으며, 제3자에게 제공하거나 외부에
							위탁하지 않습니다.</p>

						<p>
							<strong>5. 개인 정보의 동의 거부</strong>
						</p>
						<p>개인 정보의 수집 및 이용에 대한 동의는 봉사 참가 신청을 위해 필요한 사항입니다. 동의를 거부하실 경우
							봉사 참가 신청이 제한될 수 있습니다.</p>

						<p>
							<strong>6. 개인 정보 열람 및 수정</strong>
						</p>
						<p>이용자는 언제든지 본인의 개인 정보에 대한 열람 및 수정을 요청할 수 있습니다. 열람 및 수정을 위해서는
							당사로 연락해 주시기 바랍니다.</p>

						<p>
							<strong>7. 개인 정보의 파기</strong>
						</p>
						<p>개인 정보의 수집 및 이용 목적 달성 시 즉시 파기되며, 법적인 규정에 따라 보관해야 할 필요가 있는
							경우에는 해당 기간 종료 후 파기됩니다.</p>
					
					</div>
					<div class="button-container">
						<button id="agreeBtn" >동의합니다</button>
					</div>
				</div>

				<div class="join-tab-content" id="tab3">					
					봉사활동 가능시간을 선택해 주세요.
					<h2>신청</h2>
					  <div id="timeSlotsContainer"></div>	
					  
					<div id="cointest" class="button-container">
						<button id="payBtn">봉사 신청하기</button>
					</div>
				</div>


				<div style="display: flex;">
					<button id="prevBtn" class="grayBtn" style="width: 50%;"
						onclick="openPrevTab()">이전으로</button>
					<button id="nextBtn" style="width: 50%;" onclick="openNextTab()">다음으로</button>
				</div>
			</div>
		</div>
	</div>
<input type="hidden" id="cust_id" value="${logincust.custId}">
<input type="hidden" id="topic_big" value="V">
<input type="hidden" id="contents_id" value="${volunteer.voluId}">
<input id="target_in" type="hidden" value="${volunteer.targetIn}">
<input type="hidden" id="agreeornot" value="0">
<input type="hidden" id="mount" value="${volunteer.rewardCoin}">
<input type="hidden" id="starcoin" value="0">
</section>
<script>

	let currentTabIndex = 1;
	let joinTabContents = document.querySelectorAll('.join-tab-content');
	const prevBtn = document.getElementById('prevBtn');
	const nextBtn = document.getElementById('nextBtn');

	let selectedTime = '';
	
	function openPrevTab() {

		if (currentTabIndex > 1) {
			joinTabContents[currentTabIndex - 1].style.display = 'none'; // 현재 탭 숨김
			currentTabIndex -= 1;
			joinTabContents[currentTabIndex - 1].style.display = 'block'; // 이전 탭 표시
		}

		if (currentTabIndex === 1) {
			prevBtn.classList.add('grayBtn');

		} else {
			nextBtn.classList.remove('grayBtn');

		}

	}
	
	function openNextTab() {
		
		if (currentTabIndex < joinTabContents.length) {
			joinTabContents[currentTabIndex - 1].style.display = 'none'; // 현재 탭 숨김
			currentTabIndex += 1;
			joinTabContents[currentTabIndex - 1].style.display = 'block'; // 다음 탭 표시

		}
		if (currentTabIndex === joinTabContents.length) {
			nextBtn.classList.add('grayBtn');

		} else {
			nextBtn.classList.remove('grayBtn');
			prevBtn.classList.remove('grayBtn');

		}

		if (currentTabIndex === 3) {
			if (agreeornot.value === '0') { // 이 부분 수정
				popup('개인정보 이용동의에 동의해주세요.', false, goToTab2, '');
			}
		}
	}



	function goToTab2() {
		console.log('goToTab2');
		currentTabIndex = 2;

		// 현재 탭 숨김
		joinTabContents[currentTabIndex].style.display = 'none';
		// 이전탭 표시
		joinTabContents[currentTabIndex - 1].style.display = 'block';
		// 다음 버튼 활성화
		nextBtn.classList.remove('grayBtn');
	}
	
	
	var agreeBtn = document.getElementById('agreeBtn');
	var agreeornot = document.getElementById('agreeornot');

	agreeBtn.addEventListener('click', function() {
		agreeornot.value = '1';
		popup('개인정보이용동의에 동의하셨습니다.', false, '', '');
		agreeBtn.classList.add('grayBtn');
	});

	var payBtn = document.getElementById('payBtn');

	// 이벤트 리스너 함수를 저장해둘 변수
	var payBtnClickListener = function() {
	    var starCoin = ${volunteer.rewardCoin};
	    var text = "<span style='font-size: 1.4rem;'> 봉사활동 후 " + starCoin + " 스타코인이 적립됩니다.</span></br> 봉사를 정말로 신청하시겠습니까?";
	    popup(text, true, goToPay, '');
	};

	// 클릭 이벤트 리스너 추가
	payBtn.addEventListener('click', payBtnClickListener);
      	

	
	
	function generateTimeSlots() {
        const container = document.getElementById('timeSlotsContainer');
        
        for (let hour = 6; hour < 18; hour++) {
            // Create a button for each hour
            const timeBtn = document.createElement('button');
            timeBtn.textContent = hour + ":00 - " + (hour + 1) + ":00";
            
            timeBtn.classList.add('time-slot-button');
            
            // Add a click event listener (you can customize this part)
            timeBtn.addEventListener('click', function() {
                if (selectedTime == '') {
                    // 최초 선택된 경우
                    selectedTime = hour + ":00 - " + (hour + 1) + ":00";
                    console.log("선택한 시간:", selectedTime);
                    timeBtn.classList.add('timeSelectBtn');
                } else if (selectedTime === hour + ":00 - " + (hour + 1) + ":00") {
                    // 이미 선택된 버튼을 다시 클릭한 경우
                    alert("이미 선택된 시간입니다.");
                } else {
                    // 다른 버튼을 선택한 경우
                    // 다른 버튼들의 토글을 해제
                    document.querySelectorAll('.time-slot-button').forEach(btn => {
                        btn.classList.remove('timeSelectBtn');
                    });
                    // 현재 선택된 시간 갱신
                    selectedTime = hour + ":00 - " + (hour + 1) + ":00";
                    console.log("Selected Time:", selectedTime);
                    timeBtn.classList.add('timeSelectBtn');
                }
            });

            // Append the button to the container
            container.appendChild(timeBtn);
        }
    }
	
	async function checkCoin(loginCustId, mount) {
		
		console.log(loginCustId+mount)
	    try {
	        const response = await $.ajax({
	            type: "GET",
	            url: "/point/pre-check",
	            data: {
	                pointcoin: "COIN",
	                custId: loginCustId
	            }
	        });

	        const myStarCoin = parseInt(response);
			console.log(myStarCoin)
			
				
	        
	        return myStarCoin;
	    } catch (error) {
	        console.error("Error checking coin:", error);
	        throw error;
	    }
	}


	
	async function goToPay(contentsId, loginCustId, mount) {
		// "결제중입니다" 로딩바를 표시하는 로직
		showLoadingSpinner();
		
	    var contentsId = $('#contents_id').val();
	    var loginCustId = $('#cust_id').val();
	    var mount = $('#mount').val();
		var topicBig = $('#topic_big').val();
		var targetIn = $('#target_in').val();
		var agree = $('#agreeornot').val();
		var memo = selectedTime;
		
	    try {
	        const myStarCoin = await checkCoin(loginCustId, mount);

  			if(myStarCoin == -99999){
  				var payBtn = document.getElementById('payBtn');
	    		payBtn.classList.add('grayBtn'); // 버튼 스타일 변경
				payBtn.removeEventListener('click', payBtnClickListener);
					
				setTimeout(function() {
					popup('일시적인 오류가 발생했습니다. 로그인 정상 여부를 확인해주세요', false, '', '');
					hideLoadingSpinner(); // 로딩 스피너 숨기기
				}, 2000);
	            return;
	        	
	        }
	        if (myStarCoin < mount) {
	            
	            console.log("스타코인 부족으로 결제 불가능");
	            
	            var payBtn = document.getElementById('payBtn');
	    		payBtn.classList.add('grayBtn'); // 버튼 스타일 변경
				payBtn.removeEventListener('click', payBtnClickListener);
					
				setTimeout(function() {
					popup('스타코인이 부족하여 결제가 불가능합니다.', false, '', '');
					hideLoadingSpinner(); // 로딩 스피너 숨기기
				}, 2000);
	            return;
	        }

	        const response = await $.ajax({
	            type: "POST",
	            url: "/apply/process",
	            data: {
	                contentsId: contentsId,
	                //voluId: contentsId,
	                custId: loginCustId,
	                memo: memo,
	                mount: mount,
	                pointcoin: "COIN",
	                gplace: "V",
	                topicBig: topicBig,
	                targetIn: targetIn,
	                agree: agree
	            },
	            beforeSend: function (xhr, set) {
	                let token = $("meta[name='_csrf']").attr("content");
	                let header = $("meta[name='_csrf_header']").attr("content");

	                xhr.setRequestHeader("X-CSRF-Token", token);
	                xhr.setRequestHeader(header, token);
	            }
	        });

	        if (response === "success") {
	            console.log("신청완료");
	            
	        	var payBtn = document.getElementById('payBtn');
	    		payBtn.classList.add('grayBtn'); // 버튼 스타일 변경
				payBtn.removeEventListener('click', payBtnClickListener);
					
				setTimeout(function() {
					goToJoinComplete(loginCustId,contentsId);
				}, 2000);
	        } else {
	            console.error("Error in payment.");
	            setTimeout(function() {
					popup('일시적인 오류가 발생했습니다. 다시 시도해주세요', false, '','');
					hideLoadingSpinner(); // 로딩 스피너 숨기기
				}, 2000);
	        }
	    } catch (error) {
	        console.error("Error in payment:", error);
	        setTimeout(function() {
				popup('일시적인 오류가 발생했습니다. 다시 시도해주세요', false, '','');
				hideLoadingSpinner(); // 로딩 스피너 숨기기
			}, 2000);
	    }
	}


	function showLoadingSpinner() {
		// 배경을 어둡게 만들기 위한 레이어
		const overlay = document.createElement('div');
		overlay.className = 'loading-overlay';

		// 로딩 스피너의 스타일을 설정하거나 이미지를 추가할 수 있습니다.
		const spinner = document.createElement('div');
		spinner.className = 'loading-spinner';
		spinner.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';

		// 로딩 스피너의 크기를 조절하거나 스타일을 추가할 수 있습니다.
		spinner.style.width = '300px';
		spinner.style.height = '300px';

		// 화면 중앙에 로딩 스피너를 배치하기 위한 스타일 추가
		spinner.style.position = 'fixed';
		spinner.style.top = '50%';
		spinner.style.left = '50%';
		spinner.style.transform = 'translate(-50%, -50%)';

		
	 	// 이미지 추가
		const image = document.createElement('img');
		image.src = 'https://media0.giphy.com/media/vOOjguTG3XUKNxfd7R/giphy.gif'; 
		image.classList.add('running-img');
		spinner.appendChild(image);
		
		// "로딩 중입니다" 텍스트 추가
		const loadingText = document.createElement('div');
		loadingText.textContent = '신청 중입니다. 잠시만 기다려주세요.';
		loadingText.style.color = 'white';

		// 로딩 스피너를 컨테이너에 추가합니다.
		spinner.appendChild(loadingText);

		// 레이어에 로딩 스피너를 추가합니다.
		overlay.appendChild(spinner);

		// 레이어를 페이지에 추가합니다.
		document.body.appendChild(overlay);
	}

	function hideLoadingSpinner() {
		// 레이어와 컨테이너를 제거합니다.
		const overlay = document.querySelector('.loading-overlay');
		if (overlay) {
			overlay.parentNode.removeChild(overlay);
		}

	}

	function goToJoinComplete(custId, contentsId) {
	    const url = serviceServer+'/volunteer/join-complete?custId=' + custId + '&contentsId=' + contentsId;
	    window.location.href = url;
	}


</script>