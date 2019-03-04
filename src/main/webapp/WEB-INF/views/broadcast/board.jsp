<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
<meta name="author" content="Kodinger">
<meta name="keyword"
	content="magz, html5, css3, template, magazine template">
<!-- Shareable -->
<meta property="og:title"
	content="HTML5 & CSS3 magazine template is based on Bootstrap 3" />
<meta property="og:type" content="article" />
<meta property="og:url" content="http://github.com/nauvalazhar/Magz" />
<meta property="og:image"
	content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" />

<title>Today's TV BroadCast</title>
<!-- template 제공 -->
<link rel="stylesheet"
	href="/resources/assets/scripts/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/toast/jquery.toast.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet"
	href="/resources/assets/scripts/sweetalert/dist/sweetalert.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<link rel="stylesheet" href="/resources/assets/css/skins/all.css">
<link rel="stylesheet" href="/resources/assets/css/demo.css">
<!-- 폰트 어썸 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<style type="text/css">

html, body{
	height:100%;
		overflow: hidden;
	}
#searchLi {
	width:300px;
	display: inline;
	margin-top: -25px;
}
#searchForm{
	margin-left: 0px;
}

#broadCastDiv {
	background: black;
	height: 77%;
	width: 100%
}

#broadCastWarpper {
	overflow-y: scroll;
	height: 800px;
	
}

#inputChat {
	height: 100%;
	width: 100%;
	margin-right: -15px;
	margin-top: 5px;
}

#inputBtnDiv {
	height: 100%;
	width: 30%;
	margin-left: -10px;
	margin-top: 5px;
}

#inputBtn {
	height: 100%;
	width: 100%
}

#inputTextArea {
	width: 110%;
	height: 100%;
}

#chatWrapper {
	height: 100%
}

#chattingDiv {
	overflow-y: scroll;
	border: 1px solid black;
	height: 78%;
	margin-left: -25px;
	padding:10px;
	background: #EFFBEF;
	margin-top: 15%;
 	margin-right:1px;	
}

#inputChatDiv {
	height: 10%;
	margin-left: -25px;
	margin-right:1px;
}

/* #optionDiv {
	height: 5%;
	margin-left: -25px;
} */

.icons {
	font-size: 24px;
}

.icons:hover {
	cursor: pointer;
}

#report:hover {
	cursor: pointer;
}

.pull-right {
	margin-right: 10px;
}
.mine { text-align: right; }
.system { text-align: center; }
.mine div:first-child, .other div:first-child { font-size: 12px; }
.mine div:last-child, .other div:last-child {
    display: inline-block;
    border: 1px solid silver;
    border-radius: 5px;
    padding: 2px 5px;
    max-width: 300px;
    background: white;
}
.system { 
	text-align: center;
	font-weight: bold;
	font-size: medium;
	}
#broadCatsIcon, #presentIcon, #broadSettingIcon, #subscribeIcon, #broadCastExitIcon, #freezeIcon, #userCheckIcon{
	margin-top: 2px;
}
#headerDiv{
	height:100%;
}
#contaionerDiv{
	height:100%
}
#headerRowDiv{
	height:15%;
}
#bodyRowDiv{
	height:85%;
}
#firstBodyCol{
	height:100%
}
#secondBodyCol{
	height:100%;
}
#broadCastInfo{
	height:40%;
}
#creator{
	font-family: 'Raleway', sans-serif;
    font-weight: 700;
    line-height: 23px;
    position: relative;
    font-size: large;
}
#title{
	font-family: 'Raleway', sans-serif;
    font-weight: 700;
    line-height: 23px;
    position: relative;
    font-size: 25px;
}
#titleDiv{
  margin-top: 15px;
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
<body class="skin-green">
	<div class="container-fluid" id="contaionerDiv">
		<div class="row" id="headerRowDiv">
			
				<header class="primary">
					<div class="firstbar">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
								<div class="brand">
									<a href="/goMain.bc"><img src="/resources/images/logo.png" alt="Today's TV"></a>
								</div>
							</div>
							<div class="col-lg-8 col-md-8 hidden-xs hidden-sm pull-right">
								<ul class="nav-icons" id="optionUl">
						 	<c:if test="${ (!empty loginUser) and (loginUser.userId eq param.owner) }">
							<li id="broadLi"><a href="#"><i class="fas fa-video" id="broadCatsIcon"></i>
									<div>방송하기</div></a></li>
							<li id="exitBroadLi"><a href="#"><i class="fas fa-times-circle" id="broadCastExitIcon"></i>
									<div>방송종료</div></a></li>
							<li id="iceChatLi"><a href="#"><i class="far fa-snowflake" id="freezeIcon"></i>
									<div>채팅창 얼리기</div></a></li>
							<li id="broadSettingLi"><a href="#"><i class="fas fa-cog" id="broadSettingIcon"></i>
									<div>방송 설정</div></a></li>			
							</c:if>
							<c:if test="${ (!empty loginUser) and (loginUser.userId ne param.owner)}">
							<li id="presentLi">	<a href="#"><i class="fas fa-gifts" id="presentIcon"></i>
									<div>선물하기</div></a></li>			
									<li id="subscribeLi"><a href="#"><i class="far fa-star" id="subscribeIcon"></i>
									<div>구독하기</div></a></li>
							</c:if>
							<c:if test="${ empty loginUser }">
							<li><a href="loginView.me"><i class="fas fa-user-check" id="userCheckIcon"></i>
									<div>Login</div></a></li>
							</c:if>
							<li id="searchLi">
								<form class="search"  id="searchForm">
									<div class="form-group" id="searchDiv">
										<div class="input-group">
											<input type="text" name="q" class="form-control" placeholder="검색어를 입력해주세요">
											<div class="input-group-btn">
												<button class="btn btn-primary"> <i class="ion-search"></i> </button>
											</div>
										</div>
									</div>
								</form>
							</li>
						</ul>
						</div>
					</div>
					<hr>
				</div>
			</header>
		
	</div>
