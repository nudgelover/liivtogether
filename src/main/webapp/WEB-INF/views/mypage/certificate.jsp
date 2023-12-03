<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
#btnChoice {

	font-size: small;
    margin-bottom: 0.3rem;
    background: white;
    padding: 0.8rem;
    border-radius: 10px;
    border: lightgray 2px solid;
    box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
}

.reviewList{
	display: flex;
	flex-direction: column;

}
.reviewList button, #btnChoice {

	font-size: small;
    margin-bottom: 0.3rem;
    background: white;
    padding: 0.8rem;
    border-radius: 10px;
    border: lightgray 2px solid;
    box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
}
.reviewList button:hover {
    border: gold 2px solid;
    color: gold;
}
</style>
<section class="py-6">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">
				<!-- Icon -->
				<div class="mb-7 fs-1">기부 증명서 발급하기</div>	
				<button id="btnChoice" style="border: gold 1px solid; margin: 10px 0 20px 0" onclick="openLayer()">증명서를 발급하실 기부 내역을 선택해주세요.</button>

				
				   <form action="${pageContext.request.contextPath}/generatePdf" method="get">
				    <input type="hidden" id="applyId" name="applyId" value="" placeholder="applyId">
				    </br>
				    <input value="회사제출용" type="radio" id="certBtn1" name="submitTo"  checked>
					<lable for="certBtn1">회사제출용</label>
					
					<input value="세무서 제출용" type="radio" id="certBtn2" name="submitTo">
					<lable for="certBtn2">세무서 제출용</label>
					
					<input value="기타 증빙용" type="radio" id="certBtn3" name="submitTo">
					<lable for="certBtn3">기타 증빙용</label>
			    	    </br></br>	
				        <button class="btn btn-primary" type="submit">PDF 발급하기</button>
				    </form>

			</div>
		</div>
	</div>
</section>

<div style="display: none;">
		<div id="chooseReviewContent">
			<div class="reviewList">
				<c:choose>
			    <c:when test="${empty dlist}">
			        <p style="text-align: center; margin: 10px;">선택가능한 내역이 없습니다.</p>
			    </c:when>
			    <c:otherwise>
			        <c:forEach var="item" items="${dlist}">
			           
					<button onclick="chooseTitle('${item.applyId}','${item.title}')">기부처 : ${item.title} 기부금액 :  ${item.donationAmount} 기부날짜 :${item.rdate}</button>
			            
			            
			        </c:forEach>
			    </c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>		
<script>
function openLayer() {
	let chooseReviewContent = $('#chooseReviewContent').html();
	layerup(true, "후기 선택", chooseReviewContent , "bottom", true);
};

function chooseTitle(applyId, title) {
	 $('#btnChoice').html(title);
	  $('#applyId').val(applyId);
	  $('.layer').remove();
	  $('.modal-overlay').hide();
	 
	
}

</script>