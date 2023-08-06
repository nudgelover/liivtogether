<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.card-img-top {
	height: 13rem;
}

.heart-icon {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 1;
}

.white {
	color: lightgray; 
	font-size: 16px;
}

.red {
	color: red; 
	font-size: 16px;
}

.menulist {
	display: flex;
	justify-content: space-between;
	align-items: baseline;
}

.menulist span {
	margin-left: 10px;
	cursor: pointer;
}

.event-info span {
	font-weight: 800;
	color: #00b2b2;
}



/* 진행 막대 컨테이너 스타일 */
.progress {
	margin-bottom: 5px;
	height: 10px;
	background-color: #f0f0f0;
	border-radius: 10px;
}

/* 애니메이션 효과 */
.progress-bar.progress-bar-striped {
	background-color: #00b2b2 !important; /* 진행 바의 색상 */
	background-size: 40px 40px; /* 애니메이션 스트라이프 크기 조절 */
	animation: progress-animation 2s linear infinite;
	/* 애니메이션 지속 시간 및 반복 설정 */
}


@keyframes progress-animation {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: 80px 0;
  }
}
/* 
@keyframes progress-animation {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: 80px 0;
  }
} */

</style>

<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 fs-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400" href="/">Home</a>
					</li>
					<li class="breadcrumb-item active">Donation</li>
				</ol>

			</div>
		</div>
	</div>
</nav>

<!-- Slider -->
<div class="flickity-page-dots-inner mb-9"
	data-flickity='{"pageDots": true}'>

	<!-- Item -->
	<div class="w-100">
		<div class="card bg-h-100 bg-start"
			style="background-image: url(/assets/img/covers/cover-24.jpg);">
			<div class="row" style="height: 15rem">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6 align-self-center">
					<div class="card-body px-md-10 py-11">

						<!-- Heading -->
						<h4>곧 마감하는 기부 배너띄우기</h4>

						<!-- Button -->
						<a class="btn btn-link px-0 text-body" href="shop.html"> 100%e
							달성하면 국민은행이 얼마 보태고 30%이상하면 뭐하고~ 기부는 고객들이름이 다 기재되고..영수증발행해주고..? <i
							class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
				<div
					class="col-12 col-md-2 col-lg-4 col-xl-6 d-none d-md-block bg-cover"
					style="background-image: url(/assets/img/covers/cover-16.jpg);"></div>
			</div>
		</div>
	</div>


	<!-- Item -->
	<div class="w-100">
		<div class="card bg-cover"
			style="background-image: url(/assets/img/covers/cover-29.jpg)">
			<div class="row align-items-center" style="height: 15rem">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6">
					<div class="card-body px-md-10 py-11">
						<!-- Heading -->
						<h4 class="mb-5">Get -50% from Summer Collection</h4>

						<!-- Text -->
						<p class="mb-7">
							Appear, dry there darkness they're seas. <br> <strong
								class="text-primary">Use code 4GF5SD</strong>
						</p>

						<!-- Button -->
						<a class="btn btn-outline-dark" href="shop.html"> Shop Now <i
							class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Item -->
	<div class="w-100">
		<div class="card bg-cover"
			style="background-image: url(/assets/img/covers/cover-30.jpg);">
			<div class="row align-items-center" style="height: 15rem">
				<div class="col-12">
					<div class="card-body px-md-10 py-11 text-center text-white">

						<!-- Preheading -->
						<p class="text-uppercase">Enjoy an extra</p>

						<!-- Heading -->
						<h1 class="display-4 text-uppercase">50% off</h1>

						<!-- Link -->
						<a class="link-underline text-reset" href="shop.html">Shop
							Collection</a>

					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<!-- CONTENT -->