<!-- Header Row 끝 -->	
	<div class="row" id="bodyRowDiv">
		<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12" id="firstBodyCol">
			<div id="broadCastWarpper">
				<div id="broadCastDiv">
					 <video id="localVideo" width="890" height="610" autoplay muted playsinline></video>
				</div>
					<div align="right" style="margin-right: 10px;">
					<c:if test="${ (!empty loginUser) and (loginUser.userId eq param.owner)}">
						<button id="cam" onclick="aa();" disabled style="color:grey">캠 활성화</button>
						<button id="screen" onclick="dd();" disabled style="color:grey; margin-right: 10px; margin-top: 5px;"  >화면공유</button>
					</c:if>
						<img alt="s" src="/resources/images/siren.png" width="20" height="20" id="report">
					</div>
				<hr>
				<div id="broadCastInfo">
					<div>
						<span id="creator" style="color:green">${ param.owner }</span>
					</div>
					<div id="titleDiv">
						<span id="title">방송 제목 적는 곳 입니다.</span>
					</div>
				</div>				
			</div>
		</div>
		<div class="col-lg-3 col-md-3 hidden-xs hidden-sm" id="secondBodyCol">
			<div id="chatWrapper">
				<div id="chattingDiv" class="row"></div>
					<hr style="margin-top: 5px; margin-bottom: 5px">
				<div id="inputChatDiv" class="row">
					<div class="col-lg-9 col-md-9 col-sm-8" style="padding-left: 0px; padding-right: 0px; black; height: 100%">
						<c:choose>
						<c:when test="${ !empty loginUser }">
						<textarea class="form-control" rows="4" width="100%" style="height: 100%; resize: none" id="msg" name="msg" onkeyup="fc_chk_byte(this,20);" onkeypress="fc_chk2();" ></textarea>
						</c:when>
						<c:otherwise>
						<textarea class="form-control" rows="4" width="100%" style="height: 100%; resize: none" id="msg" name="msg" maxlength="0"></textarea>
						</c:otherwise>
						</c:choose>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4" style="padding-left: 0px; padding-right: 0px; height: 100%">
						<c:choose>
						<c:when test="${ !empty loginUser }">
						<button type="button" class="btn btn-success" style="padding: 0px; height: 100%; width: 100%; background: #045919" id="sendBtn" onclick="notSend();">전송</button>
						</c:when>
						<c:otherwise>
						<button type="button" class="btn btn-success"style="padding: 0px; height: 100%; width: 100%; background: #045919" id="sendBtn" onclick="loginMsg();">전송</button>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
