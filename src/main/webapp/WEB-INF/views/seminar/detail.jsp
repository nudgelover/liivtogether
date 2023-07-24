<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.location-detail {
	margin-top: 10px;
	padding: 10px 20px;
	display: flex;
	flex-direction: column;
	border: 1px solid gray;
	border-radius: 10px;
	display: flex;
	padding: 10px 20px;
}

.sticky-container {
	position: sticky;
	top: 80px;
	padding: 20px;
	/* 	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); */
}

@media ( max-width : 767px) {
	.sticky-container {
		position: static; /* Override sticky behavior on small screens */
	}
}
</style>
<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 fs-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="index.html">Home</a></li>
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="blog.html">Seminar</a></li>
					<li class="breadcrumb-item active">글번호_TITLE</li>
				</ol>

			</div>
		</div>
	</div>
</nav>
<div class="container">
	<div class="row">
		<div class="col-12 col-md-8">

			<div class="card mb-7">
				<!-- Badge -->
				<div class="badge bg-white text-body card-badge">
					<time class="text-uppercase" datetime="2019-06-20">Jun 20</time>
				</div>

				<!-- Image -->
				<img class="card-img-top"
					src="https://t1.daumcdn.net/news/202211/25/yonhap/20221125144657838kmeg.jpg">
			</div>
		</div>
		<div style="display: flex; flex-direction: column;"
			class="col-12 col-md-4 sticky-container"">
			<p>📒 세미나</p>
			<h5>제목칸입니다</h5>
			<p>간단한 소개입니다 간단한 소개입니다 간단한 소개입니다 간단한 소개입니다 간단한 소개입니다 간단한 소개입니다
				간단한 소개입니다</p>
			<div style="display: flex;">
				<span>정원 15명 </span><span>5명 참여</span><span>11일 남음</span>
			</div>
			<div style="display: flex;">
				<span><i class="fa fa-heart"></i>찜하기 11명</span><span> 👀 조회수
					220명 </span>
			</div>
			<div>
				<button>
					<i class="fa fa-heart"></i> 찜하기
				</button>
				<button>참여하기</button>
			</div>
			<!-- 종료 시 참여하기 -> 종료로 변경  -->

			<div class="location-detail">
				<span>장소</span> <span>날짜</span>
			</div>
		</div>

		<div class="col-12 col-md-8">
			<!-- Image -->
			
			<p>상세정보 상세정보 상세정보 주의사항 공지사항 등등등등등등  </p>
			<img class="card-img-top"
				src="https://ticketimage.interpark.com/230043252023/07/17/e8fed53f.jpg">

		</div>

		<div class="col-12 col-md-8 mt-10">
			<h5>같이 보면 좋은 세미나, 이건 어떠세요?</h5>
			<div class="row">
				<div class="col-6 col-md-4">

					<!-- Card -->
					<div class="card mb-7 mb-md-0">

						<!-- Image -->
						<img src="/assets/img/blog/blog-1.jpg" alt="..."
							class="card-img-top">

						<!-- Badge -->
						<div
							class="badge bg-white text-body card-badge card-badge-start text-uppercase">
							<time datetime="2019-06-20"> Jun 20 </time>
						</div>

						<!-- Body -->
						<div class="card-body px-0 py-7">

							<!-- Heading -->
							<h6 class="mb-3">Us yielding Fish sea night night the said
								him two</h6>

							<!-- Text -->
							<p class="mb-2">Fill his waters wherein signs likeness
								waters. Second light gathered appear sixth.</p>

							<!-- Link -->
							<a class="btn btn-link px-0 text-body" href="#!"> Read more <i
								class="fe fe-arrow-right ms-2"></i>
							</a>

						</div>

					</div>

				</div>
				<div class="col-6 col-md-4">

					<!-- Card -->
					<div class="card mb-7 mb-md-0">

						<!-- Badge -->
						<div
							class="badge bg-white text-body card-badge card-badge-start text-uppercase">
							<time datetime="2019-06-13"> Jun 13 </time>
						</div>

						<!-- Image -->
						<img src="/assets/img/blog/blog-2.jpg" alt="..."
							class="card-img-top">

						<!-- Body -->
						<div class="card-body px-0 py-7">

							<!-- Heading -->
							<h6 class="mb-3">Tree earth fowl given moveth deep lesser
								After</h6>

							<!-- Text -->
							<p class="mb-2">Called life don't called darkness spirit
								have, abundantly so Wherein the third cattle.</p>

							<!-- Link -->
							<a class="btn btn-link px-0 text-body" href="#!"> Read more <i
								class="fe fe-arrow-right ms-2"></i>
							</a>

						</div>

					</div>


				</div>

				<div class="col-6 col-md-4">

					<!-- Card -->
					<div class="card mb-7 mb-md-0">

						<!-- Badge -->
						<div
							class="badge bg-white text-body card-badge card-badge-start text-uppercase">
							<time datetime="2019-06-13"> Jun 13 </time>
						</div>

						<!-- Image -->
						<img src="/assets/img/blog/blog-2.jpg" alt="..."
							class="card-img-top">

						<!-- Body -->
						<div class="card-body px-0 py-7">

							<!-- Heading -->
							<h6 class="mb-3">Tree earth fowl given moveth deep lesser
								After</h6>

							<!-- Text -->
							<p class="mb-2">Called life don't called darkness spirit
								have, abundantly so Wherein the third cattle.</p>

							<!-- Link -->
							<a class="btn btn-link px-0 text-body" href="#!"> Read more <i
								class="fe fe-arrow-right ms-2"></i>
							</a>

						</div>

					</div>


				</div>
				<div class="col-6 col-md-4">

					<!-- Card -->
					<div class="card mb-7 mb-md-0">

						<!-- Badge -->
						<div
							class="badge bg-white text-body card-badge card-badge-start text-uppercase">
							<time datetime="2019-06-13"> Jun 13 </time>
						</div>

						<!-- Image -->
						<img src="/assets/img/blog/blog-2.jpg" alt="..."
							class="card-img-top">

						<!-- Body -->
						<div class="card-body px-0 py-7">

							<!-- Heading -->
							<h6 class="mb-3">Tree earth fowl given moveth deep lesser
								After</h6>

							<!-- Text -->
							<p class="mb-2">Called life don't called darkness spirit
								have, abundantly so Wherein the third cattle.</p>

							<!-- Link -->
							<a class="btn btn-link px-0 text-body" href="#!"> Read more <i
								class="fe fe-arrow-right ms-2"></i>
							</a>

						</div>

					</div>


				</div>
				<div class="col-6 col-md-4">

					<!-- Card -->
					<div class="card mb-7 mb-md-0">

						<!-- Badge -->
						<div
							class="badge bg-white text-body card-badge card-badge-start text-uppercase">
							<time datetime="2019-06-13"> Jun 13 </time>
						</div>

						<!-- Image -->
						<img src="/assets/img/blog/blog-2.jpg" alt="..."
							class="card-img-top">

						<!-- Body -->
						<div class="card-body px-0 py-7">

							<!-- Heading -->
							<h6 class="mb-3">Tree earth fowl given moveth deep lesser
								After</h6>

							<!-- Text -->
							<p class="mb-2">Called life don't called darkness spirit
								have, abundantly so Wherein the third cattle.</p>

							<!-- Link -->
							<a class="btn btn-link px-0 text-body" href="#!"> Read more <i
								class="fe fe-arrow-right ms-2"></i>
							</a>

						</div>

					</div>


				</div>
				<div class="col-6 col-md-4">

					<!-- Card -->
					<div class="card mb-7 mb-md-0">

						<!-- Badge -->
						<div
							class="badge bg-white text-body card-badge card-badge-start text-uppercase">
							<time datetime="2019-06-13"> Jun 13 </time>
						</div>

						<!-- Image -->
						<img src="/assets/img/blog/blog-2.jpg" alt="..."
							class="card-img-top">

						<!-- Body -->
						<div class="card-body px-0 py-7">

							<!-- Heading -->
							<h6 class="mb-3">Tree earth fowl given moveth deep lesser
								After</h6>

							<!-- Text -->
							<p class="mb-2">Called life don't called darkness spirit
								have, abundantly so Wherein the third cattle.</p>

							<!-- Link -->
							<a class="btn btn-link px-0 text-body" href="#!"> Read more <i
								class="fe fe-arrow-right ms-2"></i>
							</a>

						</div>

					</div>


				</div>
			</div>
		</div>
	</div>
</div>
