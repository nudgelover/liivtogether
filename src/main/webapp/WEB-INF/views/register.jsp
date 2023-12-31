<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#SNSLogin button {
	border-radius: 10px 10px;
	width: 100%;
	height: 4rem;
	border: none;
}

#kakaoLoginBtn {
	background-color: #fee500;
}

#naverLoginBtn {
	background-color: #00d337;
	color: white;
}

#googleLoginBtn {
	background-color: #00c4c4;
	color: white;
}

.idcheck {
	margin-left: 10px;
	width: 100px;
	background: #FFBF00;
	border-radius: 5px;
	color: white;
	border: none;
}

.btn {
	width: 100%;
	height: 3rem;
	border: none;
	color: white;
	background: #FFBF00;
	border-radius: 5px;
}
.form-check>.form-check-input:disabled+.form-check-label {
    text-decoration: none !important;
}

input {
	border: 1px solid #dde2e6 !important;
	border-radius: 3px !important;
}

input:focus {
	outline: none;
	border-color: #FFBF00 !important;
}

.form-check-input:checked {
	background-color: #FFBF00 !important;
}

.form-check-input:checked ~ .form-check-input[type="checkbox"] {
	border-color: #FFBF00 !important;;
}

/* 하트 아이콘 스타일 */
.form-check .fa-angle-down {
	position: absolute; /* 하트 아이콘을 절대 위치로 설정합니다. */
	right: 0; /* 우측에 배치하도록 right 값을 설정합니다. */
	top: 50%; /* 상단에서 정확히 중앙에 위치하도록 설정합니다. */
	transform: translateY(-50%); /* 세로 중앙 정렬을 위해 translateY로 이동합니다. */
	font-size: 16px; /* 원하는 아이콘 크기로 설정합니다. */
	color: gray; /* 원하는 아이콘 색상을 설정합니다. */
	cursor: pointer;
}
</style>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>


function selectAllAgreements() {
  const agreeAllCheckbox = document.getElementById('agreeAll');
  const essentialCheckboxes = document.getElementById('essential');
  const essential2Checkboxes = document.getElementById('essential2');
  const agreeAdCheckbox = document.getElementById('agreeAd');


  if (agreeAllCheckbox.checked) {
    // 전체 동의를 선택한 경우 모든 체크박스를 선택
    essentialCheckboxes.checked = true;
    essential2Checkboxes.checked = true;
    agreeAdCheckbox.checked = true;
  } else {
    // 전체 동의를 해제한 경우 모든 체크박스를 해제
    essentialCheckboxes.checked = false;
    essential2Checkboxes.checked = false;
    agreeAdCheckbox.checked = false;
  }

}

function selectBackAllAgreements(){
  const agreeAllCheckbox = document.getElementById('agreeAll');
  const essentialCheckboxes = document.getElementById('essential');
  const essential2Checkboxes = document.getElementById('essential2');
  const agreeAdCheckbox = document.getElementById('agreeAd');
  // 사용자가 전체 선택 이후, 하나의 체크박스라도 해제를 한다면 전체 동의도 false로, 근데 이 스크립트 작동안됨..다시 짜야팜
  if (essentialCheckboxes.checked == false || essential2Checkboxes.checked == false || agreeAdCheckbox.checked == false){
	agreeAllCheckbox.checked = false;  
  }
}

