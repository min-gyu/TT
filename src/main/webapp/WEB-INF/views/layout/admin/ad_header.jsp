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


	<!-- TT 추가 -->
	<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>

<body class="skin-green">
	<header class="primary">
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="goMain.me"> <img src="/resources/images/logo.png" alt="Today's TV" style="width: 300px;"></a>
							<span><h4 style="color:#088A29; text-align:center">Management</h4></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/layout/admin/ad_nav.jsp" />
	</header>
</body>
</html>