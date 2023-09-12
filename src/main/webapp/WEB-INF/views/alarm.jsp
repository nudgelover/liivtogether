<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<div>
		<button data-tab href="#tab1">활동</button>
		<button data-tab href="#tab2">배송</button>
	</div>
	<div id="tab1" class="tab-content">
		<button> 전체</button>

	</div>
	<div id="tab2" style="display: none;" class="tab-content">탭 내용 2</div>
</div>
<script>
//HTML 요소를 가져옵니다.
const buttons = document.querySelectorAll('[data-tab]');
const tabContents = document.querySelectorAll('.tab-content');

// 버튼 클릭 시 탭 전환
buttons.forEach(button => {
    button.addEventListener('click', () => {
        // 모든 탭 내용을 숨깁니다.
        tabContents.forEach(tab => {
            tab.style.display = 'none';
        });

        // 클릭한 버튼의 data-tab 속성 값을 가져옵니다.
        const targetTabId = button.getAttribute('href').substring(1);
        const targetTab = document.getElementById(targetTabId);

        // 선택한 탭 내용을 표시합니다.
        targetTab.style.display = 'block';
    });
});

</script> 