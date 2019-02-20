<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>클로버 선물하기</title>

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Semantic UI CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- J-query CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
#header {
	margin-top: 30px;
}

#myCloverDiv {
	margin-top: 70px;
}

#presentClover {
	margin-top: 70px;
}

#myClover {
	width: 100%;
}
#searchListNum, #deleteBanWordDiv{
	display: inline-block;
	padding: 10.5px;
}
#dog{
	margin-left:10px;
	margin-top:7px;
}
</style>
<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="ui attached stackable menu">
			<div class="ui container">
			<a class="item" href="/presentClover.bc"><i class="box icon"></i>클로버 선물하기</a>
			<div class="right item"><h5>${ loginUser.userId }</h5>님 환영합니다.</div>
		</div>
	</div>
	<div class="ui container">
		<div class="ui large header" id="header">
			<h1>클로버 선물하기</h1>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column" id="myCloverDiv">
				<h3>나의 보유 클로버</h3>
				<div class="ui grid">
					<div class="four wide column">
						<div class="ui input" id="myClover">
							<input type="text" id="addChatBanUser" disabled="disabled" value="${loginUser.totalClover}" style = "text-align:right;">
							<span id="dog">개</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="ui grid">
			<div class="sixteen wide column" id="presentClover">
				<h3>클로버 선물하기</h3>
			</div>
		</div>
		<div class="ui grid">
			<div class="four wide column">
				<div class="ui input" id="myClover">
						<input type="text" id="addChatBanUser" disabled="disabled" value="${ param.owner }" style = "text-align:right;">
						<span id="dog">에게</span>
				</div>
			</div>
			<div class="four wide column">
				<div class="ui input" id="myClover">
						<input type="text" id="addChatBanUser" value="${loginUser.totalClover}">
						<span id="dog">개를</span>
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column" id="presentClover" align="center">
				<button class="ui secondary button small" id="deleteBtn">선물하기</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>