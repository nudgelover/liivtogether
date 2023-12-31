<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
#tabal1 {
	display: block;
}

#tab_1, #tab_2, #tab3, #tab4, #tab5 {
	display: none;
}

.card-img-top {
	height: 13rem;
}

.heart-icon {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 10;
	cursor: progress;
}

.white {
	color: lightgray; /* Adjust the color of the bookmark icon here */
	font-size: 16px;
}

.white:hover {
	color: red;
	opacity: 50%;
}

.red {
	color: red; /* Adjust the color of the bookmark icon here */
	font-size: 16px;
}

.menulist {
	display: flex;
	justify-content: space-between;
	align-items: baseline;
	margin-bottom: 10px;
}

@media ( max-width : 987px) {
	.menulist {
		flex-direction: column;
	}
	.menulist>div {
		width: 100%;
		justify-content: flex-end;
		margin-bottom: 10px;
	}
}

.menulist label {
	display: block;
	float: right;
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

.dday {
	font-size: small;
	color: orange;
}

.form-check-input:checked {
	background-color: #FFBF00 !important;
}

.form-check-input:checked ~ .form-check-input[type="checkbox"] {
	border-color: #FFBF00 !important;;
}
</style>
<script>

$(document).ready(function() {
    // 초기에 전체보기 최신순을 로드
    fetchOrder('brandNew', '');
});

let currentOrder = ''; // 현재 정렬 순서를 저장할 변수


	function showTab(tab) {

		const allTabs = document.querySelectorAll('.nav-link');
        allTabs.forEach(link => link.classList.remove('active'));
		console.log('[onclick="showTab('+tab+')"]')
        const selectedTab = document.querySelector('[onclick="showTab(\''+tab+'\')"]');
		console.log(selectedTab)
        selectedTab.classList.add('active');
		
		document.getElementById('taball').style.display = 'none';
		document.getElementById('tab_1').style.display = 'none';
		document.getElementById('tab_2').style.display = 'none';
		document.getElementById('tab3').style.display = 'none';
		document.getElementById('tab4').style.display = 'none';
		document.getElementById('tab5').style.display = 'none';

		switch (tab) {
		case 'taball':
			document.getElementById('taball').style.display = 'block';
			fetchOrder('brandNew',''); 
			break;
		case 'tab_1':
			document.getElementById('tab_1').style.display = 'block';
			fetchOrder('brandNew','A');
			break;
		case 'tab_2':
			document.getElementById('tab_2').style.display = 'block';
			fetchOrder('brandNew','B');
			break;
		case 'tab3':
			document.getElementById('tab3').style.display = 'block';
			fetchOrder('brandNew','C');
			break;
		case 'tab4':
			document.getElementById('tab4').style.display = 'block';
			fetchOrder('brandNew','D');
			break;
		case 'tab5':
			document.getElementById('tab5').style.display = 'block';
			fetchOrder('brandNew','E');
			break;
		}
	}


	
	function fetchOrder(order, topicSmall) {
	    currentOrder = order; // 현재 정렬 순서 업데이트
	    console.log(currentOrder+'currentOrder');
	    
	    //페이지네이션 값 초기화
	    let pageOffset = $('#offset').val();
	    //이거 9로 바꿔야한다!!!!!!!!!!!!!!!!
	    $('#offset').val('9');
	    $('.loadmore').css('display', 'inline-block');
	    $('.loadmore-message').css('display', 'none');
	    
	    $("span:contains('최신순')").css('color', '');
	    $("span:contains('인기순')").css('color', '');
	    $("span:contains('마감임박순')").css('color', '');
	    $("span:contains('신청률순')").css('color', '');
	    $("span:contains('조회순')").css('color', '');
	    
	    switch (currentOrder) {
		case 'brandNew':
		    $("span:contains('최신순')").css('color', 'orange');
			break;
		case 'popular':
			$("span:contains('인기순')").css('color', 'orange');
			break;
		case 'deadline':
			 $("span:contains('마감임박순')").css('color', 'orange');
			break;
		case 'targetIn':
			 $("span:contains('신청률순')").css('color', 'orange');
			break;
		case 'views':
			 $("span:contains('조회순')").css('color', 'orange');
			break;
		}

	    const includeClosed = $("#includeClosed" + topicSmall).prop("checked");
	    
	    //id가 중복되서 오류생김
	    console.log(includeClosed+'includeClosed');
	    
	    $.ajax({
	        type: "GET",
	        url: "/esgshop/order",
	        data: {
	            topicSmall: topicSmall,
	            includeClosed: includeClosed,
	            order: currentOrder, // 현재 정렬 순서 전달
	            currentDate: new Date().toISOString().split('T')[0]
	        },
	        success: function(data) {
	            console.log(data);
	            var viewsOrderList = data;
	            $('.esgshop-list').empty(); // 기존 내용 비우고!
       			  viewsOrderList.forEach(function(obj) {
	            	
                    var card = $('<div></div>').addClass('col-12 col-md-4');
                    var cardInner = $('<div></div>').addClass('card mb-7');
                    var heartIcon = $('<div></div>').addClass('heart-icon').attr('data-id', obj.esgId).append($('<i></i>').addClass('fa-solid fa-heart white'));
                   // var badge = $('<div></div>').addClass('badge bg-white text-body card-badge').append($('<time></time>').addClass('text-uppercase').attr('datetime', obj.ddate).text(obj.ddate));
                    var cardImage = $('<img/>').addClass('card-img-top').attr('src', '/uimg/' + obj.imageMain);
                    var cardBody = $('<div></div>').addClass('card-body px-0');
                               
                    var title = obj.title;
                    var rewardCoin = obj.rewardCoin;
                    var targetIn = obj.targetIn;
                    var target = obj.target;
                    var view = obj.view;
                    var dDayText = ""; // dDayText 처리는 동일하게 유지

                    // D-Day 텍스트 처리
                    if (obj.dDay > 3) {
                        dDayText = "<span class='dday'>마감 " + obj.dDay + "일 전";
                    } else if (obj.dDay > 0) {
                        dDayText = "<span class='dday' style='color: red; font-weight: 800'>마감 " + obj.dDay + "일 전</span>";
                    } else if (obj.dDay == 0) {
                        dDayText = "<span class='dday' style='color: red; font-weight: 800'>금일마감</span>";
                    } else {
                        dDayText = "<span class='dday' style='color: darkgray'>마감</span>";
                    }
                    


                    // 요소를 순서대로 추가
                    card.append(cardInner);
                    cardInner.append(heartIcon);
                    //cardInner.append(badge);
                    cardInner.append(cardImage);
                    cardInner.append(cardBody);

                    cardBody.append($('<div></div>').addClass('d-flex justify-content-between').append($('<h6></h6>').text(title)));
                    cardBody.append($('<div></div>').addClass('event-info').append($('<span></span>').append($('<img/>').attr('src', 'https://cdn-icons-png.flaticon.com/512/8146/8146818.png'), rewardCoin + '개'), $('<span></span>').append($('<img/>').attr('src', 'https://cdn-icons-png.flaticon.com/512/2354/2354573.png'), view + '명 조회')));
                    cardBody.append($('<a></a>').addClass('btn btn-link stretched-link px-0 text-reset').attr('href', '/esgshop/detail?id=' + obj.esgId).text('상품구입하기').append($('<i></i>').addClass('fe fe-arrow-right ms-2')));

                    $('.esgshop-list').append(card);
                    
                    
                });
	        },
	        error: function(error) {
		           
	            console.error("Error fetching views order:", error);
	        }
	    });
	}
	
	function updateEsgshopList(topicSmall) {
	   console.log('currentOrder'+ currentOrder);
	   console.log('topicSmall'+topicSmall)
	   fetchOrder(currentOrder, topicSmall);
	}
	
	function getMoreList(topicSmall) {
	    console.log('topicSmall :' + topicSmall);
	    console.log('currentOrder : ' + currentOrder);

	    const includeClosed = $("#includeClosed" + topicSmall).prop("checked");
	    console.log(includeClosed + 'includeClosed');

	    let pageOffset = $('#offset').val();
	    console.log(pageOffset + 'pageOffset');

		    
	    $.ajax({
	        type: "GET",
	        url: "/esgshop/order",
	        data: {
	            topicSmall: topicSmall,
	            includeClosed: includeClosed,
	            order: currentOrder, // 현재 정렬 순서 전달
	            currentDate: new Date().toISOString().split('T')[0],
	            offset : pageOffset
	        },
	        success: function(data) {
	            console.log(data);
	            // 나중에 이거 9로 변경!!!!!!!!9개씩 불러올거니까
	    	    pageOffset = parseInt(pageOffset) + 9;

	    	    // 페이지 오프셋 값을 업데이트
	    	    $('#offset').val(pageOffset);
	    	    console.log(pageOffset + 'pageOffset (updated)');

	    	 	
	    	 // 만약 data가 빈 배열인 경우, 아무것도 없음
	    	    if (data.length === 0) {
	    	        $('.loadmore').css('display', 'none');
	    	        // 새로운 메시지를 추가합니다.
	    	        $('.loadmore-message').css('display', 'inline-block');
	    	    }


	    	    var viewsOrderList = data;
       			  viewsOrderList.forEach(function(obj) {
	            	
                    var card = $('<div></div>').addClass('col-12 col-md-4');
                    var cardInner = $('<div></div>').addClass('card mb-7');
                    var heartIcon = $('<div></div>').addClass('heart-icon').attr('data-id', obj.esgId).append($('<i></i>').addClass('fa-solid fa-heart white'));
                  //  var badge = $('<div></div>').addClass('badge bg-white text-body card-badge').append($('<time></time>').addClass('text-uppercase').attr('datetime', obj.ddate).text(obj.ddate));
                    var cardImage = $('<img/>').addClass('card-img-top').attr('src', 'uimg/' + obj.imageMain);
                    var cardBody = $('<div></div>').addClass('card-body px-0');
                    
                

                    var title = obj.title;
                    var rewardCoin = obj.rewardCoin;
                    var targetIn = obj.targetIn;
                    var target = obj.target;
                    var view = obj.view;
                    var dDayText = ""; // dDayText 처리는 동일하게 유지

                    // D-Day 텍스트 처리
                    if (obj.dDay > 3) {
                        dDayText = "<span class='dday'>마감 " + obj.dDay + "일 전";
                    } else if (obj.dDay > 0) {
                        dDayText = "<span class='dday' style='color: red; font-weight: 800'>마감 " + obj.dDay + "일 전</span>";
                    } else if (obj.dDay == 0) {
                        dDayText = "<span class='dday' style='color: red; font-weight: 800'>금일마감</span>";
                    } else {
                        dDayText = "<span class='dday' style='color: darkgray'>마감</span>";
                    }
                    


                    // 요소를 순서대로 추가
                    card.append(cardInner);
                    cardInner.append(heartIcon);
                   // cardInner.append(badge);
                    cardInner.append(cardImage);
                    cardInner.append(cardBody);

                    cardBody.append($('<div></div>').addClass('d-flex justify-content-between').append($('<h6></h6>').text(title)));
                    cardBody.append($('<div></div>').addClass('event-info').append($('<span></span>').append($('<img/>').attr('src', 'https://cdn-icons-png.flaticon.com/512/8146/8146818.png'), rewardCoin + '개'), $('<span></span>').append($('<img/>').attr('src', 'https://cdn-icons-png.flaticon.com/512/2354/2354573.png'), view + '명 조회')));
                    cardBody.append($('<a></a>').addClass('btn btn-link stretched-link px-0 text-reset').attr('href', '/esgshop/detail?id=' + obj.esgId).text('상품구입하기').append($('<i></i>').addClass('fe fe-arrow-right ms-2')));

                    $('.esgshop-list').append(card);

                    
                });
	        },
	        error: function(error) {
	        	
	            console.error("Error fetching views order:", error);
	        }
	    });
	    
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
					<li class="breadcrumb-item active">Esgshop</li>
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
		<div class="card"
			style="background-image: url(/assets/img/esgshop/지속가능한내일.png); background-size: contain; background-position: right; background-color: #FFCC06; background-repeat: no-repeat;">
			<div class="row" style="height: 18rem">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6 align-self-center">
					<div class="card-body px-md-10 py-11">

						<!-- Heading -->
						<h4>지속 가능한 내일, KB가 함께합니다</h4>

						<!-- Button -->
						<a class="btn btn-link px-0 text-body"
							href="https://omoney.kbstar.com/quics?page=C101240#loading">
							ESG STAR 보러가기 <i class="fe fe-arrow-right ms-2"></i>
						</a>

					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Item -->
	<div class="w-100">
		<div class="card"
			style="background-image: url(/assets/img/esgshop/스타프렌즈.png); background-size: contain; background-position: center center; background-repeat: no-repeat;">
			<div class="row align-items-center" style="height: 18rem">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6">
					<div class="card-body px-md-10 py-11">
						<!-- Heading -->
						<h4 class="mb-5">지구에게 더 다정한 오늘을 선물하세요!</h4>

						<!-- Button -->
						<a class="btn btn-outline-dark"
							href="https://ko.wikipedia.org/wiki/%EC%83%88%ED%99%9C%EC%9A%A9">
							업사이클링이란? <i class="fe fe-arrow-right ms-2"></i>
						</a>


					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Item -->
	<div class="w-100">
		<div class="card"
			style="background-image: url(/assets/img/esgshop/ESGBanner2.jpg); background-size: contain; background-position: right; background-color: #FAF7F2; background-repeat: no-repeat;">
			<div class="row align-items-center" style="height: 18rem">
				<div class="col-12">
					<div class="card-body px-md-10 py-11 text-center">

						<!-- Preheading -->
						<p class="text-uppercase">KB금융그룹</p>

						<!-- Heading -->
						<h1 class="display-4 text-uppercase">ESG REPORTING</h1>

						<!-- Link -->
						<a class="link-underline text-reset"
							href="https://kbfg.com/Kor/about/sustainability/sustainability.jsp">지속가능경영보고서
							보러가기</a>

					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<input type="hidden" id="offset" value="9">

<!-- CONTENT -->
<section class="pt-7 pb-12">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Heading -->
				<h3 class="mb-7 text-center">ESG Shop</h3>

				<!-- Nav -->
				<nav class="nav justify-content-center mb-5">
					<a id="tabAllBtn" class="nav-link active"
						href="javascript:void(0);" onclick="showTab('taball')">All</a> <a
						class="nav-link" href="javascript:void(0);"
						onclick="showTab('tab_1')">텀블러</a> <a class="nav-link"
						href="javascript:void(0);" onclick="showTab('tab_2')">친환경상품</a> <a
						class="nav-link" href="javascript:void(0);"
						onclick="showTab('tab3')">업사이클링</a> <a class="nav-link"
						href="javascript:void(0);" onclick="showTab('tab4')">우대금리쿠폰</a> <a
						class="nav-link" href="javascript:void(0);"
						onclick="showTab('tab5')">기타</a>
				</nav>

			</div>
		</div>

		<div id="taball">
			<div class="menulist">
				<h2>전체</h2>

				<div>
					<span style="color: orange;" onclick="fetchOrder('brandNew', '')">최신순</span>
					<span onclick="fetchOrder('popular', '')">인기순</span> <span
						onclick="fetchOrder('deadline', '')">마감임박순</span> <span
						onclick="fetchOrder('targetIn', '')">신청률순</span> <span
						onclick="fetchOrder('views', '')">조회순</span> </br> <label> <input
						class="form-check-input" type="checkbox" id="includeClosed"
						name="includeClosed" onclick="updateEsgshopList('')"> 마감
						포함
					</label>
				</div>
			</div>

			<div class="row esgshop-list"></div>
			<div class="row">
				<div class="col-12">

					<!-- Progress -->
					<div class="row justify-content-center mt-7">
						<div class="col-12 text-center load-more-box">

							<!-- Button -->
							<button class="btn btn-sm btn-outline-dark loadmore"
								onclick="getMoreList('')">더보기</button>
							<p style="display: none;" class="loadmore-message">더 이상 불러올
								데이터가 없습니다.</p>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div id="tab_1" style="display: none;">
			<div class="menulist">
				<h2>텀블러</h2>
				<div>
					<span style="color: orange;" onclick="fetchOrder('brandNew', 'A')">최신순</span>
					<span onclick="fetchOrder('popular', 'A')">인기순</span> <span
						onclick="fetchOrder('deadline', 'A')">마감임박순</span> <span
						onclick="fetchOrder('targetIn', 'A')">신청률순</span> <span
						onclick="fetchOrder('views', 'A')">조회순</span> </br> <label> <input
						class="form-check-input" type="checkbox" id="includeClosedA"
						name="includeClosed" onclick="updateEsgshopList('A')"> 마감
						포함
					</label>
				</div>
			</div>

			<div class="row esgshop-list"></div>
			<div class="row">
				<div class="col-12">

					<!-- Progress -->
					<div class="row justify-content-center mt-7">
						<div class="col-12 text-center load-more-box">

							<!-- Button -->
							<button class="btn btn-sm btn-outline-dark loadmore"
								onclick="getMoreList('A')">더보기</button>
							<p style="display: none;" class="loadmore-message">더 이상 불러올
								데이터가 없습니다.</p>
						</div>
					</div>

				</div>
			</div>
		</div>



		<div id="tab_2" style="display: none;">
			<div class="menulist">
				<h2>친환경 상품</h2>
				<div>
					<span style="color: orange;" onclick="fetchOrder('brandNew', 'B')">최신순</span>
					<span onclick="fetchOrder('popular', 'B')">인기순</span> <span
						onclick="fetchOrder('deadline', 'B')">마감임박순</span> <span
						onclick="fetchOrder('targetIn', 'B')">신청률순</span> <span
						onclick="fetchOrder('views', 'B')">조회순</span> </br> <label> <input
						class="form-check-input" type="checkbox" id="includeClosedB"
						name="includeClosed" onclick="updateEsgshopList('B')"> 마감
						포함
					</label>
				</div>
			</div>

			<div class="row esgshop-list"></div>
			<div class="row">
				<div class="col-12">

					<!-- Progress -->
					<div class="row justify-content-center mt-7">
						<div class="col-12 text-center load-more-box">

							<!-- Button -->
							<button class="btn btn-sm btn-outline-dark loadmore"
								onclick="getMoreList('B')">더보기</button>
							<p style="display: none;" class="loadmore-message">더 이상 불러올
								데이터가 없습니다.</p>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div id="tab3" style="display: none;">
			<div class="menulist">
				<h2>업사이클링</h2>
				<div>
					<span style="color: orange;" onclick="fetchOrder('brandNew', 'C')">최신순</span>
					<span onclick="fetchOrder('popular', 'C')">인기순</span> <span
						onclick="fetchOrder('deadline', 'C')">마감임박순</span> <span
						onclick="fetchOrder('targetIn', 'C')">신청률순</span> <span
						onclick="fetchOrder('views', 'C')">조회순</span> </br> <label> <input
						class="form-check-input" type="checkbox" id="includeClosedC"
						name="includeClosed" onclick="updateEsgshopList('C')"> 마감
						포함
					</label>
				</div>
			</div>

			<div class="row esgshop-list"></div>
			<div class="row">
				<div class="col-12">

					<!-- Progress -->
					<div class="row justify-content-center mt-7">
						<div class="col-12 text-center load-more-box">

							<!-- Button -->
							<button class="btn btn-sm btn-outline-dark loadmore"
								onclick="getMoreList('C')">더보기</button>
							<p style="display: none;" class="loadmore-message">더 이상 불러올
								데이터가 없습니다.</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div id="tab4" style="display: none;">

			<div class="menulist">
				<h2>우대금리쿠폰</h2>
				<div>
					<span style="color: orange;" onclick="fetchOrder('brandNew', 'D')">최신순</span>
					<span onclick="fetchOrder('popular', 'D')">인기순</span> <span
						onclick="fetchOrder('deadline', 'D')">마감임박순</span> <span
						onclick="fetchOrder('targetIn', 'D')">신청률순</span> <span
						onclick="fetchOrder('views', 'D')">조회순</span> </br> <label> <input
						class="form-check-input" type="checkbox" id="includeClosedD"
						name="includeClosed" onclick="updateEsgshopList('D')"> 마감
						포함
					</label>
				</div>
			</div>

			<div class="row esgshop-list"></div>
			<div class="row">
				<div class="col-12">

					<!-- Progress -->
					<div class="row justify-content-center mt-7">
						<div class="col-12 text-center load-more-box">

							<!-- Button -->
							<button class="btn btn-sm btn-outline-dark loadmore"
								onclick="getMoreList('D')">더보기</button>
							<p style="display: none;" class="loadmore-message">더 이상 불러올
								데이터가 없습니다.</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div id="tab5" style="display: none;">
			<div class="menulist">
				<h2>기타</h2>
				<div>
					<span style="color: orange;" onclick="fetchOrder('brandNew', 'E')">최신순</span>
					<span onclick="fetchOrder('popular', 'E')">인기순</span> <span
						onclick="fetchOrder('deadline', 'E')">마감임박순</span> <span
						onclick="fetchOrder('targetIn', 'E')">신청률순</span> <span
						onclick="fetchOrder('views', 'E')">조회순</span> </br> <label> <input
						class="form-check-input" type="checkbox" id="includeClosedE"
						name="includeClosed" onclick="updateEsgshopList('E')"> 마감
						포함
					</label>
				</div>
			</div>

			<div class="row esgshop-list"></div>

			<div class="row">
				<div class="col-12">

					<!-- Progress -->
					<div class="row justify-content-center mt-7">
						<div class="col-12 text-center load-more-box">

							<!-- Button -->
							<button class="btn btn-sm btn-outline-dark loadmore"
								onclick="getMoreList('E')">더보기</button>
							<p style="display: none;" class="loadmore-message">더 이상 불러올
								데이터가 없습니다.</p>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>

</section>

