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

#wishtabl {
	color: #ff6f61;
}

#wishtab2, #wishtab3, #wishtab4, #wishtab5 {
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
	width: 60%;
	display: flex;
	flex-direction: column;
	margin-left: 20px;
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
<script>
$(document).ready(function() {
	popup('해당 페이지는 준비 중입니다. 내년 1월에 만나요~!',false,'','')
});


	function showTab(wishtab) {
		// Hide all content
		document.getElementById('donationContent').style.display = 'none';
		document.getElementById('volunteeringContent').style.display = 'none';
		document.getElementById('seminarContent').style.display = 'none';
		document.getElementById('esgContent').style.display = 'none';
		document.getElementById('wishtab1').style.color = '#424242';
		document.getElementById('wishtab2').style.color = '#424242';
		document.getElementById('wishtab3').style.color = '#424242';
		document.getElementById('wishtab4').style.color = '#424242';


		// Show the selected wishtab's content
		switch (wishtab) {
		case 'donation':
			document.getElementById('donationContent').style.display = 'block';
			document.getElementById('wishtab1').style.color = '#ff6f61';
			break;
		case 'volunteering':
			document.getElementById('volunteeringContent').style.display = 'block';
			document.getElementById('wishtab2').style.color = '#ff6f61';
			break;
		case 'seminar':
			document.getElementById('seminarContent').style.display = 'block';
			document.getElementById('wishtab3').style.color = '#ff6f61';
			break;
		case 'esg':
			document.getElementById('esgContent').style.display = 'block';
			document.getElementById('wishtab4').style.color = '#ff6f61';
			break;
		}
	}
</script>


<div class="container  mt-5">
	<div class="row">
		<div class="col-12 col-lg-3">

			<div class="mypage-side">
				<div class="user-picbox">
					<div class="avatar-container">
						<div class="avatar avatar-xl">
							<img src="/uimg/${logincust.img}" alt="custImg"
								class="avatar-img rounded-circle">
						</div>
						<div class="edit-icon">
							<i style="font-size: 10px;" class="fa fa-pencil"></i>
						</div>
					</div>

					<div class="user-namebox">
						<span class="user-name">${logincust.custName}님</span> <span
							class="user-grade">🌱새싹회원</span>

					</div>
				</div>

			</div>

		</div>
		<div class="col-lg-9">
			<div class="row">
				<h2>
					내가 찜한 <img style="width: 50px;"
						src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
					목록
				</h2>
				<div class="titlelist col-12">
					<a id="wishtab1" href="#" onclick="showTab('donation')">기부</a> <a
						id="wishtab2" href="#" onclick="showTab('volunteering')">봉사</a> <a
						id="wishtab3" href="#" onclick="showTab('seminar')">세미나</a> <a
						id="wishtab4" href="#" onclick="showTab('esg')">ESG#</a> 
				</div>
				<div style="padding: 1rem;">
					<div id="donationContent" class="col-12 col-lg-9">

						<div class="card">
							<div class="heart-icon">
								<i class="fa-solid fa-heart red"></i>
							</div>
							<img
								src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
							<div class="detail">
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
							<div class="detail">
								<span>200%달성</span> <span>사랑의 연탄기부</span> <span>마감 5일
									전이에요 </span>
							</div>

						</div>



					</div>
					<div id="volunteeringContent" class="col-12 col-lg-9">



						<div class="card">
							<div class="heart-icon">
								<i class="fa-solid fa-heart red"></i>
							</div>
							<img
								src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
							<div class="detail">
								<span>5/10명 참가</span> <span>사랑의 연탄봉사</span> <span><img
									style="width: 20px;"
									src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
									5개</span> <span>마감 5일 전이에요. </span>
							</div>

						</div>
						<div class="card">
							<div class="heart-icon">
								<i class="fa-solid fa-heart red"></i>
							</div>
							<img
								src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
							<div class="detail">
								<span>5/10명 참가</span> <span>사랑의 연탄봉사</span> <span><img
									style="width: 20px;"
									src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
									5개</span> <span>마감 5일 전이에요. </span>
							</div>

						</div>
						<div class="card">
							<div class="heart-icon">
								<i class="fa-solid fa-heart red"></i>
							</div>
							<img
								src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
							<div class="detail">
								<span>5/10명 참가</span> <span>사랑의 연탄봉사</span> <span><img
									style="width: 20px;"
									src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
									5개 </span><span>마감 5일 전이에요 </span>
							</div>

						</div>
					</div>
					<div id="seminarContent" class="col-12 col-lg-9">
						<div class="card">
							<div class="heart-icon">
								<i class="fa-solid fa-heart red"></i>
							</div>
							<img
								src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
							<div class="detail">
								<span>5/10명 참가</span> <span>사랑의 세미나</span> <span><img
									style="width: 20px;"
									src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
									5개 </span> <span>마감 5일 전이에요. </span>
							</div>

						</div>
						<div class="card">
							<div class="heart-icon">
								<i class="fa-solid fa-heart red"></i>
							</div>
							<img
								src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
							<div class="detail">
								<span>5/10명 참가</span> <span>사랑의 세미나</span> <span><img
									style="width: 20px;"
									src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
									5개 </span> <span>마감 5일 전이에요 </span>
							</div>

						</div>
					</div>
					<div id="esgContent" class="col-12 col-lg-9">
						<div class="card">
							<div class="heart-icon">
								<i class="fa-solid fa-heart red"></i>
							</div>
							<img
								src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg">
							<div class="detail">
								<span>200%달성</span> <span>사랑의 에코백</span> <span><img
									style="width: 20px;"
									src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
									5개 </span> <span>마감 5일 전이에요. </span>
							</div>

						</div>

					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>