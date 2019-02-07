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
	
	<!-- template 제공 -->
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

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	
	<!-- TT 추가 -->
	<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>

<body class="skin-green">
	<header class="primary">
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="/goMain.me"> <img src="/resources/images/logo.png" alt="Today's TV" style="width: 300px;">
							</a>
						</div>
					</div>
					<div class="col-md-6 col-sm-12">
						<form class="search" autocomplete="off">
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="q" class="form-control" placeholder="검색어를 입력해주세요">
									<div class="input-group-btn">
										<button class="btn btn-primary">
											<i class="ion-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-3 col-sm-12 text-right">
						<ul class="nav-icons">
							<li><a href="/admin/adminMain.ad"><i class="ion-person-add"></i>
								<div>Admin</div></a></li>
							<li><a href="/loginView.me"><i class="ion-person"></i>
								<div>Login</div></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/layout/nav.jsp" />

	</header>