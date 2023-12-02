<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
	color: lightgray; /* Adjust the color of the bookmark icon here */
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
	margin-right : 5px;
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
					<li class="breadcrumb-item active">Volunteer</li>
				</ol>

			</div>
		</div>
	</div>
</nav>

<!-- Slider -->
<div class="flickity-page-dots-inner mb-9"
	data-flickity='{"pageDots": true}'>

	<!-- Item -->
	<c:forEach items="${bannerList}" var="obj">
		<div class="w-100">
			<div class="card bg-cover"
				style="background-image: url('/uimg/${obj.imageSub}');">
				<div class="row align-items-center" style="height: 15rem">
					<div class="col-12 col-md-10 col-lg-8 col-xl-6">
						<div class="card-body px-md-10 py-5">
							<!-- Heading -->
							<h4 class="mb-5" style="color: white;">${obj.title}</h4>
						
					   
						    <!-- obj의 다른 속성에 접근할 수도 있습니다. 예: ${obj.imageMain}, ${obj.comment}, 등 -->
						
							<!-- Text -->
							<p class="mb-7" style="color: white;">
								${obj.comment} <br> <strong
									class="text-primary">마감이 얼마 남지 않았어요!</strong>
							</p>
	
							<!-- Button -->
							<a class="btn btn-outline-dark" style="color: white;" href="/volunteer/detail?id=${obj.voluId}"> 참여하러가기 <i
								class="fe fe-arrow-right ms-2"></i>
							</a>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

</div>

<!-- CONTENT -->
<section class="pt-7 pb-12">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Heading -->
				<h3 class="mb-7 text-center">봉사</h3>

				<!-- Nav -->
				<nav class="nav justify-content-center mb-5">
					<a class="nav-link active" href="#">All</a>
						<a class="nav-link" href="#">방문봉사</a>
						 <a
						class="nav-link" href="#">언택트봉사</a> 
						<a class="nav-link" href="#">유기견</a>
					<a class="nav-link" href="#">재능기부</a>
				</nav>

			</div>
		</div>

		<div class="menulist">
			<h2>전체</h2>
			<div>
				<span>인기순</span><span>마감임박순</span><span>신청률순</span><span>최신순</span><span>조회순</span>
			</div>
		</div>
		<div class="row">
		<c:forEach var="obj" items="${vlist}">
			<div class="col-12 col-md-4">
				<!-- Card -->
				<div class="card mb-7">

					<!-- 좋아요 -->
					<div class="heart-icon">
						<i class="fa-solid fa-heart white"></i>
					</div>
					<!-- Badge -->
					<div class="badge bg-white text-body card-badge">
						<c:choose>
						 <c:when test="${obj.dDay >= 0}">
						    <time class="text-uppercase" datetime="${obj.ddate}">D-${obj.dDay}일 </time>
						 </c:when>
						 <c:otherwise>
						 	<time class="text-uppercase" datetime="${obj.ddate}">기한마감</time>
						 </c:otherwise>
						 </c:choose>				
					</div>

					<!-- Image -->
					<img class="card-img-top"
						 src="/uimg/${obj.imageMain}"
						 alt="/volunteer/detail">

					<!-- Body -->
					<div class="card-body px-0">

						<!-- Heading -->
						<h6>${obj.title}</h6>
						<div class="event-info">
							<span><img
								src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
								5개</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/1286/1286827.png">
								${obj.targetIn}/${obj.target}명 참가</span> <span><img
								src="https://cdn-icons-png.flaticon.com/512/2354/2354573.png">
								${obj.view} 명 조회</span>

						</div>
						<!-- Text -->
						<!-- <p class="mb-0 text-gray-500">Midst one brought greater also
							morning green saying had good. Open stars day let over gathered,
							grass face one every light of under.</p>
 -->
						<!-- Button -->
								<a class="btn btn-link stretched-link px-0 text-reset"
							href="/volunteer/detail?id=${obj.voluId}"> 참여하러가기 <i
							class="fe fe-arrow-right ms-2"></i>
								</a>
					</div>
				</div>
			</div>
			</c:forEach>
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