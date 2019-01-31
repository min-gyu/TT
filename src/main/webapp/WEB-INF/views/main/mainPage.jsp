<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
		<meta name="author" content="Kodinger">
		<meta name="keyword" content="magz, html5, css3, template, magazine template">
		<!-- Shareable -->
		<meta property="og:title" content="HTML5 & CSS3 magazine template is based on Bootstrap 3" />
		<meta property="og:type" content="article" />
		<meta property="og:url" content="http://github.com/nauvalazhar/Magz" />
		<meta property="og:image" content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" />
		
		<title>Today's TV</title>
		<link rel="stylesheet" href="/resources/assets/scripts/bootstrap/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/assets/scripts/ionicons/css/ionicons.min.css">
		<link rel="stylesheet" href="/resources/assets/scripts/toast/jquery.toast.min.css">
		<link rel="stylesheet" href="/resources/assets/scripts/owlcarousel/dist/assets/owl.carousel.min.css"> 
		<link rel="stylesheet" href="/resources/assets/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
		<link rel="stylesheet" href="/resources/assets/scripts/magnific-popup/dist/magnific-popup.css">
		<link rel="stylesheet" href="/resources/assets/scripts/sweetalert/dist/sweetalert.css">
		<link rel="stylesheet" href="/resources/assets/css/style.css">
		<link rel="stylesheet" href="/resources/assets/css/skins/all.css">
		<link rel="stylesheet" href="/resources/assets/css/demo.css">
	</head>

	<body class="skin-orange">
		<header class="primary">
			<div class="firstbar">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-12">
							<div class="brand">
								<a href="index.html">
									<img src="/resources/images/logo.png" alt="Today's TV">
								</a>
							</div>						
						</div>
						<div class="col-md-6 col-sm-12">
							<form class="search" autocomplete="off">
								<div class="form-group">
									<div class="input-group">
										<input type="text" name="q" class="form-control" placeholder="검색어를 입력해주세요">									
										<div class="input-group-btn">
											<button class="btn btn-primary"><i class="ion-search"></i></button>
										</div>
									</div>
								</div>
							</form>								
						</div>
						<div class="col-md-3 col-sm-12 text-right">
							<ul class="nav-icons">
								<li><a href="#"><i class="ion-person-add"></i><div>Register</div></a></li>
								<li><a href="#"><i class="ion-person"></i><div>Login</div></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<!-- Start nav -->
			<nav class="menu">
				<div class="container">
					<div class="brand">
						<a href="#">
							<img src="/resources/images/logo.png" alt="Magz Logo">
						</a>
					</div>
					<div class="mobile-toggle">
						<a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
					</div>
					<div class="mobile-toggle">
						<a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
					</div>
					<div id="menu-list">
						<ul class="nav-list">
							<li><a href="#">구독</a></li>	
							<li><a href="#">전체</a></li>	
							<li><a href="#">스포츠</a></li>	
							<li><a href="#">먹방</a></li>	
							<li><a href="#">뷰티</a></li>	
							<li><a href="#">VLOG</a></li>	
							<li><a href="#">VOD</a></li>	
							<li class="dropdown magz-dropdown">
								<a href="#">고객센터 <i class="ion-ios-arrow-right"></i></a>
								<ul class="dropdown-menu">
									<li><a href="#">신고하기</a></li>
									<li><a href="#">문의하기</a></li>
								</ul>
							</li>
							
						<!-- 	
						<li class="dropdown magz-dropdown"><a href="#">Dropdown Icons <i class="ion-ios-arrow-right"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="icon ion-person"></i> My Account</a></li>
								<li><a href="#"><i class="icon ion-heart"></i> Favorite</a></li>
								<li><a href="#"><i class="icon ion-chatbox"></i> Comments</a></li>
								<li><a href="#"><i class="icon ion-key"></i> Change Password</a></li>
								<li><a href="#"><i class="icon ion-settings"></i> Settings</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="icon ion-log-out"></i> Logout</a></li>
							</ul>
						</li>
						 -->
						</ul>
					</div>
				</div>
			</nav>
			<!-- End nav -->
		</header>

		<section class="home">
			<div class="container">
				<div class="row" >
					<div class="center-block">
						<div class="line">
							<div>인기 방송</div>
						</div>
						<div class="row" style="text-align: center">
							<div class="col-md-6 col-sm-6 col-xs-12" style="margin-left: 26%">
								<div class="row">
									<article class="article col-md-12">
										<div class="inner">
											<figure>
												<a href="single.html">
													<img src="/resources/images/news/img10.jpg" alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="detail">
													<div class="time">December 10, 2016</div>
													<div class="category"><a href="#">스포츠</a></div>
												</div>
												<h2><a href="single.html">[생]한국 축구 중계</a></h2>
												<footer>
													<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>1263</div></a>
													<a class="btn btn-primary more" href="single.html">
														<div>More</div>
														<div><i class="ion-ios-arrow-thin-right"></i></div>
													</a>
												</footer>
											</div>
										</div>
									</article>
								</div>
							</div>
							<!-- <div class="col-md-6 col-sm-6 col-xs-12">
								<div class="row">
									<article class="article col-md-12">
										<div class="inner">
											<figure>                                
												<a href="single.html">
													<img src="/resources/images/news/img05.jpg" alt="Sample Article">
												</a>
											</figure>
											<div class="padding">
												<div class="detail">
													<div class="time">December 09, 2016</div>
													<div class="category"><a href="#">Lifestyle</a></div>
												</div>
												<h2><a href="single.html">Mauris elementum libero at pharetra auctor</a></h2>
												<p>Vivamus in efficitur mi. Nullam semper justo ut elit lacinia lacinia. Class aptent taciti sociosqu ad litora torquent per conubia nostra.</p>
												<footer>
													<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>1083</div></a>
													<a class="btn btn-primary more" href="single.html">
														<div>More</div>
														<div><i class="ion-ios-arrow-thin-right"></i></div>
													</a>
												</footer>
											</div>
										</div>
									</article>
								</div>
							</div> -->
						</div>
						<div class="line transparent little"></div>
						<div class="line top">
							<div>생방송</div>
						</div>
						<div class="row">
							<article class="col-md-12 article-list">
							
								<div class="inner">
									<figure>
										<a href="single.html">
											<img src="/resources/images/news/img11.jpg" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">게임</a>
											</div>
											<div class="time">December 19, 2016</div>
										</div>
										<div>
											<h1>[생] 배틀그라운드</a></h1>
										</div>
										<p>
										어쩌구저쩌구 방송시간 같은거 + 채널명 + 크리에이터명
										</p>
										<footer>
											<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>273</div></a>
											<a class="btn btn-primary more" href="single.html">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
							<article class="col-md-12 article-list">
								<div class="inner">
									<div class="badge">
										Sponsored
									</div>
									<figure>
										<a href="single.html">
											<img src="/resources/images/news/img02.jpg" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">Travel</a>
											</div>
											<div class="time">December 18, 2016</div>
										</div>
										<h1><a href="single.html">Maecenas accumsan tortor ut velit pharetra mollis</a></h1>
										<p>
											Maecenas accumsan tortor ut velit pharetra mollis. Proin eu nisl et arcu iaculis placerat sollicitudin ut est. In fringilla dui.
										</p>
										<footer>
											<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>4209</div></a>
											<a class="btn btn-primary more" href="single.html">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
						</div>
						<div class="line transparent little"></div>
						<div class="line top">
							<div>VOD</div>
						</div>
						<div class="row">
							<article class="col-md-12 article-list">
								<div class="inner">
									<figure>
										<a href="single.html">
											<img src="/resources/images/news/img11.jpg" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">Film</a>
											</div>
											<div class="time">December 19, 2016</div>
										</div>
										<h1><a href="single.html">Donec consequat arcu at ultrices sodales quam erat aliquet diam</a></h1>
										<p>
										Donec consequat, arcu at ultrices sodales, quam erat aliquet diam, sit amet interdum libero nunc accumsan nisi.
										</p>
										<footer>
											<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>273</div></a>
											<a class="btn btn-primary more" href="single.html">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
							<article class="col-md-12 article-list">
								<div class="inner">
									<div class="badge">
										Sponsored
									</div>
									<figure>
										<a href="single.html">
											<img src="/resources/images/news/img02.jpg" alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="category">
												<a href="#">Travel</a>
											</div>
											<div class="time">December 18, 2016</div>
										</div>
										<h1><a href="single.html">Maecenas accumsan tortor ut velit pharetra mollis</a></h1>
										<p>
											Maecenas accumsan tortor ut velit pharetra mollis. Proin eu nisl et arcu iaculis placerat sollicitudin ut est. In fringilla dui.
										</p>
										<footer>
											<a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div>4209</div></a>
											<a class="btn btn-primary more" href="single.html">
												<div>More</div>
												<div><i class="ion-ios-arrow-thin-right"></i></div>
											</a>
										</footer>
									</div>
								</div>
							</article>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- Start footer -->
		<footer class="footer">
			<div class="container">
					<div class="col-md-12">
						<div class="copyright">
							COPYRIGHT &copy; TT 2019. ALL RIGHT RESERVED.
							<div>
								Made with <i class="ion-heart"></i> by TT</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		
		<!-- End Footer -->
		<!-- JS -->
		<script src="/resources/assets/js/jquery.js"></script>
		<script src="/resources/assets/js/jquery.migrate.js"></script> 
		<script src="/resources/assets/scripts/bootstrap/bootstrap.min.js"></script>
		<script>var $target_end=$(".best-of-the-week");</script>
		<script src="/resources/assets/scripts/jquery-number/jquery.number.min.js"></script>
		<script src="/resources/assets/resources/assets/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
		<script src="/resources/assets/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
		<script src="/resources/assets/scripts/easescroll/jquery.easeScroll.js"></script>
		<script src="/resources/assets/scripts/sweetalert/dist/sweetalert.min.js"></script>
		<script src="/resources/assets/scripts/toast/jquery.toast.min.js"></script>
		<script src="/resources/assets/js/demo.js"></script>
		<script src="/resources/assets/js/e-magz.js"></script>
	</body>
</html>