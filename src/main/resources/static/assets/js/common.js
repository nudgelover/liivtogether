/*
 * common.js
 * 모든 페이지에서 자주 사용될 수 있는 함수들을 모아놓은 페이지입니다.
 * 언제든지 추가하셔도 괜찮으나, 공용으로 사용되는 함수인만큼 
 * 기존 함수 변경 시에는 함수를 구현한 분과 꼭 의논해주시기 바랍니다!
 * 23.08.20 김진희
 * 
 * */

/*-----------------------------------------------------
 * 김진희  START
 * ----------------------------------------------------
 * */
function goToMain() {
	window.location.href = "http://localhost";
}


function goToWish() {
	window.location.href = "http://localhost/mypage/wish";
}


function goToCertificate() {
	window.location.href = "http://localhost/mypage/certificate";
}

function goToLogin() {
	window.location.href = "http://localhost/login";
}

	
function goToLogout() {
	window.location.href = "http://localhost/logouts";
}
function goToChat() {
	window.location.href = "http://localhost/mypage/chat";
}

function popup(message, isPrompt, onConfirm, onCancel) {
	//모달 팝업띄울 때 쓰는 함수. 사용하는 방법은 다음과 같습니다. 
	//popup('이벤트에 참여하시겠습니까?', true, goToJoin, gotoMain);
	//popup('이벤트는 내일부터 참여하실 수있습니다.', false, gotoMain, "");
    const modal = document.createElement('div');
    modal.classList.add('popup-modal');

    const modalContent = document.createElement('div');
    modalContent.classList.add('popup-content');

    const messageElement = document.createElement('div');
    messageElement.innerHTML = message;
    modalContent.appendChild(messageElement);

    const buttonContainer = document.createElement('div');
    buttonContainer.classList.add('button-container');

    const confirmButton = document.createElement('button');
    confirmButton.textContent = '확인';
    confirmButton.classList.add('confirm-button');
    confirmButton.addEventListener('click', () => {
        closeModal();
        if (typeof onConfirm === 'function') {
            onConfirm();
        }
    });


    if (isPrompt) {
        const cancelButton = document.createElement('button');
        cancelButton.textContent = '취소';
        cancelButton.classList.add('cancel-button');
        cancelButton.addEventListener('click', () => {
            closeModal();
            if (typeof onCancel === 'function') {
                onCancel();
            }
        });
        buttonContainer.appendChild(cancelButton);
    }
    buttonContainer.appendChild(confirmButton);
    modalContent.appendChild(buttonContainer);
    modal.appendChild(modalContent);
    document.body.appendChild(modal);

    function closeModal() {
        document.body.removeChild(modal);
    }
}

function layerup(titleUse, title, content, type, closeUse) {
	//ohyLayer(true,'title','content,'bottom',true)
    // 레이어 생성 - 바텀시트... css 완전 재정비 필용,,,
    var layer = document.createElement('div');
    layer.className = 'layer';

    // 닫기 버튼 생성
    if (closeUse) {
        var closeBtn = document.createElement('button');
        closeBtn.className = 'layer-close';
        closeBtn.textContent = '닫기';
        closeBtn.onclick = function() {
            document.body.removeChild(layer);
        };
        layer.appendChild(closeBtn);
    }
    
    
    // 타이틀 영역 생성
    if (titleUse) {
        var titleDiv = document.createElement('div');
        titleDiv.className = 'layer-title';
        titleDiv.textContent = title;
        layer.appendChild(titleDiv);
    }

    // 콘텐츠 영역 생성
    var contentDiv = document.createElement('div');
    contentDiv.className = 'layer-content';
    contentDiv.innerHTML = content;
    layer.appendChild(contentDiv);

    // 레이어 타입 설정
    if (type === 'bottom') {
        layer.style.bottom = '0';
    }

   

    // body에 레이어 추가
    document.body.appendChild(layer);
}



function isEmpty(value) {
    return value === null || value === undefined || value === '';
}

function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
}


/*-----------------------------------------------------
 * 김진희  END
 * ----------------------------------------------------
 * */