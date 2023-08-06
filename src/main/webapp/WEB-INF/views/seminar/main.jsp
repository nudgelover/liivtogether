<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#tabal1 {
	display: block;
}

#tab1, #tab2, #tab3, #tab4, #tab5 {
	display: none;
}

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

@media ( max-width : 987px) {
	.menulist {
		flex-direction: column;
	}
	.menulist>div {
		display: flex;
		width: 100%;
		justify-content: flex-end;
		margin-bottom: 10px;
	}
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
<script>
	function showTab(tab) {

		  const allTabs = document.querySelectorAll('.nav-link');
	        allTabs.forEach(link => link.classList.remove('active'));
			console.log('[onclick="showTab('+tab+')"]')
	        const selectedTab = document.querySelector('[onclick="showTab(\''+tab+'\')"]');
			console.log(selectedTab)
	        selectedTab.classList.add('active');
		
		
		
		
		document.getElementById('taball').style.display = 'none';
		document.getElementById('tab1').style.display = 'none';
		document.getElementById('tab2').style.display = 'none';
		document.getElementById('tab3').style.display = 'none';
		document.getElementById('tab4').style.display = 'none';
		document.getElementById('tab5').style.display = 'none';

		switch (tab) {
		case 'taball':
			document.getElementById('taball').style.display = 'block';
			
			break;
		case 'tab1':
			document.getElementById('tab1').style.display = 'block';
			break;
		case 'tab2':
			document.getElementById('tab2').style.display = 'block';
			break;
		case 'tab3':
			document.getElementById('tab3').style.display = 'block';
			break;
		case 'tab4':
			document.getElementById('tab4').style.display = 'block';
			break;
		case 'tab5':
			document.getElementById('tab5').style.display = 'block';
			break;
		}
	}
</script>
<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 fs-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400" href="/">Home</a>
					</li>
					<li class="breadcrumb-item active">Seminar</li>
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
						<h4>곧 마감하는 세미나 배너띄우기</h4>

						<!-- Button -->
						<a class="btn btn-link px-0 text-body" href="shop.html"> View
							Collection <i class="fe fe-arrow-right ms-2"></i>
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
				<h3 class="mb-7 text-center">세미나</h3>

				<!-- Nav -->
				<nav class="nav justify-content-center mb-5">
					<a id="tabAllBtn" class="nav-link active"
						href="javascript:void(0);" onclick="showTab('taball')">All</a> <a
						class="nav-link" href="javascript:void(0);"
						onclick="showTab('tab1')">자산관리</a> <a class="nav-link"
						href="javascript:void(0);" onclick="showTab('tab2')">인문학</a> <a
						class="nav-link" href="javascript:void(0);"
						onclick="showTab('tab3')">디지털</a> <a class="nav-link"
						href="javascript:void(0);" onclick="showTab('tab4')">북클럽</a> <a
						class="nav-link" href="javascript:void(0);"
						onclick="showTab('tab5')">기타</a>
				</nav>

			</div>
		</div>


		<div id="taball">
			<div class="menulist">
				<h2>자산관리</h2>
				<div>
					<span>인기순</span><span>마감임박순</span><span>신청률순</span><span>최신순</span><span>조회순</span>
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
							<h6>우수고객 초청 자산관리 세미나</h6>
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
							<h6>우수고객 초청 자산관리 세미나</h6>
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
							<h6>우수고객 초청 자산관리 세미나</h6>
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
							<h6>우수고객 초청 자산관리 세미나</h6>
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
							<h6>우수고객 초청 자산관리 세미나</h6>
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
							<h6>우수고객 초청 자산관리 세미나</h6>
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


		<div id="tab1" style="display: none;">Tab 1 Content</div>
		<div id="tab2" style="display: none;">Tab 2 Content</div>
		<div id="tab3" style="display: none;">Tab 3 Content</div>
		<div id="tab4" style="display: none;">Tab 4 Content</div>
		<div id="tab5" style="display: none;">Tab 5 Content</div>


	</div>






</section>
