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


<jsp:include page="/WEB-INF/views/channel/channel_header.jsp" />


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

						</div>


						<!-- 편집부분 -->
						<div class="col-lg-9 col-md-9">
							<button class="btn btn-danger btn-sm" onclick="location.href='board_write.ch'">게시글 작성</button>
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
												
												<div class="time">December 19, 2016</div>
												<div class="category">
													<a href="board_report.ch">신고</a>
												</div>
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
													href="board_oneList.ch">
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
							<div class="col-lg-12"></div>
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
						<!-- 이미지 2개  -->
						<!-- 	<div class="col-lg-12">
							<div class="quotes">MCSE boot camps have its supporters and
								its detractors. Some people do not understand why you should
								have to spend money on boot camp when you can get the MCSE study
								materials yourself at a fraction of the camp price. However, who
								has the willpower to actually sit through a self-imposed MCSE
								training.</div>
							<div class="row mt-30 mb-30">
								<div class="col-6">
									<img class="img-fluid" src="img/blog/post-img1.jpg" alt="">
								</div>
								<div class="col-6">
									<img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
								</div>
							</div>
						</div> -->



					</div>
					<!-- 	<div class="navigation-area">
						<div class="row">
							<div
								class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
								<div class="thumb">
									<a href="#"><img class="img-fluid" src="img/blog/prev.jpg"
										alt=""></a>
								</div>
								<div class="arrow">
									<a href="#"><span class="lnr text-white lnr-arrow-left"></span></a>
								</div>
								<div class="detials">
									<p>Prev Post</p>
									<a href="#"><h4>Space The Final Frontier</h4></a>
								</div>
							</div>
							<div
								class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials">
									<p>Next Post</p>
									<a href="#"><h4>Telescopes 101</h4></a>
								</div>
								<div class="arrow">
									<a href="#"><span class="lnr text-white lnr-arrow-right"></span></a>
								</div>
								<div class="thumb">
									<a href="#"><img class="img-fluid" src="img/blog/next.jpg"
										alt=""></a>
								</div>
							</div>
						</div>
					</div> -->
					<!-- 					<div class="comments-area">
						<h4>05 Comments</h4>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c1.jpg" alt="">
									</div>
									<div class="desc">
										<h5>
											<a href="#">Emilly Blunt</a>
										</h5>
										<p class="date">December 4, 2017 at 3:12 pm</p>
										<p class="comment">Never say goodbye till the end comes!</p>
									</div>
								</div>
								<div class="reply-btn">
									<a href="" class="btn-reply text-uppercase">reply</a>
								</div>
							</div>
						</div>
						<div class="comment-list left-padding">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c2.jpg" alt="">
									</div>
									<div class="desc">
										<h5>
											<a href="#">Elsie Cunningham</a>
										</h5>
										<p class="date">December 4, 2017 at 3:12 pm</p>
										<p class="comment">Never say goodbye till the end comes!</p>
									</div>
								</div>
								<div class="reply-btn">
									<a href="" class="btn-reply text-uppercase">reply</a>
								</div>
							</div>
						</div>
						<div class="comment-list left-padding">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c3.jpg" alt="">
									</div>
									<div class="desc">
										<h5>
											<a href="#">Annie Stephens</a>
										</h5>
										<p class="date">December 4, 2017 at 3:12 pm</p>
										<p class="comment">Never say goodbye till the end comes!</p>
									</div>
								</div>
								<div class="reply-btn">
									<a href="" class="btn-reply text-uppercase">reply</a>
								</div>
							</div>
						</div>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c4.jpg" alt="">
									</div>
									<div class="desc">
										<h5>
											<a href="#">Maria Luna</a>
										</h5>
										<p class="date">December 4, 2017 at 3:12 pm</p>
										<p class="comment">Never say goodbye till the end comes!</p>
									</div>
								</div>
								<div class="reply-btn">
									<a href="" class="btn-reply text-uppercase">reply</a>
								</div>
							</div>
						</div>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c5.jpg" alt="">
									</div>
									<div class="desc">
										<h5>
											<a href="#">Ina Hayes</a>
										</h5>
										<p class="date">December 4, 2017 at 3:12 pm</p>
										<p class="comment">Never say goodbye till the end comes!</p>
									</div>
								</div>
								<div class="reply-btn">
									<a href="" class="btn-reply text-uppercase">reply</a>
								</div>
							</div>
						</div>
					</div> -->

				</div>

				<!-- 오른쪽 사이드바 이동 -->

				<jsp:include page="/WEB-INF/views/channel/channel_sidebar.jsp"/>
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