<section class="pt-7 pb-12">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Heading -->
				<h3 class="mb-7 text-center">기부</h3>

				<!-- Nav -->
				<!-- 	<nav class="nav justify-content-center mb-5">
					<a class="nav-link active" href="#">All</a> <a class="nav-link"
						href="#">국내</a> <a class="nav-link" href="#">해외</a> <a
						class="nav-link" href="#">기타</a>
				</nav> -->

			</div>
		</div>
		<div style="display: flex; justify-content: right;">
			<div class="col-12 col-md-4">
				<div class="input-group input-group-merge mb-5">
					<input class="form-control" type="search" placeholder="Search">
					<div class="input-group-append">
						<button class="btn btn-outline-border" type="submit">
							<i class="fe fe-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>



		<div class="menulist">
			<h2>전체</h2>
			<div>
				<span>인기순</span><span>모집금액순</span><span>마감임박순</span><span>최신순</span><span>조회순</span>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-4">
				<!-- Card -->
				<div class="card mb-7">

					<!-- 좋아요 -->
					<div class="heart-icon">
						<i class="fa-solid fa-heart white"></i>
					</div>
					<!-- Badge -->
					<div class="badge bg-white text-body card-badge">
						<time class="text-uppercase" datetime="2019-06-20">Jun 20</time>
					</div>

					<!-- Image -->
					<img class="card-img-top"
						src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg"
						alt="/donation/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>사랑의 연탄봉사</h6>
						<div class="event-info">
							<div class="progress">
								<div class="progress-bar bg-info progress-bar-striped"
									style="width: 60%"></div>
							</div>

							<div style="display: flex; align-items: center;">

								<span style="margin-right: auto;"> 120% 달성 <span
									style="color: gray; font-size: 12px; font-weight: 200;">
										13,024,310원</span></span> <span
									style="color: gray; font-size: 12px; font-weight: 200;">종료
									<span style="font-size: 12px; font-weight: 200;">성공</span>
								</span>
							</div>

						</div>
						<!-- Text -->
						<p class="mb-0 text-gray-500">2011년을 시작으로 9년째 이어지고 있는 사랑의
							연탄봉사, 올해는 당신과 함께하고 싶어요.</p>

						<!-- Button -->
						<a class="btn btn-link stretched-link px-0 text-reset"
							href="/seminar/detail"> 참여하러가기 <i
							class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
			</div>
			<div class="col-12 col-md-4">
				<!-- Card -->
				<div class="card mb-7">

					<!-- 좋아요 -->
					<div class="heart-icon">
						<i class="fa-solid fa-heart white"></i>
					</div>
					<!-- Badge -->
					<div class="badge bg-white text-body card-badge">
						<time class="text-uppercase" datetime="2019-06-20">Jun 20</time>
					</div>

					<!-- Image -->
					<img class="card-img-top"
						src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg"
						alt="/donation/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>사랑의 연탄봉사</h6>
						<div class="event-info">
							<div class="progress">
								<div class="progress-bar bg-info progress-bar-striped"
									style="width: 60%"></div>
							</div>

							<div style="display: flex; align-items: center;">

								<span style="margin-right: auto;"> 120% 달성 <span
									style="color: gray; font-size: 12px; font-weight: 200;">
										13,024,310원</span></span> <span
									style="color: gray; font-size: 12px; font-weight: 200;">종료
									<span style="font-size: 12px; font-weight: 200;">성공</span>
								</span>
							</div>
						</div>
						<!-- Text -->
						<p class="mb-0 text-gray-500">2011년을 시작으로 9년째 이어지고 있는 사랑의
							연탄봉사, 올해는 당신과 함께하고 싶어요.</p>

						<!-- Button -->
						<a class="btn btn-link stretched-link px-0 text-reset"
							href="/seminar/detail"> 참여하러가기 <i
							class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
			</div>
			<div class="col-12 col-md-4">
				<!-- Card -->
				<div class="card mb-7">

					<!-- 좋아요 -->
					<div class="heart-icon">
						<i class="fa-solid fa-heart white"></i>
					</div>
					<!-- Badge -->
					<div class="badge bg-white text-body card-badge">
						<time class="text-uppercase" datetime="2019-06-20">Jun 20</time>
					</div>

					<!-- Image -->
					<img class="card-img-top"
						src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg"
						alt="/donation/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>사랑의 연탄봉사</h6>
						<div class="event-info">
							<div class="progress">
								<div class="progress-bar bg-info progress-bar-striped"
									style="width: 60%"></div>
							</div>
							<div style="display: flex; align-items: center;">

								<span style="margin-right: auto;"> 60% 달성 <span
									style="color: gray; font-size: 12px; font-weight: 200;">
										13,024,310원</span></span> <span
									style="color: gray; font-size: 12px; font-weight: 200;">종료
									<span style="font-size: 12px; font-weight: 200;"></span>
								</span>
							</div>
						</div>
						<!-- Text -->
						<p class="mb-0 text-gray-500">2011년을 시작으로 9년째 이어지고 있는 사랑의
							연탄봉사, 올해는 당신과 함께하고 싶어요.</p>

						<!-- Button -->
						<a class="btn btn-link stretched-link px-0 text-reset"
							href="/seminar/detail"> 참여하러가기 <i
							class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
			</div>
			<div class="col-12 col-md-4">
				<!-- Card -->
				<div class="card mb-7">

					<!-- 좋아요 -->
					<div class="heart-icon">
						<i class="fa-solid fa-heart white"></i>
					</div>
					<!-- Badge -->
					<div class="badge bg-white text-body card-badge">
						<time class="text-uppercase" datetime="2019-06-20">Jun 20</time>
					</div>

					<!-- Image -->
					<img class="card-img-top"
						src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg"
						alt="/donation/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>사랑의 연탄봉사</h6>
						<div class="event-info">
							<div class="progress">
								<div class="progress-bar bg-info progress-bar-striped"
									style="width: 60%"></div>
							</div>
							<div style="display: flex; align-items: center;">

								<span style="margin-right: auto;"> 60% 달성 <span
									style="color: gray; font-size: 12px; font-weight: 200;">
										13,024,310원</span></span> <span
									style="color: gray; font-size: 12px; font-weight: 200;">진행중
									<span style="color:red; font-size: 12px; font-weight: 200;">마감임박</span>
								</span>
							</div>
						</div>
						<!-- Text -->
						<p class="mb-0 text-gray-500">2011년을 시작으로 9년째 이어지고 있는 사랑의
							연탄봉사, 올해는 당신과 함께하고 싶어요.</p>

						<!-- Button -->
						<a class="btn btn-link stretched-link px-0 text-reset"
							href="/seminar/detail"> 참여하러가기 <i
							class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
			</div>
			<div class="col-12 col-md-4">
				<!-- Card -->
				<div class="card mb-7">

					<!-- 좋아요 -->
					<div class="heart-icon">
						<i class="fa-solid fa-heart white"></i>
					</div>
					<!-- Badge -->
					<div class="badge bg-white text-body card-badge">
						<time class="text-uppercase" datetime="2019-06-20">Jun 20</time>
					</div>

					<!-- Image -->
					<img class="card-img-top"
						src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg"
						alt="/donation/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>사랑의 연탄봉사</h6>
						<div class="event-info">
							<div class="progress">
								<div class="progress-bar bg-info progress-bar-striped"
									style="width: 60%"></div>
							</div>
							<div style="display: flex; align-items: center;">

								<span style="margin-right: auto;"> 60% 달성 <span
									style="color: gray; font-size: 12px; font-weight: 200;">
										13,024,310원</span></span> <span
									style="color: gray; font-size: 12px; font-weight: 200;">진행중
								</span>
							</div>
						</div>
						<!-- Text -->
						<p class="mb-0 text-gray-500">2011년을 시작으로 9년째 이어지고 있는 사랑의
							연탄봉사, 올해는 당신과 함께하고 싶어요.</p>

						<!-- Button -->
						<a class="btn btn-link stretched-link px-0 text-reset"
							href="/seminar/detail"> 참여하러가기 <i
							class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
			</div>
			<div class="col-12 col-md-4">
				<!-- Card -->
				<div class="card mb-7">

					<!-- 좋아요 -->
					<div class="heart-icon">
						<i class="fa-solid fa-heart white"></i>
					</div>
					<!-- Badge -->
					<div class="badge bg-white text-body card-badge">
						<time class="text-uppercase" datetime="2019-06-20">Jun 20</time>
					</div>

					<!-- Image -->
					<img class="card-img-top"
						src="https://wimg.mk.co.kr/meet/neds/2019/01/image_readtop_2019_2746_15464041933590219.jpg"
						alt="/donation/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>사랑의 연탄봉사</h6>
						<div class="event-info">
							<div class="progress">
								<div class="progress-bar bg-info progress-bar-striped"
									style="width: 60%"></div>
							</div>
								<div style="display: flex; align-items: center;">

								<span style="margin-right: auto;"> 60% 달성 <span
									style="color: gray; font-size: 12px; font-weight: 200;">
										13,024,310원</span></span> <span
									style="color: gray; font-size: 12px; font-weight: 200;">진행중
								</span>
							</div>
						</div>
						<!-- Text -->
						<p class="mb-0 text-gray-500">2011년을 시작으로 9년째 이어지고 있는 사랑의
							연탄봉사, 올해는 당신과 함께하고 싶어요.</p>

						<!-- Button -->
						<a class="btn btn-link stretched-link px-0 text-reset"
							href="/seminar/detail"> 참여하러가기 <i
							class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">

				<!-- Progress -->
				<div class="row justify-content-center mt-7">
					<div class="col-12 text-center">

						<!-- Caption -->
						<p class="fs-sm text-muted">Showing 16 of 24 products</p>

						<!-- Progress -->
						<div class="progress mx-auto mb-7" style="max-width: 250px;">
							<div class="progress-bar bg-dark" role="progressbar"
								style="width: 66%" aria-valuenow="66" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>

						<!-- Button -->
						<button class="btn btn-sm btn-outline-dark">Load more</button>

					</div>
				</div>

			</div>
		</div>
	</div>
</section>
