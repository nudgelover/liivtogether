<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.event-buttons {
	display: flex;
	gap: 10px;
}

.event-buttons a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #FFBF00;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.event-buttons a:hover {
	background-color: darkorange;
}
</style>



<section class="pt-7 pb-12">
	<div class="container">

		<div
			style="text-align: center; display: flex; justify-content: center;"
			class="col-12">
			<div class="col-6 row event-buttons">
				<a href="/event/card">카드게임</a><a href="/event/whackamole">두더지게임</a> <a href="/event/attend">출석체크</a> <a
					href="/event/ad">광고시청</a> <a href="/event/fourcut">인생네컷</a>
			</div>
		</div>

	</div>
</section>