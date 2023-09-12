<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.popup {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
}

.popup-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.popup-close {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 20px;
    cursor: pointer;
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
			 popup.style.display = 'none';
		}else{
		    popup.style.display = 'none';
			
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
			//여기서 noticePopYn은 스크립트 최상단에서 let noticePopYn = "${noticePopYn}"; 백엔드에서 값가져온거
			setNoticePopupSwiper();
		} else {
			console.log('광고 x')

		}
	}

	function setNoticePopupSwiper() {
		console.log('광고팝업');
		//나중에 swiper.js로 예쁘게 만드러주기
		const popup = document.getElementById('mainBanner');
		popup.style.display = 'block';

	}
	
	//회원가입 완료 시 alert창 표출 및 로그인 안내
	function registerFinishPopup(){
		//let previousPage = document.referrer; //이전 페이지
		let currentURL = window.location.href;
		console.log(currentURL);
		if(currentURL.includes('registerimpl')){
			alert("회원가입을 환영합니다. 로그인하여 이용해주세요.");
		}
	}
	
</script>
<!-- WELCOME -->
<section class="py-14" id="welcome" data-jarallax data-speed=".8"
	style="background-image: url(assets/img/covers/cover-18.jpg);">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-7 col-lg-5 text-white">

				<!-- Heading -->
				<h1 class="display-4">I Liiv You,<br>Liiv Together</h1>

				<!-- Text -->
				<p class="mb-8 fs-lg">더 나은 세상을 위해 KB국민은행이 함께합니다.</p>

				<!-- Button -->
				<a href="#!" class="btn btn-primary">작은 손길 더하기</a>

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
				<h3 class="mb-10 text-center text-lg-start">How is Contact
					Lenses different?</h3>

			</div>
			<div class="col-12 col-md">

				<!-- Card -->
				<div class="card mb-7 mb-md-0 shadow">

					<!-- Image -->
					<img src="assets/img/products/product-91.jpg" alt="..."
						class="card-img-top">

					<!-- Body -->
					<div class="card-body text-center">
						<img class="me-4" src="/assets/img/icons/icon-hands.svg" alt="...">
						<strong>기부와 봉사로 세상의 온도를 높여주세요.</strong>
					</div>

				</div>

			</div>
			<div class="col-12 col-md">

				<!-- Card -->
				<div class="card mb-7 mb-md-0 shadow">

					<!-- Image -->
					<img src="assets/img/products/product-92.jpg" alt="..."
						class="card-img-top">

					<!-- Body -->
					<div class="card-body text-center">
						<img class="me-4" src="assets/img/icons/icon-wrap.svg" alt="...">
						<strong>보상으로 스타코인을 드려요!</strong>
					</div>

				</div>

			</div>
			<div class="col-12 col-md">

				<!-- Card -->
				<div class="card shadow">

					<!-- Image -->
					<img src="assets/img/products/product-93.jpg" alt="..."
						class="card-img-top">

					<!-- Body -->
					<div class="card-body text-center">
						<img class="me-4" src="assets/img/icons/icon-bottle.svg" alt="...">
						<strong>세미나 참여, ESG 상품으로 교환해요!</strong>
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
				<h6 class="heading-xxs mb-3 text-gray-400">Our products</h6>

				<!-- Heading -->
				<h2 class="mb-10">Get your Perfect Lenses</h2>

				<!-- Slider -->
				<div class="flickity-buttons-lg px-lg-12 mt-n3"
					data-flickity='{"prevNextButtons": true}'>

					<!-- Item -->
					<div class="col-12 col-md-4 pt-3 pb-7 px-4">
						<div class="card card-lg shadow-hover">

							<!-- Circle -->
							<div class="card-circle card-circle-end">
								<strong class="fs-xs">save</strong> <span class="h6 mb-0">30%</span>
							</div>

							<!-- Image -->
							<img src="assets/img/products/product-94.jpg" alt="..."
								class="card-img-top">

							<!-- Body -->
							<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									Blue contact Lenses <br> <span
										class="fs-xs text-gray-350 text-decoration-line-through">$40.00</span>
									<span class="text-primary">$28.00</span>
								</p>

								<!-- Text -->
								<p class="text-muted">Good male give subdue set one, image
									that his beginning.</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary"> Add to
									Cart </a>

							</div>

						</div>
					</div>

					<!-- Item -->
					<div class="col-12 col-md-4 pt-3 pb-7 px-4">
						<div class="card card-lg shadow-hover">

							<!-- Image -->
							<img src="assets/img/products/product-95.jpg" alt="..."
								class="card-img-top">

							<!-- Body -->
							<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									Green contact Lenses <br> $40.00
								</p>

								<!-- Text -->
								<p class="text-muted">Heaven one kind created god, sea
									beginning yielding.</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary"> Add to
									Cart </a>

							</div>

						</div>
					</div>

					<!-- Item -->
					<div class="col-12 col-md-4 pt-3 pb-7 px-4">
						<div class="card card-lg shadow-hover">

							<!-- Image -->
							<img src="assets/img/products/product-96.jpg" alt="..."
								class="card-img-top">

							<!-- Body -->
							<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									Red contact Lenses <br> $40.00
								</p>

								<!-- Text -->
								<p class="text-muted">Called fruitful fill also, creature
									moved Morning saying and our.</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary"> Add to
									Cart </a>

							</div>

						</div>
					</div>

					<!-- Item -->
					<div class="col-12 col-md-4 pt-3 pb-7 px-4">
						<div class="card card-lg shadow-hover">

							<!-- Image -->
							<img src="assets/img/products/product-129.jpg" alt="..."
								class="card-img-top">

							<!-- Body -->
							<div class="card-body mt-n6 text-center">

								<!-- Heading -->
								<p class="mb-3 fw-bold">
									Yellow contact Lenses <br> $40.00
								</p>

								<!-- Text -->
								<p class="text-muted">That isn't, dominion saw meat beast
									lights sea him signs.</p>

								<!-- Button -->
								<a href="#!" class="btn btn-sm btn-outline-primary"> Add to
									Cart </a>

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
	style="background-image: url(assets/img/covers/cover-19.jpg);">
	<div class="container">
		<div class="row justify-content-end">
			<div class="col-12 col-md-7 col-lg-5">

				<!-- Card -->
				<div class="card">
					<div class="card-body p-10">

						<!-- Heading -->
						<h3 class="mb-6">About Lenses</h3>

						<!-- Text -->
						<p class="text-muted">Fifth they're greater. You'll own years
							bring set in said their. Bearing you created. Dominion earth very
							doesn't good our also gathering can't very. Evening which that
							waters meat form grass of is them own herb creeping from.</p>

						<!-- Link -->
						<a class="link-underline" href="#!"> Discover more </a>

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
						<img class="img-fluid mb-7" src="assets/img/icons/icon-eye.svg"
							alt="...">

						<!-- Heading -->
						<h6 class="mb-4">For eyes of any Color</h6>

						<!-- Text -->
						<p class="mb-0 text-muted">I over whose fruitful together fish
							likeness moved our. Give made firmament female set divided make.
						</p>

					</div>
				</div>

			</div>
			<div class="col-12 col-md-4 text-center">

				<!-- Card -->
				<div class="card">
					<div class="card-body mb-7 mb-md-0">

						<!-- Icon -->
						<img class="img-fluid mb-7" src="assets/img/icons/icon-drops.svg"
							alt="...">

						<!-- Heading -->
						<h6 class="mb-4">Convenient Packaging</h6>

						<!-- Text -->
						<p class="mb-0 text-muted">I over whose fruitful together fish
							likeness moved our. Give made firmament female set divided make.
						</p>

					</div>
				</div>

			</div>
			<div class="col-12 col-md-4 text-center">

				<!-- Card -->
				<div class="card">
					<div class="card-body">

						<!-- Icon -->
						<img class="img-fluid mb-7" src="assets/img/icons/icon-pack.svg"
							alt="...">

						<!-- Heading -->
						<h6 class="mb-4">Airtight Materials</h6>

						<!-- Text -->
						<p class="mb-0 text-muted">I over whose fruitful together fish
							likeness moved our. Give made firmament female set divided make.
						</p>

					</div>
				</div>

			</div>
		</div>
	</div>
