<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

/* 초기 상태: 회색 별 */
.star {
    color: #ccc;
    cursor: pointer;
    font-size: large;
}

/* 클릭한 별을 노란색으로 변경 */
.star.selected {
    color: gold;
    background-color: white!important;
}
#star-rating{
    padding: 0px 15px;
    margin-bottom: 20px;
}

#keyword-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start; /* 좌측 정렬 (센터, 우측 정렬로 변경 가능) */
	margin-bottom: 30px;
}

.btnKeyword {
    font-size:small;
	margin: 5px;
	background-color: antiquewhite;
	border: none;
	padding: 5px 10px;
	border-radius: 15px;
}
.negative{
	background-color: gainsboro;
}

#review-input {
	margin-top: 20px; border : 1px solid #eaeced;
	border-radius: 1.2rem;
	padding: 1.6rem;
	height: 12rem;
	line-height: 2.2rem;
	letter-spacing: -0.03em;
	outline: none;
	overflow-y: auto;
	border: 1px solid #eaeced; /* 내용이 넘칠 때 수직 스크롤 표시 */
}

.input-bottom {
	display: flex;
	justify-content: space-between;
	padding: 10px;
}

#btnClear {
	background: none;
	border: none;
	font-size: small;
}

#btnClear img {
	width: 1.2rem;
	margin-right: 4px;
}

.selected {
	color: white;
	background-color: orange;
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

@media (min-width: 968px) {
    .reviewList button {
        margin: 0.3rem 20rem;
    }
}


.reviewList button:hover {
    border: gold 2px solid;
    color: gold;
}

.button-container {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}



#btnConfirm {
	background-color: #FFBF00;
	color: white;
}

#btnCancle {
	background-color: #e0e0e0; /* 은은한 회색 배경색 */
	color: white;
}

</style>

