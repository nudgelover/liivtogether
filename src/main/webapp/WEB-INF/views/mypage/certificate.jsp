<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="py-6">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">
				<!-- Icon -->
				<div class="mb-7 fs-1">증명서발급하기</div>	
			    <form action="${pageContext.request.contextPath}/generatePdf" method="get">
			        <button type="submit">PDF 발급하기</button>
			    </form>
			
				<div>
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
