<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
  df-messenger {
    --df-messenger-bot-message: #FCF2E4;
    --df-messenger-button-titlebar-color: #feddc4;
    --df-messenger-button-titlebar-font-color: #424242;
    --df-messenger-chat-background-color: #fafafa;
    --df-messenger-font-color: #424242;
    --df-messenger-send-icon: white;
    --df-messenger-user-message: #feddc4;
    --df-messenger-input-box-color: #feddc4;
    --df-messenger-input-placeholder-font-color : white;
    --df-messenger-input-font-color: #424242;
    --df-messenger-minimized-chat-close-icon-color: #feddc4;
  	--df-messenger-chip-color: #fff;
    --df-messenger-chip-border-color: #feddc4;
	--df-messenger-font-family : "NanumSquareNeo-Variable";
}


</style>
  
  
<!-- 
df-messenger-bot-message	에이전트 메시지의 풍선 배경 색상입니다.
df-messenger-button-titlebar-color	플로팅 버튼의 색상과 채팅 대화상자의 제목 표시줄입니다.
df-messenger-button-titlebar-font-color	제목 표시줄에 있는 제목의 글꼴 색상입니다.
df-messenger-chat-background-color	채팅 대화상자 배경 색상입니다.
df-messenger-font-color	메시지 글꼴 색상입니다.
df-messenger-input-box-color	텍스트 입력 상자의 배경 색상입니다.
df-messenger-input-font-color	텍스트 입력 상자의 글꼴 색상입니다.
df-messenger-input-placeholder-font-color	텍스트 입력 상자에 있는 자리표시자 텍스트의 글꼴 색상입니다.
df-messenger-minimized-chat-close-icon-color	닫힌 채팅 뷰에 있는 닫기 아이콘의 색상입니다.
df-messenger-send-icon	텍스트 입력 상자에 있는 보내기 아이콘의 색상입니다.
df-messenger-user-message	사용자 메시지의 풍선 배경 색상입니다.
 -->

<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>

<input type="hidden" id="loginCustId" value="${logincust.custId}">
<input type="hidden" id="loginCustNm" value="${logincust.custName}">
<df-messenger intent="WELCOME"
	chat-icon="https://drive.google.com/uc?export=view&id=1bNcJcrj6LzyXTIryIcVb4bV-K7GSiC0X"
	chat-title="챗봇상담사 비비 💬" agent-id="03196ee9-4146-4004-b0c0-b626f8617970"
	language-code="ko"></df-messenger>


<script>
const dfMessenger = document.querySelector('df-messenger');

const loginCustId = $('#loginCustId').val();
const loginCustNm = $('#loginCustNm').val();
const sliceName = loginCustNm.slice(1); 

dfMessenger.addEventListener('df-messenger-loaded', function (event) {
	
	if(loginCustId){
		checkTodayAttend();
		dfMessenger.renderCustomText("안녕하세요 "+sliceName+"님🖐️ 오늘도 방문해주셔서 감사합니다😊");
		
	}else{
		dfMessenger.renderCustomText("안녕하세요! 리브투게더에 오신 것을 환영합니다💛");
		
	}
	//이런 식으로 출석체크를 안했는 지 여부 등등을 시간차를 두고 보내면 될듯?
});


dfMessenger.addEventListener('df-chip-clicked', function (event) {

  const userChoiceChip= event.detail.query;
  
  if (userChoiceChip === "후기 보러가기✏️") {
	  dfMessenger.renderCustomText(userChoiceChip + "로 이동을 도와드리겠습니다.");
	  
  }

});


//사용자가 메시지 클릭 시 메시지 텍스트를 클립보드에 복사하는 함수
function copyTextToClipboard(text) {
  const textArea = document.createElement('textarea');
  textArea.value = text;
  document.body.appendChild(textArea);
  textArea.select();
  document.execCommand('copy');
  document.body.removeChild(textArea);
}



//자주 묻는 질문 더블클릭 시 복사되게 하는 로직
dfMessenger.addEventListener('df-accordion-clicked', function (event) {

  const messageTitle = event.detail.element.title_;
  const messageText = event.detail.element.text_;
  
  const copiedText = messageTitle + "\n" + messageText;

  const accordionElement = event.detail.element; 
  
  if (!accordionElement._dblclickRegistered) {
	    accordionElement._dblclickRegistered = true;
	    
  accordionElement.addEventListener('dblclick', function () {
    
    copyTextToClipboard(copiedText);
    popup('내용이 복사되었습니다', false, '', '');
  });
  }
});



function checkTodayAttend() {
	let koreaToday = new Date(); 
	koreaToday.setHours(koreaToday.getHours() + 9);
	

    $.ajax({
        url: '/api/event/check-today-do',
        method: 'GET',
        data: {
            loginCust: loginCustId,
            eventName: 'attend',
            today: koreaToday.toISOString().split('T')[0] 
        },
        success: function(response) {
        	console.log(response)
	      if(response==0){
	    	  
	    	  dfMessenger.renderCustomText(sliceName+"님, 오늘 출석체크 잊지않으셨지요?");
	    	  const goToAttend = 
	    		  [
	    			      {
	    			        "type": "chips",
	    			        "options": [
	    			          {
	    			            "text": "출석체크하러가기",
	    			            "image": {
	    			              "src": {
	    			                "rawUrl": "https://cdn-icons-png.flaticon.com/512/3992/3992301.png"
	    			              }
	    			            },
	    			            "link": "http://localhost/event/attend"
	    			          }
	    			        ]
	    			      }
	    			    ]
	    			  ;
	    		dfMessenger.renderCustomCard(goToAttend);
	      }
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', error);

        }
    });
	
}
//-------------------------아래 함수는 실행 못함 ㅠ
<!--
//대화 데이터를 로컬 스토리지에 저장하는 함수
function saveChatData(chatData) {
  localStorage.setItem('chatData', JSON.stringify(chatData));
}

// 로컬 스토리지에서 대화 데이터를 가져오는 함수
function loadChatData() {
  const savedData = localStorage.getItem('chatData');
  return savedData ? JSON.parse(savedData) : [];
}

// 초기 대화 데이터를 로드
let chatData = loadChatData();

dfMessenger.addEventListener('df-response-received', function (event) {
  
  const responseText = event.detail.response.queryResult.fulfillmentText;
  //console.log(responseText);
  chatData.push({ type: 'bot', text: responseText });
  saveChatData(chatData);
});


dfMessenger.addEventListener('df-request-sent', function (event) {
	
  const userMessage = event.detail.requestBody.queryInput.text; //.text
 // console.log(userMessage);
  chatData.push({ type: 'user', text: userMessage });
  saveChatData(chatData);
});


window.addEventListener('load', function () {
  const previousChatData = loadChatData();
  chatData = previousChatData;

  for (const message of previousChatData) {
    if (message.type === 'bot') {

   //   dfMessenger.renderCustomText(message.text);
    } else if (message.type === 'user') {
  
    // dfMessenger.renderCustomText(message.text);
    // 로컬에 저장까진 했는데, 이게 USER가 작성한 거를 뿌릴 수 있는 방법이 없음 ㅠ 
    // df-messenger 프레임을 가져온거라 ...불가능하다
    }
  }
});


</script>
