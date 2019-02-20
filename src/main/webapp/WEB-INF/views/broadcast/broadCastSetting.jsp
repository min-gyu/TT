<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 목록</title>

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Semantic UI CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Semantic UI JS CDN -->
<style type="text/css">
#header {
	margin-top: 30px;
}

#broadCastNameGrid {
	margin-top: 70px;
}

#inputBroadCastName {
	width: 100%;
}

#broadCastCategGrid {
	margin-top: 70px;
}

#icon {
	margin-top: 10px;
	font-size: 30px;
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
			<h1>방송설정</h1>
		</div>
		<div id="broadCastNameGrid">
			<h3>방송제목 설정</h3>
			<div class="ui grid">
				<div class="six wide column">
					<div class="ui input" id="inputBroadCastName">
						<input type="text" placeholder="방송 제목을 입력하세요">
					</div>
				</div>
				<div class="two wide column">
					<button class="ui secondary button">설정</button>
				</div>
			</div>
		</div>
		<div id="broadCastCategGrid">
			<h3>방송 카테고리 설정</h3>
			<div class="ui grid">
				<div class="three wide column">
					<div class="ui selection dropdown">
						<input type="hidden" name="gender"> <i
							class="dropdown icon"></i>
						<div class="default text">Gender</div>
						<div class="menu">
							<div class="item" data-value="1">Male</div>
							<div class="item" data-value="0">Female</div>
						</div>
					</div>
				</div>
				<div class="one wide column" align="center">
					<i class="angle double right icon" id="icon"></i>
				</div>
				<div class="three wide column">
					<div class="ui selection dropdown">
						<input type="hidden" name="gender"> <i
							class="dropdown icon"></i>
						<div class="default text">Gender</div>
						<div class="menu">
							<div class="item" data-value="1">Male</div>
							<div class="item" data-value="0">Female</div>
						</div>
					</div>
				</div>
				<div class="two wide column">
					<button class="ui secondary button">설정</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
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
				swal({
					  title: "경고",
					  text: "방송채널 주인만 가능한 서비스입니다.",
					  icon: "warning",
					}).then(()=>{
						location.href="/goMain.bc";
						window.self.close(); //팝업 창을 닫는다
					});	
			}
			
		}
	})
	</script>
</body>
</html>