</section>

<!-- INFO-->
<section class="bg-light">
	<div class="container">
		<div class="row gx-0 justify-content-between">
			<div class="col-12 col-md-5 py-12">

				<!-- Heading -->
				<h3 class="mb-7">We use advanced technology in the development
					of contact lenses.</h3>

				<!-- Text -->
				<p class="mb-7 text-muted">Male his our upon seed had said
					wherein their i great wherein under you'll deep first multiply.
					Fish waters they're herb shall saying.</p>

				<!-- Button -->
				<a href="#!" class="btn btn-primary"> Get Sample Pack </a>

			</div>
			<div class="col-12 col-md-6 mt-12 mb-n12 bg-cover"
				style="background-image: url(assets/img/products/product-97.jpg);"></div>
		</div>
	</div>
</section>

<!-- FEATURES-->
<section class="section pt-12 pt-md-15 pb-12">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">

				<!-- Preheading -->
				<h6 class="heading-xxs mb-3 text-gray-400">Our features</h6>

				<!-- Heading -->
				<h2 class="mb-10">Lenses Features</h2>

			</div>
		</div>
		<div class="row align-items-center justify-content-between">
			<div class="col-12 col-md-3 text-md-end">

				<!-- Item -->
				<div class="mb-7 mb-md-13">

					<!-- Heading -->
					<h6 class="position-relative mb-4">
						Convenient tight Box <span class="line line-end d-none d-lg-block"></span>
					</h6>

					<!-- Text -->
					<p class="mb-0 text-muted">Together days thing land fifth,
						gathered fish wherein fruit called moveth their, which good air
						gathered.</p>

				</div>

				<!-- Item -->
				<div class="mb-7 mb-md-0">

					<!-- Heading -->
					<h6 class="position-relative mb-4">
						Monthly contact Lenses <span
							class="line line-end d-none d-lg-block"></span>
					</h6>

					<!-- Text -->
					<p class="mb-0 text-muted">There face that be dry morning to
						his saying, them is sixth won't fly doesn't His he For there he.</p>

				</div>

			</div>
			<div class="col-12 col-md-5">

				<!-- Image -->
				<img src="assets/img/products/product-98.jpg" alt="..."
					class="img-fluid mb-7 mb-md-0">

			</div>
			<div class="col-12 col-md-3">

				<!-- Item -->
				<div class="mt-md-10 mb-7 mb-md-13">

					<!-- Heading -->
					<h6 class="position-relative mb-4">
						Daily contact Lenses <span
							class="line line-start d-none d-lg-block"></span>
					</h6>

					<!-- Text -->
					<p class="mb-0 text-muted">Together days thing land fifth,
						gathered fish wherein fruit called moveth their, which good air
						gathered.</p>

				</div>

				<!-- Item -->
				<div>

					<!-- Heading -->
					<h6 class="position-relative mb-4">
						Airtight Container <span class="line line-start d-none d-lg-block"></span>
					</h6>

					<!-- Text -->
					<p class="mb-0 text-muted">There face that be dry morning to
						his saying, them is sixth won't fly doesn't His he For there he.</p>

				</div>

			</div>
		</div>
	</div>
