<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

	<!-- fakerLoader -->
    <script src="/resources/js/fakeLoader.js"></script>
	<script src="/resources/js/common.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function($){
			$("#fakeLoader").fakeLoader({
				     bgColor:"#18bc9c" // 배경색
				    ,spinner:"spinner7" // 로딩중으로 원하는 로딩이미지타입
				    //,timeToHide:1 // 로딩중에 걸리는 시간, 1000은 1초    
			});
		});
		 
	</script>

</head>

<div id="fakeLoader"></div>

<body class="skin-orange">
	<header class="primary">
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="goMain.me"> <img src="/resources/images/logo.png" alt="Today's TV" style="width: 300px;">
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
					
					<c:set var="adminYN" value="${sessionScope.loginUser.adminYN }" />
					
					<c:choose>
						<c:when test="${ empty sessionScope.loginUser }">
							<div class="col-md-3 col-sm-12 text-right">
								<ul class="nav-icons">
								<li><a href="/loginView.me"><i class="ion-person"></i>
									<div>Login</div></a></li>
								</ul>
							</div>
						</c:when>
						
						<c:when test="${ !empty sessionScope.loginUser }">
							<div class="col-md-3 col-sm-12 text-right">
								<ul class="nav-icons">
									<c:if test="${ adminYN  eq 'Y' }">
										<li><a href="/adminMain.ad"><i class="ion-person-add"></i>
											<div>Admin</div></a></li>
									</c:if>
											
									<c:if test="${ 'N' eq adminYN }">
										<li><a href="#"><div>${ sessionScope.loginUser.userName }님 ^ㅁ^</div></li>
									</c:if>
								
									<li><a href="/logout.me"><i class="ion-person"></i>
										<div>Logout</div></a></li>
									</ul>
								</div>
						</c:when>
					</c:choose>
					
				</div>
			</div>
		</div>
		<!-- <hr style="border:thin solid #0B610B"> -->

		<!-- Start nav -->
		<nav class="menu" style="    border-top: 0px;">
			<div class="container">
				<div class="brand">
					<a href="#"> <img src="/resources/images/logo.png"
						alt="Magz Logo">
					</a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="menu" data-target="#menu-list"><i
						class="ion-navicon-round"></i></a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="sidebar" data-target="#sidebar"><i
						class="ion-ios-arrow-left"></i></a>
				</div>
			</div>
		</nav>
		<!-- End nav -->
	</header>