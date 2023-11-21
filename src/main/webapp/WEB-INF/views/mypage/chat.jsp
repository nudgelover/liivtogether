<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.mypage-side, .user-picbox, .user-namebox {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 10px;
}

@media ( max-width : 987px) {
	.user-picbox {
		flex-direction: row;
	}
}

.avatar-container {
	margin: 10px;
	cursor: pointer;
}

.user-grade {
	font-size: small;
	font-weight: 200;
	color: gray;
}

.avatar-container {
	position: relative;
	display: inline-block;
}

.edit-icon {
	position: absolute;
	bottom: 0;
	right: 0;
	background-color: #ffffff;
	border: 2px solid #ffffff;
	border-radius: 50%; /* 동그라미 모양을 위해 border-radius를 50%로 설정 */
	width: 25px; /* 아이콘 표시 영역의 너비와 높이 설정 */
	height: 25px;
	display: flex; /* 가운데 정렬을 위해 Flexbox 사용 */
	justify-content: center;
	align-items: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.titlelist a {
	padding: 10px 20px;
	background-color: #f9fafb;
	border-radius: 10px;
}

#tabl {
	color: #ff6f61;
}

#tab2, #tab3, #tab4, #tab5 {
	color: #424242;
}

.titlelist a:hover {
	color: #ff6f61 !important;
}

#donationContent {
	display: block;
}

#volunteeringContent, #seminarContent, #esgContent, #allContent {
	display: none;
}

#donationContent, #volunteeringContent, #seminarContent, #esgContent,
	#allContent {
	margin: 1rem;
	padding: 1rem;
	background: #f9fafb;
	border-radius: 10px;
}

.heart-icon {
	top: 10px;
	right: 10px;
	z-index: 1;
	cursor: pointer;
	position: absolute;
}

.white {
	color: lightgray;
	font-size: 16px;
}

.red {
	color: red;
	font-size: 16px;
}

.card {
	margin-bottom: 1rem;
	display: flex;
	flex-direction: row;
	padding: 1rem;
	background: white;
}

.card img {
	width: 40%;
	border-radius: 10px;
}

.detail {
	margin-left: 10px;
}

.detail span:first-child {
	font-size: larger;
	font-weight: 800;
	color: #00c4c4;
}

.detail span:nth-child(2) {
	margin: 2rem 0 0 0;
	font-weight: 800;
	font-size: large;
}
</style>

<div class="container  mt-5">
	<div class="row">
		<div class="col-12 col-lg-3">

			<div class="mypage-side">
				<div class="user-picbox">
					<div class="avatar-container">
						<div class="avatar avatar-xl">
							<img src="/uimg/${logincust.img}" alt="..."
								class="avatar-img rounded-circle">
						</div>
						<div class="edit-icon">
							<i style="font-size: 10px;" class="fa fa-pencil"></i>
						</div>
					</div>

					<div class="user-namebox">
						<span class="user-name">김진희님</span> <span class="user-grade">🌱새싹회원</span>

					</div>
				</div>

			</div>

		</div>
		<div class=".titlelist a col-lg-9">
			<div class="row">
				<h2>
					내가 입장 가능한 채팅방들이에요.
				</h2>

				<div class="titlelist col-12">
					<a id="tab1" href="#" onclick="showTab('donation')">진행중</a> <a
						id="tab2" href="#" onclick="showTab('volunteering')">종료</a>
								<button data-tab href="#tab1">활동</button>
		<button data-tab href="#tab2">배송</button>
				</div>
				<div id="tab1" class="col-12 col-lg-9 tab-content">

					<div class="card">
						<div class="heart-icon">
							<i class="fa-solid fa-heart red"></i>
						</div>
						<img
							src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
						<div class="detail row">
							<span>200%달성</span> <span>사랑의 연탄기부</span> <span>마감 5일
								전이에요. </span>
						</div>

					</div>
					<div class="card">
						<div class="heart-icon">
							<i class="fa-solid fa-heart red"></i>
						</div>
						<img
							src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
						<div class="detail row">
							<span>200%달성</span> <span>사랑의 연탄기부</span> <span>마감 5일 전이에요
							</span>
						</div>

					</div>



				</div>
				<div id="tab2"  style="display: none;" class="col-12 col-lg-9 tab-content">
					<div class="card">
						<div class="heart-icon">
							<i class="fa-solid fa-heart red"></i>
						</div>
						<img
							src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
						<div class="detail row">
							<span>10명 모집 / 5명 참가</span> <span>사랑의 연탄봉사</span>
							<span><img style="width: 20px;"
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span>
							 <span>마감 5일
								전이에요. </span>
						</div>

					</div>
					<div class="card">
						<div class="heart-icon">
							<i class="fa-solid fa-heart red"></i>
						</div>
						<img
							src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
						<div class="detail row">
							<span>10명 모집 / 5명 참가</span> <span>사랑의 연탄봉사</span>
							<span><img style="width: 20px;"
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span>
							 <span>마감 5일
								전이에요. </span>
						</div>

					</div>
					<div class="card">
						<div class="heart-icon">
							<i class="fa-solid fa-heart red"></i>
						</div>
						<img
							src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
						<div class="detail row">
							<span>10명 모집 / 5명 참가</span> <span>사랑의 연탄봉사</span> 
							<span><img style="width: 20px;"
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개 </span><span>마감 5일 전이에요
							</span>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
const buttons = document.querySelectorAll('[data-tab]');
const tabContents = document.querySelectorAll('.tab-content');

// 버튼 클릭 시 탭 전환
buttons.forEach(button => {
    button.addEventListener('click', () => {
        // 모든 탭 내용을 숨깁니다.
        tabContents.forEach(tab => {
            tab.style.display = 'none';
        });

        // 클릭한 버튼의 data-tab 속성 값을 가져옵니다.
        const targetTabId = button.getAttribute('href').substring(1);
        const targetTab = document.getElementById(targetTabId);

        // 선택한 탭 내용을 표시합니다.
        targetTab.style.display = 'block';
    });
});
</script>