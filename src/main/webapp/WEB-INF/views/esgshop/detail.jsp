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

#sharingBtn {
	display: flex;
	justify-content: center;
}

#sharingBtn img {
	width: 2rem;
	margin: 1rem 1rem;
	border-radius: 3px;
	cursor: pointer;
}

.recent-title{
	color: black;
	font-size:  1.1rem;
	font-weight: 600;
}
.recent-title:hover {
	color: darkorange;
}
</style>
<script>

$(document).ready(function() {
    // 페이지 로드시 조회수 업데이트 요청 보내기
    updateViews();


    var esgshopDateStr = "${esgshop.ddate}"; // 날짜 문자열
    var esgshopDate = new Date(esgshopDateStr);
    var days = ['일', '월', '화', '수', '목', '금', '토'];
    var esgshopDayOfWeek = days[esgshopDate.getDay()]; // 0~6을 요일로 매핑
    var formattedDate = esgshopDateStr + ' ' + esgshopDayOfWeek + '요일';

    console.log(formattedDate);
    $("#esgshop-date").html(formattedDate);
    
    
});



function updateViews() {

    var esgshopId = ${esgshop.esgId};

    $.ajax({
        type: "POST", 
        url: "/esgshop/update-views",
        data: { id: esgshopId }, // 상품 아이디를 전달
    	beforeSend : function(xhr,set){
    		console.log('beforeSend 탄다. csrf 토큰확인');
			let token = $("meta[name='_csrf']").attr("content");
			//let token = 'fd6d1c70-afcd-4f76-80b1-69bba0910809' //내가 임의로 토큰값 수정해서 보내면 오류난다..!!신기함
			let header =$("meta[name='_csrf_header']").attr("content");
			
		
	        xhr.setRequestHeader("X-CSRF-Token", token);
			xhr.setRequestHeader(header,token);
		},
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


function checkLikesOrNot() {
    // 사용자가 좋아요를 누른 상태인지 아닌지 체크
    console.log('좋아요 누른 이력을 확인합니다.');
    
    let esgshopId = ${esgshop.esgId};
    let loginCustId = $('#loginCustId').val();
    
    if (loginCustId) {
    	console.log(loginCustId+'님접속')
    	
   	  $.ajax({
   	        type: "POST", 
   	        url: "/esgshop/check-likes",
   	        data: { contentsId: esgshopId,
   	        		custId: loginCustId},
       		beforeSend : function(xhr,set){
        		console.log('beforeSend 탄다. csrf 토큰확인!!');
    			let token = $("meta[name='_csrf']").attr("content");
    			//let token = 'fd6d1c70-afcd-4f76-80b1-69bba0910809' //내가 임의로 토큰값 수정해서 보내면 오류난다..!!신기함
    			let header =$("meta[name='_csrf_header']").attr("content");
    			
    		
    	        xhr.setRequestHeader("X-CSRF-Token", token);
    			xhr.setRequestHeader(header,token);
    		},
   	        success: function(response) {
   	            console.log(response + ' response');

   	       		if (response === 0){
	            	// 좋아요 한번도 안누른 상태 
   	       			popup('해당 상품을 관심 상품으로 등록하시겠습니까?', true, regLike , "");
	                
	            }else if (response === 1) {
	            	//이미 좋아요 누른상태
	            	popup('이미 관심상품으로 등록하셨습니다. 관심상품 페이지로 이동할까요?', true, "" , "");
   	                
   	            }else if (response === 2) {
   	           		//좋아요 눌렀던 이력이 있으나, is_likes N 인상태
   	       			popup('해당 상품을 관심 상품으로 등록하시겠습니까?', true, updateLike , "");
   	            }
	            else{
   	            	popup('일시적인 오류가 발생했습니다. 다시 시도해 주세요.', false, "" , "");
   	                
   	            }
   	            
   	        },
   	        error: function() {
   	            console.error("Error checkLikesOrNot.");
   	        }
   	    });
      
    }else{
    	popup('로그인 후 이용하실 수 있습니다.<br> 로그인하러 가시겠습니까?', true, goToLogin, '');
    };
    
    
}

function regLike() {
	console.log('처음으로 찜을 하신 고객님이십니다.');
	
    var likesCount = document.getElementById('likesNum');
    likesCount.textContent = parseInt(likesCount.textContent) + 1;
    
    var esgshopId = ${esgshop.esgId};
    var loginCustId = $('#loginCustId').val();
    
    $.ajax({
        type: "POST", 
        url: "/esgshop/reg-like",
        data: { contentsId: esgshopId,
       			custId: loginCustId}, // 상품 아이디를 전달
        success: function(response) {
            console.log(response + ' response');
           
            popup('관심상품으로 등록되었습니다. 관심상품 페이지로 이동할까요?', true, "" , "");
        },
        error: function() {
            console.error("Error updating views.");
        }
    });
    
    
}

function updateLike() {
	console.log('이전에 찜했다가 삭제하신 고객님이십니다.');
	
    var likesCount = document.getElementById('likesNum');
    likesCount.textContent = parseInt(likesCount.textContent) + 1;
    
    var esgshopId = ${esgshop.esgId};
    var loginCustId = $('#loginCustId').val();
    
    $.ajax({
        type: "POST", 
        url: "/esgshop/update-like",
        data: { contentsId: esgshopId,
       			custId: loginCustId}, // 상품 아이디를 전달
        success: function(response) {
            console.log(response + ' response');
           
            popup('관심상품으로 등록되었습니다. 관심상품 페이지로 이동할까요?', true, "" , "");
        },
        error: function() {
            console.error("Error updating views.");
        }
    });
    
    
}

</script>
<!-- BREADCRUMB -->
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 fs-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400" href="/">Home</a></li>
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="/esgshop">Esgshop</a></li>
					<li class="breadcrumb-item active">${esgshop.esgId}_${esgshop.title}</li>
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
					<time class="text-uppercase" datetime="${esgshop.ddate}">${esgshop.ddate}</time>
				</div>

				<!-- Image -->
				<img class="card-img-top" src="/uimg/${esgshop.imageMain}">
			</div>
		</div>
		<div style="display: flex; flex-direction: column;"
			class="col-12 col-md-4 sticky-container"">
			<p>📒 상품</p>
			<h5>${esgshop.title}</h5>
			<p>${esgshop.comment}</p>
			<div style="display: flex;">
				<span class="recruitment">정원 ${esgshop.target}명</span><span
					class="participants">${esgshop.targetIn}명 참여</span> <span
					class="${(esgshop.dDay == 0) ? 'deadline-red' : (esgshop.dDay < 0) ? 'deadline-gray' : (esgshop.dDay <= 3) ? 'deadline-red' : 'deadline-orange'}">
					<c:choose>
						<c:when test="${esgshop.dDay <= 0}">
							<c:choose>
								<c:when test="${esgshop.dDay == 0}">
				               	 금일마감
				           		</c:when>
								<c:otherwise>
				            	    마감완료
				            	</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
				       	 마감 ${esgshop.dDay}일 전
				    	</c:otherwise>
					</c:choose>
				</span>

			</div>
			<div class="preference">
				<span><img style="width: 25px;"
					src="/assets/img/starfriends/starcoin.png">
					${esgshop.rewardCoin}개</span> <span style="margin-left: 3px;" oncl><img
					style="width: 25px;"
					src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">찜하기<span
					id="likesNum">${esgshop.likesCount}</span>명 </span> <span>👀조회 <span
					style="margin-right: 0" id="view-count"> ${esgshop.view}</span>명
				</span>
			</div>
			<div id="buttons">

				<c:choose>
					<c:when test="${esgshop.dDay < 0}">
						<button
							style="width: 33%; background-color: #E6E6E6; cursor: default;">
							<i class="fa fa-heart"></i> 찜하기
						</button>
						<button
							style="width: 66%; background-color: #E6E6E6; cursor: default;">종료</button>
					</c:when>
					<c:otherwise>
						<button id="likesBtn" style="width: 33%"
							onclick="checkLikesOrNot()">
							<i class="fa fa-heart"></i> 찜하기
						</button>
						<button style="width: 66%" onclick="joinEsgshopPopup()">구매하기</button>

					</c:otherwise>
				</c:choose>

			</div>
			<!-- 종료 시 참여하기 -> 종료로 변경  -->

			<div class="location-detail">
				<span class="mb-3"><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/727/727606.png">
					장소 : ${esgshop.location}</span> <span><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/10691/10691802.png">
					날짜 : <span id="esgshop-date"></span></span>
			</div>

			<div id="sharingBtn">
				<img src="/assets/img/logo/liivtalktalk.png"
					onclick="sharingLiivTT()"> <img
					src="/assets/img/logo/KakaoTalk.png" onclick="sharingKakao()">
				<img src="/assets/img/logo/facebook.png" onclick="sharingFacebook()">
				<img src="/assets/img/logo/twitter.png" onclick="sharingTwitter()">
			</div>

		</div>

		<div class="col-12 col-md-8">
			<!-- Image -->

			<div>${esgshop.content}</div>
			<img class="card-img-top" src="/uimg/${esgshop.imageSub}">

		</div>

		<div class="col-12 col-md-8 mt-10">
			<c:choose>
				<c:when test="${logincust.custName != null}">
					<h5>${logincust.custName}님께서 최근에 보신 상품이에요👀</h5>
				</c:when>
				<c:otherwise>
					<h5>고객님께서 최근에 보신 상품에요👀</h5>
				</c:otherwise>
			</c:choose>

			<div id="recentlyViewedList" class="row"></div>
		</div>
	</div>
</div>
<input type="hidden" id="esgId"  value="${esgshop.esgId}">
<input type="hidden" id="topicBig"  value="${esgshop.topicBig}">
<input type="hidden" id="title"  value="${esgshop.title}">
<input type="hidden" id="location"  value="${esgshop.location}">
<input type="hidden" id="ddate"  value="${esgshop.ddate}">
<input type="hidden" id="starcoin" value="${esgshop.rewardCoin}">
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<script>
	const urlParams = new URLSearchParams(window.location.search);
	const esgshopId = urlParams.get('id');
	console.log('esgshopId:', esgshopId);
	
	// 사용자 ID를 어딘가에서 가져오거나 하드코딩합니다.
	const userId = $('#loginCustId').val();
	
	// 사용자의 최근 상품 목록을 로컬 스토리지에서 가져옵니다.
	let recentEsgshops = localStorage.getItem(userId + '_recent_esgshops');
	if (!recentEsgshops) {
	    recentEsgshops = [];
	} else {
	    recentEsgshops = JSON.parse(recentEsgshops);
	}
	
	// 중복을 체크하여 상품 ID를 목록에 추가합니다.
	if (!recentEsgshops.includes(esgshopId)) {
	    // 최대 6개까지만 유지하도록 처리
	    if (recentEsgshops.length >= 7) {
	    	//7개를 저장하는 이유는.. 지금 저장된 거(즉 현재 페이지의 상품는 제외하고 뿌릴려고...)
	        recentEsgshops.pop(); // 맨 뒤의 항목 제거
	    }
	    recentEsgshops.unshift(esgshopId); // 맨 앞에 항목 추가
	}


	// 최근 상품 목록을 로컬 스토리지에 저장합니다.
	localStorage.setItem(userId + '_recent_esgshops', JSON.stringify(recentEsgshops));
	
	getRecentlyViewed();
	
function getRecentlyViewed() {
    console.log('최근에 조회한 상품 리스트를 뿌리자');

    const storedRecentEsgshops = JSON.parse(localStorage.getItem(userId + '_recent_esgshops'));

    // 현재 사용자가 조회하고 있는 상품의 ID, 이건 제외하고 뿌린다.
    const currentEsgshopId = $('#esgId').val(); 
	console.log(currentEsgshopId+'currentEsgshopId');
    // 확인을 위한 로그 출력
    console.log(userId + '_recent_esgshops:', storedRecentEsgshops);

    if (storedRecentEsgshops && storedRecentEsgshops.length > 0) {
        // 현재 사용자가 조회하고 있는 상품 ID를 배열에서 제외합니다.
        const filteredRecentEsgshops = storedRecentEsgshops.filter(esgshopId => esgshopId !== currentEsgshopId);

        const esgshopDetails = [];

        filteredRecentEsgshops.forEach(esgshopId => {
            const ajaxUrl = '/esgshop/recently-viewed?id=' + esgshopId;

            fetch(ajaxUrl)
                .then(response => response.json())
                .then(data => {
                    esgshopDetails.push(data);

                    if (esgshopDetails.length === filteredRecentEsgshops.length) {
                        console.log('Fetched esgshop details:', esgshopDetails);
                        displayEsgshops(esgshopDetails);
                    }
                })
                .catch(error => {
                    console.error('Error fetching esgshop details:', error);
                });
        });
    } else {
        console.log('No recent esgshops found.');
    }
}


function displayEsgshops(esgshopDetails) {
    esgshopDetails.forEach(esgshop => {
        // 상품 정보를 이용하여 각 요소를 동적으로 생성합니다.
		const esgshopTitleElement = $('<div></div>').addClass('col-6 col-md-4');
		const cardElement = $('<div></div>').addClass('card mb-7 mb-md-0');
		
		// 이미지를 감싸는 링크 엘리먼트 생성
		const imageLinkElement = $('<a></a>').attr('href', 'http://localhost/esgshop/detail?id=' + esgshop.esgId);
		
		// 이미지 엘리먼트 생성
		const imgElement = $('<img>').attr('src', '/uimg/' + esgshop.imageMain).addClass('card-img-top');
		
		const badgeElement = $('<div></div>').addClass('badge bg-white text-body card-badge card-badge-start text-uppercase');
		const timeElement = $('<time>').text(esgshop.ddate);
		const cardBodyElement = $('<div></div>').addClass('card-body px-0 py-7');
		
		// 제목을 감싸는 링크 엘리먼트 생성
		const titleLinkElement = $('<a></a>').attr('href', 'http://localhost/esgshop/detail?id=' + esgshop.esgId);
		
		// 제목 엘리먼트 생성
		const titleElement = $('<p></p>').addClass('mb-3 recent-title').text(esgshop.title);
		
		const contentElement = $('<p></p>').addClass('mb-2').text(esgshop.comment);
		const linkElement = $('<a></a>').addClass('btn btn-link px-0 text-body').attr('href', 'http://localhost/esgshop/detail?id=' + esgshop.esgId).text('자세히 보러가기');
		const iconElement = $('<i></i>').addClass('fe fe-arrow-right ms-2');
		
		// 이미지를 링크 엘리먼트에 추가
		imageLinkElement.append(imgElement);
		
		// 링크 엘리먼트들을 적절한 위치에 추가
		titleLinkElement.append(titleElement);
		cardBodyElement.append(titleLinkElement, contentElement, linkElement.append(iconElement));
		cardElement.append(imageLinkElement, badgeElement, cardBodyElement);
		esgshopTitleElement.append(cardElement);


        // 생성한 요소를 #recentlyViewedList 요소에 추가합니다.
      	 $("#recentlyViewedList").append(esgshopTitleElement);
    });
}


function joinEsgshopPopup() {
	const esgId = document.getElementById('esgId').value;
	const title = document.getElementById('title').value;
	const location = document.getElementById('location').value;
	const ddate = document.getElementById('ddate').value;
	const starcoin = document.getElementById('starcoin').value;
    const text = "<span style='font-size: 1.4rem;'>상품 '" + title + "'를 신청하시겠습니까?</span><br>🔸장소  : " + location + "<br>🔸날짜 : " + ddate +"<br>🔸스타코인 : " + starcoin +"개 사용";

	popup(text, true, preCheck, "");

	
	
}

function preCheck() {
    var esgshopId = $('#esgId').val();
    var loginCustId = $('#loginCustId').val();
    var topicBig = $('#topicBig').val();
	
    if (loginCustId) {
   	
   	  $.ajax({
   	        type: "GET", 
   	        url: "/apply/pre-check",
   	        data: { contentsId: esgshopId,
   	        		topicBig : topicBig,
   	        		custId: loginCustId},
   	        success: function(response) {
   	        	console.log(response)
   	     		if(response === 0){
   	     			joinEsgshop() 
   	     			
   	     		}else if(response === 1){
   	     	   	
   					popup('이미 신청하신 상품 입니다. 신청 내역 페이지로 이동하시겠습니까? ', true, goToMyPayments,'');
   	     			
   	     		}else{
   					popup('일시적인 오류가 발생했습니다. 다시 시도해주세요', false, '','');
   	     			
   	     		}
   	            
   	        },
   	        error: function() {
   	            console.error("Error checkLikesOrNot.");
   	     		popup('일시적인 오류가 발생했습니다. 다시 시도해주세요', false, '','');
   	        }
   	    });

      
    }else{
    	popup('로그인 후 이용하실 수 있습니다.<br> 로그인하러 가시겠습니까?', true, goToLogin, '');
    };
	
	
	
	
}

function joinEsgshop() {
	window.location.href = "http://localhost/esgshop/join?id=${esgshop.esgId}";
}


function sharingLiivTT() {
	popup('리브똑똑으로 공유하기 : </br> 죄송합니다. 준비 중입니다.', false, '' ,'');
	
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
function goToMyPayments() {
	alert('결제함으로 이동합니다....');
}

</script>
