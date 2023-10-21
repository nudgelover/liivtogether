<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
<script
	src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.btnAdd {
	margin: 10px 0 20px;
	padding: 10px 20px;
	border-radius: 5px;
	float: right;
	background-color: #FFBF00;
	color: white;
}

.btnDel {
	float: right;
	background-color: white;
	border: none;
}

.form-check-input {
	padding: 0;
}

.form-check-input:checked {
	background-color: #FFBF00 !important;
}

.kewordList {
	margin-bottom: 10px;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
}

.kewordList span {
	font-size: small;
	border-radius: 15px;
	margin: 5px 10px 5px 0;
	padding: 0.5em;
	color: white;
	background-color: lightsalmon;
}

.negative {
	background-color: lightblue !important;
}
</style>
<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 fs-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400" href="/">Home</a></li>
					<li class="breadcrumb-item active">Review</li>
				</ol>

			</div>
		</div>
	</div>
</nav>



<!-- CONTENT -->
<section class="pt-7 pb-12">
	<div class="container">
		<div class="row">

			<div class="col-12">
				<div id="wordCloud"></div>
				<a class="btnAdd" href="/review/add">후기 작성하러가기</a>

			</div>
			<div style="margin-bottom: 10px;">
				<input class="form-check-input" type="checkbox" id="myReviewOnly">
				<label for="myReviewOnly">내가 작성한 후기 모아보기</label>
			</div>
			<div id="reviewContainer">
				<c:forEach var="item" items="${reviewcontent}">

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

					<div class="review">
						<div class="review-body">
							<c:if test="${item.custId==logincust.custId}">
								<button class="btnDel" onclick="delReview('${item.reviewId}')">
									<img style="width: 1.5em;"
										src="https://cdn-icons-png.flaticon.com/512/484/484560.png">
								</button>
							</c:if>
							<div class="row">
								<div class="col-12 col-md-auto">

									<!-- Avatar -->
									<div class="avatar avatar-xxl mb-6 mb-md-0">
										<span class="avatar-title rounded-circle"> <img
											style="width: 100%; height: 100%; border-radius: 50%;"
											src="/uimg/${item.custImg}">
										</span>
									</div>

								</div>
								<div class="col-12 col-md">

									<!-- Header -->
									<div class="row mb-6">
										<div class="col-12">

											<!-- Rating -->
											<div class="rating fs-sm text-dark"
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

										</div>
										<div class="col-12">

											<!-- Time -->
											<span class="fs-xs text-muted"> ${fn:substring(maskedCustId,0,10)}  <time
													datetime="${item.rdate}">${item.rdate}</time>
											</span>

										</div>
									</div>

									<!-- Title -->
									<c:if test="${item.topicBig == 'D'}">	<p class="mb-2 fs-lg fw-bold">[기부] ${item.title}</p></c:if>
									<c:if test="${item.topicBig == 'V'}">	<p class="mb-2 fs-lg fw-bold">[봉사] ${item.title}</p></c:if>
									<c:if test="${item.topicBig == 'S'}">	<p class="mb-2 fs-lg fw-bold">[세미나] ${item.title}</p></c:if>
								
									<div class="kewordList">
										<c:choose>
											<c:when test="${item.keyword1 eq 'keyword1'}">
												<span>큰 보람을 얻었어요🫶</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword2'}">
												<span>색다른 경험이었어요👏</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword3'}">
												<span>잊지못할 추억을 만들었어요😉</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword4'}">
												<span>추천합니다👍</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword5'}">
												<span>다시 참여하고 싶어요😊</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword6'}">
												<span>행복한 경험이었어요🥰</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword7'}">
												<span class="negative">어려움을 느꼈어요😥</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword8'}">
												<span class="negative">변화가 필요해요🤔</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword9'}">
												<span class="negative">아쉬워요🥺</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${item.keyword2 eq 'keyword1'}">
												<span>큰 보람을 얻었어요🫶</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword2'}">
												<span>색다른 경험이었어요👏</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword3'}">
												<span>잊지못할 추억을 만들었어요😉</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword4'}">
												<span>추천합니다👍</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword5'}">
												<span>다시 참여하고 싶어요😊</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword6'}">
												<span>행복한 경험이었어요🥰</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword7'}">
												<span class="negative">어려움을 느꼈어요😥</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword8'}">
												<span class="negative">변화가 필요해요🤔</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword9'}">
												<span class="negative">아쉬워요🥺</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${item.keyword3 eq 'keyword1'}">
												<span>큰 보람을 얻었어요🫶</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword2'}">
												<span>색다른 경험이었어요👏</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword3'}">
												<span>잊지못할 추억을 만들었어요😉</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword4'}">
												<span>추천합니다👍</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword5'}">
												<span>다시 참여하고 싶어요😊</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword6'}">
												<span>행복한 경험이었어요🥰</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword7'}">
												<span class="negative">어려움을 느꼈어요😥</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword8'}">
												<span class="negative">변화가 필요해요🤔</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword9'}">
												<span class="negative">아쉬워요🥺</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>
									</div>
									<!-- Text -->
									<div>${item.reviewContents}</div>

									<!-- Footer -->
									<div class="row align-items-center mt-2 text-primary">
										<div class="col-auto d-none d-lg-block">

											<!-- Text -->
											<p class="mb-0 fs-sm">이 리뷰가 도움이 되셨나요?</p>

										</div>
										<div class="col-auto me-auto">

											<!-- Rate -->
											<div class="rate">
												<a class="rate-item" data-toggle="vote" data-count="2"
													href="#" role="button"> <i class="fe fe-thumbs-up"></i>
												</a> <a class="rate-item" data-toggle="vote" data-count="1"
													href="#" role="button"> <i class="fe fe-thumbs-down"></i>
												</a>
											</div>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
			<div id="myReviewContainer" style="display: none;">
				<c:forEach var="item" items="${myReviewcontent}">

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

					<div class="review">
						<div class="review-body">
							<c:if test="${item.custId==logincust.custId}">
								<button class="btnDel" onclick="delReview('${item.reviewId}')">
									<img style="width: 1.5em;"
										src="https://cdn-icons-png.flaticon.com/512/484/484560.png">
								</button>
							</c:if>
							<div class="row">
								<div class="col-12 col-md-auto">

									<!-- Avatar -->
									<div class="avatar avatar-xxl mb-6 mb-md-0">
										<span class="avatar-title rounded-circle"> <img
											style="width: 100%; height: 100%; border-radius: 50%;"
											src="/uimg/${item.custImg}">
										</span>
									</div>

								</div>
								<div class="col-12 col-md">

									<!-- Header -->
									<div class="row mb-6">
										<div class="col-12">

											<!-- Rating -->
											<div class="rating fs-sm text-dark"
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

										</div>
										<div class="col-12">

											<!-- Time -->
											<span class="fs-xs text-muted"> ${maskedCustId} <time
													datetime="${item.rdate}">${item.rdate}</time>
											</span>

										</div>
									</div>

									<!-- Title -->
									<c:if test="${item.topicBig == 'D'}">	<p class="mb-2 fs-lg fw-bold">[기부] ${item.title}</p></c:if>
									<c:if test="${item.topicBig == 'V'}">	<p class="mb-2 fs-lg fw-bold">[봉사] ${item.title}</p></c:if>
									<c:if test="${item.topicBig == 'S'}">	<p class="mb-2 fs-lg fw-bold">[세미나] ${item.title}</p></c:if>
								

									<div class="kewordList">
										<c:choose>
											<c:when test="${item.keyword1 eq 'keyword1'}">
												<span>큰 보람을 얻었어요🫶</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword2'}">
												<span>색다른 경험이었어요👏</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword3'}">
												<span>잊지못할 추억을 만들었어요😉</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword4'}">
												<span>추천합니다👍</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword5'}">
												<span>다시 참여하고 싶어요😊</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword6'}">
												<span>행복한 경험이었어요🥰</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword7'}">
												<span class="negative">어려움을 느꼈어요😥</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword8'}">
												<span class="negative">변화가 필요해요🤔</span>
											</c:when>
											<c:when test="${item.keyword1 eq 'keyword9'}">
												<span class="negative">아쉬워요🥺</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${item.keyword2 eq 'keyword1'}">
												<span>큰 보람을 얻었어요🫶</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword2'}">
												<span>색다른 경험이었어요👏</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword3'}">
												<span>잊지못할 추억을 만들었어요😉</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword4'}">
												<span>추천합니다👍</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword5'}">
												<span>다시 참여하고 싶어요😊</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword6'}">
												<span>행복한 경험이었어요🥰</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword7'}">
												<span class="negative">어려움을 느꼈어요😥</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword8'}">
												<span class="negative">변화가 필요해요🤔</span>
											</c:when>
											<c:when test="${item.keyword2 eq 'keyword9'}">
												<span class="negative">아쉬워요🥺</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${item.keyword3 eq 'keyword1'}">
												<span>큰 보람을 얻었어요🫶</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword2'}">
												<span>색다른 경험이었어요👏</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword3'}">
												<span>잊지못할 추억을 만들었어요😉</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword4'}">
												<span>추천합니다👍</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword5'}">
												<span>다시 참여하고 싶어요😊</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword6'}">
												<span>행복한 경험이었어요🥰</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword7'}">
												<span class="negative">어려움을 느꼈어요😥</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword8'}">
												<span class="negative">변화가 필요해요🤔</span>
											</c:when>
											<c:when test="${item.keyword3 eq 'keyword9'}">
												<span class="negative">아쉬워요🥺</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>
									</div>
									<!-- Text -->
									<div>${item.reviewContents}</div>

									<!-- Footer -->
									<div class="row align-items-center mt-2 text-primary">
										<div class="col-auto d-none d-lg-block">

											<!-- Text -->
											<p class="mb-0 fs-sm">이 리뷰가 도움이 되셨나요?</p>

										</div>
										<div class="col-auto me-auto">

											<!-- Rate -->
											<div class="rate">
												<a class="rate-item" data-toggle="vote" data-count="2"
													href="#" role="button"> <i class="fe fe-thumbs-up"></i>
												</a> <a class="rate-item" data-toggle="vote" data-count="1"
													href="#" role="button"> <i class="fe fe-thumbs-down"></i>
												</a>
											</div>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>

				</c:forEach>


			</div>
		</div>
	</div>