$(function(){

	selectAllAgreements();
	
	// 회원가입 form 전송하는 함수
	$("#register_btn").click(function(){
	  if (!$('#exampleCheck1').prop('checked')) {
	        popup("회원가입 필수 동의는 필수 사항입니다.", false, "", "");
	        return;
	    }

		    $.ajax({
		        url: '/registerimpl',
		        type: 'POST',
		        data: $("#register_form").serialize(), // 폼 데이터를 직렬화하여 전송
		        beforeSend: function(xhr) {
		            console.log('beforeSend 탄다. csrf 토큰확인');
		            let token = $("meta[name='_csrf']").attr("content");
		            let header = $("meta[name='_csrf_header']").attr("content");

		            // headers 속성을 사용하여 헤더를 설정
		            xhr.setRequestHeader("X-CSRF-Token", token);
		            xhr.setRequestHeader(header, token);
		        },
		        success: function(response) {
		            console.log(response);
		            goToLogin();
		        },
		        error: function(error) {
		            // 오류 발생 시 수행할 코드
		            console.log(error);
		        }
		   
		});
	});

	
	// id중복체크. 중복체크 확인을 누르면 비활성화로 만듦
	$("#idcheck").click(function(){
		let cust_id = $("#custId").val();
		console.log("idcheck 눌림" + cust_id);
		param = {
				cust_id : cust_id
		};
		$.ajax({
			url : '/idcheck',
			dataType : 'json',
			data : param
		})
		.done(function(result){
			if(result == 1){
				let a = confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")
				if(a){
		            $("#custId").attr("readonly", "readonly");
				} else{
					return;
				}
			} else {
				alert("중복된 아이디입니다.")
			}
		})
		.fail(function(){
			alert("에러가 발생했습니다.")
		})
	})
	
	
	Kakao.init("${kakaojs}"); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
 	//카카오로그인
 	function kakaoLogin() {
 	    let a = confirm("카카오 계정으로 로그인 합니다. 계정이 없으면 회원가입 후 진행됩니다. 회원가입 후 핸드폰 번호를 수정하세요.")
 	    if (a){
			$.ajax({
	 	        url: '/login/getKakaoAuthUrl',
	 	        type: 'get',
	 	    }).done(function (res) {
	 	        console.log("res"+res);
	 	    	location.href = res;
	 	    });
 	    }
 	  }
	
	//카카오 로그인 클릭시
 	$("#kakaoLoginBtn").click(function(){
		kakaoLogin();
	})
	
	$("#agreeBtn").click(function () {
	    // essential, essential2 중 하나라도 체크되어 있지 않으면 '필수동의체크' 알림
	    if (!$('#essential').prop('checked')) {
	        popup("회원서비스가입 약관은 필수사항입니다.", false, "", "");
	        return;
	    }
	    if (!$('#essential2').prop('checked')) {
	        popup("만 14세 이상 여부를 확인해주세요", false, "", "");
	        return;
	    }

	    $(".btn-close").click();

	  

	    // $('#exampleCheck1') 체크 여부를 true로 변경
	    $('#exampleCheck1').prop('checked', true);
	    $('#exampleCheck1').prop('disabled', true);
	});
 	
 
})


</script>



<div
	style="display: flex; justify-content: center; align-items: center;"
	class="container mt-3 mb-10">
	<div class="col-12 col-lg-4">
		<div class="card mb-10">
			<h6 style="font-weight: bold">간편가입</h6>
			<div id="SNSLogin">

				<div class="mt-7 mb-7">
					<button id="kakaoLoginBtn">
						<svg width="40" height="40" viewBox="0 0 20 20" fill="none"
							xmlns="http://www.w3.org/2000/svg">
<circle cx="10" cy="10" r="10" fill="#FEE500" />
<path
								d="M10.0289 4.82629C6.91773 4.82629 4.40869 6.8335 4.40869 9.27028C4.40869 10.852 5.45245 12.237 7.01809 13.0278L6.48818 15.007C6.47819 15.0366 6.47666 15.0685 6.48375 15.0989C6.49084 15.1294 6.50627 15.1574 6.52833 15.1796C6.56049 15.2079 6.60187 15.2236 6.64475 15.2237C6.6803 15.2209 6.71403 15.2068 6.74109 15.1836L9.02131 13.6461C9.3579 13.6925 9.69719 13.7166 10.037 13.7183C13.1442 13.7183 15.6572 11.7111 15.6572 9.27028C15.6572 6.82949 13.1361 4.82629 10.0289 4.82629Z"
								fill="#392020" />
