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
#subsccriberNum{
	display: inline-block;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/channel/channel_header.jsp" />

	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area" style="
    background-color: white;
">
	
					
					
					<div class="row" id="listbReply">
					<div class="form-inline">
						<input class="form-control mr-sm-3" type="search" id="search"
							placeholder="아이디를 입력하세요">
						<button class="btn btn-success" id="searchBtn" style="background-color: #6ac169;"
							onclick="searchBoard();">Search</button>
					</div>
					<br>
					<br>
					<br>
						<table class="table table-bordered" style="text-align: center">
							<thead>
								<tr>
									<th style="text-align: center">아이디</th>
									<th style="text-align: center">닉네임</th>
									<th style="text-align: center">날짜</th>
									<th style="text-align: center">상태</th>
								</tr>
							</thead>
							<c:forEach var="row" items="${list}">
							<tbody>
								<tr>
									<td>${row.userId}</td>
									<td>${row.nickName }</td>
									<td>${row.rDate}</td>
									<td><a class="btn btn-success" style="background-color: #6ac169;"
									href="${contextPath }/deleteBlack.ch?rchNo=${row.rchNo}&&rtargetuNo=${row.rtargetuNo}">삭제</a></td>
								</tr>
								</tbody>
								</c:forEach>
						</table>
								<div>
				<c:if test="${pagination.curRange != 1 }">
					<a href="javascript:listbReply('1')">[처음]</a>
				</c:if>
				<c:if test="${pagination.curPage != 1}">
					<a href="javascript:listbReply('${ pagination.prevPage}')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${pagination.startPage }"
					end="${pagination.endPage }">
					<c:choose>
						<c:when test="${num ==  pagination.curPage}">
							<span style="font-weight: bold;">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:listbReply('${num }')">${num }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if
					test="${pagination.curPage <= pagination.pageCnt && pagination.pageCnt > 0}">
					<a href="javascript:listbReply('${pagination.nextPage }')">[다음]</a>
				</c:if>
				<c:if
					test="${pagination.curRange <= pagination.rangeCnt && pagination.rangeCnt > 0}">
					<a href="javascript:listbReply('${pagination.pageCnt }')">[끝]</a>
				</c:if>
			</div>
					</div>
					
					
	</section>

	
	<!-- End post-content Area -->


<script type="text/javascript">
var msg = '<c:out value="${msg}"/>';
console.log(msg);

$(function() {
	if (msg) {
		alert(msg);
	}
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