</section>
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<script>
	$(document).ready(function() {
		$('#myReviewOnly').on('change', getMyReview);
	});

	var contentList = '${contentList}';

	var contentWithoutHTML = contentList.replace(/<[^>]*>/g, '');

	anychart.onDocumentReady(function() {

		// create data
		var data = contentWithoutHTML;
		// create a chart
		chart = anychart.tagCloud();

		// configure angles
		chart.angles([ 0 ]);

		// set the parsing mode
		chart.data(data, {
			mode : "by-word",
			ignoreItems : [ "통해", "하면서", "수", "해도", "더", "어떻게", "그리고", "그런데",
					"그러나", "또는", "그래서", "하지만", "이런", "저런", "어떤", "많은", "작은",
					"큰", "없는", "있는", "이것", "그것", "저것", "모든", "우리", "너희", "그들",
					"나는", "너는", "그는", "그녀는", "우리는", "그들은", "이렇게", "저렇게", "그렇게",
					"때문에", "무엇", "어떻게", "어디", "언제", "왜", "어떤", "그럼", "게", "들을",
					"것", "대해서", "아니요", "네", "모두", "나", "너", "그", "그녀", "우리",
					"그들", "이", "저", "누가", "무슨", "무엇", "얼마나", "몇", "더", "많이",
					"적게", "매우", "정말", "너무", "그래서", "그러므로", "그러면", "또한", "물론",
					"아마도", "다시", "곧", "지금", "이제", "그때", "전에", "바로", "조금", "많이",
					"딱", "바로", "먼저", "다음", "때", "후에", "마지막", "아직", "높이"
			// 필요에 따라 추가할 수 있습니다.
			]
		});

		// set the container id
		chart.container("wordCloud");

		// initiate drawing the chart
		chart.draw();
	});

	function delReview(reviewId) {
		console.log(reviewId);

		$.ajax({
			url : '/review/delete',
			method : 'POST',
			data : {
				reviewId : reviewId
			},
			beforeSend : function(xhr, set) {
				let token = $("meta[name='_csrf']").attr("content");
				let header = $("meta[name='_csrf_header']").attr("content");

				xhr.setRequestHeader("X-CSRF-Token", token);
				xhr.setRequestHeader(header, token);
			},
			success : function(response) {
				console.log(response);
				if (response == "succ") {
					popup("후기가 정상적으로 삭제되었습니다.", false, goToReview, "")
				} else {
					popup("일시적인 오류가 발생하였습니다. 다시 시도해주십시오.", false, "", "")
				}
			},
			error : function(error) {

				console.error('오류 발생:', error);
			}
		});

	}

	function getMyReview() {
		var myReviewOnlyCheckbox = $('#myReviewOnly');
		var loginCustId = $('#loginCustId').val();
		var myReviewContainer = $('#myReviewContainer');

		if (myReviewOnlyCheckbox.prop('checked')) {

			if (!loginCustId) {
				popup('로그인 후 이용하실 수 있습니다.<br> 로그인하러 가시겠습니까?', true, goToLogin,
						'');
				myReviewOnlyCheckbox.prop('checked', false);
				return;
			}
			$('#myReviewContainer').css('display', 'block');
			$('#reviewContainer').css('display', 'none');

		} else {
			$('#myReviewContainer').css('display', 'none');
			$('#reviewContainer').css('display', 'block');

		}
	}
</script>