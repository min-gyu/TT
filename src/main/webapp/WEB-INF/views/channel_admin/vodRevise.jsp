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
<style type="text/css">
input.upload_text { /*읽기전용 인풋텍스트*/
	float: left;
	width: 230px; /* 버튼 포함 전체 가로 길이*/
	height: 19px;
	line-height: 19px;
	padding: 0 3px;
	border: 1px solid #bbb;
}

div.upload-btn_wrap input.input_file { /*파일찾기 폼 투명하게*/
	position: absolute;
	top: 0;
	right: 0;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: "alpha(opacity=0)";
	-moz-opacity: 0;
}

div.upload-btn_wrap { /*버튼테두리 감싼 div*/
	overflow: hidden;
	position: relative;
	float: left;
	width: 70px; /*width, height 값은 button(찾아보기)값과 같아야함 */
	height: 21px;
	padding-left: 3px;
}

div.upload-btn_wrap button { /*버튼 div*/
	width: 70px;
	height: 21px;
	font-weight: bold;
	background: #333;
	border: 1px solid #333;
	color: #fff;
}

#saveBtn {
	width: 20%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/channel/channel_header.jsp" />

	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="row">
						<h5>VOD 수정하기</h5>
					</div>
					<div class="row">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col" style="width: 20%; text-align: center"><div
											style="margin-bottom: 15%;">제목</div></th>
									<td>
										<div class="input-group mb-3" style="margin-top: 2%">
											<input type="text" class="form-control" aria-label="Default"
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
									<th style="width: 20%; text-align: center">첨부동영상</th>
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
											class="btn btn-dark" id="saveBtn">수정</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>


				<!-- 오른쪽 사이드바 이동 -->
				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<div class="single-sidebar-widget user-info-widget">
							<img src="/resources/channel/img/blog/user-info.png" alt="">
							<a><h4>감스트</h4></a>
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
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<!-- End post-content Area -->
	<script type="text/javascript">
		$(function() {
			$('.upload_text').val('미리보여줄 텍스트.');
			$('.input_file').change(function() {
				var i = $(this).val();
				$('.upload_text').val(i);
			});
		});
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