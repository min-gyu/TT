<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
#header {
	margin-top: 30px;
}

#tableDiv {
	margin-top: 70px;
}
#searchDiv {
	float: right;
}
#userListNum{
	display: inline-block;
	padding: 10.5px;
}
</style>

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
			<h1>시청자 목록</h1>
		</div>
		<div class="sixteen wide column" id="tableDiv">
			<div class="ui grid">
				<div class="sixteen wide column" id="searchUser">
					<h3>시청자 목록</h3>
					<div class="menu">
						<div class="item">
						<div id="userListNum"><span>검색 버튼을 눌러주세요</span></div>
							<div class="ui icon input" id="searchDiv">
								<input type="text" placeholder="Search..."> <i
									class="inverted circular search link icon" id="searchI"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>아이디</th>
						<th>구독 여부</th>
					</tr>
				</thead>
				<tbody id="dataBody">
					<tr align="center">
						<td colspan="2">검색 버튼을 눌러주세요</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
<!-- socket.io를 가져오는 스크립트 -->
<script src="http://localhost:8010/socket.io/socket.io.js"></script>
<script type="text/javascript">

$(function(){
	//서치 소켓에 연결
		
});
$("#searchI").click(function(){
	if("${loginUser}"!=null){
		var socket = io.connect('http://localhost:8010/search', {
		path : '/socket.io'	}); //localhost에 연결합니다.
		console.log("search 소켓 연결!");
		axios({
	 	    method: 'get',
	    	url: 'http://localhost:8010/search',
	   		params: {	
	      	owner:"${loginUser.userId}"
	    	}
	  	})
	  	.then(function (response) {
	  		console.log(response.data);
	  		if(response.data!="방송중이 아닙니다."){
	  			if(response.data.length==0){
	  				$("#dataBody").empty();
	  				var $td = $("<td colspan='2'>").text("시청중인 유저가 없습니다.");
	  				var $tr = $("<tr align='center'>");
	  				$tr.append($td);
	  				$("#dataBody").append($tr);
	  			
	  			}else{
					$("#userListNum").children().eq(0).text(response.data.length-1+"명이 시청중 입니다!");
	  				$("#dataBody").empty();
	  				for(var i=0;i<response.data.length;i++){ 				
	  					if(response.data[i].userId!="${loginUser.userId}"){
	  						var $td = $("<td colspan='2'>").text(response.data[i].userId);
		  					var $tr = $("<tr align='center'>");
		  					$tr.append($td);
		  					$("#dataBody").append($tr);
	  					}
	  				}
	  			}
	  		}else{
	  			$("#dataBody").empty();
  				var $td = $("<td colspan='2'>").text("방송중이 아닙니다.");
  				var $tr = $("<tr align='center'>");
  				$tr.append($td);
  				$("#dataBody").append($tr);
	  		}
	  		console.log("search 소켓 연결 해제!");
	  		socket.disconnect();
	  	})
	  	.catch(function (error) {
	  	});
	}else{
		swal({
			  title: "경고",
			  text: "잘못된 접근입니다.",
			  icon: "warning",
		}).then(()=>{
			//페이지 다른데로 보내기
		});
	}
})

</script>
</html>