<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.mypage-side, .user-picbox, .user-namebox {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 10px;
}

@media ( max-width : 987px) {
	.user-picbox {
		flex-direction: row;
	}
}

.avatar-container {
	margin: 10px;
	cursor: pointer;
}

.user-grade {
	font-size: small;
	font-weight: 200;
	color: gray;
}

.avatar-container {
	position: relative;
	display: inline-block;
}

.edit-icon {
	position: absolute;
	bottom: 0;
	right: 0;
	background-color: #ffffff;
	border: 2px solid #ffffff;
	border-radius: 50%; /* 동그라미 모양을 위해 border-radius를 50%로 설정 */
	width: 25px; /* 아이콘 표시 영역의 너비와 높이 설정 */
	height: 25px;
	display: flex; /* 가운데 정렬을 위해 Flexbox 사용 */
	justify-content: center;
	align-items: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.titlelist a {
	padding: 10px 20px;
	background-color: #f9fafb;
	border-radius: 10px;
}

#attendTab1 {
	color: #ff6f61;
}

#attendTab2, #attendTab3, #attendTab4, #attendTab5 {
	color: #424242;
}

.titlelist a:hover {
	color: #ff6f61 !important;
}

#donationContent {
	display: block;
}

#volunteeringContent, #seminarContent, #allContent {
	display: none;
}

#donationContent, #volunteeringContent, #seminarContent, #allContent {
	margin: 1rem 0;
	padding: 1rem;
	background: #f9fafb;
	border-radius: 10px;
	padding: 1rem;
}

.heart-icon {
	top: 10px;
	right: 10px;
	z-index: 1;
	cursor: pointer;
	position: absolute;
}

.white {
	color: lightgray;
	font-size: 16px;
}

.red {
	color: red;
	font-size: 16px;
}

.card {
	margin-bottom: 1rem;
	display: flex;
	flex-direction: row;
	padding: 1rem;
	background: white;
}

.card img {
	width: 40%;
	border-radius: 10px;
}

.titleContainer {
	display: flex;
}

.state {
	margin: 0 !important;
}

.detail {
	width: 60%;
	display: flex;
	flex-direction: column;
	margin-left: 1rem;
}

.detail span:first-child {
	font-size: larger;
	font-weight: 800;
	color: #00c4c4;
}

.detail span:nth-child(2) {
	margin: 1.5rem 0 0 0;
}

.detail span {
	color: #424242;
}

@media ( max-width : 500px) {
	.detail span:first-child {
		font-size: medium !important;
		letter-spacing: -2px;
	}
	.detail span:nth-child(2) {
		margin: 1rem 0 0 0 !important;
	}
}

.cancleBtn {
	font-size: small;
	color: gray;
	border: none;
	background-color: transparent;
}

.shareBtn{
 	color: darkorange;
	font-size: small;
	border: none;
	background-color: transparent;
}

.shareBtn:hover{
	color : firebrick;
}

.shareBtn img{
	margin-right: 5px;
	width: 20px;
	border-radius: 0;
}
</style>
<script>
	$(document).ready(function() {

		var myattend = localStorage.getItem('myattend');

		if (myattend === 'D') {
			showTab('donation');
		}
		if (myattend === 'V') {
			showTab('volunteering');
		}
		if (myattend === 'S') {
			showTab('seminar');
		}

		localStorage.removeItem('myattend');
	});

	function showTab(tab) {
		document.getElementById('donationContent').style.display = 'none';
		document.getElementById('volunteeringContent').style.display = 'none';
		document.getElementById('seminarContent').style.display = 'none';
		
		document.getElementById('attendTab1').style.color = '#424242';
		document.getElementById('attendTab2').style.color = '#424242';
		document.getElementById('attendTab3').style.color = '#424242';
		

		switch (tab) {
		case 'donation':
			document.getElementById('donationContent').style.display = 'block';
			document.getElementById('attendTab1').style.color = '#ff6f61';
			break;
		case 'volunteering':
			document.getElementById('volunteeringContent').style.display = 'block';
			document.getElementById('attendTab2').style.color = '#ff6f61';
			break;
		case 'seminar':
			document.getElementById('seminarContent').style.display = 'block';
			document.getElementById('attendTab3').style.color = '#ff6f61';
			break;
		}
	}