</section>

<!-- HOW IT WORKS -->
<section class="py-12 bg-dark bg-pattern" id="howItWorks">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Heading -->
				<h2 class="mb-10 text-center text-white">How it Works</h2>

			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-4">

				<!-- Card -->
				<div class="card bg-none mb-7 mb-md-0">

					<!-- Image -->
					<div class="card-img-top position-relative mx-auto"
						style="max-width: 120px;">

						<!-- Circle -->
						<div class="card-circle card-circle-sm card-circle-top-end">1</div>

						<!-- Image -->
						<img class="img-fluid rounded-circle"
							src="assets/img/products/product-99.jpg" alt="...">

					</div>

					<!-- Body -->
					<div class="card-body text-center">

						<!-- Heading -->
						<h6 class="mb-4 text-white">Take out the Lens from the
							container</h6>

						<!-- Text -->
						<p class="mb-0 text-gray-300">Under above saying waters saying
							wherein stars fourth made appear won't darkness fill, form rule i
							dry his god.</p>

					</div>

				</div>

			</div>
			<div class="col-12 col-md-4">

				<!-- Card -->
				<div class="card bg-none mb-7 mb-md-0">

					<!-- Image -->
					<div class="card-img-top position-relative mx-auto"
						style="max-width: 120px;">

						<!-- Circle -->
						<div class="card-circle card-circle-sm card-circle-top-end">2</div>

						<!-- Image -->
						<img class="img-fluid rounded-circle"
							src="assets/img/products/product-100.jpg" alt="...">

					</div>

					<!-- Body -->
					<div class="card-body text-center">

						<!-- Heading -->
						<h6 class="mb-4 text-white">Put the lens on a clean and dry
							finger</h6>

						<!-- Text -->
						<p class="mb-0 text-gray-300">Under above saying waters saying
							wherein stars fourth made appear won't darkness fill, form rule i
							dry his god.</p>

					</div>

				</div>

			</div>
			<div class="col-12 col-md-4">

				<!-- Card -->
				<div class="card bg-none mb-7 mb-md-0">

					<!-- Image -->
					<div class="card-img-top position-relative mx-auto"
						style="max-width: 120px;">

						<!-- Circle -->
						<div class="card-circle card-circle-sm card-circle-top-end">3</div>

						<!-- Image -->
						<img class="img-fluid rounded-circle"
							src="assets/img/products/product-101.jpg" alt="...">

					</div>

					<!-- Body -->
					<div class="card-body text-center">

						<!-- Heading -->
						<h6 class="mb-4 text-white">Look upward as you place it on
							your eye.</h6>

						<!-- Text -->
						<p class="mb-0 text-gray-300">Under above saying waters saying
							wherein stars fourth made appear won't darkness fill, form rule i
							dry his god.</p>

					</div>

				</div>

			</div>
		</div>
	</div>