<script>
	$("#broadSettingLi").click(function(){
		window.open("/userList.bc?owner=${param.owner}", "방송 시청자 목록",
		"width=1250, height=1200, left=100, top=50, location=no");
	})
	$("#presentLi").click(function(){
		window.open("/goPresentClover.bc?owner=${param.owner}", "클로버 선물하기",
		"width=1000, height=700, left=100, top=50, location=no");
	})

	$("#report").click(function() {
		var msg = confirm("신고작성 페이지로 이동 하시겠습니까?")
		if (msg == true) {
			location.href = "reportView.me";
		}
	});
	$("#note").click(
			function() {
				window.open("/note.bc", "방송 설정",
						"width=440, height=550, left=100, top=50");
			});
	//비회원이 메세지 전송 버튼을 눌렀을시 로그인을 유도하는 alert를 띄우는 메서드
	function loginMsg(){
		swal({
			  title: "경고",
			  text: "로그인 회원만 채팅이 가능합니다.",
			  icon: "warning",
		  });
	}
	//textarea 글자 수 제한하는 메서드
	function fc_chk_byte(aro_name,ari_max)
	{

	   var ls_str     = aro_name.value; // 이벤트가 일어난 컨트롤의 value 값
	   var li_str_len = ls_str.length;  // 전체길이

	   // 변수초기화
	   var li_max      = ari_max; // 제한할 글자수 크기
	   var i           = 0;  // for문에 사용
	   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
	   var li_len      = 0;  // substring하기 위해서 사용
	   var ls_one_char = ""; // 한글자씩 검사한다
	   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.

	   for(i=0; i< li_str_len; i++)
	   {
	      // 한글자추출
	      ls_one_char = ls_str.charAt(i);

	      // 한글이면 2를 더한다.
	      if (escape(ls_one_char).length > 4)
	      {
	         li_byte += 2;
	      }
	      // 그밗의 경우는 1을 더한다.
	      else
	      {
	         li_byte++;
	      }

	      // 전체 크기가 li_max를 넘지않으면
	      if(li_byte <= li_max)
	      {
	         li_len = i + 1;
	      }
	   }
	   
	   // 전체길이를 초과하면
	   if(li_byte > li_max)
	   {
	      swal({
			  title: "경고",
			  text: li_max +"글자를 초과 입력할수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다.",
			  icon: "warning",
		  });
	      ls_str2 = ls_str.substr(0, li_len);
	      aro_name.value = ls_str2;
	      
	   }
	   aro_name.focus();   
	}
	//textarea 엔터 사용 금지하는 메서드
 	function fc_chk2(){
  		if(event.keyCode == 13){
		$("#sendBtn").click();
   		event.returnValue=false;
		}
	}
	//구독하기 버튼을 누르면 구독을 추가하거나 구독을 취소하는 메서드
 	$("#subscribeLi").click(function(){
 		if($("#subscribeIcon").hasClass("far")){
 			$.ajax({
			url : "/insertSubscribe.bc",
			type : "post",
			data: {
		   		owner:"${ param.owner }",
		   		uno:"${loginUser.uno}"
		  	},
			success : function(data) {
				if(data==1){
					$("#subscribeIcon").removeClass("far");
					$("#subscribeIcon").addClass("fas");
					swal({
			  			title: "성공!",
			 		 	text: "${param.owner}님을 구독하였습니다!",
			 		 	icon: "success",
			 		 	button: "OK",
						})
				}
			},
			error : function(data) {
				console.log("실패")
			}	
		}); 
 		}
 		if($("#subscribeIcon").hasClass("fas")){
 			$.ajax({
 				url : "/deleteSubscribe.bc",
 				type : "post",
 				data: {
 			   		owner:"${ param.owner }",
 			   		uno:"${loginUser.uno}"
 			  	},
 				success : function(data) {
 					console.log(data);
 					if(data==1){
 						$("#subscribeIcon").removeClass("fas");
 						$("#subscribeIcon").addClass("far");
 						swal({
 				  			title: "성공!",
 				 		 	text: "${param.owner}님을 구독을 취소했습니다!",
 				 		 	icon: "success",
 				 		 	button: "OK",
 							})
 					}
 				},
 				error : function(data) {
 					console.log("실패")
 				}	
 			}); 
 		}
 		
 	})
 	//매니저 방송설정 페이지
 	setInterval(() => {
 		$("#broadSettiongLi").click(function(){
 	 		window.open("/userList.bc?owner=${param.owner}", "방송 시청자 목록",
 			"width=1250, height=1200, left=100, top=50");
 	 	})
	}, 0);	

