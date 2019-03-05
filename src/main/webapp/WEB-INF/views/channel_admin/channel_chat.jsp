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
#subsccriberNum {
	display: inline-block;
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
						<h5>채팅 필터 관리</h5>
					</div>

					<div class="row">
						<div class="col-ms-12">
							<h6>금칙어</h6>
							<input type="text" id="banLan">
							<input type="hidden" id="CuNo" value="${CuNo }">
						</div>
					</div>
					<div class="row">
						<div class="col-ms-12">
							<h6>대체어</h6>
							<input type="text" id="reLan">
							<button class="btn btn-danger btn-sm" id="banBtn">추가</button>
						</div>
					</div>



			<div id="listchatReply"></div>


				</div>


		<!-- 관리자 사이드바 -->
				<jsp:include page="/WEB-INF/views/channel_admin/channel_admin_sidebar.jsp" />
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<!-- End post-content Area -->
	<script type="text/javascript">
	
	
		$("#banBtn").click(
				function() {
					var banLan = $("#banLan").val();
					var reLan = $("#reLan").val();
					var CuNo=$("#CuNo").val();
					

					$.ajax({
						type : "post",
						url : "${contextPath}/insertBanLan.ch",
						/* data : "banLan=" + banLan + "&reLan=" + reLan
								+ "&CuNo=" + CuNo, */
						data:{banLan:banLan,reLan:reLan,CuNo:CuNo},
						success : function(data) {
							alert(data);
							$("#banLan").val("");
							$("#reLan").val("");
							listchatReply("1");

						}
					});
				});
		listchatReply("1");
		function listchatReply(num) {
			var CuNo=$("#CuNo").val();
			console.log(num);
			$.ajax({
				type : "get",
				url : "${contextPath}/listBanC.ch",
				data : "CuNo="+CuNo+"&curPage="+num,
				success : function(result) {
					$("#listchatReply").html(result);
				}
			});
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