</section>

<!-- INFO-->
<section class="bg-light">
	<div class="container">
		<div class="row gx-0 justify-content-between">
			<div class="col-12 col-md-6 mt-12 mb-n12 bg-cover"
				style="background-image: url(assets/img/products/product-102.jpg);"></div>
			<div class="col-12 col-md-5 py-12">

				<!-- Heading -->
				<h3 class="mb-7">Our lenses are designed for your clear and
					brilliant vision.</h3>

				<!-- Text -->
				<ul class="list-styled mb-7">
					<li class="list-styled-item"><i
						class="fe fe-check me-2 text-primary"></i> <span>Male his
							our upon seed had</span></li>
					<li class="list-styled-item"><i
						class="fe fe-check me-2 text-primary"></i> <span>Day
							together third</span></li>
					<li class="list-styled-item"><i
						class="fe fe-check me-2 text-primary"></i> <span>You're
							seed is creepeth gathered</span></li>
					<li class="list-styled-item"><i
						class="fe fe-check me-2 text-primary"></i> <span>Given
							moved it so lights</span></li>
				</ul>

				<!-- Button -->
				<a href="#!" class="btn btn-primary"> Get Sample Pack </a>

			</div>
		</div>
	</div>
</section>

<!-- BEST PICKS -->
<section class="pt-12 pt-md-15 pb-12">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8 col-xl-7 text-center">

				<!-- Preheading -->
				<h6 class="heading-xxs mb-3 text-gray-400">Before & after</h6>

				<!-- Heading -->
				<h2 class="mb-4">The best solution for Eyes of any Color</h2>

				<!-- Subheading -->
				<p class="mb-10 text-gray-500">Appear, dry there darkness
					they're seas, dry waters thing fly midst. Beast, above fly brought
					Very green.</p>

			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-12 col-lg-10">

				<!-- Card -->
				<div class="card">

					<!-- Badge -->
					<div
						class="badge bg-white text-body card-badge card-badge-start text-uppercase">
						Before</div>

					<!-- Badge -->
					<div
						class="badge bg-white text-body card-badge card-badge-end text-uppercase">
						After</div>

					<!-- Comparision -->
					<div class="img-comp">

						<!-- Back -->
						<div class="img-comp-back">
							<img src="assets/img/products/product-104.jpg" alt="..."
								class="img-comp-img">
						</div>

						<!-- Front -->
						<div class="img-comp-front">
							<img src="assets/img/products/product-103.jpg" alt="..."
								class="img-comp-img">
						</div>

						<!-- Handle -->
						<div class="img-comp-handle btn btn-sm btn-circle btn-white">
							<i class="fe fe-arrow-left"></i> <i class="fe fe-arrow-right"></i>
						</div>

						<!-- Input -->
						<input class="img-comp-input" type="range">

					</div>
				</div>

			</div>
		</div>
	</div>
