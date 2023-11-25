<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>

#welcome {
  background-image: url(assets/img/main/center.png);
}

@media (max-width: 1250px) {
  #welcome {
    background-image: url(assets/img/main/centersmall.png);
  }
}

.main-popup {
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 9999;
	opacity: 0;
	transition: opacity 0.3s ease-in-out; /*팝업 바깥 회색 배경화면이 천천이 사라짐*/
}

.main-popup.active {
	opacity: 1;
	transition: opacity 0.3s ease-in-out; /*팝업 바깥 회색 배경화면이 천천이 표출*/
}

.main-popup-content {
	position: absolute;
	bottom: -100%; /* 초기에는 아래로 숨김 */
	left: 0;
	width: 100%;
	background-color: snow;
	padding: 30px 30px 20px 30px;
	border-radius: 25px 25px 0 0;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	text-align: center;
	transform: translateY(100%); /* 초기에는 아래로 숨김 */
	transition: transform 0.3s ease-in-out;
}

.main-popup.active .main-popup-content {
	bottom: 0;
	transform: translateY(0); /* 팝업이 나타날 때 위로 올라오는 효과 */
	transition: transform 0.3s ease-in-out;
}

.main-popup.remove .main-popup-content {
	bottom: 0;
	transform: translateY(100%); /* 팝업이 내려갈 때 아래로 숨기기효과 */
	transition: transform 0.3s ease-in-out;
}

#mainBanner button {
	color: white;
	border: none;
	margin: 15px 0;
	background-color: darkorange;
	padding: 15px;
	width: 100%;
	border-radius: 25px;
}

@media ( min-width : 768px) {
	#mainBanner button {
		width: 50%;
	}
}

#mainBanner p {
	color: #767676;
	cursor: pointer;
	margin-bottom: 10px !important;
	font-size: small;
}

#mainBanner img {
	width: 7rem;
	margin: 30px;
	border-radius: 10px;
}

.font-italic {
	font-weight: 200 !important;
	color: lightslategray;
	font-style: italic;
}

.card-img-top{
	padding: 10%;
}
</style>
<script>
	$(document).ready(function() {
		openNoticePopup();
		registerFinishPopup();
		
	});

	function fnBannerclose(param) {
		const popup = document.getElementById('mainBanner');
		if (param == "stop") {
			//오늘 하루 그만보기 
			setCookieMainNoticePopup("mainbanner", "1");
			//popup.style.display = 'none';
			closePopup()
		} else {
			//popup.style.display = 'none';
			closePopup()
		}

	}

	function setCookieMainNoticePopup(name, value) {
		var date = new Date();
		console.log(date)

		date.setDate(date.getDate() + 1);
		date.setHours(0, 0, 0, 0);

		document.cookie = name + '=' + value + ';expires=' + date.toUTCString()
				+ ';path=/';
		console.log(date); // Tue Aug 22 2023 00:00:00:00 찍힘
		console.log(document.cookie + 'document.cookie'); // XSRF-TOKEN=영문-영문-영문 쭉 나열 ; 

	}

	function openNoticePopup() {
		var isTodayX = "";
		isTodayX = getCookie('mainbanner');

		if (isEmpty(isTodayX)) {
			console.log('광고 o')
			setNoticePopupSwiper();
		} else {
			console.log('광고 x')
			const mainBanner = document.getElementById('mainBanner'); // 이게 없어두 되어야 되는데,,이게 없으면 이상하게 휴대폰에서 오늘하루 보지않기 누르면 터치가 아무것도 안먹음
			mainBanner.style.display = 'none';// 이게 없어두 되어야 되는데,,,?
		}
	}

	function setNoticePopupSwiper() {
		console.log('광고팝업');

		setTimeout(() => {
			openMainPopup();
		}, 300);

	}

	//회원가입 완료 시 alert창 표출 및 로그인 안내
	function registerFinishPopup() {
		//let previousPage = document.referrer; //이전 페이지
		let currentURL = window.location.href;
		console.log(currentURL);
		if (currentURL.includes('registerimpl')) {
			alert("회원가입을 환영합니다. 로그인하여 이용해주세요.");
		}
	}
