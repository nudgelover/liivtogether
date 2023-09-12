<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

.menulist label{
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

.dday{
 font-size: small;
 color : orange;
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
    // 초기 정렬 순서와 topicSmall을 전달하여 fetchOrder 함수 호출
    fetchOrder('brandNew', '');
    
    
    $(".heart-icon").click(function() {
        var heartIcon = $(this).find("svg"); // 클릭한 하트 아이콘 내의 <i> 요소 선택

        if (heartIcon.hasClass('red-heart')) {
            heartIcon.removeClass('red-heart'); // 이미 빨간색인 경우 다시 회색으로 변경
        } else {
            heartIcon.addClass('red-heart'); // 빨간색이 아닌 경우 빨간색으로 변경
        }
    });


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
		
		
		document.getElementById('tab1').style.display = 'none';
		document.getElementById('tab2').style.display = 'none';
		document.getElementById('tab3').style.display = 'none';
		document.getElementById('tab4').style.display = 'none';
		document.getElementById('tab5').style.display = 'none';

		switch (tab) {
		case 'taball':
			document.getElementById('taball').style.display = 'block';
			fetchOrder('brandNew',''); 
			//여기 로직 좀 수정해야할듯...
			break;
		case 'tab1':
			document.getElementById('tab1').style.display = 'block';
			fetchOrder('brandNew','A');
			break;
		case 'tab2':
			document.getElementById('tab2').style.display = 'block';
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
			alert('찜기능 완성후 구현 예정');
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
	        url: "/seminar/order",
	        data: {
	            topicSmall: topicSmall,
	            includeClosed: includeClosed,
	            order: currentOrder, // 현재 정렬 순서 전달
	            currentDate: new Date().toISOString().split('T')[0]
	        },
	        success: function(data) {
	            console.log(data);
	            var viewsOrderList = data;
	            $('.seminar-list').empty(); // 기존 내용 비우고!
       			  viewsOrderList.forEach(function(obj) {
	            	
                    var card = $('<div></div>').addClass('col-12 col-md-4');
                    var cardInner = $('<div></div>').addClass('card mb-7');
                    var heartIcon = $('<div></div>').addClass('heart-icon').attr('data-id', obj.semiId).append($('<i></i>').addClass('fa-solid fa-heart white'));
                    var badge = $('<div></div>').addClass('badge bg-white text-body card-badge').append($('<time></time>').addClass('text-uppercase').attr('datetime', obj.ddate).text(obj.ddate));
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
                    cardInner.append(badge);
                    cardInner.append(cardImage);
                    cardInner.append(cardBody);

                    cardBody.append($('<div></div>').addClass('d-flex justify-content-between').append($('<h6></h6>').text(title), $('<span></span>').html(dDayText)));
                    cardBody.append($('<div></div>').addClass('event-info').append($('<span></span>').append($('<img/>').attr('src', 'https://cdn-icons-png.flaticon.com/512/8146/8146818.png'), rewardCoin + '개'), $('<span></span>').append($('<img/>').attr('src', 'https://cdn-icons-png.flaticon.com/512/1286/1286827.png'), ' '+targetIn + '/' + target + '명 참가'), $('<span></span>').append($('<img/>').attr('src', 'https://cdn-icons-png.flaticon.com/512/2354/2354573.png'), view + '명 조회')));
                    cardBody.append($('<a></a>').addClass('btn btn-link stretched-link px-0 text-reset').attr('href', '/seminar/detail?id=' + obj.semiId).text('참여하러가기').append($('<i></i>').addClass('fe fe-arrow-right ms-2')));

                    $('.seminar-list').append(card);
                    
                    
                });
	        },
	        error: function(error) {
		           
	            console.error("Error fetching views order:", error);
	        }
	    });
	}
	
	function updateSeminarList(topicSmall) {
	   console.log('currentOrder'+ currentOrder);
	   console.log('topicSmall'+topicSmall)
	   fetchOrder(currentOrder, topicSmall);
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
	

	<!-- 여기서 부터 광고 foreach 걸면 됨  -->
	<div class="w-100">
		<div class="card bg-cover"
			style="background-color: pink;">
			<div class="row align-items-center" style="height: 15rem">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6">
					<div class="card-body px-md-10 py-5">
						<!-- Heading -->
						<h4 class="mb-5">하트구현하기 광고구현하기 loadmore 스크롤 맨위로 가기</h4>

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
	<!-- 여기까지 광고 foreach 걸면 됨  -->
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
				<h2>전체보기</h2>
			
				<div>
				 <span style="color:orange;" onclick="fetchOrder('brandNew', '')">최신순</span>
		         <span onclick="fetchOrder('popular', '')">인기순</span>
		         <span onclick="fetchOrder('deadline', '')">마감임박순</span>
		         <span onclick="fetchOrder('targetIn', '')">신청률순</span>
		         <span onclick="fetchOrder('views', '')">조회순</span>
		         </br>
		         <label>	
				    <input class="form-check-input" type="checkbox" id="includeClosed" name="includeClosed" onclick="updateSeminarList('')"> 마감 포함
				 </label>
				</div>
			</div>

			<div class="row seminar-list">
			

			</div>
		</div>

		<div id="tab1" style="display: none;">
			<div class="menulist">
				<h2>자산관리</h2>
						<div>
				 <span style="color:orange;" onclick="fetchOrder('brandNew', 'A')">최신순</span>
		         <span onclick="fetchOrder('popular', 'A')">인기순</span>
		         <span onclick="fetchOrder('deadline', 'A')">마감임박순</span>
		         <span onclick="fetchOrder('targetIn', 'A')">신청률순</span>
		         <span onclick="fetchOrder('views', 'A')">조회순</span>
		         </br>
		         <label>	
				    <input class="form-check-input" type="checkbox" id="includeClosedA" name="includeClosed" onclick="updateSeminarList('A')"> 마감 포함
				 </label>
				</div>
			</div>

			<div class="row seminar-list">
				

			</div>
		</div>



		<div id="tab2" style="display: none;">
			<div class="menulist">
				<h2>인문학</h2>
						<div>
				 <span style="color:orange;" onclick="fetchOrder('brandNew', 'B')">최신순</span>
		         <span onclick="fetchOrder('popular', 'B')">인기순</span>
		         <span onclick="fetchOrder('deadline', 'B')">마감임박순</span>
		         <span onclick="fetchOrder('targetIn', 'B')">신청률순</span>
		         <span onclick="fetchOrder('views', 'B')">조회순</span>
		         </br>
		         <label>	
				    <input class="form-check-input" type="checkbox" id="includeClosedB" name="includeClosed" onclick="updateSeminarList('B')"> 마감 포함
				 </label>
				</div>
			</div>

			<div class="row seminar-list">
				
			</div>
		</div>

		<div id="tab3" style="display: none;">
			<div class="menulist">
				<h2>디지털</h2>
				<div>
				 <span style="color:orange;" onclick="fetchOrder('brandNew', 'C')">최신순</span>
		         <span onclick="fetchOrder('popular', 'C')">인기순</span>
		         <span onclick="fetchOrder('deadline', 'C')">마감임박순</span>
		         <span onclick="fetchOrder('targetIn', 'C')">신청률순</span>
		         <span onclick="fetchOrder('views', 'C')">조회순</span>
		         </br>
		         <label>	
				    <input class="form-check-input" type="checkbox" id="includeClosedC" name="includeClosed" onclick="updateSeminarList('C')"> 마감 포함
				 </label>
				</div>
			</div>

			<div class="row seminar-list">
				
			</div>
		</div>
		<div id="tab4" style="display: none;">

			<div class="menulist">
				<h2>북클럽</h2>
				<div>
				 <span style="color:orange;" onclick="fetchOrder('brandNew', 'D')">최신순</span>
		         <span onclick="fetchOrder('popular', 'D')">인기순</span>
		         <span onclick="fetchOrder('deadline', 'D')">마감임박순</span>
		         <span onclick="fetchOrder('targetIn', 'D')">신청률순</span>
		         <span onclick="fetchOrder('views', 'D')">조회순</span>
		         </br>
		         <label>	
				    <input class="form-check-input" type="checkbox" id="includeClosedD" name="includeClosed" onclick="updateSeminarList('D')"> 마감 포함
				 </label>
				</div>
			</div>

			<div class="row seminar-list">
				
			

			</div>




		</div>
		<div id="tab5" style="display: none;">
			<div class="menulist">
				<h2>기타</h2>
				<div>
				 <span style="color:orange;" onclick="fetchOrder('brandNew', 'E')">최신순</span>
		         <span onclick="fetchOrder('popular', 'E')">인기순</span>
		         <span onclick="fetchOrder('deadline', 'E')">마감임박순</span>
		         <span onclick="fetchOrder('targetIn', 'E')">신청률순</span>
		         <span onclick="fetchOrder('views', 'E')">조회순</span>
		         </br>
		         <label>	
				    <input class="form-check-input" type="checkbox" id="includeClosedE" name="includeClosed" onclick="updateSeminarList('E')"> 마감 포함
				 </label>
				</div>
			</div>

			<div class="row seminar-list">
			

			</div>
		</div>


	</div>

</section>