<path
								d="M6.37559 8.56774H5.76137C5.68525 8.56995 5.61006 8.55045 5.54459 8.51153C5.51553 8.49332 5.49054 8.46929 5.4712 8.44096C5.45185 8.41264 5.43857 8.38062 5.43219 8.34692C5.43024 8.32556 5.43024 8.30409 5.43219 8.28273C5.43028 8.24275 5.43804 8.20288 5.45481 8.16654C5.47159 8.1302 5.49687 8.09845 5.52853 8.07397C5.59852 8.02328 5.683 7.9965 5.7694 7.99767H7.62007C7.6968 7.99497 7.7725 8.01601 7.83685 8.05789C7.8666 8.0753 7.89212 8.09911 7.91156 8.12758C7.93099 8.15604 7.94387 8.18846 7.94926 8.2225C7.95122 8.24252 7.95122 8.2627 7.94926 8.28273C7.95115 8.32328 7.94341 8.3637 7.92666 8.40068C7.90991 8.43767 7.88464 8.47013 7.85291 8.49546C7.78463 8.54608 7.70097 8.57163 7.61605 8.56774H7.02192V10.6794C7.02433 10.7243 7.01737 10.7693 7.00147 10.8115C6.98558 10.8536 6.9611 10.892 6.92958 10.9242C6.89936 10.955 6.86304 10.9791 6.82293 10.995C6.78283 11.0109 6.73985 11.0183 6.69674 11.0166C6.62135 11.0187 6.54755 10.9946 6.48799 10.9483C6.43128 10.9031 6.3928 10.839 6.3796 10.7677C6.37563 10.7384 6.37563 10.7087 6.3796 10.6794L6.37559 8.56774Z"
								fill="#FEE500" />
<path
								d="M8.12647 8.1542C8.14413 8.08814 8.18559 8.03093 8.24289 7.99361C8.30394 7.95901 8.37351 7.94231 8.44361 7.94544H8.59616C8.67055 7.94277 8.74422 7.96084 8.80893 7.99763C8.8775 8.04374 8.92623 8.11396 8.94542 8.19433L9.74831 10.4625C9.76913 10.5217 9.78655 10.582 9.8005 10.6432C9.80187 10.6686 9.80187 10.694 9.8005 10.7194C9.80186 10.7586 9.79466 10.7975 9.7794 10.8336C9.76415 10.8696 9.74121 10.9019 9.71218 10.9282C9.68406 10.957 9.65029 10.9798 9.61299 10.995C9.5757 11.0101 9.53566 11.0175 9.4954 11.0165C9.43348 11.0227 9.3713 11.0078 9.31886 10.9743C9.26643 10.9408 9.2268 10.8906 9.20636 10.8319L9.03775 10.3381H7.98195L7.81334 10.8319C7.7934 10.8918 7.75329 10.943 7.69985 10.9766C7.64642 11.0103 7.58296 11.0244 7.52029 11.0165C7.4524 11.0183 7.38591 10.9971 7.33161 10.9563C7.2787 10.9142 7.243 10.8543 7.23124 10.7877C7.22911 10.765 7.22911 10.7421 7.23124 10.7194C7.22435 10.6796 7.22435 10.6389 7.23124 10.599C7.23124 10.5549 7.25935 10.5067 7.2754 10.4625L8.12647 8.1542ZM8.52792 8.68012L8.14654 9.88446H8.90527L8.52792 8.68012Z"
								fill="#FEE500" />
<path
								d="M9.89244 8.28278C9.88836 8.19268 9.92011 8.10465 9.98075 8.0379C10.0116 8.0068 10.0486 7.9825 10.0894 7.9666C10.1302 7.95069 10.1739 7.9435 10.2176 7.94552C10.2928 7.94465 10.3662 7.96866 10.4264 8.01379C10.4821 8.06088 10.5192 8.12638 10.5307 8.19844C10.5347 8.2264 10.5347 8.25481 10.5307 8.28278V10.3944H11.6347C11.7112 10.3934 11.7865 10.4142 11.8515 10.4546C11.8807 10.4726 11.9058 10.4966 11.9252 10.5249C11.9446 10.5533 11.9578 10.5854 11.9639 10.6192C11.9639 10.6192 11.9639 10.6593 11.9639 10.6794C11.9658 10.7194 11.958 10.7592 11.9413 10.7955C11.9245 10.8319 11.8992 10.8637 11.8676 10.8882C11.7976 10.9388 11.7131 10.9656 11.6267 10.9644H10.2698C10.1834 10.97 10.0975 10.9475 10.0249 10.9002C9.96001 10.8517 9.91676 10.7796 9.90448 10.6995C9.90154 10.6554 9.90154 10.6111 9.90448 10.567L9.89244 8.28278Z"
								fill="#FEE500" />
