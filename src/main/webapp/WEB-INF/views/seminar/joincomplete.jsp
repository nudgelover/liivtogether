<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
    setTimeout(function() {
        sendAlarm();
    }, 1000); // 1초 후에 실행
});

function sendAlarm() {
    const currentDate = new Date();
    const options = { timeZone: 'Asia/Seoul', year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit',fractionalSecondDigits: 3};
    const koreanTime = currentDate.toLocaleString('ko-KR', options);
    
    const time = koreanTime;
    const receiveId = $('#loginCustId').val();
    const custName = $('#loginCustName').val();
    const title = $('#title').html();
    const linkId = $('#linkId').html();
    const content = custName + '님, [' + title + '] 세미나 신청이 완료되셨습니다.</br> <a class="alarm-link" href="/seminar/detail?id='+linkId+'">세미나 상세 페이지로 이동하기<img style="width:15px; margin-left : 5px;" src="/assets/img/icons/link.png"></a>';
  
    alarm.sendTo(time, receiveId,content);
};
</script>



<!-- CONTENT -->
<section class="py-12">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">

				<!-- Icon -->
				<div class="mb-7 fs-1"><img style="width: 50%" src ="/assets/img/starfriends/thank.gif"></div>

				<!-- Heading -->
				<h3 class="mb-5">세미나에 참여해주셔서 감사합니다.</h3>
				<p style="display: none" id="linkId">${seminar.semiId}</p>
				<p id="title">${seminar.title}</p>
				<!-- Text -->
		
				<!-- Button -->
				</br> <button class="btn btn-warning" onclick="goMyAttend('S')"> 나의 세미나로 이동하기</button>

			</div>
		</div>
	</div>
</section>
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<input type="hidden" id="loginCustName" value="${logincust.custName}">