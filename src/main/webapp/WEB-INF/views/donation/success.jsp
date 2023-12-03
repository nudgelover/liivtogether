<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    const content = custName + '님, [' + title + '] 기부가 완료되셨습니다.</br> <a class="alarm-link" href="/donation/detail?id='+linkId+'">기부 상세 페이지로 이동하기<img style="width:15px; margin-left : 5px;" src="/assets/img/icons/link.png"></a>';
    alarm.sendTo(time, receiveId,content);
};
</script>

    <!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">

            <!-- Icon -->
            <div class="mb-7 fs-1">❤️</div>

            <!-- Heading -->
            <h2 class="mb-5">기부가 완료되었습니다!</h2>
       		<p style="display: none" id="linkId">${donation.donaId}</p>
			<p id="title">${donation.title}</p>

            <!-- Text -->
            <p class="mb-7 text-gray-500">
              고객님의 기부<span class="text-body text-decoration-underline"></span>가 성공적으로 완료되었습니다.
              '마이페이지'에서 고객님의 기부내역을 확인하실 수 있습니다!
            </p>

         <button class="btn btn-warning" onclick="goMyAttend('D')"> 나의 기부함로 이동하기</button>

          </div>
        </div>
      </div>
    </section>
<input type="hidden" id="loginCustId" value="${logincust.custId}">
<input type="hidden" id="loginCustName" value="${logincust.custName}">