<path
								d="M12.0362 8.28286C12.0338 8.19303 12.0653 8.1056 12.1245 8.03798C12.1847 7.98331 12.2619 7.95102 12.3431 7.94663C12.4242 7.94225 12.5044 7.966 12.5701 8.01387C12.6271 8.06055 12.6656 8.12602 12.6785 8.19852C12.6805 8.22659 12.6805 8.25479 12.6785 8.28286V9.26638L13.6942 8.09414C13.7333 8.05415 13.7749 8.01665 13.8186 7.98177C13.8599 7.95722 13.9072 7.94467 13.9551 7.94561C14.0253 7.94522 14.0939 7.96624 14.1518 8.00583C14.1791 8.02421 14.2024 8.04793 14.2204 8.07552C14.2383 8.10311 14.2505 8.13402 14.2562 8.16642C14.2578 8.17437 14.2578 8.18258 14.2562 8.19053C14.2543 8.1998 14.2543 8.20935 14.2562 8.21861C14.2561 8.26085 14.245 8.30236 14.2241 8.33906C14.2028 8.37793 14.1772 8.41424 14.1478 8.44741L13.4814 9.17807L14.2843 10.4225V10.4627C14.326 10.5202 14.3585 10.5839 14.3807 10.6514V10.6714C14.3853 10.718 14.3786 10.7649 14.3611 10.8083C14.3436 10.8516 14.3159 10.8901 14.2803 10.9203C14.2133 10.971 14.1314 10.9978 14.0475 10.9966C13.9917 10.9989 13.9363 10.9864 13.8869 10.9605C13.8334 10.9246 13.7894 10.8764 13.7584 10.82L13.0117 9.61564L12.6544 9.989V10.6594C12.6568 10.7492 12.6253 10.8366 12.5661 10.9043C12.5344 10.9353 12.4967 10.9595 12.4552 10.9754C12.4138 10.9912 12.3696 10.9985 12.3253 10.9966C12.2512 10.9982 12.1789 10.9741 12.1205 10.9284C12.0638 10.8832 12.0253 10.819 12.0121 10.7477C12.0082 10.7184 12.0082 10.6887 12.0121 10.6594L12.0362 8.28286Z"
								fill="#FEE500" />
</svg>

						카카오로 시작하기
					</button>
				</div>

				<div class="mb-7">
					<button id="googleLoginBtn">
						<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
							xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd"
								d="M23.04 12.2614C23.04 11.4459 22.9668 10.6618 22.8309 9.90912H12V14.3575H18.1891C17.9225 15.795 17.1123 17.013 15.8943 17.8284V20.7139H19.6109C21.7855 18.7118 23.04 15.7637 23.04 12.2614Z"
								fill="#4285F4" />
<path fill-rule="evenodd" clip-rule="evenodd"
								d="M12 23.4998C15.105 23.4998 17.7081 22.47 19.6109 20.7137L15.8943 17.8282C14.8645 18.5182 13.5472 18.9259 12 18.9259C9.00474 18.9259 6.46951 16.903 5.56519 14.1848H1.72314V17.1644C3.61542 20.9228 7.50451 23.4998 12 23.4998Z"
								fill="#34A853" />
<path fill-rule="evenodd" clip-rule="evenodd"
								d="M5.56523 14.1851C5.33523 13.4951 5.20455 12.758 5.20455 12.0001C5.20455 11.2421 5.33523 10.5051 5.56523 9.81506V6.83551H1.72318C0.944318 8.38801 0.5 10.1444 0.5 12.0001C0.5 13.8557 0.944318 15.6121 1.72318 17.1646L5.56523 14.1851Z"
								fill="#FBBC05" />
