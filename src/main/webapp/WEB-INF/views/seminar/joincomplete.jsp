<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
    sendAlarm();
});

function sendAlarm() {
    const content = "세미나신청완료!!"
    const postid = "5번세미나"
    const receiveId = $('#loginCustId').val();
    alarm.sendTo(postid, receiveId, content);
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
				<p>${seminar.title}</p>
				<!-- Text -->
		
				<!-- Button -->
				</br> <button class="btn btn-warning" onclick="goMyAttend('S')"> 나의 세미나로 이동하기</button>

			</div>
		</div>
	</div>
</section>
<input type="text" id="loginCustId" value="${logincust.custId}">
<input type="text" id="loginCustName" value="${logincust.custName}">