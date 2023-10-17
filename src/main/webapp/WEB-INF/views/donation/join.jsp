<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.mainImg {
  width: 100%;
}

.tab-content {
	display: none;
}

#joinBox {
	background-color: #FBFBFB;
	padding: 3rem 1rem;
	border-radius: 10px;
	border: 1px solid #F7F7F8;
}

#joinBox #donaBtn {
	width: 100%;
	padding: 1rem;
	border-radius: 5px;
	font-weight: 700;
	color: white;
	height: 3.5rem;
	border: none;
	background-color: #FFBF00;
	margin: 5px;
}

#joinBox #prevBtn {
	width: 100%;
	padding: 1rem;
	border-radius: 5px;
	font-weight: 700;
	color: white;
	height: 3.5rem;
	border: none;
	background-color: #FFBF00;
	margin: 5px;
}

.grayBtn{
	background-color: #E6E6E6 !important;
	cursor: default !important;

}
.col-40 {
  float: left;
  width: 40%;
  margin-top: 12px;
  padding: 0px;
  font-size: 0.7em;
  font-color: #ddd;
}

.col-70 {
  float: left;
  width: 70%;
  margin-top: 6px;
}

.col-53 {
  float: left;
  width: 53%;
  margin-top: 6px;
  padding: 0px 0px 0px 16px; 
}

.col-30 {
  float: left;
  width: 30%;
  margin-top: 6px;
}

.col-17 {
  float: left;
  width: 17%;
  margin-top: 6px;
  padding: 0px;
}

button #reset{
	font-color: white !important;
	cursor: default !important;
}

/* Clear floats after the columns */
.row::after {
  content: "";
  display: table;
  clear: both;
}

input:focus {
  border: 3px solid #555;
  
} 
input[type=text]{
  width: 100%;
  height: 30px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  resize: none;
}
input[type=number]{
  width: 100%;
  height: 30px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  resize: none;
}

input[type=textarea]{
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  resize: none;
}

.pointreeSetBtn{
	font-weight: 100 !important;
	background-color: #E6E6E6 !important;
	color: grey !important;
	border-radius: 12px !important;
	width: 90% !important;
	height: 50% !important%
}

</style>
<script>
$(document).ready(function(){
	let currentTabIndex = 1;
   	console.log(currentTabIndex);
   	
   });
   
function setInputValue(amount) {
	  // 'donaPoint' ID를 가진 input 요소를 찾습니다.
	  var inputElement = document.getElementById('donaPoint');	  
	  var intValue = parseInt(inputElement.value);
	  var intAmount = parseInt(amount);
	  inputElement.value = intValue + intAmount;
	}

let dona_form = {
		  init: function(){
		    $('#donaBtn').click(function() {
		      console.log("form");
		      dona_form.send();
		    }); 
		  },
		  
		  send: function(){
		    let token = $("meta[name='_csrf']").attr("content");
		    let header = $("meta[name='_csrf_header']").attr("content");
		    var donaId = $('#contents_id').val();
		    var loginCustId = $('#cust_id').val();
		    var topicBig = $('#topic_big').val();
		    var agree = $('#agreeornot').val();
		    var memo = $('#memo').val();
		    var donaPoint = $("#donaPoint").val();
		    var pointcoin = $("#pointcoin").val();
		    console.log(donaPoint);
		
		    $.ajax({
		      url: '/apply/register',
		      method: 'POST',
		      data: {contentsId: donaId,
		      		topicBig : topicBig,
		      		custId: loginCustId,
		      		agree : agree,
		      		memo : memo,
		      		mount : donaPoint,
		      		pointcoin : pointcoin,
		      		uplace : donaPoint},
		      beforeSend: function(xhr) {
		        xhr.setRequestHeader("X-CSRF-Token", token);
		        xhr.setRequestHeader(header, token);
		      },
		      success: function(response) {
		    	  if(response === 1){
		    		  window.location.href = '/donation/success';
		    	  }
		      },
		      error: function(xhr, status, error) {
		        // Ajax 요청이 실패한 경우 실행될 코드
		      }
		    });

		    console.log("send");
		  }   
		}


$(function(){
	dona_form.init();
  });
  
function donaSubmit(){
	console.log("Dona");
}