<path fill-rule="evenodd" clip-rule="evenodd"
								d="M12 5.07386C13.6884 5.07386 15.2043 5.65409 16.3961 6.79364L19.6945 3.49523C17.7029 1.63955 15.0997 0.5 12 0.5C7.50451 0.5 3.61542 3.07705 1.72314 6.83545L5.56519 9.815C6.46951 7.09682 9.00474 5.07386 12 5.07386Z"
								fill="#EA4335" />
</svg>

						구글로 시작하기
					</button>
				</div>

				<div class="mb-7">

					<button id="naverLoginBtn">


						<svg width="24" height="24" viewBox="0 0 20 20" fill="none"
							xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_403_243)">
<path
								d="M18 20H2C0.9 20 0 19.1 0 18V2C0 0.9 0.9 0 2 0H18C19.1 0 20 0.9 20 2V18C20 19.1 19.1 20 18 20Z"
								fill="#03C75A" />
<path
								d="M11.35 10.25L8.50002 6.19995H6.15002V13.8H8.65002V9.74995L11.5 13.8H13.85V6.19995H11.35V10.25Z"
								fill="white" />
</g>
<defs>
<clipPath id="clip0_403_243">
<rect width="20" height="20" fill="white" />
</clipPath>
</defs>
</svg>
						네이버로 시작하기
					</button>
				</div>


			</div>
		</div>

		<div class="card">
			<h6 style="font-weight: bold">일반 회원가입</h6>
			<form id = "register_form">
			<input type="hidden" id="img" name = "img" value = "default.jpg">
			<input type="hidden" id="pointree" name = "pointree" value = 0>
			<input type="hidden" id="starcoin" name = "starcoin" value = 0>
			<input type="hidden" id="isMaster" name = "isMaster" value = "0">
			
				<div class="mb-3">
					<label for="exampleInputID" class="form-label">아이디 </label>
					<div style="display: flex;">
						<input type="id" class="form-control" id="custId" name="custId"
							aria-describedby="idhelp">
						<button type = "button" class="idcheck" id="idcheck">중복확인</button>
					</div>

					<div id="idhelp" class="form-text">아이디는 6자리이상으로 입력해주세요.</div>
				</div>

				<div class="mb-3">
					<label for="exampleInputID" class="form-label">이름 </label> 
					<input type="id" class="form-control" id="custName" name="custName"
						aria-describedby="idhelp">
					<div id="idhelp" class="form-text">이름을 입력해주세요</div>
				</div>


				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">비밀번호</label>
					<input type="password" class="form-control mb-1"
						placeholder="비밀번호 입력" id="custPwd" name="custPwd"> 
					<input
						type="password" class="form-control" id="custPwdCheck"
						placeholder="비밀번호 확인">
					<div id="passwordHelpBlock" class="form-text">비밀번호는 영문, 숫자,
						특수문자를 포함하여 8~20자리 입니다.</div>
				</div>

				<div class="mb-3">
					<label for="exampleInputID" class="form-label">연락처 </label> 
					<input type="id" class="form-control" id="phoneNo" name="phoneNo"
						aria-describedby="idhelp">
					<div id="idhelp" class="form-text">연락처를 입력해주세요</div>
				</div>

				<div class="mb-3">
					<label for="exampleInputID" class="form-label">생년월일</label> 
					<input type="id" class="form-control" id="birth" name="birth"
						aria-describedby="idhelp">
					<div id="idhelp" class="form-text">생년월일을 입력해주세요</div>
				</div>
				
				<div style="position: relative;" class="form-check">
					<a class="nav-link" data-bs-toggle="offcanvas" href="#agreeModal">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
					<label style="margin-left: 5px;" class="form-check-label" for="exampleCheck1"> 전체동의 </label> <i
						class="fas fa-angle-down"></i></a>
				</div>




				<div style="padding: 0 0 0 35px;" class="form-text mb-3 ">회원·서비스(필수),
					스타트업찾기 서비스 (선택), 이벤트·혜택알림 동의(선택), 만 14세 이상(필수)</div>
				<button type="button" class="btn" id="register_btn">완료</button>
			</form>
		</div>
	</div>
