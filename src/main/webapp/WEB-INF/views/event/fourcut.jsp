<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.fourcut_container {
    margin: 3em auto; /* 수직 가운데 정렬을 위해 margin-top을 제거하고 수평 가운데 정렬을 위해 margin-left와 margin-right를 auto로 설정 */
    width: 100%;
    max-width: 400px;
    height: 1065px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

#img1 {
	margin-top: 50px;
}

.photo {
	display: flex;
	width: 100%;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	/*background-color: white;*/
}

.photo_frame {
	margin: 10px 0;
	width: 350px;
	height: 200px;
	background-color: lightgray;
	position: relative;
	cursor: pointer;
}

.fourcut_footer {
	display: flex;
	justify-content: center;
	align-items: center;
}

.footer_image {
	padding: 0 10px;
	width: 400px;
	height: 120px;
}

.preview_image {
	display: none;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.upload_input {
	display: none;
}

.savebtn{
    width: 100%;
    max-width: 400px;
    background-color: orange;
    margin: auto;
    margin-bottom :3rem;
    padding: 1rem;
    border: none;
    color: white;
}
.savebtn:hover{
  	background-color: darkorange;
}

</style>


<div style="text-align: center;">
	<div style="width: 100%; background-color: #DBE9ED;">
		<img style="width: 100%; max-width: 35rem; height: 10rem;'"
			src="/assets/img/event/attendEvent.png">
	</div>

</div>

<div
	style="display: flex; flex-direction: column; justify-content: center;"
	class="col-12">
	<!--begin::Content-->
		푸터 스타프렌즈로다양하게, 배경도 색깔말고 이미지로 다양하게?이미지위치도 조절가능하면좋을듯
	<div class="mt-5 text-center">
		<button style="background-color: whitesmoke; color: gray"
			class="btn mx-2" id="changWhite">흰색</button>
		<button style="background-color: #E0E6F8; color: gray"
			class="btn mx-2" id="changPink">연보라</button>
		<button style="background-color: #CEF6F5; color: gray"
			class="btn mx-2" id="changMint">민트</button>
		<button style="background-color: #585858; color: gray"
			class="btn mx-2" id="changBlack">블랙</button>
	</div>


	<div class="fourcut_container">
		<div class="photo">
			<div id="img1" class="photo_frame" onclick="openFileInput('file1')">
				<img class="preview_image" src="" alt="Preview Image"> <input
					id="file1" class="upload_input" type="file"
					onchange="handleFileSelect(event)">
			</div>
			<div id="img2" class="photo_frame" onclick="openFileInput('file2')">
				<img class="preview_image" src="" alt="Preview Image"> <input
					id="file2" class="upload_input" type="file"
					onchange="handleFileSelect(event)">
			</div>
			<div id="img3" class="photo_frame" onclick="openFileInput('file3')">
				<img class="preview_image" src="" alt="Preview Image"> <input
					id="file3" class="upload_input" type="file"
					onchange="handleFileSelect(event)">
			</div>
			<div id="img4" class="photo_frame" onclick="openFileInput('file4')">
				<img class="preview_image" src="" alt="Preview Image"> <input
					id="file4" class="upload_input" type="file"
					onchange="handleFileSelect(event)">
			</div>
		</div>
		<div class="fourcut_footer" style="position: relative;">
			<img class="footer_image" src="/assets/img/logo/logo.png"> <span
				style="position: absolute; top: 110px; right: 28px; font-size: 14px; color: lightblue; z-index: 1;">${now}</span>
		</div>
	</div>
	<button class="savebtn" onclick="captureAndSaveImage()">저장</button>


</div>


<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script>
	const changWhite = document.getElementById('changWhite')
	const changPink = document.getElementById('changPink');
	const changMint = document.getElementById('changMint');
	const changBlack = document.getElementById('changBlack');
	const fourcutContainer = document.querySelector('.fourcut_container');
	const photo = document.querySelector('.photo');
	const fourcutFooter = document.querySelector('.fourcut_footer');
	changWhite.addEventListener('click', function() {
		fourcutContainer.style.backgroundColor = 'white';
		photo.style.backgroundColor = 'white';
		fourcutFooter.style.backgroundColor = 'white';
	});

	changPink.addEventListener('click', function() {
		fourcutContainer.style.backgroundColor = '#E0E6F8';
		photo.style.backgroundColor = '#E0E6F8';
		fourcutFooter.style.backgroundColor = '#E0E6F8';
	});

	changMint.addEventListener('click', function() {
		fourcutContainer.style.backgroundColor = '#EFF5FB';
		photo.style.backgroundColor = '#EFF5FB';
		fourcutFooter.style.backgroundColor = '#EFF5FB';
	});

	changBlack.addEventListener('click', function() {
		fourcutContainer.style.backgroundColor = 'black';
		photo.style.backgroundColor = 'black';
		fourcutFooter.style.backgroundColor = 'black';
	});

	function handleFileSelect(event) {
		const file = event.target.files[0];
		const reader = new FileReader();
		const preview = event.target.parentNode.querySelector('.preview_image');

		reader.onload = function(e) {
			preview.src = e.target.result;
			preview.style.display = 'block'; // Show the preview image
		};

		if (file) {
			reader.readAsDataURL(file);
		}
	}

	function openFileInput(inputId) {
		document.getElementById(inputId).click();
	}

	function captureAndSaveImage() {
		const container = document.querySelector('.fourcut_container');

		html2canvas(container).then(function(canvas) {
			// Convert canvas image to data URL
			const imageData = canvas.toDataURL('image/jpg');

			// Create a download link for the image
			const downloadLink = document.createElement('a');
			downloadLink.href = imageData;
			downloadLink.download = 'fourcut_image.jpg';
			downloadLink.click();
		});
	}
</script>
