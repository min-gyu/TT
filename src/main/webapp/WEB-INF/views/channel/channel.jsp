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

	<jsp:include page="/WEB-INF/views/channel/channel_header.jsp" />

	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list" style="background-color: white;">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img" align="center">
								<c:choose>
									<c:when test="${not empty bi.atMName}">
										<img class="img-fluid"
											src="${ contextPath }/resources/uploadFiles/banner/${bi.atMName}${ext1}"
											style="padding-left: 0%; width: 700px; height: 300px;">
									</c:when>
									<c:otherwise>
										<img class="img-fluid"
											src="/resources/uploadFiles/banner/banner.png"
											style="padding-left: 0%; width: 700px; height: 300px;">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="info"
								style="padding-top: 20px; padding-bottom: 20px;">
								<!-- VOD 게시판 번호 전송 -->
								<button onclick="location.href='vod_List.ch?CuNo=${m.uno }'"
									class="genric-btn info circle arrow">
									VOD<span class="lnr lnr-arrow-right"></span>
								</button>
							</div>
						</div>


						<!-- 편집부분 -->
						<div class="col-lg-9 col-md-9">

							<div class="row">
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<a href="single.html"> <img
												src="/resources/channel/channel2/images/news/img11.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="details"
											style="width: 410px; border-bottom: 1px solid #eee;">
											<div class="detail">
												<div class="category">
													<a href="#">Film</a>
												</div>
												<div class="time">December 19, 2016</div>
											</div>
											<h1>
												<a href="single.html">Donec consequat arcu at ultrices
													sodales quam erat aliquet diam</a>
											</h1>
											<p>Donec consequat, arcu at ultrices sodales, quam erat
												aliquet diam, sit amet interdum libero nunc accumsan nisi.</p>
											<footer>
												<a href="#" class="love active"><i
													class="ion-android-favorite"></i>
													<div>302</div></a> <a class="btn btn-primary more"
													href="vod_oneList.ch">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<a href="single.html"> <img
												src="/resources/channel/channel2/images/news/img02.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="details"
											style="width: 410px; border-bottom: 1px solid #eee;">
											<div class="detail">
												<div class="category">
													<a href="#">Travel</a>
												</div>
												<div class="time">December 18, 2016</div>
											</div>
											<h1>
												<a href="single.html">Maecenas accumsan tortor ut velit
													pharetra mollis</a>
											</h1>
											<p>Maecenas accumsan tortor ut velit pharetra mollis.
												Proin eu nisl et arcu iaculis placerat sollicitudin ut est.
												In fringilla dui.</p>
											<footer>
												<a href="#" class="love active"><i
													class="ion-android-favorite"></i>
													<div>302</div></a> <a class="btn btn-primary more"
													href="single.html">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>
								<article class="col-md-12 article-list">
									<div class="inner"">
										<figure>
											<a href="single.html"> <img
												src="/resources/channel/channel2/images/news/img03.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="details"
											style="width: 410px; border-bottom: 1px solid #eee;">
											<div class="detail">
												<div class="category">
													<a href="#">Travel</a>
												</div>
												<div class="time">December 16, 2016</div>
											</div>
											<h1>
												<a href="single.html">Nulla facilisis odio quis gravida
													vestibulum Proin venenatis pellentesque arcu</a>
											</h1>
											<p>Nulla facilisis odio quis gravida vestibulum. Proin
												venenatis pellentesque arcu, ut mattis nulla placerat et.</p>
											<footer>
												<a href="#" class="love active"><i
													class="ion-android-favorite"></i>
													<div>302</div></a> <a class="btn btn-primary more"
													href="single.html">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>
							</div>

							<!-- 게시글 3개 아이콘 -->
							<div class="col-lg-12">
								<div class="info"
									style="padding-top: 30px; padding-bottom: 20px;">

									<button onclick="location.href='board_List.ch'"
										class="genric-btn info circle arrow">
										게시글<span class="lnr lnr-arrow-right"></span>
									</button>
								</div>

							</div>
							<div class="col-lg-9 col-md-9" style="padding-left: 0px;">

								<div class="row">
									<article class="col-md-12 article-list">
										<div class="inner">
											<figure>
												<a href="single.html"> <img
													src="/resources/channel/channel2/images/news/img11.jpg"
													alt="Sample Article">
												</a>
											</figure>
											<div class="details"
												style="width: 410px; border-bottom: 1px solid #eee;">
												<div class="detail">
													<div class="category">
														<a href="#">Film</a>
													</div>
													<div class="time">December 19, 2016</div>
												</div>
												<h1>
													<a href="single.html">Donec consequat arcu at ultrices
														sodales quam erat aliquet diam</a>
												</h1>
												<p>Donec consequat, arcu at ultrices sodales, quam erat
													aliquet diam, sit amet interdum libero nunc accumsan nisi.</p>
												<footer>
													<a href="#" class="love active"><i
														class="ion-android-favorite"></i>
														<div>302</div></a> <a class="btn btn-primary more"
														href="single.html">
														<div>More</div>
														<div>
															<i class="ion-ios-arrow-thin-right"></i>
														</div>
													</a>
												</footer>
											</div>
										</div>
									</article>
									<article class="col-md-12 article-list">
										<div class="inner">
											<figure>
												<a href="single.html"> <img
													src="/resources/channel/channel2/images/news/img11.jpg"
													alt="Sample Article">
												</a>
											</figure>
											<div class="details"
												style="width: 410px; border-bottom: 1px solid #eee;">
												<div class="detail">
													<div class="category">
														<a href="#">Film</a>
													</div>
													<div class="time">December 19, 2016</div>
												</div>
												<h1>
													<a href="single.html">Donec consequat arcu at ultrices
														sodales quam erat aliquet diam</a>
												</h1>
												<p>Donec consequat, arcu at ultrices sodales, quam erat
													aliquet diam, sit amet interdum libero nunc accumsan nisi.</p>
												<footer>
													<a href="#" class="love active"><i
														class="ion-android-favorite"></i>
														<div>302</div></a> <a class="btn btn-primary more"
														href="single.html">
														<div>More</div>
														<div>
															<i class="ion-ios-arrow-thin-right"></i>
														</div>
													</a>
												</footer>
											</div>
										</div>
									</article>
									<article class="col-md-12 article-list">
										<div class="inner">
											<figure>
												<a href="single.html"> <img
													src="/resources/channel/channel2/images/news/img11.jpg"
													alt="Sample Article">
												</a>
											</figure>
											<div class="details"
												style="width: 410px; border-bottom: 1px solid #eee;">
												<div class="detail">
													<div class="category">
														<a href="#">Film</a>
													</div>
													<div class="time">December 19, 2016</div>
												</div>
												<h1>
													<a href="single.html">Donec consequat arcu at ultrices
														sodales quam erat aliquet diam</a>
												</h1>
												<p>Donec consequat, arcu at ultrices sodales, quam erat
													aliquet diam, sit amet interdum libero nunc accumsan nisi.</p>
												<footer>
													<a href="#" class="love active"><i
														class="ion-android-favorite"></i>
														<div>302</div></a><a class="btn btn-primary more"
														href="single.html">
														<div>More</div>
														<div>
															<i class="ion-ios-arrow-thin-right"></i>
														</div>
													</a>
												</footer>
											</div>
										</div>
									</article>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 오른쪽 사이드바 이동 -->

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
									<img src="/resources/channel/img/blog/eun.jpg" alt=""
										style="width: 150px; height: 150px; border-radius: 50%;">
								</c:otherwise>
							</c:choose>
							<a><h4>${m.nickName }</h4></a>
							<p>@${m.userId }</p>

							<p>아 이렇게 제 채널에 방문해 주셔서 감사합니다. 이렇게 소개창이 기니 정말 할말이 많습니다. 방송을 한지
								어언 10년쨰 모든 분들께 감사드리고 앞으로 더 재밌는</p>
						</div>
						<div class="single-sidebar-widget popular-post-widget">
							<c:set var="loginUser" value="${sessionScope.loginUser.userId }" />
							<c:if test="${m.userId eq loginUser}">
								<a href="goBannerProfile.ch?CuNo=${m.uno }"
									style="color: #6ac169;"><h4 class="popular-title"
										type="hidden">방송국 관리</h4></a>

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
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<!-- End post-content Area -->

	<script>
		function matchId() {
			$("#manage").hide();
		}
	</script>

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