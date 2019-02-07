<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Board_List</title>

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


	<!-- header -->
	<header id="header">
		<div class="container main-menu" style="background: #f9f9ff";>
			<div class="row align-items-center justify-content-between d-flex">
				<a href="index.html"><img src="/resources/images/logo.png"
					alt="Today's TV" style="width: 300px;"></a>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
					<!-- 공간 비율때문에 넣음 -->
						<li><a style="color: #f9f9ff;">방송하기</a>
						<li><a style="color: #f9f9ff;">방송하기</a>
						<li><a style="color: #f9f9ff;">방송하기</a>
						<!-- 공간 비율때문에 넣음 end -->
						<li class="menu-has-children"><a href="">abc123</a>
							<ul>
								<li><a href="blog-home.html">로그아웃</a></li>
								<li><a href="blog-single.html">마이페이지</a></li>
							</ul></li>
						<li><a href="elements.html">방송하기</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

	<!-- header -->


	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list" style="background-color: white;">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="line transparent little"></div>
							<div class="line top">
								<div>게시판</div>
							</div>
							<div >
								<div class="row">
									<h5>게시글 업로드</h5>
								</div>
								<div class="row">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th scope="col" style="width: 20%; text-align: center"><div
														style="margin-bottom: 15%;">제목</div></th>
												<td>
													<div class="input-group mb-3" style="margin-top: 2%">
														<input type="text" class="form-control"
															aria-label="Default"
															aria-describedby="inputGroup-sizing-default">
													</div>

												</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th style="width: 20%; text-align: center"><div
														style="margin-top: 40%;">내용</div></th>
												<td><textarea class="form-control col-mb-5" rows="7"
														width="100%"></textarea></td>

											</tr>
											<tr>
												<th style="width: 20%; text-align: center">첨부사진</th>
												<td>
													<!--input box--> <input type="text" class="upload_text"
													readonly="readonly"> <!--button-->
													<div class="upload-btn_wrap">
														<button type="button" title="파일찾기">
															<span>파일찾기</span>
														</button>
														<input type="file" class="input_file" title="파일찾기">
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center"><button type="button"
														class="btn btn-danger btn-sm" id="saveBtn">저장</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

						</div>


						<!-- 편집부분 -->
						<div class="col-lg-9 col-md-9">

							<div class="row"></div>

							<!-- 게시글 3개 아이콘 -->
							<div class="col-lg-12"></div>
							<div class="col-lg-9 col-md-9" style="padding-left: 0px;">

								<div class="row"></div>
							</div>


						</div>

					</div>


				</div>

				<!-- 오른쪽 사이드바 이동 -->

				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<div class="single-sidebar-widget user-info-widget">
							<img src="/resources/channel/img/blog/user-info.png" alt="">
							<a><h4>감스트</h4></a>
							<p>@abc123</p>
							<p>아 이렇게 제 채널에 방문해 주셔서 감사합니다. 이렇게 소개창이 기니 정말 할말이 많습니다. 방송을 한지
								어언 10년쨰 모든 분들께 감사드리고 앞으로 더 재밌는</p>
						</div>
						<div class="single-sidebar-widget popular-post-widget">
							<a href="manage_C.ch" style="color: #6ac169;"><h4
									class="popular-title">방송국 관리</h4></a>
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