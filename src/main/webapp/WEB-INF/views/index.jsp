<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<!-- Favicon -->
<link rel="shortcut icon" href="/assets/favicon/favicon.png"
	type="image/x-icon" />

<!-- Libs CSS -->
<link rel="stylesheet" href="/assets/css/libs.bundle.css" />

<!-- Theme CSS -->
<link rel="stylesheet" href="/assets/css/theme.bundle.css" />
<!-- 공통 css -->
<link rel="stylesheet" href="/assets/css/common.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/assets/js/common.js"></script>

<!-- Title -->
<title>Liiv Together</title>
<style>
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'NanumSquareNeo-Variable', sans-serif;
}

.navbar-nav.ms-xl-auto li.nav-item a.nav-link {
	text-decoration: none; /* 모든 링크의 밑줄 제거 */
}

.navbar-nav.ms-xl-auto li.nav-item a.nav-link.orange-underline {
	position: relative; /* 포지션 설정 */
	color: darkorange; /* 주황색으로 변경 */
}

.navbar-nav.ms-xl-auto li.nav-item a.nav-link.orange-underline::after {
	content: ''; /* 가상 요소 설정 */
	display: block;
	position: absolute; /* 포지션 설정 */
	bottom: -3px; /* 원하는 간격을 조절합니다. 음수 값으로 내려가면 간격이 늘어납니다. */
	left: 10%;
	border-bottom: 2px solid darkorange;
	width: 80%; /* 밑줄 스타일 및 색상 설정 */
}

/* Styles for screens smaller than 1200px */
@media (max-width: 1199px) {
	.navbar-nav.ms-xl-auto li.nav-item a.nav-link.orange-underline::after {
		display: none; /* Hide the orange underline on smaller screens */
	}
}

</style>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="91"
	style="padding-top: 90px;">

	<jsp:include page="modal.jsp" />
	<jsp:include page="search.jsp" />
	<jsp:include page="alarm.jsp" />
	<!-- 상단 네비바 -->
	<nav class="navbar navbar-expand-xl navbar-light fixed-top bg-white">
		<div class="container">

			<!-- Brand -->
			<a class="navbar-brand" href="/"> <img
				style="margin: 0; height: 1.3em" src="/assets/img/logo/logo.png">
			</a>

			<!-- Toggler -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarLandingCollapse"
				aria-controls="navbarLandingCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="navbarLandingCollapse">

				<!-- Nav -->
				<ul class="navbar-nav ms-xl-auto">
					<!-- 	<li class="nav-item"><a class="nav-link active" href="#welcome"
						data-smoothscroll>기부</a></li>
					<li class="nav-item"><a class="nav-link" href="#products"
						data-smoothscroll>봉사</a></li>
					<li class="nav-item">
					  <a class="nav-link" href="#about" data-smoothscroll>세미나</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#howItWorks"
						data-smoothscroll>ESG#</a></li>
					<li class="nav-item"><a class="nav-link" href="#pricing"
						data-smoothscroll>후기</a></li>
					<li class="nav-item"><a class="nav-link" href="#reviews"
						data-smoothscroll>Reviews</a></li>
					<li class="nav-item"><a class="nav-link" href="#getStarted"
						data-smoothscroll>Get Started</a></li>
						 -->
					<li class="nav-item"><a class="nav-link " href="/donation"
						>기부</a></li>
					<li class="nav-item"><a class="nav-link" href="/volunteer"
						>봉사</a></li>
					<li class="nav-item"><a class="nav-link" href="/seminar"
						>세미나</a></li>
					<li class="nav-item"><a class="nav-link" href="/esgshop"
						>ESG#</a></li>
						
					<li class="nav-item"><a class="nav-link" href="/review"
						>후기</a></li>
					<li class="nav-item"><a class="nav-link" href="/event"
					>이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="/faq"
						>FAQ</a></li>
				
					
						
					<li class="nav-item ms-lg-n4"><a class="nav-link"
					data-bs-toggle="offcanvas" href="#modalSearch"> <i
						class="fe fe-search"></i>
					</a></li>

					<li class="nav-item ms-lg-n4"><a class="nav-link"
					data-bs-toggle="offcanvas" href="#alarmModal"> <span
						data-cart-items="2"> <i class="fe fe-bell"></i>
					</span>
					</a></li>
					<li class="nav-item ms-lg-n4"><a class="nav-link"
							href="/mypage"><img style="width: 25px; border-radius: 50%" src="/assets/img/starfriends/profile1.png"></i>
						</a>
					</li>
					<c:choose>
						<c:when test="${logincust == null}">
							<li class="nav-item ms-lg-n4"><a class="nav-link"
									href="/login"> 로그인 </a></li>
							<li class="nav-item ms-lg-n4"><a class="nav-link"
									href="/register"> 회원가입 </a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item ms-lg-n4"><a class="nav-link"
									href="/logouts"> 로그아웃 </a></li>
						</c:otherwise>
					</c:choose>	
					<li style="display: none;"><a class="nav-link"
							href="./account-wishlist.html"> <i class="fe fe-heart"></i>
						</a></li>
				</ul>

				<!-- Nav 
				<ul class="navbar-nav ms-xl-4">
					<li style="display: none;"><a class="nav-link"
						href="./account-wishlist.html"> <i class="fe fe-heart"></i>
					</a></li>
					
					<div id="userpageDropdown" class="dropdown">
						<a href="#" role="button" id="userpage" data-bs-toggle="dropdown"
							aria-expanded="false"> <i class="fe fe-user"></i>
						</a>

						<ul class="dropdown-menu" aria-labelledby="userpage">
							<li><a class="dropdown-item" href="/mypage">마이페이지</a></li>
							<li><a class="dropdown-item" href="#">채팅방</a></li>
							<li><a class="dropdown-item" href="/logout">로그아웃</a></li>
						</ul>
					</div>

					<li class="nav-item ms-lg-n4"><a class="nav-link"
						href="/login"> 로그인 </a></li>
					<li class="nav-item ms-lg-n4"><a class="nav-link"
						href="/register"> 회원가입 </a></li>
				</ul> -->

			</div>

		</div>
	</nav>
	<!-- 메인페이지 -->
	<c:choose>
		<c:when test="${center==null}">
			<jsp:include page="center.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="${center}.jsp" />
		</c:otherwise>
	</c:choose>

	<!-- footer -->
	<jsp:include page="footer.jsp" />

	<!-- JAVASCRIPT -->
	<!-- Map (replace the API key to enable) -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>

	<!-- Vendor JS -->
	<script src="/assets/js/vendor.bundle.js"></script>

	<!-- Theme JS -->
	<script src="/assets/js/theme.bundle.js"></script>
	<script>
		// 현재 URL을 가져오는 함수
		function getCurrentURL() {
			return window.location.href;
		}

		// 세미나와 후기 항목의 데이터 속성을 이용하여 색상 변경
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var navItems = document
									.querySelectorAll(".navbar-nav.ms-xl-auto li.nav-item a.nav-link");

							navItems.forEach(function(item) {
								var targetURL = item.getAttribute("href");
								var currentURL = getCurrentURL();

								if (currentURL.includes(targetURL)) {
									item.classList.add("orange-underline"); // 주황색 밑줄 추가
								}
							});
						});
	</script>


</body>
</html>
