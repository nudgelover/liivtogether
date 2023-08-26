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
	color: lightgray; /* Adjust the color of the bookmark icon here */
	font-size: 16px;
}

.red {
	color: red; /* Adjust the color of the bookmark icon here */
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
	margin-right: 5px;
	padding: 5px;
	background-color: #F2F2F2;
	border-radius: 10px;
	margin-right: 5px;
}

.event-info img {
	width: 20px;
}
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
					<li class="breadcrumb-item active">ESG Shop</li>
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
						<h4>지속 가능한 내일, KB가 함께합니다</h4>

						<!-- Button -->
						<a class="btn btn-link px-0 text-body" href="https://omoney.kbstar.com/quics?page=C101240#loading">
						 ESG STAR 보러가기 <i class="fe fe-arrow-right ms-2"></i>
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
						<h4 class="mb-5">지구에게 더 다정한 오늘을 선물하세요!</h4>

						<!-- Button -->
						<a class="btn btn-outline-dark" href="https://ko.wikipedia.org/wiki/%EC%83%88%ED%99%9C%EC%9A%A9"> 업사이클링이란? <i
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
						<p class="text-uppercase">KB금융그룹</p>

						<!-- Heading -->
						<h1 class="display-4 text-uppercase">ESG REPORTING</h1>

						<!-- Link -->
						<a class="link-underline text-reset" href="https://kbfg.com/Kor/about/sustainability/sustainability.jsp">지속가능경영보고서 보러가기</a>

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
				<h3 class="mb-7 text-center">ESG Shop</h3>

				<!-- Nav -->
				<nav class="nav justify-content-center mb-5">
					<a class="nav-link active" href="#">All</a> <a class="nav-link"
						href="#">에코백</a> <a class="nav-link" href="#">텀블러</a> <a
						class="nav-link" href="#">종이테이프</a> <a class="nav-link" href="#">업사이클링 스타프렌즈 상품</a>
					<a class="nav-link" href="#">우대금리쿠폰</a>
				</nav>

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
				<span>인기순</span><span>Sale</span><span>판매량Best</span><span>최신순</span><span>조회순</span>
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
						src="https://t1.daumcdn.net/news/202211/25/yonhap/20221125144657838kmeg.jpg"
						alt="/seminar/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>업사이클링 스타프렌즈 인형(아거)</h6> 
						<div class="event-info">
							<span><img
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/1286/1286827.png">
								34/120명 참가</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/2354/2354573.png">
								222명 조회</span>

						</div>
						<!-- Text -->
						<!-- <p class="mb-0 text-gray-500">Midst one brought greater also
							morning green saying had good. Open stars day let over gathered,
							grass face one every light of under.</p>
 -->
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
						src="https://t1.daumcdn.net/news/202211/25/yonhap/20221125144657838kmeg.jpg"
						alt="/seminar/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>업사이클링 스타프렌즈 인형(비비)</h6>
						<div class="event-info">
							<span><img
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/1286/1286827.png">
								34/120명 참가</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/2354/2354573.png">
								222명 조회</span>

						</div>
						<!-- Text -->
						<!-- <p class="mb-0 text-gray-500">Midst one brought greater also
							morning green saying had good. Open stars day let over gathered,
							grass face one every light of under.</p>
 -->
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
						src="https://t1.daumcdn.net/news/202211/25/yonhap/20221125144657838kmeg.jpg"
						alt="/seminar/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>업사이클링 스타프렌즈 인형(콜리)</h6>
						<div class="event-info">
							<span><img
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/1286/1286827.png">
								34/120명 참가</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/2354/2354573.png">
								222명 조회</span>

						</div>
						<!-- Text -->
						<!-- <p class="mb-0 text-gray-500">Midst one brought greater also
							morning green saying had good. Open stars day let over gathered,
							grass face one every light of under.</p>
 -->
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
						src="https://t1.daumcdn.net/news/202211/25/yonhap/20221125144657838kmeg.jpg"
						alt="/seminar/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>업사이클링 스타프렌즈 인형(키키)</h6>
						<div class="event-info">
							<span><img
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/1286/1286827.png">
								34/120명 참가</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/2354/2354573.png">
								222명 조회</span>

						</div>
						<!-- Text -->
						<!-- <p class="mb-0 text-gray-500">Midst one brought greater also
							morning green saying had good. Open stars day let over gathered,
							grass face one every light of under.</p>
 -->
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
						src="https://t1.daumcdn.net/news/202211/25/yonhap/20221125144657838kmeg.jpg"
						alt="/seminar/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>업사이클링 스타프렌즈 인형(라무)</h6>
						<div class="event-info">
							<span><img
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/1286/1286827.png">
								34/120명 참가</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/2354/2354573.png">
								222명 조회</span>

						</div>
						<!-- Text -->
						<!-- <p class="mb-0 text-gray-500">Midst one brought greater also
							morning green saying had good. Open stars day let over gathered,
							grass face one every light of under.</p>
 -->
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
						src="https://t1.daumcdn.net/news/202211/25/yonhap/20221125144657838kmeg.jpg"
						alt="/seminar/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>업사이클링 스타프렌즈 담요</h6>
						<div class="event-info">
							<span><img
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/1286/1286827.png">
								34/120명 참가</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/2354/2354573.png">
								222명 조회</span>

						</div>
						<!-- Text -->
						<!-- <p class="mb-0 text-gray-500">Midst one brought greater also
							morning green saying had good. Open stars day let over gathered,
							grass face one every light of under.</p>
 -->
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