</section>

<!-- PRICING -->
<section class="py-12 bg-light" id="pricing">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">

				<!-- Preheading -->
				<h6 class="heading-xxs mb-3 text-gray-400">Pricing plans</h6>

				<!-- Heading -->
				<h2 class="mb-10">Something for Everyone</h2>

			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-4">

				<!-- Card -->
				<div class="card card-lg shadow mb-7 mb-lg-0">
					<div class="card-body border-bottom text-center">

						<!-- Subheading -->
						<h5>Basic</h5>

						<!-- Heading -->
						<h2 class="mb-0 fw-bolder">
							$29.00 <span class="fs-lg fw-bold">/ month</span>
						</h2>

					</div>
					<div class="card-body">

						<!-- Text -->
						<p class="text-muted">Called life don't called darkness spirit
							abundantly so Wherein the.</p>

						<!-- List -->
						<ul class="list-styled mb-8">
							<li class="list-styled-item"><i
								class="fe fe-check me-2 text-primary"></i> Behold in creature
								likeness</li>
							<li class="list-styled-item text-muted"><i
								class="fe fe-x me-2 text-muted"></i> To hath for fly land</li>
							<li class="list-styled-item text-muted"><i
								class="fe fe-x me-2 text-muted"></i> Third under god above
								bearing</li>
						</ul>

						<!-- Button -->
						<div class="text-center">
							<a class="btn btn-outline-primary" href="#!"> Get Started Now
							</a>
						</div>

					</div>
				</div>

			</div>
			<div class="col-12 col-lg-4">

				<!-- Card -->
				<div class="card card-lg shadow mb-7 mb-lg-0">

					<!-- Badge -->
					<div
						class="badge bg-primary card-badge card-badge-start text-uppercase">
						Popular</div>

					<!-- Context -->
					<div class="card-body border-bottom text-center">

						<!-- Subheading -->
						<h5>Standart</h5>

						<!-- Heading -->
						<h2 class="mb-0 fw-bolder text-primary">
							$59.00 <span class="fs-lg fw-bold">/ month</span>
						</h2>

					</div>
					<div class="card-body">

						<!-- Text -->
						<p class="text-muted">In herb seed land divided together
							seasons night good years.</p>

						<!-- List -->
						<ul class="list-styled mb-8">
							<li class="list-styled-item"><i
								class="fe fe-check me-2 text-primary"></i> Behold in creature
								likeness</li>
							<li class="list-styled-item"><i
								class="fe fe-check me-2 text-primary"></i> To hath for fly land
							</li>
							<li class="list-styled-item text-muted"><i
								class="fe fe-x me-2 text-muted"></i> Third under god above
								bearing</li>
						</ul>

						<!-- Button -->
						<div class="text-center">
							<a class="btn btn-outline-primary" href="#!"> Get Started Now
							</a>
						</div>

					</div>

				</div>

			</div>
			<div class="col-12 col-lg-4">

				<!-- Card -->
				<div class="card card-lg shadow">
					<div class="card-body border-bottom text-center">

						<!-- Subheading -->
						<h5>Premium</h5>

						<!-- Heading -->
						<h2 class="mb-0 fw-bolder">
							$79.99 <span class="fs-lg fw-bold">/ month</span>
						</h2>

					</div>
					<div class="card-body">

						<!-- Text -->
						<p class="text-muted">Fly which shall, male replenish stars
							called i sixth without.</p>

						<!-- List -->
						<ul class="list-styled mb-8">
							<li class="list-styled-item"><i
								class="fe fe-check me-2 text-primary"></i> Behold in creature
								likeness</li>
							<li class="list-styled-item"><i
								class="fe fe-check me-2 text-primary"></i> To hath for fly land
							</li>
							<li class="list-styled-item"><i
								class="fe fe-check me-2 text-primary"></i> Third under god above
								bearing</li>
						</ul>

						<!-- Button -->
						<div class="text-center">
							<a class="btn btn-outline-primary" href="#!"> Get Started Now
							</a>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
