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
					<div class="line top">
						<div>
							<h5>베너 사진 설정</h5>
						</div>
					</div>

					<form action="updateBimg.ch?CuNo=${m.uno}" method="post"
						enctype="multipart/form-data">
						<div class="row">


							<table class="table table-bordered">
								<tbody>
									<tr>
										<th style="width: 20%; text-align: center">*사진 설정</th>

										<th><input type="file" name="banner" title="파일찾기"></th>

									</tr>
									<tr>
										<td colspan="2" align="center"><button type="submit"
												class="btn btn-primary more" id="saveBtn"
												style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; width: 102px; height: 32px;">저장</button></td>
									</tr>
								</tbody>
							</table>
					</form>

				</div>
				<!-- 설정해놓은 이미지를 띄워준다 -->
				<div id="img">
					<c:if test="${not empty a.atMName}">
						<img
							src="${ contextPath }/resources/uploadFiles/banner/${a.atMName}${ext}"
							style="width: 400px;">
					</c:if>

				</div>
				<div class="line top">
					<div>
						<h5>프로필 사진 설정</h5>
					</div>
				</div>
				<form action="updatePimg.ch?CuNo=${m.uno }" method="post"
					enctype="multipart/form-data">
					<div class="row">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="width: 20%; text-align: center">*사진 설정</th>

									<th><input type="file" name="profile" title="파일찾기"></th>

								</tr>
								<tr>
									<td colspan="2" align="center"><button type="submit"
											class="btn btn-primary more" id="saveBtn"
											style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; width: 102px; height: 32px;">저장</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<!-- 설정해놓은 이미지를 띄워준다 -->
				<div id="img">
					<c:if test="${not empty pa.atMName}">
						<img
							src="${ contextPath }/resources/uploadFiles/profile/${pa.atMName}${ext}"
							style="width: 300px;">
					</c:if>

				</div>
			</div>

<jsp:include page="/WEB-INF/views/channel_admin/channel_admin_sidebar.jsp" />
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

	<script type="text/javascript">
		var message = '${msg}';
		console.log(message)
		if (message) {
			alert(message);
		}
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