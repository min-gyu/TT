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


	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">


		<div class="comments">
			<div id="listReply">
				<c:forEach var="row" items="${list}">
					<div class="item">
						<div class="user">
							<!-- <figure>
												<img src="images/img01.jpg">
											</figure> -->
							<div class="details">
								<h5 class="name"></h5>
								<h5 class="name">${row.bnickName}</h5>
								<h5 class="name">@${row.buId}</h5>
								<div class="time">${row.bwDate}</div>
								<div class="description">${row.bContent }</div>
								<footer style="padding-left: 500px;">
									<c:set var="loginUser"
										value="${sessionScope.loginUser.userId }" />
									<c:if test="${row.buId eq loginUser}">
										<a class="love active" type="hidden" > </a>
										<a class="btn btn-primary more" href="${contextPath}/deleteDet.ch?CuNo=${row.buNo}&&buId=${row.buId}&&bNo=${row.bNo}"
											style="padding-top: 10px; width: 67px; height: 42px; padding-left: 15px; padding-right: 15px;">
											<div>삭제</div>
											<div>
												<i class="ion-ios-arrow-thin-right"></i>
											</div>
										</a>
									</c:if>
								</footer>

							</div>
						</div>
					</div>
				</c:forEach>
				<div>
					<c:if test="${pagination.curRange != 1 }">
						<a href="javascript:listReply('1')">[처음]</a>
					</c:if>
					<c:if test="${pagination.curPage != 1}">
						<a href="javascript:listReply('${ pagination.prevPage}')">[이전]</a>
					</c:if>
					<c:forEach var="num" begin="${pagination.startPage }"
						end="${pagination.endPage }">
						<c:choose>
							<c:when test="${num ==  pagination.curPage}">
								<span style="font-weight: bold;">${num}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:listReply('${num }')">${num }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${pagination.curPage <= pagination.pageCnt && pagination.pageCnt > 0}">
						<a href="javascript:listReply('${pagination.nextPage }')">[다음]</a>
					</c:if>
					<c:if
						test="${pagination.curRange <= pagination.rangeCnt && pagination.rangeCnt > 0}">
						<a href="javascript:listReply('${pagination.pageCnt }')">[끝]</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>


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
	
</script>
</html>