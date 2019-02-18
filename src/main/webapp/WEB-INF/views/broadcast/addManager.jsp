<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매니저 추가</title>

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

#addManager {
	margin-top: 70px;
}

#searchManager {
	margin-top: 70px;
}

#searchDiv {
	float: right;
}

#tableDiv {
	margin-top: 10px;
}

#inputManagerDiv {
	width: 100%;
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
			<a class="item" href="userList.bc"> <i class="grid layout icon"></i>
				시청자 목록
			</a> <a class="item" href="/addManager.bc"> <i class="home icon"></i>
				매니저 추가
			</a> <a class="item" href="/addBanWord.bc"> <i class="mail icon"></i>
				금지어 추가
			</a> <a class="item" href="broadCastSetting.bc"><i
				class="settings icon"></i>방송 설정</a>
				<div class="right item"><h5>${ loginUser.userId }</h5>님 환영합니다.</div>
		</div>
	</div>
	<div class="ui container">
		<div class="ui large header" id="header">
			<h1>매니저 추가</h1>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column" id="addManager">
				<h3>매니저 추가</h3>
				<div class="ui grid">
					<div class="six wide column">
						<div class="ui input" id="inputManagerDiv">
							<input type="text" placeholder="아이디를 입력하세요" id="addManagerId">
						</div>
					</div>
					<div class="two wide column">
						<button class="ui secondary button" id="addManagerBtn">추가</button>
					</div>
				</div>
			</div>
		</div>

		<div class="ui grid">
			<div class="sixteen wide column" id="searchManager">
				<h3>매니저 검색</h3>
				<div class="menu">
					<div class="item">
						<div class="ui icon input" id="searchDiv">
							<input type="text" placeholder="Search..." disabled="disabled"> <i
								class="inverted circular search link icon"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="sixteen wide column" id="tableDiv">
			<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>아이디</th>
						<th>지정일</th>
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
<script type="text/javascript">
	$(function(){
		//로그인 안했을시 창 종료 추가할 것.
	})
	
	$("#addManagerBtn").click(function(){	
	$.ajax({
		url : "/insertManager.bc",
		type : "post",
		data: {
		   	owner:"${loginUser.userId}",
		   	addManagerId:$("#addManagerId").val()
		  },
		success : function(data) {
			console.log(data);
			switch(data){
			case "존재하지 않는 유저 입니다" : 
				swal({
				  title: "경고",
				  text: "존재하지 않는 유저입니다.",
				  icon: "warning",
				})
				break;
			}
		},
		error : function(data) {
			console.log("실패")
		}
	});
	});
</script>
</html>