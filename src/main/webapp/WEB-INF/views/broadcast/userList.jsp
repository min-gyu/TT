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
			<a class="item" href="/userList.bc?owner=${param.owner}"> <i class="user icon"></i>시청자 목록</a>
			<c:if test="${ (!empty loginUser) and (loginUser.userId eq param.owner) }">
			<a class="item" href="/addManager.bc?owner=${param.owner}"><i class="user outline icon"></i>매니저 추가</a>
			</c:if> 
			<a class="item" href="/addChatBanUser.bc?owner=${param.owner}"><i class="ban icon"></i>채팅 금지 설정</a>
			<a class="item" href="/addBanWord.bc?owner=${param.owner}"><i class="edit icon"></i>금지어 추가</a> 
			<c:if test="${ (!empty loginUser) and (loginUser.userId eq param.owner) }">
			<a class="item" href="/broadCastSetting.bc?owner=${param.owner}"><i class="settings icon"></i>방송 설정</a>
			</c:if>
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
								<input type="text" placeholder="Search..." disabled="disabled"> <i
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
						<th>닉네임</th>
						<th>구독 여부</th>
					</tr>
				</thead>
				<tbody id="dataBody">
					<tr align="center">
						<td colspan="3">검색 버튼을 눌러주세요</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
<!-- socket.io를 가져오는 스크립트 -->
<script src="https://192.168.30.51:8010/socket.io/socket.io.js"></script>
<script type="text/javascript">

$(function(){
	jQuery.ajaxSettings.traditional = true;
	if(${empty loginUser}){
		swal({
			  title: "경고",
			  text: "로그인이 필요한 서비스 입니다.",
			  icon: "warning",
			}).then(()=>{
				location.href="/goMain.bc";
				window.self.close(); //팝업 창을 닫는다
			});			
	}else{
		if(${loginUser.userId == param.owner}){
			console.log("방송채널 주인인 유저!");
		}else{
			console.log("방송채널 주인이 아닌 유저!");
			$.ajax({
				url : "/selectBSManager.bc",
				type : "get",
				data: {
			   		owner:"${ param.owner }",
			   		uno:"${loginUser.uno}"
			  	},
				success : function(data) {
					switch(data){
					case "매니저" : {console.log("매니저"); break;}
					case "비매니저" : {
						swal({
							  title: "경고",
							  text: "크리에이터 또는 매니저만 이용가능한 서비스 입니다.",
							  icon: "warning",
							}).then(()=>{
								location.href="/goMain.bc";
								window.self.close(); //팝업 창을 닫는다
							});					
						break;}
					}
					
				},
				error : function(data) {
					console.log("실패")
				}	
			});
		}
		
	}
		
});
$("#searchI").click(function(){
	if("${loginUser}"!=null){
		var socket = io.connect('https://192.168.30.51:8010/search', {
		path : '/socket.io'	}); //localhost에 연결합니다.
		console.log("search 소켓 연결!");
		axios({
	 	    method: 'get',
	    	url: 'https://192.168.30.51:8010/search',
	   		params: {	
	      	owner:"${ param.owner }"
	    	}
	  	})
	  	.then(function (response) {
	  		console.log(response.data);
	  		if(response.data!="방송중이 아닙니다."){
	  			if(response.data.length==1){
	  				$("#dataBody").empty();
	  				var $td = $("<td colspan='3'>").text("시청중인 유저가 없습니다.");
	  				var $tr = $("<tr align='center'>");
	  				$tr.append($td);
	  				$("#dataBody").append($tr);
	  			
	  			}else{
	  				//유저리스트 만들기(본인 포함)
	  				var userList = new Array();
	  				for(var i=0;i<response.data.length;i++){
	  					userList[i]=response.data[i].userId; 
	  				}
	  				//구독여부를 조회하기 위해서 오라클에 새로운 요청
	  				 $.ajax({
						url : "/searchSubscribe.bc",
						type : "get",
						data: {
			   				owner:"${ param.owner }",
			   				userList:userList
			  			},	
						success : function(data) {
							console.log(data);
							$("#userListNum").children().eq(0).text(data.member.length-1+"명이 시청중 입니다!");
			  				$("#dataBody").empty();
			  					for(var i=0; i<data.member.length; i++){
			  						if(data.member[i].userId!="${ param.owner }"){
			  							var $tdSubscribe = $("<td>").text("구독하지 않은 유저!");
			  							for(var j=0; j<data.relation.length; j++){
			  								if(data.member[i].uno==data.relation[j].rTargetUno){
			  									$tdSubscribe.text(data.relation[j].rType);
			  									break;
			  								}
			  							}
			  							var $tdUserId = $("<td>").text(data.member[i].userId);
			  							var $tdUserNickName = $("<td>").text(data.member[i].nickName);	  						
				  						var $tr = $("<tr align='center'>");
				  						$tr.append($tdUserId);
				  						$tr.append($tdUserNickName);
				  						$tr.append($tdSubscribe);
				  						$("#dataBody").append($tr);
			  						}
			  					
			  					}
						},
						error : function(data) {
							console.log("실패")
						}
					});  

	  			}
	  		}else{
	  			$("#dataBody").empty();
  				var $td = $("<td colspan='3'>").text("방송중이 아닙니다.");
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