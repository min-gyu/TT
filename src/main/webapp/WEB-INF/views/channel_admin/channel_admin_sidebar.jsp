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
						
							<c:choose>
									<c:when test="${title ne stitle }">
										<p>${title }</p>
									</c:when>
								</c:choose>
					</div>

					<div class="single-sidebar-widget post-category-widget">
						<h4 class="category-title">방송국 관리</h4>
						<ul class="cat-list">
								<li><a href="/goChannelIntro.ch?CuNo=${m.uno }" class=""
									style="text-align: center;">
										<p>채널 소개 설정</p>
								</a></li>
								<li><a href="#" class="" style="text-align: center;">
										<p>주력 카테고리 설정</p>

								</a></li>
								<li><a href="/goBannerProfile.ch?CuNo=${m.uno }" class=""
									style="text-align: center;">
										<p>베너 & 프로필 사진 설정</p>

								</a></li>
								<li><a href="/goVodAdmin.ch?CuNo=${m.uno }" class=""
									style="text-align: center;">
										<p>VOD 관리</p>

								</a></li>
								<li><a href="/subscriberAdmin.ch?CuNo=${m.uno }" class=""
									style="text-align: center;">
										<p>구독자 관리</p>

								</a></li>
								<li><a href="/managerAdmin.ch?CuNo=${m.uno }" class=""
									style="text-align: center;">
										<p>매니저 관리</p>

								</a></li>
								<li><a href="/manage_Chat.ch?CuNo=${m.uno }" class="" style="text-align: center;">
										<p>채팅 필터 관리</p>

								</a></li>
								<li><a href="manage_black.ch?CuNo=${m.uno }" class=""
									style="text-align: center;">
										<p>블랙 리스트</p>

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