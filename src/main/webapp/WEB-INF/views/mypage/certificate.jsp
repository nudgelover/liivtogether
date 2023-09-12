<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#pdfDiv{
	
	border: 1px solid orange;
	background-color: gray;
}
</style>
<!-- CONTENT -->
<script src="/assets/js/html2canvas.js"></script>
<script src="/assets/js/jspdf.min.js"></script>
<script>
$(document).ready(function() {
	$('#savePdf').click(function() { // pdf저장 button id
		// 적절한 암호와 옵션을 설정하여 PDF 암호화
		var userName  = $('#userName').val()
		//var userBirth  = $('#userBirth').val()
		//var userPhoneNumber  = $('#userPhoneNumber').val()
		//var userPassword = userBirth+userPhoneNumber
		//var ownerPassword = "iamamannger";
	
		//var encryptionOptions = {
		//    permissions: {
		//        modify: false,
		 //       copy: false
		//    },
		//    encryptionKeyLength: 128 // 키의 길이 설정
		//};

	    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
		
	    // 캔버스를 이미지로 변환
	    var imgData = canvas.toDataURL('image/png');
		     
	    var imgWidth = 210; // 이미지 가로 길이(mm) / A4 기준 210mm
	    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    var imgHeight = canvas.height * imgWidth / canvas.width;
	   // var heightLeft = imgHeight;
	    var margin = 0; // 출력 페이지 여백설정
	    var doc = new jsPDF('p', 'mm');
	    var position = 0;
	       
	    // 첫 페이지 출력
	    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	    //heightLeft -= pageHeight;
	         
	    // 한 페이지 이상일 경우 루프 돌면서 출력
	    //while (heightLeft >= 20) {
	     //   position = heightLeft - imgHeight;
	       // doc.addPage();
	        //doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	        //heightLeft -= pageHeight;
	    //}

			// 도장 이미지 추가
	      var stampImg = new Image();
	      stampImg.src = '/assets/img/logo/kb도장.png'; // 도장 이미지 경로 설정
	      var stampWidth = 30; // 도장 이미지 가로 길이
	      var stampHeight = 30; // 도장 이미지 세로 길이
	      var stampX = 150; // 도장 이미지 위치 X 좌표
	      var stampY = 200; // 도장 이미지 위치 Y 좌표
	      
	      var kbIogo = new Image();
	      kbIogo.src = '/assets/img/logo/kbbank.jpg'; // 도장 이미지 경로 설정
	      var kbIogoWidth = 30; // 도장 이미지 가로 길이
	      var kbIogoHeight = 20; // 도장 이미지 세로 길이
	      var kbIogoX = 180; // 도장 이미지 위치 X 좌표
	      var kbIogoY = 10; // 도장 이미지 위치 Y 좌표


      	// 도장 이미지 추가
     	// doc.addImage(stampImg, 'PNG', stampX, stampY, stampWidth, stampHeight);
   		// doc.addImage(kbIogo, 'jpg', kbIogoX, kbIogoY, kbIogoWidth, kbIogoHeight);

	      //상단에 기부증명서-2023-096 이런식으로 가라 출력하기..ㅎ...
	      
	      

		//doc.setEncryption("userpassword", "ownerpassword", options);
	   	//doc.setEncryption(userPassword, ownerPassword, encryptionOptions); 아ㅠㅠ이라이브러리는 암호화기능이없네...우짜제
		// 파일 저장
	    doc.save(userName+'_리브투게더증명서.pdf');  
		});
	});
})
</script>

<section class="py-6">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">
				<!-- Icon -->
				<div class="mb-7 fs-1">증명서발급하기</div>
			
				<div>
					<p>나중엔 다 히든으로 바꿀것</p>
					<input id="userName" value="" placeholder="이름">
					<input id="topicBig" value="" placeholder="topicBig">
					<input id="title" value="" placeholder="title">
				</div>

				
				<input value="회사제출용" type="radio" id="certBtn1" name="radioType1" onclick="certBtnClick(this.id)">
				<lable for="certBtn1">회사제출용</label>
				
				<input value="세무서 제출용" type="radio" id="certBtn2" name="radioType1" onclick="certBtnClick(this.id)">
				<lable for="certBtn2">세무서 제출용</label>
				
				<input value="기타 증빙용" type="radio" id="certBtn3" name="radioType1" onclick="certBtnClick(this.id)">
				<lable for="certBtn3">기타 증빙용</label>
				<div>
					<button type="button" class="btn btn-primary" id="savePdf" >PDF 저장</button>
					<button type="button" class="btn btn-primary" id="sendEmail" >이메일로 전송하기</button>
				</div>
				<p>pdf 예시입니다. 실 증명서에 발급시에만 도장이 출력됩니다</p>
				<div id="pdfDiv">
					<img  style="width: 100px"  alt="logo" src="/assets/img/logo/logo.png">
					<h4>기부 증명서</h4>
					<p style="margin-left: 100px;" class="mt-8">KB국민은행</p>
				    <p>2023년 8월 26일</p>
				</div>
			</div>
		</div>
	</div>
</section>