</script>


<!-- WELCOME -->
<section class="py-14" id="welcome" data-jarallax data-speed=".8">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-7 col-lg-5 text-white">

				<!-- Heading -->
				<h1 class="display-4">
					I Liiv You,<br>Liiv Together
				</h1>

				<!-- Text -->
				<p class="mb-8 fs-lg">더 나은 세상을 위해 KB국민은행이 함께합니다.</p>

				<!-- Button -->
				<a href="/donation" class="btn btn-primary">작은 손길 더하기</a>

			</div>
		</div>
	</div>
</section>

<!-- DESCRIPTION -->
<section class="py-12 bg-light">
	<div class="container">
		<div class="row">
			<div class="col-12 col-lg-3">

				<!-- Heading -->
				<h3 class="mb-10 text-center text-lg-start">리브투게더 </br> 이것만 알 면 돼요!</h3>

			</div>
			<div class="col-12 col-md">

				<!-- Card -->
				<div class="card mb-7 mb-md-0 shadow">

					<!-- Image -->
					<img src="assets/img/starfriends/cuteeeee.gif" alt="..."
						class="card-img-top">

					<!-- Body -->
					<div class="card-body text-center">
						<img class="me-4" style="width: 30px;" src="https://cdn-icons-png.flaticon.com/512/1692/1692181.png" alt="...">
						<strong>기부와 봉사로 세상의 온도를 높여주세요.</strong>
					</div>

				</div>

			</div>
			<div class="col-12 col-md">

				<!-- Card -->
				<div class="card mb-7 mb-md-0 shadow">

					<!-- Image -->
					<img src="assets/img/starfriends/money.gif" alt="..."
						class="card-img-top">

					<!-- Body -->
					<div class="card-body text-center">
						<img class="me-4" style="width: 30px;" src="assets/img/payment/starcoin.png" alt="...">
						<strong>보상으로 스타코인을 드려요!</strong>
					</div>

				</div>

			</div>
			<div class="col-12 col-md">

				<!-- Card -->
				<div class="card shadow">

					<!-- Image -->
						<img src="assets/img/starfriends/gift.gif" alt="..."
						class="card-img-top">

					<!-- Body -->
					<div class="card-body text-center">
						<img class="me-4" style="width: 25px;" src="https://cdn-icons-png.flaticon.com/512/1139/1139982.png" alt="...">
						<strong>세미나 참여, ESG 상품으로 교환해요!</strong>
					</div>

				</div>

			</div>
		</div>
	</div>
</section>

<!-- IMAGE -->
<!-- <section data-jarallax data-speed=".8"
	style="min-height: 580px; background-image: url(assets/img/covers/cover-20.jpg);"></section> -->

