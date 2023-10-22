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

#btnbox{
	display: flex;
	justify-content: space-around;
	padding: 0 1em;
}

#btnbox > button{
	width:100%;
	border: none;
	margin: 0 5px;
	padding: 10px;	
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
}

.photo_frame {
	margin: 10px 0;
	width: 90%;
	height: 200px;
	background-color: whitesmoke;
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
    background-color: #F3D7C9;
    margin: auto;
    margin-bottom :3rem;
    padding: 1rem;
    border: none;
    color: white;
}
.savebtn:hover{
  	background-color: lightcoral;
}

</style>


<div style="text-align: center;">
	<div style="width: 100%; background-color: #F3D7C9;">
		<img style="width: 100%; max-width: 35rem; height: 10rem;'"
			src="/assets/img/event/forcutMain.png">
	</div>
</div>

<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;" class="col-12">
	<div id="btnbox" class="mt-5 col-12 col-lg-6">
		<button style="background-color: whitesmoke; color: gray"
			id="changWhite">흰색</button>
		<button style="background-color: #E0E6F8; color: gray"
			 id="changPink">연보라</button>
		<button style="background-color: #FFD966; color: gray"
			id="changMint">연노랑</button>
		<button style="background-image:url('/assets/img/event/starbtn.jpg'); color: gray"
			id="changStarfriends">스타프렌즈</button>
	</div>

<div class="col-12" style="padding: 10px; text-align: center;">
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
			<img class="footer_image" src="/assets/img/event/fourcutfooter.png"> <span
				style="position: absolute; top: 110px; right: 28px; font-size: 14px; color: lightblue; z-index: 1;">${now}</span>
		</div>
	</div>
	<button class="savebtn" onclick="captureAndSaveImage()">저장</button>
</div>

</div>


<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script>
	const changWhite = document.getElementById('changWhite')
	const changPink = document.getElementById('changPink');
	const changMint = document.getElementById('changMint');
	const changStarfriends = document.getElementById('changStarfriends');
	const fourcutContainer = document.querySelector('.fourcut_container');
	const photo = document.querySelector('.photo');
	const fourcutFooter = document.querySelector('.fourcut_footer');
	changWhite.addEventListener('click', function() {
		fourcutContainer.style.backgroundImage = 'none';
		photo.style.backgroundImage = 'none';
		fourcutFooter.style.backgroundImage ='none';
		
		fourcutContainer.style.backgroundColor = 'white';
		photo.style.backgroundColor = 'white';
		fourcutFooter.style.backgroundColor = 'white';
	});

	changPink.addEventListener('click', function() {
		fourcutContainer.style.backgroundImage = 'none';
		photo.style.backgroundImage = 'none';
		fourcutFooter.style.backgroundImage ='none';
		
		fourcutContainer.style.backgroundColor = '#E0E6F8';
		photo.style.backgroundColor = '#E0E6F8';
		fourcutFooter.style.backgroundColor = '#E0E6F8';
	});

	changMint.addEventListener('click', function() {
		fourcutContainer.style.backgroundImage = 'none';
		photo.style.backgroundImage = 'none';
		fourcutFooter.style.backgroundImage ='none';
	
		fourcutContainer.style.backgroundColor = '#FFD966';
		photo.style.backgroundColor = '#FFD966';
		fourcutFooter.style.backgroundColor = '#FFD966';
	});

	changStarfriends.addEventListener('click', function() {
		fourcutContainer.style.backgroundColor = '#EBECEB';
		photo.style.backgroundImage = 'url(/assets/img/event/fourcutback.png)';
		photo.style.backgroundColor = '#EBECEB';
		photo.style.backgroundSize = 'cover';
		fourcutFooter.style.backgroundImage = 'url(/assets/img/event/fourcutback2.png)'
		fourcutFooter.style.backgroundSize = 'cover';
	
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
