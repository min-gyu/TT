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
							<div>
								<div class="line top">
									<div>
										<h5>채널 제목 설정</h5>
									</div>
								</div>
								<form action="updateCin.ch?CuNo=${m.uno}" method="post">
									<div class="row">
										<table class="table table-bordered">

											<tbody>
												<tr>
													<th style="width: 20%; text-align: center"><div
															style="margin-top: 40%;">내용</div></th>
													<td><textarea class="form-control col-mb-5"
															name="chName" rows="7" width="100%"
															placeholder="최대 50자 까지 작성 가능합니다."></textarea></td>

												</tr>
												<tr>
													<td colspan="2" align="center"><button type="submit"
															class="btn btn-danger btn-sm" id="saveBtn">저장</button></td>
												</tr>
											</tbody>
										</table>

									</div>
								</form>

								<c:if test="${not empty cin }">
									<div class="line top">
										<div>
											<h5>변경된 채널 제목</h5>
										</div>
									</div>
									<div>
										<br>
										<br>
										<h5>${cin }</h5>
									</div>

								</c:if>
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
							<c:choose>
								<c:when test="${not empty pi.atMName}">
									<img
										src="${ contextPath }/resources/uploadFiles/profile/${pi.atMName}${ext2}"
										style="width: 150px; height: 150px; border-radius: 50%;">
								</c:when>
								<c:otherwise>
									<img src="/resources/uploadFiles/profile/profile1.png" alt=""
										style="width: 150px; height: 150px; border-radius: 50%;">
								</c:otherwise>
							</c:choose>
							<a><h4>${m.nickName }</h4></a>
							<p>@${m.userId }</p>
							<c:set var="stitle" value="채널명을 입력해주세요" />
							
							<c:choose>
									<c:when test="${title ne stitle }">
										<p>${title }</p>
									</c:when>
								</c:choose>
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