</div>



<!-- 모달창 -->


<div
	style="position: fixed; border-radius: 10px; width: 450px; height: 600px; top: 50%; left: 50%; transform: translate(-50%, -50%);"
	class="offcanvas" id="agreeModal" tabindex="-1" role="dialog"
	aria-hidden="true">

	<!-- Close -->
	<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
		aria-label="Close">
		<i class="fe fe-x" aria-hidden="true"></i>
	</button>

	<!-- Body: Results (add `.d-none` to disable it) -->


	<form>
		<div style="padding: 2rem 2rem 0 2rem;" class="border-top fs-sm">

			<h3 style="font-weight: 800;">약관확인</h3>
			<div class="mb-3">동의하셔야 해당 서비스를 이용할 수 있습니다.</div>
			<div class="form-check form-check-inline mt-5">
				<input class="form-check-input" type="checkbox" id="agreeAll"
					value="option1" onclick="selectAllAgreements()"> <label
					class="form-check-label" for="agreeAll"><span
					style="font-weight: bold;">전체동의</span>(선택항목포함)</label>
			</div>
			<!-- id : agreeAll을 가진 input을 클릭하면 essential, essential2 ,agreeAd input 전부선택-->
			<div class="form-check form-check-inline mt-5"
				style="display: grid; grid-template-columns: 1fr auto;">
				<div>
					<input class="form-check-input" type="checkbox" id="essential"
						value="option1" onclick="selectBackAllAgreements()"> <label style="margin-left: 14px;"
						class="form-check-label" for="essential">회원·서비스 가입<span
						style="color: orange;">(필수)</span></label>
				</div>

				<div
					style="font-size: 12px; font-weight: 200; color: gray; justify-self: end;"
					data-bs-toggle="collapse" href="#essentialText">전체보기</div>
			</div>



			<div style="padding: 0 0 0 32px;" class="collapse" id="essentialText">
				<div>
					<p class="mb-0 fs-sm text-gray-400">전체동의 클릭시</p>
				</div>
			</div>
			<div class="form-check form-check-inline mt-5">
				<input class="form-check-input" type="checkbox" id="essential2"
					value="option1" onclick="selectBackAllAgreements()"> <label class="form-check-label"
					for="essential2">만 14세 이상입니다.<span style="color: orange;">(필수)</span></label>
			</div>



			<div class="form-check form-check-inline mt-4"
				style="display: grid; grid-template-columns: 1fr auto;">
				<div>
					<input class="form-check-input" type="checkbox" id="agreeAd"
						value="option1" onclick="selectBackAllAgreements()"> <label style="margin-left: 14px;"
						class="form-check-label" for="agreeAd">서비스 이벤트 혜택 알림(선택)</span></label>
				</div>

				<div
					style="font-size: 12px; font-weight: 200; color: gray; justify-self: end;"
					data-bs-toggle="collapse" href="#agreeAddText">전체보기</div>
			</div>



			<div style="padding: 0 0 0 32px;" class="collapse" id="agreeAddText">
				<div>
					<p class="mb-0 fs-sm text-gray-400">펀딩·프리오더·스토어 서비스, 이벤트·할인 혜택
						등에 대한 정보를 이메일, 앱 알림(앱 회원가입 시)로 받아볼 수 있습니다. (동의 철회 시까지)</p>
				</div>
			</div>



			<p style="font-size: 10px; color: gray; font-weight: 200;">·선택
				동의를 거부하셔도 리브투게더 서비스 이용이 가능합니다.</p>
			<div
				style="position: sticky; bottom: 0px; background-color: white; margin-top: 10rem; height: 80px;">
				<button type="button" id="agreeBtn" class="btn">확인</button>
			</div>

		</div>
	</form>
</div>