</script>
<!-- socket.io를 가져오는 스크립트 -->
<!-- <script src="https://192.168.30.51:8010/socket.io/socket.io.js"></script> -->
<script src="https://192.168.0.120:8090/socket.io/socket.io.js"></script>
<script>
	/* 소켓 통신 하는곳  */
	$(function(){
		//채팅 입력창 초기화
		$("#msg").val("");
		owner = "${ param.owner }";
		title =	$("#title").text();
		user = "${ loginUser.userId }";
		
		if("${ loginUser.userId }"==""){
			console.log("로그인 하지 않은 유저!");
		}else if("${ loginUser.userId }"!="" && "${loginUser.userId}"!="${ param.owner }"){
			console.log("방송채널 주인이 아닌 유저!");
			chatFunc();
			$.ajax({
				url : "/selectSubsManager.bc",
				type : "get",
				data: {
			   		owner:"${ param.owner }",
			   		uno:"${loginUser.uno}"
			  	},
				success : function(data) {
					console.log(data);
					if(data.Subscribe == "구독유저"){
						$("#subscribeIcon").removeClass("far");
						$("#subscribeIcon").addClass("fas");
					}else{
						
					}
					if(data.Manager == "매니저"){
						var $li = $("<li id='broadSettiongLi'>");
						var $a = $("<a href='#'>");
						var $i = $("<i class='fas fa-cog' id='broadSettingIcon'>")
						var $div = $("<div>").text("방송 설정");
						$a.append($i);
						$a.append($div);
						$li.append($a);
						$("#subscribeLi").after($li);						
					}else{
						
					}
				},
				error : function(data) {
					console.log("실패")
				}	
			});
			
		}else if("${ loginUser.userId }"=="${ param.owner }"){
			console.log("방송채널 주인인 유저!");		
		}
	});
		
		//방송시작 유저id, 방송주소, 카테고리번호, 방송제목
		$("#broadLi").click(()=>{
			/* $.ajax({
				type : "post",
				url : "/broadStart.bc",
				data : "userId=" + "${loginUser.userId}" + "&broadUrl=" + document.location.href
						+ "&category=" + 16 + "&broadTitle=" + "(생)",
				success : function(result) {
					alert("ajax성공");
					console.log(result);
				}
				 error : function(error){
					alert(error);
					console.log(error);
				} 
			}); */
			$('#cam').attr('disabled', false);
			$('#cam').css("color", "black");
			$('#screen').attr('disabled', false);
			$('#screen').css('color', "black");
			roomFunc();
			setTimeout(() => {
				chatFunc();
			}, 1000);
		})
	
	//방만들기, 방송시작과 같음 채asd팅 방을 만드는 메서드
		function roomFunc() {
			var socket = io.connect('https://192.168.30.51:8010/room', {
				path : '/socket.io'	}); //localhost에 연결합니다.
				axios({
				    method: 'post',
				    url: 'https://192.168.30.51:8010/room',
				    params: {
				      title:$("#title").text(),	
				      owner:"${ param.owner }"
				    }
				  })
				  .then(function (response) {
				    console.log(response.data);
				  })
				  .catch(function (error) {
				  });
		};
		//채팅방 입장하기
		function chatFunc(){
			console.log("채팅창 연결");
			var socket = io.connect('https://192.168.30.51:8010/chat', {
				path : '/socket.io'	}); //localhost에 연결합니다.
				
			/* var userListSocket = io.connect('http://localhost:8010/userList',{
				path : '/socket.io' });	 */
			
			socket.on('join',(data)=>{
					console.log("join 이벤트 확인!")
			 	  	console.log(data);
			 		var $div = $("<div>");
					$div.addClass("system");
			      	$div.text(data.chat);
			      $("#chattingDiv").append($div);
			    });
			
			    socket.on('exit', function (data) {
			    	console.log("exit 이벤트 확인!")
			    	console.log(data);
			    	console.log("${param.owner}");
			    	if(data.userId=="${param.owner}"){
				    	socket.disconnect();
			    		var $div = $("<div>");
						$div.addClass("system");
			      		$div.text("방송이 종료되었습니다.");
				    	$("#chattingDiv").append($div);
				    	 $("#sendBtn").attr('onclick', 'notSend()');
						  swal({
							  title: "경고",
							  text: "방송이 종료 되었습니다.",
							  icon: "warning",
							}).then(()=>{
								$("#msg").focus();
							});				
				    	console.log("socket 연결 해제!");
			    	}else{
			    		 $("#chattingDiv").append("<br>");
			    		var $div = $("<div>");
						$div.addClass("system");
			      		$div.text(data.chat);
				    	$("#chattingDiv").append($div);
				    	 $("#chattingDiv").append("<br>");
			    	}
			    });
			    
			    socket.on('present',(data)=>{
					console.log("present 이벤트 확인!")
			 	  	console.log(data);
			 		var $div = $("<div>").css("background","#81F79F");
					$div.addClass("system");
			      	$div.text(data.userNick+"("+data.userId+")"+"님께서");
			      	var $divMsg = $("<div>").css("background","#81F79F");
			      	$divMsg.text(data.sendMsg);
			      	$divMsg.addClass("system");
			      	var $divUser = $("<div>").css("background","#81F79F");
			      	$divUser.addClass("system");
			      	$divUser.text("클로버"+data.clover+"개를 선물하셨습니다.")
			      $("#chattingDiv").append("<br>");
			      $("#chattingDiv").append($div);
			      $("#chattingDiv").append($divUser);
			      $("#chattingDiv").append($divMsg); 
			      $("#chattingDiv").append("<br>");
			    });
			    
			    socket.on('chat',(data)=>{
			      console.log("chat 이벤트 확인!")
			      var $div = $("<div>");
			      if (data.userId === "${ loginUser.userId }" ) {
			    	  $div.addClass('mine');
			      } else {
			    	  $div.addClass('other');
			      }
			      var $divId = $("<div>").text(data.userNickName+"("+data.userId+")").css("display","inline-block").css("margin-left","3px");
			      var $divChat = $("<div>").text(data.chat);
			      if(data.userId=="${param.owner}"){
			    	  var $i =$("<i class='fas fa-crown'>").css("display","inline");
			    	  $div.append($i);
			      }
			      $div.append($divId);
			      $div.append("<br>");
			      $div.append($divChat);
			      $("#chattingDiv").append($div);
			      //스크롤을 아래로 따라가게 만드는 스크립트
			      $("#chattingDiv").scrollTop($("#chattingDiv")[0].scrollHeight);
			    });
			    //axios를 이용해서 RoomId를 조회해서 response.data로 받음
			    socket.on('joinRoom', function (data) {
			    	console.log("joinRoom 신호받음")
			    	axios({
					    method: 'get',
					    url: 'https://192.168.30.51:8010/chat/joinRoom/'+"${ param.owner }",	
					    params: {
					    	userSocketId:data,
					    }
					  })
					  .then(function (response) {
						  if(response.data.roomId==null){
							  socket.disconnect();
							  console.log("채팅창 연결 종료!");
							  $("#sendBtn").attr('onclick', 'notSend()');
							  swal({
								  title: "경고",
								  text: "방송이 종료 되었습니다.",
								  icon: "warning",
								}).then(()=>{
									$("#msg").focus();
								});					  
						  }else{
					   		//서버에 참여할 RoomId를 전송하면서 joinRoom 이벤트를 실행하라고 전달함.
					  		socket.emit('joinRoom',{roomId:response.data.roomId, owner:"${param.owner}",userSocketId:response.data.userSocketId,userId:"${ loginUser.userId }",userNickName:"${loginUser.nickName}"});		  		
					  		var $conDiv = $("<div>").text("<<채팅방에 입장했습니다.>>");
					  		//채팅방에 정상적으로 입력되고나서 send 버튼에 메세지 전송 버튼 메서드를 추가해줌
					  	  	$("#sendBtn").attr('onclick', 'msgSend()');
					  		$conDiv.addClass("system");
					  		$("#chattingDiv").append($conDiv);
					  		$("#chattingDiv").append("<br>");
						  }
					  })
					  .catch(function (error) {
						  console.log(error);
					  });
				});
			    
			    //채팅 얼리기 이벤트
			    socket.on('freeze',(data)=>{
				console.log("채팅 얼리기 이벤트 확인!")
		 	  	console.log(data);
		 		var $div = $("<div>");
				$div.addClass("system");
		      	$div.text("관리자가 채팅창을 얼렸습니다!");
		      	$("#chattingDiv").append("<br>");
		     	$("#chattingDiv").append($div);
		     	$("#chattingDiv").append("<br>");
		     	$("#chattingDiv").css("background","#81DAF5");
		   		});
			  //채팅 얼리기 이벤트
			    socket.on('melt',(data)=>{
				console.log("채팅 녹이기 이벤트 확인!")
		 	  	console.log(data);
		 		var $div = $("<div>");
				$div.addClass("system");
		      	$div.text("관리자가 채팅창을 녹였습니다.");
		      	$("#chattingDiv").append("<br>");
		     	$("#chattingDiv").append($div);	  
		     	$("#chattingDiv").append("<br>");
		     	$("#chattingDiv").css("background","#EFFBEF");
		     	
		   		});
			    
			};
			function notSend(){
				swal({
					  title: "경고",
					  text: "방송이 종료 되어 채팅을 보낼 수 없습니다.",
					  icon: "warning",
				}).then(()=>{
					$("#msg").focus();
				});
			}
			
			//메세지 전달 메서드, 채팅금지 확인과 필터링처리후 소켓을 이용하여 메세지 전달
			function msgSend(){
				$.ajax({
					url : "/convertMsg.bc",
					type : "post",
					data: {
				   		owner:"${ param.owner }",
				   		msg:$("#msg").val(),
				   		uno:"${ loginUser.uno }"
				  	},
					success : function(data) {
						console.log(data);
						console.log("send 메서드 메세지 전달!")
						if(data.check=="비채팅금유저"){
							var msg = data.msg;
							if($("#msg").val().trim() != ""){
								$("#msg").val("");
								axios({
						    		method: 'post',
						    		url: 'https://192.168.30.51:8010/room/chat',
						   			params: {
						    			owner:"${ param.owner }",
						    			userId:"${ loginUser.userId }",
						    			userNickName:"${ loginUser.nickName }",
						    			msg:msg   	
						    		}
						  		})
						  		.then(function (response) {
						    		console.log(response);
						    		if(response.data=="채팅창 얼음!"){
						    			swal({
										  	title: "경고",
										  	text:"관리자가 채팅창을 얼렸습니다.",
										  	icon: "warning",
										})
						    		}
						  		})
						  		.catch(function (error) {
							  		console.log(error);
							  		console.log("채팅전달 error");
						  		});
							}else{
								swal({
								  	title: "경고",
								  	text: "공백 메세지는 보낼 수 없습니다.",
								  	icon: "warning",
								}).then(()=>{
									$("#msg").focus();
								});
							
							} 
						}else{
							swal({
							  	title: "경고",
							  	text: "채팅금지 회원은 채팅하실 수 없습니다.",
							  	icon: "warning",
							})
						}
						
					},
					error : function(data) {
						console.log("실패")
					}	
				});
			}
			
			//채팅 얼리기 메서드
			$("#iceChatLi").click(function(){
				
				axios({
		    		method: 'post',
		    		url: 'https://192.168.30.51:8010/room/chat/freeze',
		   			params: {
		    			owner:"${ param.owner }", 	
		    		}
		  		})
		  		.then(function (response) {
		    		console.log(response.data);
					if(response.data=="방송중이 아닙니다."){
						swal({
							  title: "경고",
							  text: "방송중이 아닙니다!",
							  icon: "warning",
						  });
		    		}else if(response.data=="얼음으로 변경 성공!"){
		    			$("#iceChatLi").children().children().eq(0).attr("id","tIntIcon").removeClass('far fa-snowflake').addClass('fas fa-tint');
		    			$("#iceChatLi").children().children().eq(1).text("채팅 녹이기");
		    			swal({
 				  			title: "성공!",
 				 		 	text: "채팅창을 얼렸습니다.",
 				 		 	icon: "success",
 				 		 	button: "OK",
 							})
		    		}else if(response.data=="물로 변경 성공!"){
		    			$("#iceChatLi").children().children().eq(0).attr("id","freezeIcon").removeClass('fas fa-tint').addClass('far fa-snowflake');
		    			$("#iceChatLi").children().children().eq(1).text("채팅 얼리기");
		    			swal({
 				  			title: "성공!",
 				 		 	text: "채팅창을 녹였습니다.",
 				 		 	icon: "success",
 				 		 	button: "OK",
 							})
		    		}
		    		
		  		})
		  		.catch(function (error) {
			  		console.log(error);
			  		console.log("채팅전달 error");
		  		});
			})
			
		/*방 제거하기, 방송종료 메서드, 몽구스DB에서도 방을 삭제해서 이걸 지워야하나 말아야하나 고민중 
		$("#CloseRoomBtn").click(function(){
			axios({
			    method: 'delete',
			    url: 'http://localhost:8010/room/'+owner,
			    params: {
			    	
			    }
			  })
			  .then(function (response) {
			    console.log(response);
			  })
			  .catch(function (error) {
				  console.log(error);
				  console.log("방 삭제 error");
			  });
		}); */
		//채팅입장 메서드, axios로 크리에이터 아이디로 RoomId를 조회하고 그값으로 그방에 room()한다.
			/* $("#ChatBtn").click(function(){
			console.log("채팅창 연결");
			var socket = io.connect('http://localhost:8010/chat', {
				path : '/socket.io'	}); //localhost에 연결합니다.
				
			 var userListSocket = io.connect('http://localhost:8010/userList',{
				path : '/socket.io' });	 
			
			var $conDiv = $("<div>").text("<<채팅방에 입장했습니다.>>");
			$conDiv.addClass("system");
			$("#chattingDiv").append($conDiv);
			$("#chattingDiv").append("<br>");
			
			socket.on('join',(data)=>{
			 	  	console.log(data);
			 		var $div = $("<div>");
					$div.addClass("system");
			      	$div.text(data.chat);
			      $("#chattingDiv").append($div);
			    });
			
			    socket.on('exit', function (data) {
			    	console.log(data);
			    	var $div = $("<div>");
					$div.addClass("system");
			      	$div.text(data.chat);
				    $("#chattingDiv").append($div);
			    });
			    
			    socket.on('chat',(data)=>{
			      console.log(data);
			      var $div = $("<div>");
			      if (data.user === $("#user").val()) {
			    	  $div.addClass('mine');
			      } else {
			    	  $div.addClass('other');
			      }
			      var $divId = $("<div>").text(data.user);
			      var $divChat = $("<div>").text(data.chat);
			      $div.append($divId);
			      $div.append($divChat);
			      $("#chattingDiv").append($div);
			      //스크롤을 아래로 따라가게 만드는 스크립트
			      $("#chattingDiv").scrollTop($("#chattingDiv")[0].scrollHeight);
			    });
			    //axios를 이용해서 RoomId를 조회해서 response.data로 받음
			    socket.on('joinRoom', function (data) {
			    	console.log("joinRoom 신호받음")
			    	axios({
					    method: 'get',
					    url: 'http://localhost:8010/chat/joinRoom/'+"${ param.owner }",	
					    params: {
					    	userSocketId:data,
					    }
					  })
					  .then(function (response) {
					    //서버에 참여할 RoomId를 전송하면서 joinRoom 이벤트를 실행하라고 전달함.
					    socket.emit('joinRoom',{roomId:response.data.roomId, owner:$("#creator").val(),userSocketId:response.data.userSocketId,userId:$("#user").val()});
					  })
					  .catch(function (error) {
						  
					  });
				}); */
			    //유저 방떠나기 기능, 굳이 없어도 돼서 주석처리 / 이유 : 유저가 채팅방을 선택해서 나가지 않고 disconnect로 나가기 때문에 disconnect로 처리함
			   /*  socket.on('leaveRoom', function (data) {
			    	axios({
					    method: 'get',
					    url: 'http://localhost:8010/chat/leaveRoom/'+owner,
					  })
					  .then(function (response) {
					    //서버에 참여할 RoomId를 전송하면서 joinRoom 이벤트를 실행하라고 전달함.
					    socket.emit('leaveRoom',{roomId:response.data,userId:$("#user").val()});
					  })
					  .catch(function (error) {
						  
					  });
				}); */
			    //유저리스트를 조회하기 위한 소켓에 이벤트 추가
			   /*  userListSocket.on('searchUserList',()=>{
			    	axios({
					    method: 'get',
					    url: 'http://localhost:8010/userList',
					    params: {
					    	owner:$("#creator").val(),
					    	userId:$("#user").val(),
					    }
					  })
					  .then(function (response) {
					  	console.log(response);
					  })
					  .catch(function (error) {
						  
					  });
			    }) 
		});	*/	
		    //유저 방떠나기 기능, 굳이 없어도 돼서 주석처리 / 이유 : 유저가 채팅방을 선택해서 나가지 않고 disconnect로 나가기 때문에 disconnect로 처리함
		   /*  socket.on('leaveRoom', function (data) {
		    	axios({
				    method: 'get',
				    url: 'http://localhost:8010/chat/leaveRoom/'+owner,
				  })
				  .then(function (response) {
				    //서버에 참여할 RoomId를 전송하면서 joinRoom 이벤트를 실행하라고 전달함.
				    socket.emit('leaveRoom',{roomId:response.data,userId:$("#user").val()});
				  })
				  .catch(function (error) {
					  
				  });
			}); */
		    //유저리스트를 조회하기 위한 소켓에 이벤트 추가
		   /*  userListSocket.on('searchUserList',()=>{
		    	axios({
				    method: 'get',
				    url: 'http://localhost:8010/userList',
				    params: {
				    	owner:$("#creator").val(),
				    	userId:$("#user").val(),
				    }
				  })
				  .then(function (response) {
				  	console.log(response);
				  })
				  .catch(function (error) {
					  
				  });
		    }) */
		    
		    /////////////////////////
		    
		    
		    
