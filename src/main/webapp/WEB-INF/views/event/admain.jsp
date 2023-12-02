<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#ad1,#ad2, #ad3, #ad4, #ad5{
	position: relative;

}
.adoverlay p{
	padding: 5px 10px;
    background-color: white;
    color: gray;
    border-radius: 50px;
    margin-bottom: 0 !important;

}
.ad-list {
	display: flex;
	gap: 2rem;
	flex-direction: column;
}
.ad-list img{
	width: 100%;
	height: 100%; 
	border-radius: 15px;
}

.event-buttons img:hover{
	border: 3px solid navy;
}
.banner {
	width:100%;
	border-radius:10px;
    background-color: gold; 
    color: #fff; 
    font-size: 1.5em; 
    padding: 10px; 
    overflow: hidden;
    margin-bottom: 1rem;
}

.banner p {
    animation: moveLeft 10s linear infinite;
    white-space: nowrap;
    margin: 0 !important;
}

@keyframes moveLeft {
    0% {
        transform: translateX(100%);
    }
    100% {
        transform: translateX(-100%);
    }
}

</style>

<div style="text-align: center;">
	<div style="width: 100%; background-color: #FFE699;">
		<img style="width:100%; max-width:35rem; height: 10rem;'" src="/assets/img/event/adEvent.png">
	</div>
</div>

<section class="pt-7 pb-12">
	<div class="container">
		<div style="text-align: center; display: flex; justify-content: center; flex-direction: column; align-items: center;" class="col-12">
			<div class="col-12 col-lg-6 ad-list">			
				<a id="ad1" href="/event/admain/ad1"><img src="/assets/img/event/ad1.png"></a> 
				<a id="ad2" href="/event/admain/ad2"><img src="/assets/img/event/ad2.png"></a>
				<a id="ad3" href="/event/admain/ad3"><img src="/assets/img/event/ad3.png"></a> 
				<a id="ad4" href="/event/admain/ad4"><img src="/assets/img/event/ad4.png"></a> 
				<a id="ad5" href="/event/admain/ad5"><img  src="/assets/img/event/ad5.png"></a>
			</div>
		</div>

	</div>
</section>
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<input type="hidden" id="watchOrNot1" value="">
<input type="hidden" id="watchOrNot2" value="">
<input type="hidden" id="watchOrNot3" value="">
<input type="hidden" id="watchOrNot4" value="">
<input type="hidden" id="watchOrNot5" value="">
<script>
const loginCust = $("#loginCustId").val();

$(document).ready(function() {
    if (loginCust) {
    	console.log('로그인해따')
        checkWatchOrNot();
    }
});


function checkWatchOrNot() {
    console.log('checkWatchOrNot')
    var eventNames = ['ad1', 'ad2', 'ad3', 'ad4', 'ad5'];
    var promises = [];

    for (let i = 0; i < eventNames.length; i++) {
        var promise = new Promise(function(resolve, reject) {
            $.ajax({
                url: '/api/event/check-today-do',
                method: 'GET',
                data: {
                    loginCust: loginCust,
                    eventName: eventNames[i]
                },
                success: function(response) {
                    console.log(eventNames[i]); // 정상적으로 출력
                    console.log(response);
                    $('#watchOrNot' + (i + 1)).val(response); // 값이 올바르게 할당
                    resolve();
                },
                error: function(xhr, status, error) {
                    console.error('AJAX 요청 실패:', error);
                    reject(error);
                }
            });
        });
        promises.push(promise);
    }

    Promise.all(promises).then(function() {
        goDisplay();
    });
}


function goDisplay() {
    console.log('도달');
    // 배열로 input 엘리먼트들의 id 정의
    var inputIds = ['watchOrNot1', 'watchOrNot2', 'watchOrNot3', 'watchOrNot4', 'watchOrNot5'];

    for (var i = 0; i < inputIds.length; i++) {
        var inputValue = parseInt($('#' + inputIds[i]).val()); // 해당 input의 값을 정수로 변환

        // 값이 1 이상이면 배경색을 검정색으로 변경
        if (inputValue >= 1) {
            // 이미지 위에 옅은 회색 투명 레이어 생성
            var adOverlay = $('<div class="adoverlay"><p>시청완료</p></div>');
            adOverlay.css({
            	'align-items':'center',
            	'justify-content': 'center',
          		'display': 'flex',
                'position': 'absolute',
                'top': '50%',
                'left': '50%',
                'width': '100%',
                'height': '100%',
                'transform': 'translate(-50%, -50%)',
                'background-color': 'rgba(192, 192, 192, 0.5)', // 옅은 회색 투명 레이어
                'border-radius': '15px'
            });

            // 이미지 엘리먼트에 레이어 추가
            $('#ad' + (i + 1)).append(adOverlay);
        }
    }
}



</script>