<script>
	$(document).ready(function() {

	   $('.star').click(function () {
	        var rating = $(this).data('rating');
	        $('#reviewScore').val(rating);
     	    $('.star').removeClass('selected');
       	    $(this).addClass('selected').prevAll('.star').addClass('selected');

	    });
		
		var selectedButtons = [];
		// 버튼 클릭 시 동작
		$(".btnKeyword").click(function() {
			var buttonId = $(this).attr("id");

			// 이미 선택된 버튼이라면 취소 처리
			if (selectedButtons.includes(buttonId)) {
				selectedButtons = selectedButtons.filter(function(item) {
					return item !== buttonId;
				});
				$(this).removeClass("selected");

				// 선택한 값을 keywordValue input 요소에서도 제거
				for (var i = 1; i <= 3; i++) {
					var inputVal = $("#keywordValue" + i).val();
					if (inputVal === buttonId) {
						$("#keywordValue" + i).val("");
					}
				}
			}
			// 선택되지 않은 버튼이라면 선택 처리
			else {
				if (selectedButtons.length < 3) {
					selectedButtons.push(buttonId);
					$(this).addClass("selected");
				} else {
					popup('키워드는 3개까지만 선택 가능합니다.', false, "", "");
				}
			}
			console.log("selectedButtons : " + selectedButtons);

			// 선택한 값들을 input 요소에 저장
			for (var i = 0; i < 3; i++) {
				if (i < selectedButtons.length) {
					console.log("selectedButtons[i]: " + selectedButtons[i]);
					$("#keywordValue" + (i + 1)).val(selectedButtons[i]);
				} else {
					// 배열의 길이가 3보다 작지 않으면 값을 비워줍니다.
					$("#keywordValue" + (i + 1)).val("");
				}
			}

		});

		const divElement = $('#review-input');
		const placeholderText = '후기를 500자 이내로 작성해주세요.';

		// 초기에 placeholder 텍스트를 표시
		divElement.text(placeholderText).addClass('review-focus');

		// 포커스가 들어오면 placeholder 텍스트 제거
		divElement.on('focus', function() {
			if (divElement.hasClass('review-focus')) {
				divElement.text('').removeClass('review-focus');
			}
		});

		// 포커스가 빠져나가면 placeholder 텍스트 복원
		divElement.on('blur', function() {
			if (divElement.text() === '') {
				divElement.text(placeholderText).addClass('review-focus');
			}
		});

		//후기 입력 시 글자 수 출력	 
		$('#review-input').on('input', function() {
			let content = $(this).text(); 
			let cnt = content.length;
			$('#letterCnt').html(cnt); 
			console.log(cnt);
			
		    if (cnt > 500) {
		    	alert('후기는 500자까지만 입력하실 수 있습니다.');
		        $(this).text(content.substring(0, 500)); 
		        cnt = 500; // 글자 수를 500으로 제한합니다.
		        $('#letterCnt').html(cnt); 
		    	return;
		    }
		});

		//입력 초기화 버틀 클릭
		$('#btnClear').on('click', function() {
			$('#review-input').html('');
			$('#letterCnt').html(0);
			focusInput();
		})

		//확인 버튼 클릭
		$('#btnConfirm').on('click', function() {
			var loginCustId = $('#loginCustId').val();
			if (!loginCustId) {
				popup('로그인 후 이용하실 수 있습니다. 로그인하러 가시겠습니까?', true, goToLogin, '');
				return;
			}
			if (checkValid()) {
				popup('후기를 등록하시겠습니까?', true, saveMyRevw, '');
			}
		})

		function checkValid() {
			var content = $('#review-input').text();
			if ($.trim(content) == "" || $.trim(content) == placeholderText) {
				popup('후기를 입력해주세요.', false, focusInput, "");
				return false;
			}
			var selectedStars = document.querySelectorAll('.star.selected');

	        if (selectedStars.length === 0) {
	        	popup('별점을 선택해주세요.', false, "", "");
	        	return false;
	        } 
	        
	        if (!$('#applyId').val()) {
	            popup('후기를 남기실 컨텐츠를 선택해주세요.', false, "", "");
	            return false;
	        }

			return true;
		}

		function focusInput() {
			$('#review-input').focus();
		}

		function saveMyRevw() {
			
			let applyId = $('#applyId').val();
			let loginCustId = $('#loginCustId').val();
			let reviewScore =$('#reviewScore').val();
			let keyword1 = $('#keywordValue1').val();
			let keyword2 = $('#keywordValue2').val();
			let keyword3 = $('#keywordValue3').val();
			let revwContent = $('#review-input').html();
						
			 $.ajax({
			        url: '/review/register',
			        method: 'POST', 
			        data: { applyId :applyId,
				        	custId :loginCustId,
				        	reviewScore : reviewScore,
				        	keyword1 : keyword1,
				        	keyword2 : keyword2,
				        	keyword3 : keyword3,
				        	reviewContents : revwContent},
		            beforeSend: function (xhr, set) {
		                let token = $("meta[name='_csrf']").attr("content");
		                let header = $("meta[name='_csrf_header']").attr("content");

		                xhr.setRequestHeader("X-CSRF-Token", token);
		                xhr.setRequestHeader(header, token);
		            },
			        success: function(response) {

			          if(response=="succ"){
			        		popup("후기가 정상적으로 등록되었습니다.", false, goToReview,"")
			          }else{
			        	  	popup("일시적인 오류가 발생하였습니다. 다시 시도해주십시오.", false, "","")  
			          }
			          
			        },
			        error: function(error) {
			            console.error();
			        	popup("일시적인 오류가 발생하였습니다. 다시 시도해주십시오.", false, "","")
			        }
			    });
		}
	});
</script>


<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 fs-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400" href="/">Home</a></li>
					<li class="breadcrumb-item active"><a class="text-gray-400"
						href="/review">Review</a></li>
					<li class="breadcrumb-item active">Add</li>
				</ol>

			</div>
		</div>
	</div>
</nav>

