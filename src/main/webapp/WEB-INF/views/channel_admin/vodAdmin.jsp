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
</head>
<body>
	<jsp:include page="/WEB-INF/views/channel/channel_header.jsp" />
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>

	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="row">
						<div class="col-md-offset-9">
							<div class="info"
								style="padding-top: 20px; padding-bottom: 20px;">
								<a href="/vodAdd.ch?CuNo=${m.uno }" class="genric-btn info circle arrow">VOD
									추가<span class="lnr lnr-arrow-right"></span>
								</a>
							</div>

						</div>
					</div>
					<div class="col-lg-9 col-md-9">
						<div class="row">
							<c:forEach var="row" items="${list}">
								<article class="col-md-12 article-list">
									<div class="inner">
										<figure>
											<video class="img-fluid"
													src="${ contextPath }/resources/uploadFiles/${row.atMName}.mp4"
													type="video/mp4"  style="padding-left: 0%;"></video>
										</figure>
										<div class="details"
											style="width: 410px; border-bottom: 1px solid #eee;">
											<div class="detail">
												<div class="category">
													<a>VOD</a>
												</div>
												<div class="time">${row.bwDate }</div>
											</div>
											<h1>
												<a href="${contextPath}/vod_oneList.ch?bNo=${row.bNo}&&CuNo=${m.uno }">${row.bTitle }</a>
											</h1>
											<p>${row.bContent }</p>
											<footer>
												<a href="#" class="love active"><i
													class="ion-android-favorite"></i>
													<div>${row.bCount }</div></a> <a class="btn btn-primary more"
													href="/vodRevise.ch">
													<div>수정</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>
							</c:forEach>
						</div>
								<div>
										<c:if test="${pagination.curRange != 1 }">
											<a href="#" onClick="fn_paging(1)">[처음]</a>
										</c:if>
										<c:if test="${pagination.curPage != 1}">
											<a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a>
										</c:if>
										<c:forEach var="pageNum" begin="${pagination.startPage }"
											end="${pagination.endPage }">
											<c:choose>
												<c:when test="${pageNum ==  pagination.curPage}">
													<span style="font-weight: bold;"><a href="#"
														onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
												</c:when>
												<c:otherwise>
													<a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if
											test="${pagination.curPage != pagination.pageCnt && pagination.pageCnt > 0}">
											<a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a>
										</c:if>
										<c:if
											test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
											<a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
										</c:if>
									</div>
					</div>
				</div>


	<!-- 관리자 사이드바 -->
				<jsp:include page="/WEB-INF/views/channel_admin/channel_admin_sidebar.jsp" />
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<!-- End post-content Area -->

	<script>
	function fn_paging(curPage) {
		location.href = "/vod_List.ch?curPage=" + curPage+"&CuNo="+${m.uno };
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