</script>

<script>

//방송종료
$('#exitBroadLi').click(function(){
	location.href="/goMain.bc";
	sendMessage('End');
});


'use strict';

var isChannelReady = false;
var isInitiator = false;
var isStarted = false;
var localStream;
var pc;
var remoteStream;
var turnReady;
var flag= false;
var id;
var msg;

var pcConfig = {
		'iceServers': [
			{
				urls: 'stun:stun.l.google.com:19302'
			}]
};

var sdpConstraints = {
		  offerToReceiveAudio: true,
		  offerToReceiveVideo: true
		};

/*var room = 'foo';*/
// Could prompt for room name:
// room = prompt('Enter room name:');
/* var room = window.location.hash.substring(1); */
var broadurl = document.location.href;
var room = "${ param.owner }"

var socket = io.connect('https://192.168.0.120:8090');


if (room !== '') {
  socket.emit('create or join', room);
  console.log('Attempted to create or  join room', room);
}

socket.on('created', function(room) {
  console.log('Created room ' + room);
  isInitiator = true;
  id = socket.id;
  socket.emit('master',id);
});

socket.on('full', function(room) {
  console.log('Room ' + room + ' is full');
});

socket.on('join', function (room){
  console.log('Another peer made a request to join room ' + room);
  console.log('This peer is the initiator of room ' + room + '!');
  socket.emit('exchange', id);
  isChannelReady = true;
});

