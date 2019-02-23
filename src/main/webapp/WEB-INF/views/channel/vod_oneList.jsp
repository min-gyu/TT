<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style>
#report:hover {
	cursor: pointer
}

#subscribe:hover {
	cursor: pointer
}
</style>
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
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<jsp:include page="/WEB-INF/views/channel/channel_header.jsp" />


	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">
								<video class="img-fluid"
									src="${ contextPath }/resources/uploadFiles/${a.atMName}.mp4"
									type="video/mp4" controls style="padding-left: 0%;"></video>
							</div>
						</div>

						<div class="col-lg-9 col-md-9">
							<a class="posts-title"><h3>${b.bTitle }</h3></a>

							<p class="excert">${b.bContent }</p>

						</div>
						<!-- 신고하기 -->
						<div>
							<a id="report"><img
								src="/resources/channel/channel2/images/channel_report.png"
								style="padding-left: 150px; width: 174px; padding-top: 10px;">
							</a>
						</div>
						<!-- 신고하기  end-->

					</div>
					<div class="col-md-8" style="max-width: 100% !important";>

						<div>
							<!-- ion-ios-bell -->
							<c:set var="loginUser" value="${sessionScope.loginUser.uno }" />
							<a
								href="addSubscribe.ch?CuNo=${m.uno }&&uNo=${loginUser}&&bNo=${b.bNo}">
								<i class="ion-ios-bell-outline"
								style="font-size: 28px; padding-left: 2px;"></i> 구독

							</a>
						</div>
						<div>
							<a href="#" class="love active"><i
								class="ion-android-favorite"></i>
								<div>${b.bCount }</div></a>
						</div>

						<div class="line thin"></div>


						<div class="comments">
							<h3 class="title">댓글란</h3>
							<div class="comment-list">
								<!-- <div class="item">
									<div class="user">
										<figure>
											<img src="images/img01.jpg">
										</figure>
										<div class="details">
											<h5 class="name">Mark Otto</h5>
											<h5 class="name">@abc123</h5>
											<div class="time">24 Hours</div>
											<div class="description">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit, sed do eiusmod tempor
												incididunt ut labore et dolore</div>
										</div>
									</div>
								</div> -->
								<div id="listReply"></div>
							</div>

							<!-- 댓글란 : 로그인 했을때 보이기! -->

							<div class="row">
								<div class="col-md-12">
									<h3 class="title">
										댓글 한줄 작성 <a href="#" class="love active"><i
											class="ion-android-favorite"></i> </a>
									</h3>
								</div>
								<!-- <div class="form-group col-md-4">
									<label for="name">닉네임 <span class="required"></span></label> <input
										type="text" id="name" name="" class="form-control">
								</div>
								<div class="form-group col-md-4">
									<label for="name">아이디 <span class="required"></span></label> <input
										type="text" id="name" name="" class="form-control">
								</div> -->
								<div class="form-group col-md-12">

									<label for="message">댓글 <span class="required"></span></label>
									<textarea class="form-control" id="ReplyContent"
										placeholder="댓글 입력란"></textarea>

									<!-- 작성자 회원번호 -->
									<input type="hidden" id="buNo"
										value="${sessionScope.loginUser.uno }">
								</div>
								<div class="form-group col-md-12">
									<button class="btn btn-primary" id="ReplyBtn">댓글 작성</button>
								</div>

							</div>

							<!-- 댓글란 end : 로그인 했을때 보이기! -->


						</div>

					</div>
				</div>


				<!-- 오른쪽 사이드바 이동 -->

				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<div class="single-sidebar-widget user-info-widget">
							<img src="/resources/channel/img/blog/user-info.png" alt="">
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
<script type="text/javascript">
	var msg = '<c:out value="${msg}"/>';
	console.log(msg);

	$(function() {
		if (msg) {
			alert(msg);
		}
	});

	$("#report").click(
			function() {
				window.open("/report.ch?bNo=${b.bNo}", "신고하기",
						"width=550, height=550, left=100, top=100");
			});

	listReply("1");
	$("#ReplyBtn").click(
			function() {
				var ReplyContent = $("#ReplyContent").val();
				var CuNo = '<c:out value="${m.uno }"/>';
				var uNo = $("#buNo").val();
				var bNo = '<c:out value="${b.bNo}"/>';

				console.log(uNo);
				$.ajax({
					type : "post",
					url : "${contextPath}/insertDet.ch",
					data : "ReplyContent=" + ReplyContent + "&CuNo=" + CuNo
							+ "&bNo=" + bNo + "&uNo=" + uNo,
					success : function(result) {
						alert("댓글이 등록되었습니다.");
						listReply("1");
					}
				});
			});

	function listReply(num) {
		console.log(num);
		$.ajax({
			type : "get",
			url : "${contextPath}/listDet.ch?bNo=${b.bNo}&curPage=" + num,
			success : function(result) {
				$("#listReply").html(result);
			}
		});
	}


</script>
</html>