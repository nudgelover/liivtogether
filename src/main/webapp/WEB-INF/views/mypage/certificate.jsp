<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="py-6">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">
				<!-- Icon -->
				<div class="mb-7 fs-1">증명서발급하기</div>	
			    <form action="${pageContext.request.contextPath}/generatePdf" method="get">
			    	<input id="applyId" name="applyId" value="214" placeholder="applyId">
			        <button type="submit">PDF 발급하기</button>
			    </form>
			    
			        <button type="button" onclick="generatePdf()">Generate PDF</button>
			    
			
				<div>
					<input id="applyId" value="171" placeholder="applyId">
					<input id="donationAmount" value="1000000" placeholder="1000000">
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
			</div>
		</div>
	</div>
</section>


<script>
function generatePdf() {
    // 사용자가 입력한 기부 정보를 수집
    var applyId = $("#applyId").val(); // 예시: 사용자가 입력한 기부 금액
    var donationAmount = $("#donationAmount").val();
    // AJAX 요청 설정
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/generatePdf",
        data: { applyId: applyId,
       	    donationAmount: donationAmount }, // 서버에 전달할 데이터
       	 beforeSend: function (xhr, set) {
             let token = $("meta[name='_csrf']").attr("content");
             let header = $("meta[name='_csrf_header']").attr("content");

             xhr.setRequestHeader("X-CSRF-Token", token);
             xhr.setRequestHeader(header, token);
         },
        success: function(response) {
            // 성공적으로 응답을 받았을 때 실행되는 코드
            console.log(response);
        },
        error: function(error) {
            // 오류가 발생했을 때 실행되는 코드
            console.log(error);
        }
    });
}
</script>