socket.on('joined', function(room) {
  console.log('joined: ' + room);
  id = socket.id;
  isChannelReady = true;
  setTimeout(function() {
	  socket.emit('sub', id);
	  sendMessage('got user media');
	  }, 4000);
});

socket.on('log', function(array) {
  console.log.apply(console, array);
});

////////////////////////////////////////////////

function sendMessage(message) {
  console.log('Client sending message: ', message);
  socket.emit('message', {msg:message, nick:id});
  /*socket.emit('message', message);*/
}

// This client receives a message
socket.on('message', function(message) {
  console.log('Client received message받음:', message);
  if (message=== 'got user media') {
    maybeStart();
  } else if (message.type === 'offer') {
	  console.log('offer받음');
    if (!isInitiator && !isStarted) {
      maybeStart2();
    }
    console.log("받은 message: " + message);
    pc.setRemoteDescription(new RTCSessionDescription(message));
    doAnswer();
  } else if (message.type === 'answer' && flag) {
    pc.setRemoteDescription(new RTCSessionDescription(message));
  } else if (message.type === 'candidate' && flag) {
    var candidate = new RTCIceCandidate({
      sdpMLineIndex: message.label,
      candidate: message.candidate
    });
    pc.addIceCandidate(candidate);
  } else if (message === 'End' && flag) {
	 handleRemoteHangup();
  }
}); 

