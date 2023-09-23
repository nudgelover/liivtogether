<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.deadline-gray {
	margin: 10px 3px;
	border-radius: 10px 10px;
	padding: 3px 10px;
	background-color: gray;
	color: white;
}

.preference {
	display: flex;
	padding: 4px;
    align-items: center;
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
}

#sharingBtn{
	display: flex;
	justify-content:center;
}

#sharingBtn img {
	width: 2rem;
	margin: 1rem 1rem;
	border-radius: 3px;
	cursor: pointer;
}
</style>
<script>

$(document).ready(function() {
    // 페이지 로드시 조회수 업데이트 요청 보내기
    updateViews();
    

    var seminarDateStr = "${seminar.ddate}"; // 날짜 문자열
    var seminarDate = new Date(seminarDateStr);
    var days = ['일', '월', '화', '수', '목', '금', '토'];
    var seminarDayOfWeek = days[seminarDate.getDay()]; // 0~6을 요일로 매핑
    var formattedDate = seminarDateStr + ' ' + seminarDayOfWeek + '요일';

    console.log(formattedDate);
    $("#seminar-date").html(formattedDate);
});

function updateViews() {

    var seminarId = ${seminar.semiId};

    $.ajax({
        type: "POST", 
        url: "/seminar/update-views",
        data: { id: seminarId }, // 세미나 아이디를 전달
        success: function(response) {
            console.log(response + ' response');
            if (response === 1) {
                var currentViewCount = parseInt($("#view-count").text());
                var updatedViewCount = currentViewCount + 1;
                $("#view-count").text(updatedViewCount);
            }
        },
        error: function() {
            console.error("Error updating views.");
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
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="/">Home</a></li>
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="/seminar">Seminar</a></li>
					<li class="breadcrumb-item active">No.${seminar.semiId}</li>
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
					<time class="text-uppercase" datetime="${seminar.ddate}">${seminar.ddate}</time>
				</div>

				<!-- Image -->
				<img class="card-img-top"
					src="https://t1.daumcdn.net/news/202211/25/yonhap/20221125144657838kmeg.jpg">
			</div>
		</div>
		<div style="display: flex; flex-direction: column;"
			class="col-12 col-md-4 sticky-container"">
			<p>📒 세미나</p>
			<h5>${seminar.title}</h5>
			<p>${seminar.comment}</p>
			<div style="display: flex;">
				<span class="recruitment">정원 ${seminar.target}명</span><span
					class="participants">${seminar.targetIn}명 참여</span> <span
					class="${(seminar.dDay == 0) ? 'deadline-red' : (seminar.dDay < 0) ? 'deadline-gray' : (seminar.dDay <= 3) ? 'deadline-red' : 'deadline-orange'}">
					<c:choose>
						<c:when test="${seminar.dDay <= 0}">
							<c:choose>
								<c:when test="${seminar.dDay == 0}">
				               	 금일마감
				           		</c:when>
								<c:otherwise>
				            	    마감완료
				            	</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
				       	 마감 ${seminar.dDay}일 전
				    	</c:otherwise>
					</c:choose>
				</span>

			</div>
			<div class="preference">
				<span><img style="width: 25px;" src="/assets/img/starfriends/starcoin.png"> ${seminar.rewardCoin}개</span> 
				<span style="margin-left: 3px;"><img style="width: 25px;" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png"> 찜하기 11명 </span> <span>👀조회
				<span style="margin-right: 0" id="view-count"> ${seminar.view}</span>명</span>
			</div>
			<div id="buttons">
				
				<c:choose>
					<c:when test="${seminar.dDay < 0}">
						<button style="width: 33%; background-color: #E6E6E6; cursor: default;">
						<i class="fa fa-heart"></i> 찜하기
						</button>
	            	  	 <button style="width: 66%; background-color: #E6E6E6; cursor: default;">종료</button>
	          		</c:when>
					<c:otherwise>
						<button style="width: 33%">
						<i class="fa fa-heart"></i> 찜하기
						</button>
        	    		<button style="width: 66%" onclick="joinSeminarPopup()">참여하기</button>
        	    		
		           	</c:otherwise>
				</c:choose>

			</div>
			<!-- 종료 시 참여하기 -> 종료로 변경  -->

			<div class="location-detail">
				<span class="mb-3"><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/727/727606.png">
					장소 : ${seminar.location}</span> <span><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/10691/10691802.png">
					날짜 : <span id="seminar-date"></span></span>
			</div>
			
			<div id="sharingBtn">
				<img src="/assets/img/logo/liivtalktalk.png" onclick="sharingLiivTT()">
				<img src="/assets/img/logo/KakaoTalk.png" onclick="sharingKakao()">
				<img src="/assets/img/logo/facebook.png" onclick="sharingFacebook()">
				<img src="/assets/img/logo/twitter.png" onclick="sharingTwitter()">					
			</div>
			
		</div>

		<div class="col-12 col-md-8">
			<!-- Image -->

			<div>${seminar.content}</div>
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
<input id="semiId" style="display: none;" value="${seminar.semiId}">
<input id="title" style="display: none;" value="${seminar.title}">
<input id="location" style="display: none;" value="${seminar.location}">
<input id="ddate" style="display: none;" value="${seminar.ddate}">
<input id="starcoin" style="display: none;" value="${seminar.rewardCoin}">
<script>
function joinSeminarPopup() {
	const semiId = document.getElementById('semiId').value;
	const title = document.getElementById('title').value;
	const location = document.getElementById('location').value;
	const ddate = document.getElementById('ddate').value;
	const starcoin = document.getElementById('starcoin').value;
    const text = "<span style='font-size: 1.4rem;'>세미나 '" + title + "'를 신청하시겠습니까?</span><br>🔸장소  : " + location + "<br>🔸날짜 : " + ddate +"<br>🔸스타코인 : " + starcoin +"개 사용";

	popup(text, true, joinSeminar, "");

	
	
}

function joinSeminar() {
	window.location.href = "http://localhost/seminar/join?id=${seminar.semiId}";
}


function sharingLiivTT() {
	alert('리브똑똑 공유하기  : 죄송합니다. 준비 중입니다.');
	//가짜로라도 비슷하게 만들어보쟈 ㅎㅎ
	
}


function sharingKakao() {
	alert('카톡 공유하기  : 죄송합니다. 준비 중입니다.');
	//가짜로라도 비슷하게 만들어보쟈 ㅎㅎ
	
}


function sharingFacebook() {
	alert('fb 공유하기  : 죄송합니다. 준비 중입니다.');
	//가짜로라도 비슷하게 만들어보쟈 ㅎㅎ
	
}


function sharingTwitter() {
	alert('tw공유하기  : 죄송합니다. 준비 중입니다.');
	//가짜로라도 비슷하게 만들어보쟈 ㅎㅎ
	
}


</script>
