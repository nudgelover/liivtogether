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


.row.align-items-center {
  height: 15rem;
}

@media (min-width: 768px) {
  .row.align-items-center {
    height: 20rem;
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
	<c:forEach items="${bannerList}" var="obj">
		<div class="w-100">
			<div class="card bg-cover"
				style="background-image: url('/uimg/${obj.imageSub}');">
				<div class="row align-items-center">
					<div class="col-12">
						<div class="card-body px-md-10 py-5">
							<!-- Heading -->
							<div style="background-color: rgba(255, 255, 255, 0.5);">
							<h4 class="mb-5">${obj.title}</h4>
						
							<!-- Text -->
							<p class="mb-7">
								${obj.comment} <br> <strong style="font-weight: 800;"
									class="text-primary">마감이 얼마 남지 않았어요!</strong>
							</p>
							</div>
							<a style="background-color: rgba(255, 255, 255, 0.5);" class="btn btn-outline-dark" href="/seminar/detail?id=${obj.donaId}"> 참여하러가기 <i
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
				<h3 class="mb-7 text-center">기부</h3>

				<!-- Nav -->
				<!-- 	<nav class="nav justify-content-center mb-5">
					<a class="nav-link active" href="#">All</a> <a class="nav-link"
						href="#">국내</a> <a class="nav-link" href="#">해외</a> <a
						class="nav-link" href="#">기타</a>
				</nav> -->

			</div>
		</div>
	


		<div class="menulist">
			<h2>전체</h2>
			<div>
				<span>인기순</span><span>모집금액순</span><span>마감임박순</span><span>최신순</span><span>조회순</span>
			</div>
		</div>
		<div class="row">
		<c:forEach var="obj" items="${dlist}">
			<div class="col-12 col-md-4">
				<!-- Card -->
				<div class="card mb-7">

					<!-- 좋아요 -->
					<div class="heart-icon" id="like">
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
						 alt="/donation/detail">

					<!-- Body -->
					<div class="card-body px-0">
								<c:set var="achiQuo" value="${(obj.targetIn)/(obj.target)*100}"/>
								<fmt:formatNumber value="${achiQuo}" pattern="###" var="formattedAchiQuo" />
						<!-- Heading -->
						<h6>${obj.title}</h6>
						<div class="event-info">
							<div class="progress">
								<div class="progress-bar bg-info progress-bar-striped"
									style="width: ${formattedAchiQuo}%"></div>
							</div>

							<div style="display: flex; align-items: center;">
								
								<span style="margin-right: auto;"> ${formattedAchiQuo}% 달성 <br><span
									style="color: gray; font-size: 12px; font-weight: 200;">
										모금액 : <fmt:formatNumber value="${obj.targetIn}" pattern="###,###원"/>/ 
										목표액 : <fmt:formatNumber value="${obj.target}" pattern="###,###원"/></span></span> 
									<c:choose>
									  <c:when test="${formattedAchiQuo >= 100}">
										<span style="font-size: 12px; font-weight: 200;">성공</span></span>
									  </c:when>
									  <c:when test="${obj.dDay < 0}">
										<span style="color: gray; font-size: 12px; font-weight: 200;">종료
									  </c:when>
									  <c:otherwise>
        								<span style="font-size: 12px; font-weight: 300;">진행중</span>
    								  </c:otherwise>
									  
									</c:choose>
								
							</div>

						</div>
						<!-- Text -->
						<p class="mb-0 text-gray-500">${obj.comment}</p>

						<!-- Button -->
						<c:choose>
							  <c:when test="${obj.dDay >= 0}">
								<a class="btn btn-link stretched-link px-0 text-reset"
							href="/donation/detail?id=${obj.donaId}"> 참여하러가기 <i
							class="fe fe-arrow-right ms-2"></i>
								</a>
							  </c:when>
							  <c:otherwise>
      							<span class="btn btn-link stretched-link px-0 text-reset">
      								참여종료
								</span>
  							  </c:otherwise>
					  	</c:choose>
				
						

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
						<button class="btn btn-sm btn-outline-dark">더보기</button>

					</div>
				</div>

			</div>
		</div>
	</div>
</section>