////////////////////////////////////////////////////

var localVideo = document.querySelector('#localVideo');
var remoteVideo = document.querySelector('#Video');

//캠화면
function aa(){
	$('#cam').attr('disabled', true);
	$('#cam').css("color", "grey");
	$('#screen').attr('disabled', false);
	$('#screen').css('color', "black");
	navigator.mediaDevices.getUserMedia({
		  audio: true,
		  video: true
		})
		.then(gotStream)
		.catch(function(e) {
		  alert('getUserMedia() error: ' + e.name);
			$('#cam').attr('disabled', false);
			$('#cam').css("color", "black");
			$('#screen').attr('disabled', false);
			$('#screen').css('color', "black");
		});
	
}

//화면공유
function dd(){
	 $('#cam').attr('disabled', false);
	 $('#cam').css("color", "black");
	 $('#screen').attr('disabled', true);
	 $('#screen').css('color', "grey");
	navigator.mediaDevices.getDisplayMedia(
			)
			.then(gotStream)
			.catch(function(e){
				$('#cam').attr('disabled', false);
				$('#cam').css("color", "black");
				$('#screen').attr('disabled', false);
				$('#screen').css('color', "black");
			});
	
}

function gotStream(stream) {
	  console.log('Adding local stream.');
	  localStream = stream;
	  localVideo.srcObject = stream;
	  sendMessage('got user media');
	  if (isInitiator) {
	    maybeStart();
	  }
}

