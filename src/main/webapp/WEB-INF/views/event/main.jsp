<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.event-buttons {
	display: flex;
	gap: 10px;
}
.event-buttons img{
	width: 100%;
	height: 100%; 
	border-radius: 15px;
}
.event-buttons img{
	width: 100%;
	height: 100%; 
	border-radius: 15px;
}
.event-buttons img:hover{
	border: 3px solid navy;
}
.banner {
	width:100%;
	border-radius:10px;
    background-color: gold; 
    color: #fff; 
    font-size: 1.5em; 
    padding: 10px; 
    overflow: hidden;
    margin-bottom: 1rem;
}

.banner p {
    animation: moveLeft 10s linear infinite;
    white-space: nowrap;
    margin: 0 !important;
}

@keyframes moveLeft {
    0% {
        transform: translateX(100%);
    }
    100% {
        transform: translateX(-100%);
    }
}

</style>



<section class="pt-7 pb-12">
	<div class="container">

		<div
			style="text-align: center; display: flex; justify-content: center; flex-direction: column; align-items: center;"
			class="col-12">
			
			<div class="col-12 col-lg-6 row event-buttons">
			<h3>이벤트존</h3>
			<div class="banner">
			    <p>365일 연중무휴, 리브투게더는 언제나 축제 중!🎉</p>
			</div>		
				<a href="/event/attend"><img src="/assets/img/event/attendEvent.png";></a> 
				<a href="/event/card"><img src="/assets/img/event/cardEvent.png";></a>
				<a href="/event/whackamole"><img src="/assets/img/event/catchEvent.png";></a> 
				<a href="/event/admain"><img src="/assets/img/event/adEvent.png";></a> 
				<a href="/event/fourcut"><img src="/assets/img/event/forcutMain.png";></a>
			</div>
		</div>

	</div>
</section>