</script>
<section class="py-8">
	<div class="container">
		<div class="row justify-content-center">

			<div id="joinBox"
				class="col-12 col-md-10 col-lg-8 col-xl-6 row text-center">


				<div style="display: block;" class="tab-content" id="tab1">
					<!-- 세미나 정보 확인 탭 내용 -->
					<h2>기부신청서를 작성해 주세요.</h2>
					<form id="donaForm">
						<input type="hidden" name="custId" value="{logincust.custId">
						<input type="hidden" name="topicBic" value="{donation.topicBig}">
						<input type="hidden" name="contentsId" value="{donation.contentsId}">
						<input type="hidden" name="agree" id="agreeornot" value="1">
						<input type="hidden" name="pointcoin" id="pointcoin" value="POINTREE">
										
						<p>${donation.title}</p>
						<p><img class="mainImg" src="/uimg/${donation.imageMain}"></p>
						<p>${donation.comment}<br/>
						   ${donation.content}</p>
						<div class="row">
							<div class="col-30">기부하시는 분 : </div>
							<div class="col-70"><input type="text" name="donaName" value="${logincust.custName}" placeholder="${logincust.custName}" readonly/></div>
						</div>
						<div class="row">
							<div class="col-30">기부 포인트리 : </div>
							<div class="col-53"><input type="number" name="donaPoint" id="donaPoint" value="0"/></div>
							<div class="col-17"><button type="button" class="pointreeSetBtn" id="reset" value="0" onclick="setInputValue(0)">초기화</button></div>							
						</div>
						<div class="row">
							<div class="col-50 right-align" style="text-align: right;">(기부가능 포인트리 : 100000 P)</div>
						</div>
						<div class="row">
							<div class="col-30"></div>
							<div class="col-17"><button type="button" class="pointreeSetBtn" id="chunP" value="1000" onclick="setInputValue(1000)">천원</button></div>
							<div class="col-17"><button type="button" class="pointreeSetBtn" id="manP" value="10000" onclick="setInputValue(10000)">만원</button></div>
							<div class="col-17"><button type="button" class="pointreeSetBtn" id="sipmanP" value="100000" onclick="setInputValue(100000)">십만원</button></div>
							<div class="col-17"><button type="button" class="pointreeSetBtn" id="allP" value="1000000" onclick="setInputValue(1000000)">전액</button></div>
						</div>
						<br/>
						<p><input type="textarea" id ="memo" name="memo" placeholder="기부와 함께 소중한 마음을 전달해드립니다(선택)"></textarea></p>
					</form>
				</div>


				<div style="display: flex;">
					<button id="prevBtn" class="grayBtn"  style="width: 50%;" onclick="openPrevTab()">이전으로</button>
					<button id="donaBtn" style="width: 50%;">기부하기</button>
				</div>
			</div>
		</div>
	</div>
<input type="text" id="cust_id" value="${logincust.custId}">
<input type="text" id="topic_big" value="D">
<input type="text" id="contents_id" value="${donation.donaId}">
<input type="text" id="agreeornot" value="0">
</section>
<script>


	let currentTabIndex = 1;
	const tabContents = document.querySelectorAll('.tab-content');
	const prevBtn = document.getElementById('prevBtn'); 
	const nextBtn = document.getElementById('nextBtn'); 
	
	function openNextTab() {
		if (currentTabIndex < tabContents.length) {
			tabContents[currentTabIndex - 1].style.display = 'none'; // 현재 탭 숨김
			currentTabIndex += 1;
			tabContents[currentTabIndex - 1].style.display = 'block'; // 다음 탭 표시

		}
		if (currentTabIndex === tabContents.length) {
			nextBtn.classList.add('grayBtn');
			
		}else{
			nextBtn.classList.remove ('grayBtn');
			prevBtn.classList.remove('grayBtn');
			
		}
		
		if (currentTabIndex === 2 ) {
			popup('개인정보 이용동의에 동의해주세요.', false, "", "");
			return;		
			
		}

	}

	function openPrevTab() {
		const tabContents = document.querySelectorAll('.tab-content');
		const prevBtn = document.getElementById('prevBtn'); 
		const nextBtn = document.getElementById('nextBtn'); 

		if (currentTabIndex > 1) {
			tabContents[currentTabIndex - 1].style.display = 'none'; // 현재 탭 숨김
			currentTabIndex -= 1;
			tabContents[currentTabIndex - 1].style.display = 'block'; // 이전 탭 표시
		}
		
		if (currentTabIndex === 1) {
			prevBtn.classList.add('grayBtn');
			
		}else{
			nextBtn.classList.remove ('grayBtn');
			
		}
				
	 
	}
	

	
</script>