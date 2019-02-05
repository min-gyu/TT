<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
<meta name="author" content="Kodinger">
<meta name="keyword"
	content="magz, html5, css3, template, magazine template">
<!-- Shareable -->
<meta property="og:title"
	content="HTML5 & CSS3 magazine template is based on Bootstrap 3" />
<meta property="og:type" content="article" />
<meta property="og:url" content="http://github.com/nauvalazhar/Magz" />
<meta property="og:image"
	content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" />

<title>Today's TV BroadCast</title>
<!-- template 제공 -->
<link rel="stylesheet"
	href="/resources/assets/scripts/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/toast/jquery.toast.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<link rel="stylesheet" href="/resources/assets/css/skins/all.css">
<link rel="stylesheet" href="/resources/assets/css/demo.css">

<style type="text/css">
#searchDiv {
	width: 300px;
}

#searchForm {
	display: inline
}

#searchLi {
	margin-top: -25px;
}

#broadCastDiv {
	background: black;
	height: 0px;
	padding-bottom: 50%;
}

#broadCastWarpper {
	overflow-y: scroll;
	height: 800px;
}

#chattingDiv {
	overflow-y: scroll;
	border: 1px solid black;
	height: 83%;
	margin-left: -25px;
}

#inputChat {
	height: 100%;
	width: 100%;
	margin-right: -15px;
	margin-top: 5px;
}

#inputBtnDiv {
	height: 100%;
	width: 30%;
	margin-left: -10px;
	margin-top: 5px;
}

#inputBtn {
	height: 100%;
	width: 100%
}

#inputTextArea {
	width: 110%;
	height: 100%;
}

#chatWrapper {
	height: 800px;
}

#inputChatDiv {
	height:10%;
	margin-left: -25px;
}

#optionDiv {
	height: 5%;
	margin-left: -25px;
}

.icons {
	font-size: 24px;
}

.icons:hover {
	cursor: pointer;
}
.pull-right{
	margin-right: 10px;
}
</style>
<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body class="skin-orange">
	<header class="primary">
		<div class="firstbar">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="#"> <img src="/resources/images/logo.png"
								alt="Today's TV">
							</a>
						</div>
					</div>

					<div class="col-md-6 visible-lg-* visible-md-* pull-right">
						<ul class="nav-icons">
							<li><a href="#"><i class="ion-person-add"></i>
									<div>Register</div></a></li>
							<li><a href="loginView.me"><i class="ion-person"></i>
									<div>Login</div></a></li>
							<li id="searchLi">
								<form class="search" autocomplete="off" id="searchForm">
									<div class="form-group" id="searchDiv">
										<div class="input-group">
											<input type="text" name="q" class="form-control"
												placeholder="검색어를 입력해주세요">
											<div class="input-group-btn">
												<button class="btn btn-primary">
													<i class="ion-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
							</li>
						</ul>
					</div>
				</div>
				<!-- Header의 1번째 ROW -->
				<hr>
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-12">
						<div id="broadCastWarpper">
							<div id="broadCastDiv"></div>
							<hr>
							<div>
								<h2>방송 제목 :</h2>
							</div>
							<div>
								<h4>스트리머 아이디 :</h4>
							</div>
							<div>
								<h4>방송날짜 :</h4>
							</div>
							<div>
								<h4>방송에 대한 간단한 설명 적는공간</h4>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12 hidden-sm hidden-xs">
						<div id="chatWrapper">
							<div id="optionDiv" class="row">
								<div class="pull-right">
									<i class="ion-person-add icons" id="addManager"></i> &nbsp; <i
										class="ion-ios-people icons" id=userList></i> &nbsp; <i
										class="ion-android-remove-circle icons" id="addBanWord"></i>
									&nbsp; <i class="ion-android-settings icons"
										id="broadCastSetting"></i>
								</div>
							</div>
							<div id="chattingDiv" class="row"></div>
							<hr style="margin-top: 5px;margin-bottom: 5px">
							<div id="inputChatDiv" class="row">
								<div class="col-lg-9 col-md-9 col-sm-8" style="padding-left:0px; padding-right:0px; black;height: 100%">
									<textarea class="form-control" rows="4" width="100%" style="height: 80px;resize: none">									
									</textarea> 
								</div>
								<div class="col-lg-3 col-md-3 col-sm-4" style="padding-left:0px; padding-right:0px; height:100%">
									<button type="button" class="btn btn-success" style="padding:0px;height:100%;width:100%">전송</button>
								</div>							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
<script type="text/javascript">
	$("#addManager").click(
			function() {
				window.open("/addManager.bc", "매니저 추가",
						"width=1250, height=1200, left=100, top=50");
			});
	$("#userList").click(
			function() {
				window.open("/userList.bc", "방송 시청자 목록",
						"width=1250, height=1200, left=100, top=50");
			});
	$("#addBanWord").click(
			function() {
				window.open("/addBanWord.bc", "금지단어 추가",
						"width=1250, height=1200, left=100, top=50");
			});
	$("#broadCastSetting").click(
			function() {
				window.open("/broadCastSetting.bc", "방송 설정",
						"width=1250, height=1200, left=100, top=50");
			});
</script>
</html>