</section>

<!-- IMAGE -->
<section data-jarallax data-speed=".8"
	style="min-height: 580px; background-image: url(assets/img/covers/cover-20.jpg);"></section>

<!-- REVIEWS -->
<section class="py-12 border-bottom" id="reviews">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-8 col-lg-6 col-xl-4">

				<!-- Heading -->
				<h2 class="mb-12 text-center">A positive Experience in many
					ways.</h2>

			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-6 col-lg-4">

				<!-- Card -->
				<div class="card card-lg mb-11">
					<div class="card-body text-center bg-light">

						<!-- Avatar -->
						<img src="assets/img/avatars/avatar-1.jpg" alt="..."
							class="img-fluid rounded-circle mb-7 mt-n11"
							style="max-width: 100px;">

						<!-- Text -->
						<blockquote class="blockquote mb-0">

							<!-- Text -->
							<p class="fs-lg fst-normal">From creepeth said moved given
								divide make multiply of him shall itself also above second
								doesn't unto created saying land herb sea midst night wherein.</p>

							<!-- Rating -->
							<div class="rating fs-xs text-warning mb-2" data-value="5">
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

							<!-- Footer -->
							<footer class="blockquote-footer"> Catherine Hicks, 21
								Jul 2019 </footer>

						</blockquote>

					</div>
				</div>

				<!-- Card -->
				<div class="card card-lg mb-11">
					<div class="card-body text-center bg-light">

						<!-- Avatar -->
						<img src="assets/img/avatars/avatar-4.jpg" alt="..."
							class="img-fluid rounded-circle mb-7 mt-n11"
							style="max-width: 100px;">

						<!-- Text -->
						<blockquote class="blockquote mb-0">

							<!-- Text -->
							<p class="fs-lg fst-normal">Creeping his under doesn't. Above
								two fourth dry open blessed our creeping, made great.</p>

							<!-- Rating -->
							<div class="rating fs-xs text-warning mb-2" data-value="5">
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

							<!-- Footer -->
							<footer class="blockquote-footer"> Jason Griffith, 05
								Jul 2019 </footer>

						</blockquote>

					</div>
				</div>

			</div>
			<div class="col-12 col-md-7 col-lg-4">

				<!-- Card -->
				<div class="card card-lg mb-11">
					<div class="card-body text-center bg-light">

						<!-- Avatar -->
						<img src="assets/img/avatars/avatar-2.jpg" alt="..."
							class="img-fluid rounded-circle mb-7 mt-n11"
							style="max-width: 100px;">

						<!-- Text -->
						<blockquote class="blockquote mb-0">

							<!-- Text -->
							<p class="fs-lg fst-normal">Gathered to were female. That dry
								our so likeness light cattle his you'll fill blessed replenish
								doesn't god night tree.</p>

							<!-- Rating -->
							<div class="rating fs-xs text-warning mb-2" data-value="5">
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

							<!-- Footer -->
							<footer class="blockquote-footer"> Daisy Turner, 18 Jul
								2019 </footer>

						</blockquote>

					</div>
				</div>

				<!-- Card -->
				<div class="card card-lg mb-11">
					<div class="card-body text-center bg-light">

						<!-- Avatar -->
						<img src="assets/img/avatars/avatar-5.jpg" alt="..."
							class="img-fluid rounded-circle mb-7 mt-n11"
							style="max-width: 100px;">

						<!-- Text -->
						<blockquote class="blockquote mb-0">

							<!-- Text -->
							<p class="fs-lg fst-normal">Yielding place upon heaven
								created sea So fly you'll had years which good herb hath moveth
								for grass. Created. Wherein, had every were, face you'll made
								from.</p>

							<!-- Rating -->
							<div class="rating fs-xs text-warning mb-2" data-value="5">
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

							<!-- Footer -->
							<footer class="blockquote-footer"> Katrina Willis, 30
								Jun 2019 </footer>

						</blockquote>

					</div>
				</div>

			</div>
			<div class="col-12 col-lg-4">
				<div class="row">
					<div class="col-12 col-md-6 col-lg-12">

						<!-- Card -->
						<div class="card card-lg mb-11">
							<div class="card-body text-center bg-light">

								<!-- Avatar -->
								<img src="assets/img/avatars/avatar-3.jpg" alt="..."
									class="img-fluid rounded-circle mb-7 mt-n11"
									style="max-width: 100px;">

								<!-- Text -->
								<blockquote class="blockquote mb-0">

									<!-- Text -->
									<p class="fs-lg fst-normal">Abundantly behold. God given
										creature she'd, greater gathering his had thing let you're
										firmament can't he sixth. Without evening. Given appear days
										signs abundantly and brought female bring.</p>

									<!-- Rating -->
									<div class="rating fs-xs text-warning mb-2" data-value="4">
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

									<!-- Footer -->
									<footer class="blockquote-footer"> Logan Edwards, 11
										Jul 2019 </footer>

								</blockquote>

							</div>
						</div>

					</div>
					<div class="col-12 col-md-6 col-lg-12">

						<!-- Card -->
						<div class="card card-lg mb-11">
							<div class="card-body text-center bg-light">

								<!-- Avatar -->
								<img src="assets/img/avatars/avatar-6.jpg" alt="..."
									class="img-fluid rounded-circle mb-7 mt-n11"
									style="max-width: 100px;">

								<!-- Text -->
								<blockquote class="blockquote mb-0">

									<!-- Text -->
									<p class="fs-lg fst-normal">Place whose a give upon seed
										Yielding don't cattle living.</p>

									<!-- Rating -->
									<div class="rating fs-xs text-warning mb-2" data-value="5">
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

									<!-- Footer -->
									<footer class="blockquote-footer"> George Sanders, 17
										Jun 2019 </footer>

								</blockquote>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">

				<!-- Link -->
				<div class="text-center">
					<a class="link-underline" href="#!">Discover more</a>
				</div>

			</div>
		</div>
	</div>