</script>
<div class="container  mt-5">
	<div class="row">
		<div class="col-12 col-lg-3">

			<div class="mypage-side">
				<div class="user-picbox">
					<div class="avatar-container">
						<div class="avatar avatar-xl">
							<img src="/uimg/${logincust.img}" alt="..."
								class="avatar-img rounded-circle">
						</div>
						<div class="edit-icon">
							<i style="font-size: 10px;" class="fa fa-pencil"></i>
						</div>
					</div>

					<div class="user-namebox">
						<span class="user-name">김진희님</span> <span class="user-grade">🌱새싹회원</span>

					</div>
				</div>

			</div>

		</div>
		<div class=".titlelist a col-lg-9">
			<div class="row">
				<h2>
					내가 참여한 목록 <img style="width: 50px;"
						src="https://cdn-icons-png.flaticon.com/512/1642/1642767.png">
				</h2>

				<div class="titlelist col-12">
					<a id="attendTab1" href="#" onclick="showTab('donation')">기부</a> <a
						id="attendTab2" href="#" onclick="showTab('volunteering')">봉사</a>
					<a id="attendTab3" href="#" onclick="showTab('seminar')">세미나</a> 
				</div>
				<div>
			"src/main/webapp/WEB-INF/views/mypage/certificate.jsp"		<div id="donationContent" class="col-12 col-lg-9">

						<c:choose>
							<c:when test="${empty dlist}">
								<p style="text-align: center; margin: 10px;">신청하신 기부 내역이
									없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${dlist}">
									<div class="card">
										<img src="/uimg/${item.imageMain}">
										<div class="detail">
											<span><a href="/seminar/detail?id=${item.contentsId}">${item.title}</a></span>
											<span>기부금액 : 어떻게표출하지</span>
											 <span>전달메모:  ${item.memo}</span>
											<span>보상스타코인: <img style="width: 20px;"
												src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
												${item.rewordCoin}개
											</span> <span>신청한 날짜 : ${item.rdate}</span>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>



					</div>
					<div id="volunteeringContent" class="col-12 col-lg-9">
						<c:choose>
							<c:when test="${empty vlist}">
								<p style="text-align: center; margin: 10px;">신청하신 봉사 내역이
									없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${vlist}">
									<div class="card">
										<img src="/uimg/${item.imageMain}">
										<div class="detail">
											<span><a href="/seminar/detail?id=${item.contentsId}">${item.title}</a></span>
											<span>장소 : ${item.location}</span> <span>날짜:
												${item.ddate}</span> <span>소요스타코인: <img style="width: 20px;"
												src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
												${item.rewordCoin}개
											</span> <span>신청한 날짜 : ${item.rdate}</span>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="seminarContent" class="col-12 col-lg-9">
						<c:choose>
							<c:when test="${empty slist}">
								<p style="text-align: center; margin: 10px;">신청하신 세미나가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${slist}">
									<c:set var="edate" value="${item.edate}" />
									<div style="display: flex; flex-direction: column;"
										class="card">
										<div style="display: flex;">
											<img src="/uimg/${item.imageMain}">
											<div class="detail">
												<div class="titleContainer">
													<span><a
														href="/seminar/detail?id=${item.contentsId}">${item.title}</a></span>

												</div>
												<span>장소 : ${item.location}</span> <span>날짜:
													${item.ddate}</span> <span>사용코인: <img style="width: 20px;"
													src="https://cdn-icons-png.flaticon.com/512/8146/8146818.png">
													${item.rewordCoin}개
												</span> <span style="font-size: small; color: gray;">${item.rdate}</span>
											</div>
										</div>
										<div style="display: flex; justify-content: space-between; margin-top: 5px;">
											<button class="shareBtn">
												<img src="https://cdn-icons-png.flaticon.com/512/3135/3135807.png" onclick="goToCertificate">증명서 발급하기
											</button>
											<button class="cancleBtn">
												취소하기<i class="fa fa-close"></i>
											</button>
										
										</div>
									</div>

								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</div>




	</div>
</div>