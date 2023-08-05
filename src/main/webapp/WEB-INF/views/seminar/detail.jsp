<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.location-detail {
	margin-top: 10px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	border: 1px solid gray;
	border-radius: 10px;
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

.recruitment {
	margin: 10px 3px;
	border-radius: 10px 10px;
	padding: 3px 10px;
	background-color: #E6E6E6;
}

.participants {
	margin: 10px 3px;
	border-radius: 10px 10px;
	padding: 3px 10px;
	background-color: #CEF6F5;
}

/* 마감임박 시 빨간 배경 스타일 */
.deadline-red {
	margin: 10px 3px;
	border-radius: 10px 10px;
	padding: 3px 10px;
	background-color: red;
	color: white;
}

/*일반 마감날짜는 주황 배경 스타일 */
.deadline-orange {
	margin: 10px 3px;
	border-radius: 10px 10px;
	padding: 3px 10px;
	background-color: #F3E2A9;
}

.preference {
	display: flex;
	padding: 4px;
}

.preference span {
	margin-right: 10px;
	color: #585858;
}

#buttons {
	margin: 20px 0;
	display: flex;
	justify-content: space-between;
	display: flex;
}

#buttons button {
	border-radius: 5px;
	font-weight: 700;
	color: white;
	height: 3.5rem;
	border: none;
	background-color: #FFBF00;
	border: none;
	font-weight: 700;
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
				<span class="recruitment">정원 15명 </span><span class="participants">5명
					참여</span> <span class="deadline-orange">11일 남음</span>
				<!--  디비 연결 후 남은 일짜 deadline으로 값보내기 -->
				<%-- 				<span class="${(deadline <= 5) ? 'deadline-red' : 'deadline-orange'}">${deadline}</span>
 --%>
			</div>
			<div class="preference">
				<span><i class="fa fa-heart"></i> 찜하기 11명 </span><span> 👀조회
					22명 </span>
			</div>
			<div id="buttons">
				<button style="width: 33%">
					<i class="fa fa-heart"></i> 찜하기
				</button>
				<button style="width: 66%">참여하기</button>
			</div>
			<!-- 종료 시 참여하기 -> 종료로 변경  -->

			<div class="location-detail">
				<span class="mb-3"><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/727/727606.png">
					장소 : 성수동 알파코 캠퍼스</span> <span><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/10691/10691802.png">
					날짜 : 2023년 11월 23일</span>
			</div>
		</div>

		<div class="col-12 col-md-8">
			<!-- Image -->

			<p>상세정보 상세정보 상세정보 주의사항 공지사항 등등등등등등</p>
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