<!-- CONTENT -->
<section class="pt-7 pb-12">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h3>소중한 후기를 남겨주세요 🫶</h3>
				<button id="btnChoice" style="border: gold 1px solid; margin: 10px 0 20px 0" onclick="openLayer()">후기를 남기실 컨텐츠를 선택해주세요.</button>
				<h6>⭐ 별점을 선택해주세요.</h6>
				<div id="star-rating">
				    <span class="star" data-rating="1"><i class="fas fa-star"></i></span>
				    <span class="star" data-rating="2"><i class="fas fa-star"></i></span>
				    <span class="star" data-rating="3"><i class="fas fa-star"></i></span>
				    <span class="star" data-rating="4"><i class="fas fa-star"></i></span>
				    <span class="star" data-rating="5"><i class="fas fa-star"></i></span>
				</div>


				<h6>📍후기를 대표하는 키워드를 선택해주세요. (최대 3개까지 선택 가능)</h6>
				<div id="keyword-container">
					<button id="keyword1" class="btnKeyword">큰 보람을 얻었어요🫶</button>
					<button id="keyword2" class="btnKeyword">색다른 경험이었어요👏</button>
					<button id="keyword3" class="btnKeyword">잊지못할 추억을 만들었어요😉</button>
					<button id="keyword4" class="btnKeyword">추천합니다👍</button>
					<button id="keyword5" class="btnKeyword">다시 참여하고 싶어요😊</button>
					<button id="keyword6" class="btnKeyword">행복한 경험이었어요🥰</button>
					<button id="keyword7" class="btnKeyword negative">어려움을 느꼈어요😥</button>
					<button id="keyword8" class="btnKeyword negative">변화가 필요해요🤔</button>
					<button id="keyword9" class="btnKeyword negative">아쉬워요🥺</button>
				</div>
		

				<div class="col-12" id="review-input" contenteditable="true"></div>
				<div class="col-12 input-bottom">
					<p>
						<span id="letterCnt">0</span> / 500 자
					</p>
					<button id="btnClear">
						<img src="https://cdn-icons-png.flaticon.com/512/2618/2618245.png">입력
						내용 초기화
					</button>
				</div>

				<div class="button-container">
					<button id="btnCancle">취소</button>
					<button id="btnConfirm">등록</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="applyId">
	<input type="hidden" id="reviewScore">
	<input type="hidden" id="keywordValue1"> 
	<input type="hidden"id="keywordValue2"> 
	<input type="hidden" id="keywordValue3">
	<input type="hidden" id="loginCustId" value="${logincust.custId}">
	
	<div style="display: none;">
		<div id="chooseReviewContent">
			<div class="reviewList">
				<c:choose>
			    <c:when test="${empty myApplyList}">
			        <p style="text-align: center; margin: 10px;">선택가능한 내역이 없습니다.</p>
			    </c:when>
			    <c:otherwise>
			        <c:forEach var="item" items="${myApplyList}">
			            <c:choose>
			                <c:when test="${item.topicBig eq 'S'}">
								<button onclick="reviewPrecheck('${item.applyId}', '[세미나] ${item.title}')">[세미나] ${item.title}</button>
			                </c:when>
			                <c:when test="${item.topicBig eq 'V'}">
			                    <button onclick="reviewPrecheck('${item.applyId}')">[봉사] ${item.title}</button>
			                </c:when>
			                <c:when test="${item.topicBig eq 'D'}">
			                    <button onclick="reviewPrecheck('${item.applyId}')">[기부] ${item.title}</button>
			                </c:when>
			            </c:choose>
			        </c:forEach>
			    </c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>		
</section>
<script>

	function openLayer() {
		let chooseReviewContent = $('#chooseReviewContent').html();
		layerup(true, "후기 선택", chooseReviewContent , "bottom", true);
	};

	function reviewPrecheck(data, buttonText) {

		  $.ajax({
		        url: '/review/precheck',
		        method: 'GET', 
		        data: { applyId: data },
		        success: function(response) {
		          
		           if(response >= 1){
		        	   popup('이미 등록된 후기가 있습니다.', false,'','');
		        	   
		           }
		           if(response ===0){
		        	  $('#btnChoice').html(buttonText);
		        	  $('#applyId').val(data);
		        	  $('.layer').remove();
		        	  $('.modal-overlay').hide();
		        	   
		           }
		           
		        },
		        error: function(error) {
		   
		            console.error('오류 발생:', error);
		        }
		    });
	}
</script>

