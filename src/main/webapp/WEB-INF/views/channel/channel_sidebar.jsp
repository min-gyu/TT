<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/resources/channel/img/fav.png">
<meta name="author" content="colorlib">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>Channel</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/channel/css/linearicons.css">
<link rel="stylesheet"
	href="/resources/channel/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/channel/css/bootstrap.css">
<link rel="stylesheet" href="/resources/channel/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/channel/css/nice-select.css">
<link rel="stylesheet" href="/resources/channel/css/animate.min.css">
<link rel="stylesheet" href="/resources/channel/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/channel/css/main.css">
<link rel="stylesheet"
	href="/resources/channel/channel2/scripts/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/channel/channel2/scripts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="/resources/channel/channel2/scripts/toast/jquery.toast.min.css">
<link rel="stylesheet"
	href="/resources/channel/channel2/scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/channel/channel2/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="/resources/channel/channel2/scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet"
	href="/resources/channel/channel2/scripts/sweetalert/dist/sweetalert.css">
<!-- Custom style -->
<link rel="stylesheet" href="/resources/channel/channel2/css/style.css">
<link rel="stylesheet"
	href="/resources/channel/channel2/css/skins/all.css">
<link rel="stylesheet" href="/resources/channel/channel2/css/demo.css">
</head>
<body>

	<div class="col-lg-4 sidebar-widgets">
		<div class="widget-wrap">
			<div class="single-sidebar-widget user-info-widget">
				<c:choose>
					<c:when test="${not empty pi.atMName}">
						<img
							src="${ contextPath }/resources/uploadFiles/profile/${pi.atMName}${ext2}"
							style="width: 150px; height: 150px; border-radius: 50%;">
					</c:when>
					<c:otherwise>
						<img src="/resources/uploadFiles/profile/profile1.png" alt=""
							style="width: 150px; height: 150px; border-radius: 50%;">
					</c:otherwise>
				</c:choose>
				<a><h4>${m.nickName }</h4></a>
				<p>@${m.userId }</p>
				<c:set var="stitle" value="채널명을 입력해주세요" />

				<c:choose>
					<c:when test="${title ne stitle }">
						<p>${title }</p>
					</c:when>
				</c:choose>
			</div>
			<div class="single-sidebar-widget popular-post-widget">
				<c:set var="loginUser" value="${sessionScope.loginUser.userId }" />
				<c:if test="${m.userId eq loginUser}">
					<a href="goBannerProfile.ch?CuNo=${m.uno }" style="color: #6ac169;">
						<h4 class="popular-title" type="hidden">방송국 관리</h4>
					</a>

				</c:if>
			</div>


			<div class="single-sidebar-widget ads-widget">
				<a href="#"><img class="img-fluid"
					src="/resources/channel/img/blog/ads-banner.jpg" alt=""
					style="width: 250px"></a>
			</div>
			<div class="single-sidebar-widget popular-post-widget">
				<h4 class="popular-title">Write board</h4>
				<div class="popular-post-list">
					<div class="single-post-list d-flex flex-row align-items-center">
					</div>
				</div>
			</div>
			<div class="single-sidebar-widget post-category-widget">
				<div class="single-sidebar-widget newsletter-widget">


					<p class="text-bottom">순위</p>
				</div>
				<ul class="cat-list">
					<li><a href="#" class="d-flex justify-content-between">
							<p>회장</p>
							<p>내이름은</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>1등</p>
							<p>내가 1등이다</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>2등</p>
							<p>아앗2등</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>3등</p>
							<p>29</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>4등</p>
							<p>15</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>5등</p>
							<p>09</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>6등</p>
							<p>44</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>7등</p>
							<p>44</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>8등</p>
							<p>44</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>9등</p>
							<p>44</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>10등</p>
							<p>44</p>
					</a></li>
				</ul>




			</div>
		</div>
	</div>
	<script src="/resources/channel/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="/resources/channel/js/vendor/bootstrap.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="/resources/channel/js/easing.min.js"></script>
	<script src="/resources/channel/js/hoverIntent.js"></script>
	<script src="/resources/channel/js/superfish.min.js"></script>
	<script src="/resources/channel/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/channel/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/channel/js/jquery-ui.js"></script>
	<script src="/resources/channel/js/jquery.nice-select.min.js"></script>
	<script src="/resources/channel/js/mail-script.js"></script>
	<script src="/resources/channel/js/main.js"></script>
</body>
</html>