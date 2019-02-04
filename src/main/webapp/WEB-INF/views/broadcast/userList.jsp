<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 목록</title>

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Semantic UI CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- J-query CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Semantic UI JS CDN -->
<style type="text/css">
#header {
	margin-top: 30px;
}


#tableDiv {
	margin-top: 70px;
}


</style>

</head>
<body>
	<div class="ui attached stackable menu">
		<div class="ui container">
			<a class="item" href="userList.bc"> <i class="grid layout icon"></i>
				유저 목록
			</a> <a class="item" href="/addManager.bc"> <i class="home icon"></i>
				매니저 추가
			</a> <a class="item" href="/addBanWord.bc"> <i class="mail icon"></i>
				금지어 추가
			</a> <a class="item" href="broadCastSetting.bc"
				style="border-left: 1px solid lightgray"><i
				class="settings icon"></i>방송 설정</a>
		</div>
	</div>
	<div class="ui container">
		<div class="ui large header" id="header">
			<h1>시청자 목록</h1>
		</div>
		
		<div class="sixteen wide column" id="tableDiv">
			<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>아이디</th>
						<th>구독 여부</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td data-label="Name">비워두면</td>
						<td data-label="Age">이상해서</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>