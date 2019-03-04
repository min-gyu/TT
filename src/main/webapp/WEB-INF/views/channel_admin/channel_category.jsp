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
					<form name="select_machine">
						<div class="row">
							<h5>주 카테고리 관리 관리</h5>
						</div>
						<div class="row">
							<div class="col-ms-12">
								<h6>카테고리 추가</h6>
								<select name="topCate" id="topCate"
									onChange="showSub(this.options[this.selectedIndex].value);"
									style="
    											width: 230px;
   													 height: 32px;">
   									<option value="0" selected>상위 카테고리를 선택하세요</option>
									<option value="1">스포츠</option>
									<option value="2">먹방</option>
									<option value="3">뷰티</option>
									<option value="4">VLOG</option>
									<option value="5">VOD</option>
								</select> 
								<br><br><select name="subCate1" 
								onChange="suboneCate(this.options[this.selectedIndex].value);"style="display:;
    											width: 230px;
   													 height: 32px;">
   													 <option value="0" selected>하위 카테고리를 선택하세요</option>
									<option value="7">축구</option>
									<option value="8">농구</option>
									<option value="9">배구</option>
									<option value="10">야구</option>
								</select> <br><br><select name="subCate2" 
								onChange="subtwoCate(this.options[this.selectedIndex].value);" style="display:;
								width: 230px;
   													 height: 32px;">
   													 <option value="0" selected>하위 카테고리를 선택하세요</option>
									<option value="11">스포츠</option>
									<option value="12">먹방</option>
									<option value="13">뷰티</option>
									<option value="14">VLOG</option>
								</select>
								<button class="btn btn-danger btn-sm" id="insertCat" >추가</button>
							</div>
						</div>
						
					</form>
					<div class="row">
						<table class="table table-bordered" style="text-align: center">
							<thead>
								<tr>
									<th style="text-align: center">아이디</th>
									<th style="text-align: center">닉네임</th>
									<th style="text-align: center">날짜</th>
									<th style="text-align: center">상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>글씨</td>
									<td>이상해</td>
									<td>ㅇㅇ</td>
									<td><button class="btn btn-danger btn-sm">삭제</button></td>
								</tr>

							</tbody>
						</table>
					</div>


				</div>

				<!-- 관리자 사이드바 -->
				<jsp:include
					page="/WEB-INF/views/channel_admin/channel_admin_sidebar.jsp" />
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	<!-- End post-content Area -->


	<script type="text/javascript">
	
	
	f = document.forms.select_machine;
	f.subCate2.style.display = "none";
	f.subCate1.style.display = "none";
	
		
		
		function showSub(obj) {
			f = document.forms.select_machine;
			if (obj == 1) {
				f.subCate1.style.display = "";
				f.subCate2.style.display = "none";
				var topCate=1;
				console.log(topCate);
				return addCate(topCate);
				
			}
			else if(obj == 5){
				f.subCate1.style.display = "none";
				f.subCate2.style.display = "";
				var topCate=5;
				console.log(topCate);
				return addCate(topCate);
			}
		}
		
		
		function suboneCate(obj){
			var subCate=$("select[name=subCate1]").val();
			console.log(subCate);
			return addCate(subCate);
		}
		
		function subtwoCate(obj){
			var sub2Cate=$("select[name=subCate2]").val();
			console.log(sub2Cate);
			return addCate(subCate);
		}
		
		
			function addCate(num){
			
		}
			
	$("#insertCat").click(function(){
		var topCate=$("select[name=topCate]").val();
		var subCate=$("select[name=subCate1]").val();
		var sub2Cate=$("select[name=subCate2]").val();
		
		var arr=new Array;
		arr.push(topCate);
		arr.push(subCate);
		arr.push(sub2Cate);
		
		$.ajax({
			url:"insertCate.ch",
			type:"GET",
			data:{arr:arr},
			success:function(data){
				alert("삽입완료");
				window.location.reload();
			}
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