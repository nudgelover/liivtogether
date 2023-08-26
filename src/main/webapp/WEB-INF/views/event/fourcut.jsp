<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
    .fourcut_container {
        margin: 3em 0;
        width: 400px;
        height: 1065px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        /*background-color: white;*/
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
</style>
<!--end::Head-->

<!--begin::Main-->
<div class="d-flex flex-column flex-column-fluid">
    <!--begin::toolbar-->
    <div class="toolbar" id="kt_toolbar">
        <div class="container-xxl d-flex flex-stack flex-wrap flex-sm-nowrap">
            <!--begin::Info-->
            <div class="d-flex flex-column align-items-start justify-content-center flex-wrap me-1">
                <!--begin::Title-->
                <h3 class="text-dark fw-bold my-1">디지네컷</h3>
                <p class="text-muted"><img style="height: 30px; padding-bottom: 4px"
                                           src="https://cdn-icons-png.flaticon.com/512/1042/1042339.png"> 당신들의 소중한 순간을
                    아름답게 간직해드릴게요. 여기서 여러분의 인생네컷을 만들어보세요.</p>
                <p style="display: none" id="group_chat_stdn_id">${loginStdn.id}</p>
                <!--end::Title-->
            </div>
            <!--end::Info-->

        </div>
    </div>
    <!--end::toolbar-->
    <!--begin::Content-->
    <div class="content fs-6 d-flex flex-column-fluid">
        <!--begin::Container-->
        <div class="container-xxl">
            <!--begin::Layout-->
            <div class="card flex-row-fluid align-items-center">

                <div class="mt-10 text-center">
                    <h1 class="text-primary">디지네컷 사용법🎈</h1>
                    <span class="fw-bold text-muted">클릭하여 이미지를 업로드하세요. 아래 저장 버튼을 누르면 사진이 저장됩니다.</br>
                        그럼 즐거운 포토타임 되세요!📸</span></div>
                <div class="d-flex mt-10">
                    <button style="background-color: whitesmoke; color: gray" class="btn mx-2" id="changWhite">흰색</button>
                    <button style="background-color:#E0E6F8; color: gray " class="btn mx-2" id="changPink">연보라</button>
                    <button style="background-color: #CEF6F5; color: gray" class="btn mx-2" id="changMint">민트</button>
                    <button style="background-color: #585858; color: gray" class="btn mx-2" id="changBlack">블랙</button>
                </div>
                <div class="fourcut_container">
                    <div class="photo">
                        <div id="img1" class="photo_frame" onclick="openFileInput('file1')">
                            <img class="preview_image" src="" alt="Preview Image">
                            <input id="file1" class="upload_input" type="file" onchange="handleFileSelect(event)">
                        </div>
                        <div id="img2" class="photo_frame" onclick="openFileInput('file2')">
                            <img class="preview_image" src="" alt="Preview Image">
                            <input id="file2" class="upload_input" type="file" onchange="handleFileSelect(event)">
                        </div>
                        <div id="img3" class="photo_frame" onclick="openFileInput('file3')">
                            <img class="preview_image" src="" alt="Preview Image">
                            <input id="file3" class="upload_input" type="file" onchange="handleFileSelect(event)">
                        </div>
                        <div id="img4" class="photo_frame" onclick="openFileInput('file4')">
                            <img class="preview_image" src="" alt="Preview Image">
                            <input id="file4" class="upload_input" type="file" onchange="handleFileSelect(event)">
                        </div>
                    </div>
                    <div class="fourcut_footer" style="position: relative;">
                        <img class="footer_image" src="/img/인생네컷푸터.png">
                        <span style="position: absolute; top: 110px; right: 28px; font-size: 14px; color: lightblue; z-index: 1;">${now}</span>
                    </div>
                </div>
                <button class="btn btn-warning mb-10" onclick="captureAndSaveImage()">저장</button>
            </div>

        </div>
        <!--end::Layout-->
    </div>

</div>
<!--end::Main-->

<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script>
    const changWhite = document.getElementById('changWhite')
    const changPink = document.getElementById('changPink');
    const changMint = document.getElementById('changMint');
    const changBlack = document.getElementById('changBlack');
    const fourcutContainer = document.querySelector('.fourcut_container');
    const photo = document.querySelector('.photo');
    const fourcutFooter = document.querySelector('.fourcut_footer');
    changWhite.addEventListener('click', function () {
        fourcutContainer.style.backgroundColor = 'white';
        photo.style.backgroundColor = 'white';
        fourcutFooter.style.backgroundColor = 'white';
    });

    changPink.addEventListener('click', function () {
        fourcutContainer.style.backgroundColor = '#E0E6F8';
        photo.style.backgroundColor = '#E0E6F8';
        fourcutFooter.style.backgroundColor = '#E0E6F8';
    });

    changMint.addEventListener('click', function () {
        fourcutContainer.style.backgroundColor = '#EFF5FB';
        photo.style.backgroundColor = '#EFF5FB';
        fourcutFooter.style.backgroundColor = '#EFF5FB';
    });

    changBlack.addEventListener('click', function () {
        fourcutContainer.style.backgroundColor = 'black';
        photo.style.backgroundColor = 'black';
        fourcutFooter.style.backgroundColor = 'black';
    });


    function handleFileSelect(event) {
        const file = event.target.files[0];
        const reader = new FileReader();
        const preview = event.target.parentNode.querySelector('.preview_image');

        reader.onload = function (e) {
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

        html2canvas(container).then(function (canvas) {
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