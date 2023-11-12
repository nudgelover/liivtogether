<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
#alarmTop{
	display: flex;

}
#alarmTop button{
	width: 50%;
    border: none;
    background: white;
    padding: 0.7rem;
    font-weight: 700;
    position: relative;

}
 .border-line {
    position: absolute;
    bottom: 0;
    left: 35%;
    width: 30%;
    border-bottom: 1px solid transparent; /* 기본적으로는 투명한 선을 가짐 */
    transition: border-bottom 0.3s ease; /* 부드러운 효과를 위한 트랜지션 설정 */
}


.line-active{
	border-bottom: 3px solid orange;
}

#notification, #delNotification {
	padding: 1rem;

}

#notification p, #delNotification p{
	margin: 0;

}
.alarm-link{
    color: darkorange;

}

.alarm-time{
	font-size: small;
    font-weight: 200 !important;
    color: lightgray;
}

</style>

<script>
let alarm = {
    id         : null,
    stompClient: null,
    init       : function () {
        this.id = $('#loginCustId').val();
        var self = this;
        var sid = this.id;
        var socket = new SockJS('${serviceserver}/alarm');
        this.stompClient = Stomp.over(socket);

        this.stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);

            self.stompClient.subscribe('/alarm/to/' + sid, function (msg) {
          
                var sendid = JSON.parse(msg.body).sendid;
                var postid = JSON.parse(msg.body).postid;
                var content = JSON.parse(msg.body).content;
                var alarmData = {
                    sendid   : sendid,
                    postid   : postid,
                    content  : content,
                    isAlerted: true
                };

                self.saveAlarm(alarmData); //-- 지금은 로컬인데, 이제 디비로 저장..!
                self.displayAlarm(alarmData);
                self.showAlarm();

            });
            
            
            self.stompClient.subscribe('/deliveryalarm/to/' + sid, function (msg) {
                
                var sendid = JSON.parse(msg.body).sendid;
                var postid = JSON.parse(msg.body).postid;
                var content = JSON.parse(msg.body).content;
                var alarmData = {
                    sendid   : sendid,
                    postid   : postid,
                    content  : content,
                    isAlerted: true
                };

                self.saveDeliveryAlarm(alarmData);
                self.displayDeliveryAlarm(alarmData);
                self.showAlarm();

            });

        });

        $("#sendalarm").click(function (event) {
            event.preventDefault();
       
            const currentDate = new Date();
            const options = { timeZone: 'Asia/Seoul', year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' };
            const koreanTime = currentDate.toLocaleString('ko-KR', options);
            
            const postid = koreanTime;
            const receiveId = $('#loginCustId').val();
            const custName = $('#loginCustName').val();
            const content = custName + '님, [세상을 바꾸는 금융] 세미나 신청이 완료되셨습니다.</br> <a class="alarm-link" href="/seminar/detail?id=19">세미나 상세 페이지로 이동하기<img style="width:15px; margin-left : 5px;" src="/assets/img/icons/link.png"></a>';
          
            alarm.sendTo(postid, receiveId,content);

        });
        
        $("#sendDeliveryalarm").click(function (event) {
            event.preventDefault();
     
            
            const currentDate = new Date();
            const options = { timeZone: 'Asia/Seoul', year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' };
            const koreanTime = currentDate.toLocaleString('ko-KR', options);
            
            const postid = koreanTime;
            const receiveId = $('#loginCustId').val();
            const custName = $('#loginCustName').val();
            const content = custName + '님, [친환경 종이 테이프] 배송이 시작되었습니다.</br><a class="alarm-link" href="/seminar/detail?id=19">배송상태 확인하러가기<img style="width:15px; margin-left : 5px;" src="/assets/img/icons/link.png"></a>';
            
            
            alarm.delsendTo(postid, receiveId, content);

        });
        
        
        this.loadAndDisplayAlarms();
    },
    disconnect : function () {
        if (this.stompClient !== null) {
            this.stompClient.disconnect();
        }
        console.log("Disconnected");
    },
    sendTo     : function (postid, receiveId, content) {
        var msg = JSON.stringify({
            'sendid'   : this.id,
            'postid'   : postid,
            'receiveid': receiveId,
            'content'  : content
        });
        this.stompClient.send('/alarmto', {}, msg);
    },
    delsendTo     : function (postid, receiveId, content) {
        var msg = JSON.stringify({
            'sendid'   : this.id,
            'postid'   : postid,
            'receiveid': receiveId,
            'content'  : content
        });
        this.stompClient.send('/deliveryalarm', {}, msg);
    },
    saveAlarm  : function (alarmData) {
      //  var storedAlarms = this.getStoredAlarms();  -> 이제 디비 저장으로 하자!!!!!!!!!!!!!!!!!!!!
      //  storedAlarms.push(alarmData);
      //  localStorage.setItem('alarms', JSON.stringify(storedAlarms));
    },
    loadAndDisplayAlarms: function () { //디비에서 가져와서 뿌리는거로!!!!!!!!!!!!!!!!!!!!!!!
      //  var storedAlarms = this.getStoredAlarms();
      //  for (var i = 0; i < storedAlarms.length; i++) {
      //      var alarmData = storedAlarms[i];
      //      this.displayAlarm(alarmData);
       //     if (alarmData.isAlerted) {
      //          this.showAlarm();
      //      }
     //   }
    },
    displayAlarm: function (alarmData) {
        var sendid = alarmData.sendid;
        var postid = alarmData.postid;
        var content = alarmData.content;

        var alarmhtml =	'<div style="display: flex; margin-bottom: 10px;">'
    		alarmhtml += '<div style="margin-right: 10px;">'
   			+'<img style="width:25px;" src="https://cdn-icons-png.flaticon.com/512/11520/11520014.png">'
    		+'</div>'
			+'<div>'
			+content
			+'<p class="alarm-time">'+postid+'</p>'
			+'</div>';	    


        $("#notification").append(alarmhtml);
        $(".pulse-ring").show();
    }
    ,
    saveDeliveryAlarm  : function (alarmData) {
        //  var storedAlarms = this.getStoredAlarms();  -> 이제 디비 저장으로 하자!!!!!!!!!!!!!!!!!!!!
        //  storedAlarms.push(alarmData);
        //  localStorage.setItem('alarms', JSON.stringify(storedAlarms));
    }
	,
	displayDeliveryAlarm: function (alarmData) {
        var sendid = alarmData.sendid;
        var postid = alarmData.postid;
        var content = alarmData.content;

        var delalarmhtml =	'<div style="display: flex; margin-bottom: 10px;">'
        	delalarmhtml += '<div style="margin-right: 10px;">'
			+'<img style="width:25px;" src="https://cdn-icons-png.flaticon.com/512/3180/3180087.png">'
			+'</div>'
			+'<div>'
			+content
			+'<p class="alarm-time">'+postid+'</p>'
			+'</div>';	    


        $("#delNotification").append(delalarmhtml);
        $(".pulse-ring").show();
    }
	,
    showAlarm: function () {
        $(".pulse-ring").show();
    },
    getStoredAlarms: function () {
    //    var storedAlarms = localStorage.getItem('alarms');
      //  if (storedAlarms) {
        //    return JSON.parse(storedAlarms);
       // } else {
         //   return [];
        //}
    }
   
};
$(function () {
	alarm.init();
	
});
</script>



