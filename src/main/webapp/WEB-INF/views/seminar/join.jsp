<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.tab-content {
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

.grayBtn{
	background-color: #E6E6E6 !important;
	cursor: default !important;

}
</style>
<script>
$(document).ready(function(){
	let currentTabIndex = 1;
   	console.log(currentTabIndex);
   });
</script>
<section class="py-8">
	<div class="container">
		<div class="row justify-content-center">

			<div id="joinBox"
				class="col-12 col-md-10 col-lg-8 col-xl-6 row text-center">


				<div style="display: block;" class="tab-content" id="tab1">
					<!-- 세미나 정보 확인 탭 내용 -->
					<h2>세미나 정보 확인</h2>
					<p>${seminar.title}</p>
					<p>${seminar.ddate}</p>
					<p>${seminar.rewardCoin}</p>
				</div>

				<div class="tab-content" id="tab2">
					<!-- 개인정보 이용동의 탭 내용 -->
					<h2>개인정보 이용동의</h2>
					<p>
						<strong>1. 개인 정보 수집 목적</strong>
					</p>
					<p>당사는 이 세미나 신청을 위해 아래의 개인 정보를 수집하고자 합니다.</p>
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
						<li>세미나 참가 신청 및 관리</li>
						<li>세미나 안내 및 업데이트 제공</li>
						<li>세미나 관련 서비스 제공 및 운영</li>
					</ul>

					<p>
						<strong>3. 개인 정보 보유 기간</strong>
					</p>
					<p>수집한 개인 정보는 세미나 종료 후 최대 [보유기간]까지 보관됩니다. 보유 기간 이후에는 해당 정보를 즉시
						파기합니다.</p>

					<p>
						<strong>4. 개인 정보의 제공 및 위탁</strong>
					</p>
					<p>당사는 수집한 개인 정보를 본 목적 외에 다른 용도로 제공하지 않으며, 제3자에게 제공하거나 외부에 위탁하지
						않습니다.</p>

					<p>
						<strong>5. 개인 정보의 동의 거부</strong>
					</p>
					<p>개인 정보의 수집 및 이용에 대한 동의는 세미나 참가 신청을 위해 필요한 사항입니다. 동의를 거부하실 경우
						세미나 참가 신청이 제한될 수 있습니다.</p>

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

					<div class="button-container">
						<button id="agreeBtn">동의합니다</button>
					</div>
				</div>

				<div class="tab-content" id="tab3">
					<!-- 결제 탭 내용 -->
					<h2>결제</h2>
					<div class="button-container">
						<button>스타코인으로 결제하기</button>
					</div>
				</div>


				<div style="display: flex;">
					<button id="prevBtn" class="grayBtn"  style="width: 50%;" onclick="openPrevTab()">이전으로</button>
					<button id="nextBtn" style="width: 50%;" onclick="openNextTab()">다음으로</button>
				</div>
			</div>
		</div>
	</div>
</section>
<script>

	let currentTabIndex = 1;
	const tabContents = document.querySelectorAll('.tab-content');
	const prevBtn = document.getElementById('prevBtn'); 
	const nextBtn = document.getElementById('nextBtn'); 
	
	function openNextTab() {
		if (currentTabIndex < tabContents.length) {
			tabContents[currentTabIndex - 1].style.display = 'none'; // 현재 탭 숨김
			currentTabIndex += 1;
			tabContents[currentTabIndex - 1].style.display = 'block'; // 다음 탭 표시

		}
		if (currentTabIndex === tabContents.length) {
			nextBtn.classList.add('grayBtn');
			
		}else{
			nextBtn.classList.remove ('grayBtn');
			prevBtn.classList.remove('grayBtn');
			
		}
		
		if (currentTabIndex === 2 ) {
			popup('개인정보 이용동의에 동의해주세요.', false, "", "");
			return;		
			
		}

	}

	function openPrevTab() {
		const tabContents = document.querySelectorAll('.tab-content');
		const prevBtn = document.getElementById('prevBtn'); 
		const nextBtn = document.getElementById('nextBtn'); 

		if (currentTabIndex > 1) {
			tabContents[currentTabIndex - 1].style.display = 'none'; // 현재 탭 숨김
			currentTabIndex -= 1;
			tabContents[currentTabIndex - 1].style.display = 'block'; // 이전 탭 표시
		}
		
		if (currentTabIndex === 1) {
			prevBtn.classList.add('grayBtn');
			
		}else{
			nextBtn.classList.remove ('grayBtn');
			
		}
				
	 
	}
</script>