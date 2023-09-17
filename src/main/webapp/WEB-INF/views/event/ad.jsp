<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>


</style>
<section style="display: flex; flex-direction: column; align-items: center; padding: 10px;">	
	<div class="col-12 col-md-8">
<h1>광고 시청 시 포인트지급</h1>

    <video id="videoPlayer" controls width="640" height="360">
        <source src="/assets/videos/똑똑1388.mp4" type="video/mp4">
    </video>
</div>
</section>

    <script>
        var videoPlayer = document.getElementById('videoPlayer');
        var hasSkipped = false;

        // 동영상 재생이 완료되었을 때 이벤트 핸들러 추가
        videoPlayer.addEventListener('ended', function() {
            if (hasSkipped) {
                alert('스킵해서 포인트지급x');
            }else{
            	//나중엔 여기에 재생시간을 db에 같이 저장해서 그 시간이 초과되었을 때만..!!! 
            	alert('포인트지급')
            }
        });

        // 동영상 스킵이 발생했을 때 이벤트 핸들러 추가
        videoPlayer.addEventListener('seeked', function() {
            hasSkipped = true;
            alert('영상을 스킵하시면, 포인트리가 지급되지 않습니다. 처음부터 다시 진행해주세요!');
        });

        // 자동배속을 방지하기 위해 playbackRate를 설정
        videoPlayer.playbackRate = 1; // 일반 재생 속도 (기본값)
    </script>