<!-- REVIEWS -->
<section class="py-12 border-bottom" id="reviews">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-8">

				<!-- Heading -->
				<h2 class="mb-12 text-center">
					고객후기<br> <span style="color: sandybrown; font-size: x-large;">더 나은 세상을 함께 만들어 나갑니다</span>
				</h2>

			</div>
		</div>


		<div class="row">
			<c:forEach var="item" items="${reviewcontent}" varStatus="loop">
				<c:if test="${loop.index < 6}">
					<div class="col-12 col-md-6 col-lg-4">

						<!-- Card -->
						<div class="card card-lg mb-11">
							<div class="card-body text-center bg-light">

								<!-- Avatar -->
								<img src="/uimg/${item.custImg}" alt="..."
									class="img-fluid rounded-circle mb-7 mt-n11"
									style="max-width: 100px;">

								<!-- Text -->
								<blockquote class="blockquote mb-0">
									<c:if test="${item.topicBig == 'D'}">	[기부] ${item.title}</c:if>
									<c:if test="${item.topicBig == 'V'}">	[봉사] ${item.title}</c:if>
									<c:if test="${item.topicBig == 'S'}">	[세미나] ${item.title}</c:if>

									<c:set var="substringReviewValue"
										value="${item.reviewContents}" />
									<!-- Text -->
									<div class="fs-lg font-italic">"${fn:substring(substringReviewValue,0,120)}..."</div>

									<!-- Rating -->
									<div class="rating fs-xs text-warning mb-2"
										data-value="${item.reviewScore}">
										<div class="rating-item">
											<i class="fas fa-star"></i>
										</div>
										<div class="rating-item">
											<i class="fas fa-star"></i>
										</div>
										<div class="rating-item">
											<i class="fas fa-star"></i>
										</div>
										<div class="rating-item">
											<i class="fas fa-star"></i>
										</div>
										<div class="rating-item">
											<i class="fas fa-star"></i>
										</div>
									</div>

									<!-- 아이디 마스킹 처리 start -->
									<c:set var="prefix" value="${fn:substring(item.custId, 0, 3)}" />
									<c:set var="suffix"
										value="${fn:substring(item.custId, 3, fn:length(item.custId))}" />
									<c:set var="maskedSuffix" value="" />

									<c:forEach var="i" begin="0" end="${fn:length(suffix)-1}">
										<c:set var="maskedSuffix" value="${maskedSuffix}*" />
									</c:forEach>
									<c:set var="maskedCustId" value="${prefix}${maskedSuffix}" />


									<!-- 아이디 마스킹 처리 end -->

									<c:set var="substringrdate" value="${item.rdate}" />
									<!-- Footer -->
									<footer class="blockquote-footer">${fn:substring(maskedCustId,0,10)},
										${fn:substring(substringrdate,0,10)} </footer>

								</blockquote>

							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>


			<div class="row">
				<div class="col-12">

					<!-- Link -->
					<div class="text-center">
						<a class="link-underline" href="/review">더 많은 후기 보러가기</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>


