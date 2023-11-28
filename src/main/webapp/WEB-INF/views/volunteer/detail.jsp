<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    

    var volunteerDateStr = "${volunteer.ddate}"; // 날짜 문자열
    var volunteerDate = new Date(volunteerDateStr);
    var days = ['일', '월', '화', '수', '목', '금', '토'];
    var volunteerDayOfWeek = days[volunteerDate.getDay()]; // 0~6을 요일로 매핑
    var formattedDate = volunteerDateStr + ' ' + volunteerDayOfWeek + '요일';

    console.log(formattedDate);
    $("#volunteer-date").html(formattedDate);
});

function joinVolunteerPopup() {
    const voluId = document.getElementById('voluId').value;
    const title = document.getElementById('title').value;
    const location = document.getElementById('location').value;
    const ddate = document.getElementById('ddate').value;
    const starcoin = document.getElementById('starcoin').value;
    const pointree = document.getElementById('pointree').value;
    const text = "<span style='font-size: 1.4rem;'>'" + title + "' 봉사를 신청하시겠습니까?</span><br>🔸장소  : " + location + "<br>🔸날짜 : " + ddate +"<br>🔸스타코인 : " + starcoin +"개 적립";

    popup(text, true, preCheck, "");
};


function updateViews() {

	 var volunteerId = ${volunteer.voluId};

    $.ajax({
        type: "POST", 
        url: "/volunteer/update-views",
        data: { id: volunteerId }, // 세미나 아이디를 전달
    	beforeSend : function(xhr,set){
    		console.log('beforeSend 탄다. csrf 토큰확인');
			let token = $("meta[name='_csrf']").attr("content");
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
    
    var volunteerId = ${volunteer.voluId};
    let loginCustId = $('#loginCustId').val();
    
    if (loginCustId) {
    	console.log(loginCustId+'님접속')
    	
   	  $.ajax({
   	        type: "POST", 
   	        url: "/volunteer/check-likes",
   	        data: { contentsId: volunteerId,
   	        		custId: loginCustId},
       		beforeSend : function(xhr,set){
        		console.log('beforeSend 탄다. csrf 토큰확인!!');
    			let token = $("meta[name='_csrf']").attr("content");
    			let header =$("meta[name='_csrf_header']").attr("content");
    		
    	        xhr.setRequestHeader("X-CSRF-Token", token);
    			xhr.setRequestHeader(header,token);
    		},
   	        success: function(response) {
   	            console.log(response + ' response');

   	       		if (response === 0){
	            	// 좋아요 한번도 안누른 상태 
   	       			popup('해당 봉사활동를 관심 봉사활동으로 등록하시겠습니까?', true, regLike , "");
	                
	            }else if (response === 1) {
	            	//이미 좋아요 누른상태
	            	popup('이미 관심 봉사활동으로 등록하셨습니다. 관심 봉사 페이지로 이동할까요?', true, goToWish , "");
   	                
   	            }else if (response === 2) {
   	           		//좋아요 눌렀던 이력이 있으나, is_likes N 인상태
   	       			popup('해당 봉사를 관심 봉사로 등록하시겠습니까?', true, updateLike , "");
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
    
    var volunteerId = ${volunteer.voluId};
    var loginCustId = $('#loginCustId').val();
    
    $.ajax({
        type: "POST", 
        url: "/volunteer/reg-like",
        data: { contentsId: volunteerId,
       			custId: loginCustId}, // 세미나 아이디를 전달
        beforeSend : function(xhr,set){
       	     console.log('beforeSend 탄다. csrf 토큰확인!!');
       	     let token = $("meta[name='_csrf']").attr("content");
       	     let header =$("meta[name='_csrf_header']").attr("content");
       	     	
       	     xhr.setRequestHeader("X-CSRF-Token", token);
       	     xhr.setRequestHeader(header,token);
      	},
        success: function(response) {
            console.log(response + ' response');
           
            popup('관심상품으로 등록되었습니다. 관심상품 페이지로 이동할까요?', true, goToWish , "");
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
    
    var volunteerId = ${volunteer.voluId};
    var loginCustId = $('#loginCustId').val();
    
    $.ajax({
        type: "POST", 
        url: "/volunteer/update-like",
        data: { contentsId: volunteerId,
       			custId: loginCustId}, // 세미나 아이디를 전달
        success: function(response) {
            console.log(response + ' response');
           
            popup('관심상품으로 등록되었습니다. 관심상품 페이지로 이동할까요?', true, goToWish , "");
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
						href="/volunteer">volunteer</a></li>
					<li class="breadcrumb-item active">No.${volunteer.voluId}</li>
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
					<time class="text-uppercase" datetime="${volunteer.ddate}">${volunteer.ddate}</time>
				</div>

				<!-- Image -->
				<img class="card-img-top"
					src="/uimg/${volunteer.imageMain}">
			</div>
		</div>
		<div style="display: flex; flex-direction: column;"
			class="col-12 col-md-4 sticky-container"">
			<p>📒 봉사</p>
			<h5>${volunteer.title}</h5>
			<p>${volunteer.comment}</p>
			<div style="display: flex; text-align: center;">
				<span class="recruitment">모집 인원<br/>
				${volunteer.target} 명
				</span><span
					class="participants">
					${volunteer.targetIn} 명
					<br/> 참여중</span> <span
					class="${(volunteer.dDay == 0) ? 'deadline-red' : (volunteer.dDay < 0) ? 'deadline-gray' : (volunteer.dDay <= 3) ? 'deadline-red' : 'deadline-orange'}">
					<c:choose>
						<c:when test="${volunteer.dDay <= 0}">
							<c:choose>
								<c:when test="${volunteer.dDay == 0}">
				               	 금일마감
				           		</c:when>
								<c:otherwise>
				            	    마감완료
				            	</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
				       	 모집마감 <br/> ${volunteer.dDay}일 전
				    	</c:otherwise>
					</c:choose>
				</span>

			</div>
			<div class="preference">
				<span><img style="width: 25px;"
					src="/assets/img/starfriends/starcoin.png">
					${volunteer.rewardCoin}개</span> <span style="margin-left: 3px;"><img
					style="width: 25px;"
					src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">찜하기<span
					id="likesNum">${volunteer.likesCount}</span>명 </span> <span>👀조회 <span
					style="margin-right: 0" id="view-count"> ${volunteer.view}</span>명
				</span>
			</div>
			<div id="buttons">
				
				<c:choose>
					<c:when test="${volunteer.dDay < 0}">
						<button style="width: 33%; background-color: #E6E6E6; cursor: default;">
						<i class="fa fa-heart"></i> 찜하기
						</button>
	            	  	 <button style="width: 66%; background-color: #E6E6E6; cursor: default;">종료</button>
	          		</c:when>
					<c:otherwise>
						<button id="likesBtn" style="width: 33%"
							onclick="checkLikesOrNot()">
							<i class="fa fa-heart"></i> 찜하기
						</button>
        	    		<button style="width: 66%" onclick="joinVolunteerPopup()">봉사 참여하기</button>
        	    		
		           	</c:otherwise>
				</c:choose>

			</div>
			<!-- 종료 시 참여하기 -> 종료로 변경  -->

			<div class="location-detail">
				<span class="mb-3"><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/727/727606.png">
					장소 : ${volunteer.location}</span> <span><img style="width: 20px;"
					src="https://cdn-icons-png.flaticon.com/512/10691/10691802.png">
					봉사일자 : <span id="volunteer-date"></span></span>
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

			<div>${volunteer.content}</div>
			<img class="card-img-top"
				src="/uimg/${volunteer.imageSub}">

		</div>

		<div class="col-12 col-md-8 mt-10">
			<h5> 모집인원이 너무적어요! 의미있는 봉사에 참여해보는 것은 어떠신가요?</h5>
			<div class="row">
			<c:forEach var="obj" items="${rlist}">
					<div class="col-6 col-md-4">

					<!-- Card -->
					<div class="card mb-7 mb-md-0">

						<!-- Image -->
						<img src="/uimg/${obj.imageMain}" alt="..."
							class="card-img-bottom">

						<!-- Badge -->
						<div
							class="badge bg-white text-body card-badge card-badge-start text-uppercase">
							<time datetime="2019-06-20">현재 ${obj.targetIn}명 모집
							</time>
						</div>

						<!-- Body -->
						<div class="card-body px-0 py-7">

							<!-- Heading -->
							<h6 class="mb-3">${obj.title}</h6>

							<!-- Text -->
							<p class="mb-2">${obj.comment}</p>

							<!-- Link -->
							<a class="btn btn-link px-0 text-body" href="/volunteer/detail?id=${obj.voluId}"> 자세히보기 <i
								class="fe fe-arrow-right ms-2"></i>
							</a>

						</div>

					</div>

				</div>
			</c:forEach>
			</div>
		</div>
	</div>
</div>
<input id="voluId" style="display: none;" value="${volunteer.voluId}">
<input id="title" style="display: none;" value="${volunteer.title}">
<input id="location" style="display: none;" value="${volunteer.location}">
<input id="ddate" style="display: none;" value="${volunteer.ddate}">
<input id="starcoin" style="display: none;" value="${volunteer.rewardCoin}">
<input id="pointree" style="display: none;" value="${logincust.pointree}">



<script>


function preCheck() {
    var volunteerId = $('#voluId').val();
    var loginCustId = $('#loginCustId').val();
    var topicBig = $('#topicBig').val();
	
    if (loginCustId) {
   	
   	  $.ajax({
   	        type: "GET", 
   	        url: "/apply/pre-check",
   	        data: { voluId: volunteerId,
   	        		topicBig : topicBig,
   	        		custId: loginCustId},
   	        success: function(response) {
   	        	console.log(response)
   	     		if(response === 0){
   	     			joinVolunteer() 
   	     			
   	     		}else if(response === 1){
   	     	   	
   					popup('이미 신청하신 봉사 입니다. 신청 내역 페이지로 이동하시겠습니까? ', true, goToMyPayments,'');
   	     			
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
    }
};






function joinVolunteer() {
	window.location.href = "http://localhost/volunteer/join?id=${volunteer.voluId}";
};



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
