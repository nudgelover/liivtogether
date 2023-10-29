<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
#videoPlayer{
 border-radius: 10px;
}

</style>
<div style="text-align: center;">
	<div style="width: 100%; background-color: #FFE699;">
		<img style="width:100%; max-width:35rem; height: 10rem;'" src="/assets/img/event/adEvent.png">
	</div>
</div>


<section
	style="display: flex; flex-direction: column; align-items: center; padding: 10px; text-align: center;">
	<div class="col-12 col-md-6">
		<p style="margin: 5px; float: left;">
			[희망부자] 세상 달콤한 희망을 모으는 사람들 (K-Bee 프로젝트 편)
			</p>

			<video id="videoPlayer" controls width="100%" height="100%">
				<source src="/assets/videos/세상달콤한희망을모으는사람들.mp4" type="video/mp4">
			</video>
	</div>
</section>
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<input type="hidden" id="watchOrNot" value="">
<script>
	const loginCust = $("#loginCustId").val();

	var videoPlayer = document.getElementById('videoPlayer');
	var hasSkipped = false;
	let firstPlay = true; // 처음 실행 여부를 추적하는 변수
	
	videoPlayer.addEventListener('play', function() {
		if (!loginCust) {
			popup('로그인 하신 회원분들만 포인트가 적립됩니다<br> 로그인하러 가시겠습니까?', true, goToLogin, '');
		} else {
			 if (firstPlay) {
		            checkTodayDo(); // 처음 실행일 때만 실행
		            firstPlay = false; // 다음에는 실행되지 않도록 플래그 변경
		        }
		}
	});

	
	videoPlayer.addEventListener('ended', function() {
		console.log('영상종료')
		if (hasSkipped) {
			popup('영상을 스킵하시어 포인트가 지급되지 않습니다. 다시 시청하시겠습니까?', true, rewatch, '')
		} else {
			if($('#watchOrNot').val()==0){
				savePoint(10);
			}else{
				popup('이 영상은 이미 시청하신 영상으로 포인트리가 적립되지 않습니다.',false,'','');
			}
			
		}
	});

	videoPlayer.addEventListener('seeked', function() {
		hasSkipped = true;
		popup('영상을 스킵하시면, 포인트리가 지급되지 않습니다. 처음부터 다시 시청하시겠습니까?', true, rewatch,	'')
	});

	// 자동배속을 방지하기 위해 playbackRate를 설정
	videoPlayer.playbackRate = 1; // 일반 재생 속도 (기본값)

	function rewatch() {
		location.reload();
	}

	function gotoAdMain() {
		window.location = 'http://localhost/event/admain'
	}
	function checkTodayDo() {
		
		// AJAX 호출
	    $.ajax({
	        url: '/api/event/check-today-do',
	        method: 'GET',
	        data: {
	            loginCust: loginCust,
	            eventName: 'ad2',
	        },
	        success: function(response) {
	        		console.log('오늘  참여회수'+response);
					if(response=='0'){
						console.log('미참여');
						$('#watchOrNot').val(response);
					}else{
						$('#watchOrNot').val(response);
						popup('이 영상은 이미 시청하신 영상으로 포인트리가 적립되지 않습니다.',false,'','');
					}

	        },
	        error: function(xhr, status, error) {
	            console.error('AJAX 요청 실패:', error);
	            popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
	        }
	    });
		
	}
	
	function savePoint(point) {
		if (loginCust) {
		    $.ajax({
		        url: '/api/event/eventdata', 
		        method: 'POST',
		        data: {
		            loginCust: loginCust,
		            eventName: 'ad2',
		        	pointsAwarded : point
		        },
		    	beforeSend : function(xhr,set){
					let token = $("meta[name='_csrf']").attr("content");
					let header =$("meta[name='_csrf_header']").attr("content");
				
			        xhr.setRequestHeader("X-CSRF-Token", token);
					xhr.setRequestHeader(header,token);
				},
		        success: function(response) {
		        	
	       			popup('광고시청을 완료하셨습니다. 보상으로 '+point + '포인트리가 내일 적립됩니다!',false,'','');
		        	
		        },
		        error: function(xhr, status, error) {
			   		popup('일시적인 오류가 발생했습니다. 다시시도해주세요', false, '', '');
		            console.error('AJAX 요청 실패:', error);
		        }
		    });
		
		}
	}
</script>