<!-- OUR PRODUCTS -->
<section class="pt-12 pb-10" id="products">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">

				<!-- Preheading -->
				<h6 class="heading-xxs mb-3 text-gray-400">ESG SHOP</h6>

				<!-- Heading -->
				<h2 class="mb-10">따뜻한 마음, 착한 소비로 되받아가세요.</h2>

				<!-- Slider -->
				<div class="flickity-buttons-lg px-lg-12 mt-n3"
					data-flickity='{"prevNextButtons": true}'>

					<!-- Item -->
					<div class="col-12 col-md-4 pt-3 pb-7 px-4" >
						<div class="card card-lg shadow-hover" style="align-items: center;">

							<!-- Circle -->
							<div class="card-circle card-circle-end">
								<strong class="fs-xs">인기최고</strong> <span class="h6 mb-0">HOT</span>
							</div>

							<!-- Image -->
						<img src="assets/img/starfriends/텀블러1.png" style="max-width: 10rem;" alt="..."
						class="card-img-top">

							<!-- Body -->
						<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									[스타프렌즈 키키 에코텀블러] <br> <img style="width: 20px;" src="/assets/img/payment/starcoin.png">10 스타코인
								</p>

								<!-- Text -->
								<p class="text-muted"> <span style="font-weight: bold; color: orange;">리브투게더 단독 시즌 상품</span></br>추운 겨울, 따듯하게 품어줄게요! 당신의 핫아 지키미</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary">상품 보러 가기 </a>

							</div>

						</div>
					</div>

					<!-- Item -->
					<div class="col-12 col-md-4 pt-3 pb-7 px-4" >
						<div class="card card-lg shadow-hover" style="align-items: center;">

							<!-- Image -->
							<img src="assets/img/starfriends/텀블러2.png" style="max-width: 10rem;" alt="..."
							class="card-img-top">

								<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									[스타프렌즈 아거 에코텀블러] <br> <img style="width: 20px;" src="/assets/img/payment/starcoin.png">10 스타코인
								</p>

								<!-- Text -->
								<p class="text-muted"> <span style="font-weight: bold; color: orange;">리브투게더 단독 시즌 상품</span></br>추운 겨울, 따듯하게 품어줄게요! 당신의 핫아 지키미</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary">상품 보러 가기 </a>

							</div>

						</div>
					</div>

					<!-- Item -->
					<div class="col-12 col-md-4 pt-3 pb-7 px-4" >
						<div class="card card-lg shadow-hover" style="align-items: center;">

							<!-- Image -->
							<img src="assets/img/starfriends/텀블러3.png" style="max-width: 10rem;" alt="..."
							class="card-img-top">

							<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									[스타프렌즈 비비 에코텀블러] <br> <img style="width: 20px;" src="/assets/img/payment/starcoin.png">10 스타코인
								</p>

								<!-- Text -->
								<p class="text-muted"> <span style="font-weight: bold; color: orange;">리브투게더 단독 시즌 상품</span></br>추운 겨울, 따듯하게 품어줄게요! 당신의 핫아 지키미</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary">상품 보러 가기 </a>

							</div>

						</div>
					</div>

					<!-- Item -->
					<div class="col-12 col-md-4 pt-3 pb-7 px-4">
						<div class="card card-lg shadow-hover" style="align-items: center;">

							<!-- Image -->
							<img src="assets/img/starfriends/텀블러4.png" style="max-width: 10rem;" alt="..."
								class="card-img-top">

							<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									[스타프렌즈 콜리 에코텀블러] <br> <img style="width: 20px;" src="/assets/img/payment/starcoin.png">10 스타코인
								</p>

								<!-- Text -->
								<p class="text-muted"> <span style="font-weight: bold; color: orange;">리브투게더 단독 시즌 상품</span></br>추운 겨울, 따듯하게 품어줄게요! 당신의 핫아 지키미</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary">상품 보러 가기 </a>

							</div>
						</div>
					</div>
					<div class="col-12 col-md-4 pt-3 pb-7 px-4">
						<div class="card card-lg shadow-hover" style="align-items: center;">

							<!-- Image -->
							<img src="assets/img/starfriends/텀블러5.png" style="max-width: 10rem;" alt="..."
								class="card-img-top">

							<!-- Body -->
							<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									[스타프렌즈 라무 에코텀블러] <br> <img style="width: 20px;" src="/assets/img/payment/starcoin.png">10 스타코인
								</p>

								<!-- Text -->
								<p class="text-muted"> <span style="font-weight: bold; color: orange;">리브투게더 단독 시즌 상품</span></br>추운 겨울, 따듯하게 품어줄게요! 당신의 핫아 지키미</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary">상품 보러 가기 </a>

							</div>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</section>

<!-- ABOUT -->
<section class="py-12" id="about" data-jarallax data-speed=".8"
	style="background-image: url(assets/img/event/cardgame.png);">
	<div class="container">
		<div class="row justify-content-end">
			<div class="col-12 col-md-7 col-lg-5">

				<!-- Card -->
				<div class="card">
					<div class="card-body p-10">

						<!-- Heading -->
						<h4 class="mb-6">이벤트 참여하고</br>포인트리를 모아보세요!</h4>

						<!-- Text -->
						<p class="text-muted"><span style="font-style: italic; color: #424242">다양한 이벤트가 여러분을 기다리고 있습니다! </span>
						매일매일 참여가능한 <span style="font-weight: bold; color: orange;">출석체크, 카드맞추기게임, 콜리를 잡아라</span> 등 다양한 이벤트들이 상시대기 중 이니,
						포인트리를 신나고 즐겁게 모아보세요!😆 심지어 스타프렌즈와 함께하는  <span style="font-weight: bold; color: hotpink;">예쁜 리브네컷</span>도 만들 수 있다구요!
						</p>

						<!-- Link -->
						<a class="link-underline" href="/event"> 이벤트 참여하러가기 </a>

					</div>
				</div>

			</div>
		</div>
	</div>
</section>