</section>

<!-- GET STARTED -->
<section class="pt-12 pb-6" id="getStarted">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">

				<!-- Heading -->
				<h2 class="mb-8">Ready to get Started? 😍</h2>

				<!-- Button -->
				<a href="#!" class="btn btn-primary mb-10"> Get Sample Pack </a>

			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row align-items-end">
			<div class="col">

				<!-- Image -->
				<img src="assets/img/products/product-105.jpg" alt="..."
					class="img-fluid">

			</div>
			<div class="col d-none d-md-block">

				<!-- Image -->
				<img src="assets/img/products/product-106.jpg" alt="..."
					class="img-fluid">

			</div>
			<div class="col">

				<!-- Image -->
				<img src="assets/img/products/product-107.jpg" alt="..."
					class="img-fluid">

			</div>
			<div class="col d-none d-md-block">

				<!-- Image -->
				<img src="assets/img/products/product-108.jpg" alt="..."
					class="img-fluid">

			</div>
			<div class="col">

				<!-- Image -->
				<img src="assets/img/products/product-109.jpg" alt="..."
					class="img-fluid">

			</div>
		</div>
	</div>
</section>



<div id="mainBanner" class="popup">
	<div class="popup-content">
		<span class="popup-close" onclick="fnBannerclose('')">&times;</span>
		<h2>광고 팝업</h2>
		<button onclick="goToApp()">앱설치하기</button>
		<button data-cation="close" onClick="fnBannerclose('stop');">오늘
			그만보기</button>
		<button data-cation="close" onClick="fnBannerclose('');">닫기</button>
	</div>
</div>





<script>
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
        setTimeout(function () {
            if (document.hasFocus()) {
             	location.href = "https://play.google.com/store/apps/details?id=com.kbstar.liivmobile";
            }
        }, 1000);
    }
    // ios
    else if (typeOS == "ios") {
        setTimeout(function () {
            if (document.hasFocus()) {
                location.href = "https://itunes.apple.com/app/id1659980349?mt=8";
            }
        }, 1000);

    }
}


</script>