function maybeStart() {
  console.log('>>>>>>> maybeStart() ', isStarted, localStream, isChannelReady);
  if (!isStarted && typeof localStream !== 'undefined' && isChannelReady) {
    console.log('>>>>>> creating peer connection');
    createPeerConnection();
    /* localStream.getTracks().forEach((track) => pc.addTrack(track, localStream)); */
    pc.addStream(localStream);
    /*isStarted = true;*/
    flag=true;
    console.log('isInitiator', isInitiator);
    if (isInitiator) {
      doCall();
    }
  }
}

function maybeStart2(){
	console.log('>>>>>>> maybeStart2() ', isStarted, localStream, isChannelReady);
	if (!isStarted && isChannelReady) {
	    console.log('>>>>>> creating peer connection');
	    createPeerConnection();
	   /* isStarted = true;*/
	    flag=true;
	}
}

window.onbeforeunload = function() {
  sendMessage('bye');
};

/////////////////////////////////////////////////////////

function createPeerConnection() {
  try {
    pc = new RTCPeerConnection(pcConfig);
    pc.onicecandidate = handleIceCandidate;
    /* pc.ontrack = bb; */
    pc.onaddstream = handleRemoteStreamAdded;
    pc.onremovestream = handleRemoteStreamRemoved;
    console.log('Created RTCPeerConnnection');
  } catch (e) {
    console.log('Failed to create PeerConnection, exception: ' + e.message);
    alert('Cannot create RTCPeerConnection object.');
    return;
  }
}

/* function bb(event){
	console.log("aa 실행 : " + event.streams[0]);
	console.log(event.streams[0]);
	remoteVideo.srcObject = event.streams[0];
} */

function handleIceCandidate(event) {
  console.log('icecandidate event: ', event);
  if (event.candidate) {
    sendMessage({
      type: 'candidate',
      label: event.candidate.sdpMLineIndex,
      id: event.candidate.sdpMid,
      candidate: event.candidate.candidate
    });
  } else {
    console.log('End of candidates.');
  }
}

function handleCreateOfferError(event) {
  console.log('createOffer() error: ', event);
}

function doCall() {
  console.log('Sending offer to peer');
  pc.createOffer(setLocalAndSendMessage, handleCreateOfferError);
}

function doAnswer() {
  console.log('Sending answer to peer.');
  pc.createAnswer().then(
    setLocalAndSendMessage,
    onCreateSessionDescriptionError
  );
}

function setLocalAndSendMessage(sessionDescription) {
  pc.setLocalDescription(sessionDescription);
  console.log('setLocalAndSendMessage sending message', sessionDescription);
  sendMessage(sessionDescription);
}

function onCreateSessionDescriptionError(error) {
  trace('Failed to create session description: ' + error.toString());
}

function handleRemoteStreamAdded(event) {
  console.log('Remote stream added.');
  remoteStream = event.stream;
  localVideo.srcObject = remoteStream;
}

function handleRemoteStreamRemoved(event) {
  console.log('Remote stream removed. Event: ', event);
}

function hangup() {
  console.log('Hanging up.');
  stop();
  sendMessage('bye');
}

function handleRemoteHangup() {
  console.log('Session terminated.');
  stop();
  isInitiator = false;
  
}

function stop() {
  isStarted = false;
  pc.close();
  pc = null;
  console.log('stopppp : 실행');
}

function randomToken() {
	  return Math.floor((1 + Math.random()) * 1e16).toString(16).substring(1);
	}
</script>
</html>