<!-- 알람창모달-->
<div class="offcanvas offcanvas-end" id="alarmModal" tabindex="-1"
	role="dialog" aria-hidden="true">

	<!-- Full cart (add `.d-none` to disable it) -->

	<!-- Close -->
	<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
		aria-label="Close">
		<i class="fe fe-x" aria-hidden="true"></i>
	</button>

	<!-- Header-->
	<div class="offcanvas-header lh-fixed fs-lg">
		<strong class="mx-auto">알림</strong>
	</div>
	<div id="alarmTop">
		<button data-tab href="#alarmTab1">활동 알림
		    <div class="border-line line-active"></div>
		</button>
		
		<button data-tab href="#alarmTab2">배송 알림
		    <div class="border-line"></div>
		</button>
	</div>
	<div id="alarmTab1" class="tab-content">
		<div id="notification">
		
		</div>
		
						

	</div>
	<div id="alarmTab2" style="display: none;" class="tab-content">
	 <div id="delNotification">
	 
	 
	 </div>
	</div>

	<button class="btn" id="sendalarm">활동 알람 테스트</button>
	<button class="btn" id="sendDeliveryalarm">배송 알람  테스트</button>
	
	
	<input type="hidden" id="loginCustId" value="${logincust.custId}">
	<input type="hidden" id="loginCustName" value="${logincust.custName}">
</div>

	
<script>

const buttons = document.querySelectorAll('[data-tab]');
const tabContents = document.querySelectorAll('.tab-content');

buttons.forEach(button => {
    button.addEventListener('click', () => {
        // 모든 버튼에서 line-active 클래스 제거
        buttons.forEach(btn => {
            const divInsideButton = btn.querySelector('.border-line');
            if (divInsideButton) {
                divInsideButton.classList.remove('line-active');
            }
        });

        // 클릭된 버튼의 div에 line-active 클래스 추가
        const divInsideClickedButton = button.querySelector('.border-line');
        if (divInsideClickedButton) {
            divInsideClickedButton.classList.add('line-active');
        }
       
        // 모든 탭 내용을 숨깁니다.
        tabContents.forEach(tab => {
            tab.style.display = 'none';
        });

        const targetTabId = button.getAttribute('href').substring(1);
        const targetTab = document.getElementById(targetTabId);

        targetTab.style.display = 'block';
    });
});

</script>