<!-- DETAILS -->
<section class="py-12">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-4 text-center">

				<!-- Card -->
				<div class="card mb-7 mb-md-0">
					<div class="card-body">

						<!-- Icon -->
						<img class="img-fluid mb-7"  style="width: 100%; max-width: 10rem; max-height: 10rem;"  src="assets/img/event/점프콜리.png"
							alt="...">

						<!-- Heading -->
						<h6 class="mb-4">콜리를 잡아라</h6>

						<!-- Text -->
						<p class="mb-0 text-muted">날아가려는 콜리를 잡아주세요! 콜리를 잡으면 하루 최대 30포인트리!
						</p>

					</div>
				</div>

			</div>
			<div class="col-12 col-md-4 text-center">

				<!-- Card -->
				<div class="card">
					<div class="card-body mb-7 mb-md-0">

						<!-- Icon -->
						<img class="img-fluid mb-7" style="width: 100%; max-width: 10rem; max-height: 10rem;"  src="assets/img/event/flower.gif"
							alt="꽃도장비비">

						<!-- Heading -->
						<h6 class="mb-4">출석체크</h6>

						<!-- Text -->
						<p class="mb-0 text-muted"> 출석체크하고 귀여운 꽃비비도장을 획득하세요! 매일 매일 10포인트리 지급해드립니다!
						</p>

					</div>
				</div>

			</div>
			<div class="col-12 col-md-4 text-center">

				<!-- Card -->
				<div class="card">
					<div class="card-body">

						<!-- Icon -->
						<img class="img-fluid mb-7"  style="width: 100%; max-width: 10rem; max-height: 10rem;"  src="assets/img/event/은빈네컷.png"
							alt="...">

						<!-- Heading -->
						<h6 class="mb-4">인생네컷</h6>

						<!-- Text -->
						<p class="mb-0 text-muted"> 예쁜 립투네컷 만들고 인스타그램에 올려주시면 추첨을 통해 선물을 드려요~!
						</p>

					</div>
				</div>

			</div>
		</div>
	</div>
</section>



<div id="mainBanner" class="main-popup">
	<div class="main-popup-content">
		<span class="main-popup-close" onclick="fnBannerclose('')"></span> <img
			src="https://cdn.psnews.co.kr/news/photo/202208/2013078_56856_1222.png">
		<h5>리브투게더 앱출시!🥳</h5>
		<p>리브투게더 앱은 더욱 다양한 혜택과 고객 맞춤 서비스를 제공합니다.</p>
		<button onclick="goToApp()">앱 이용하기</button>
		<p style="color: coral;" onClick="fnBannerclose('');">괜찮아요. 모바일웹으로
			볼게요.</p>
		<p style="text-align: left; margin-top: 20px !important;"
			onClick="fnBannerclose('stop');">오늘 그만보기</p>
	</div>
</div>





<script>

	//팝업 열기 함수
	function openMainPopup() {
	    document.getElementById('mainBanner').classList.add('active');
	}
	
	// 팝업 닫기 함수
	function closePopup() {
	    document.getElementById('mainBanner').classList.remove('active');
	    document.getElementById('mainBanner').classList.add('remove');
		setTimeout(() => {
			const popup = document.getElementById('mainBanner');
			popup.style.display = 'none';
		}, 500);
	}



	function goToApp() {
		const redirectUrl = "/";
		const userAgent = navigator.userAgent;
		console.log("userAgent:" + userAgent);

		let typeOS;

		if (userAgent.match(/iPhone|iPad|iPod/i)) {
			typeOS = "ios";
		} else if (userAgent.match(/Android/i)) {
			typeOS = "android";
		} else {
			typeOS = "others";
		}

		console.log(typeOS + "typeOS");

		if (typeOS == "android") {
			setTimeout(
					function() {
						if (document.hasFocus()) {
							location.href = "https://play.google.com/store/apps/details?id=com.kbstar.liivmobile";
						}
					}, 1000);
		}
		// ios
		else if (typeOS == "ios") {
			setTimeout(
					function() {
						if (document.hasFocus()) {
							location.href = "https://itunes.apple.com/app/id1659980349?mt=8";
						}
					}, 1000);

		}else{
			setTimeout(
					function() {
						if (document.hasFocus()) {
							location.href = "https://play.google.com/store/apps/details?id=com.kbstar.liivmobile";
						}
					}, 1000);

			
		}
	}
	
</script>