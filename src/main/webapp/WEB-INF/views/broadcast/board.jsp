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
<style type="text/css">
#searchDiv {
	width: 300px;
}

#searchForm {
	display: inline
}

#searchLi {
	margin-top: -25px;
}

#broadCastDiv {
	background: black;
	height: 0px;
	padding-bottom: 50%;
}

#broadCastWarpper {
	overflow-y: scroll;
	height: 800px;
}

#chattingDiv {
	overflow-y: scroll;
	border: 1px solid black;
	height: 83%;
	margin-left: -25px;
	padding:10px;
	background: #EFFBEF;
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
	height: 800px;
}

#inputChatDiv {
	height: 10%;
	margin-left: -25px;
}

#optionDiv {
	height: 5%;
	margin-left: -25px;
}

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
	font-size: large;
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
<body class="skin-orange">
	<header class="primary">
		<div class="firstbar">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="#"> <img src="/resources/images/logo.png"
								alt="Today's TV">								
							</a>
						</div>
					</div>

					<div class="col-md-6 visible-lg-* visible-md-* pull-right">
						<ul class="nav-icons">
						 	<c:if test="${ (!empty loginUser) and (loginUser.userId eq param.owner) }">
							<li><a href="#"><i class="ion-person-add"></i>
									<div>Register</div></a></li>
							</c:if>
							<c:if test="${ empty loginUser }">
							<li><a href="loginView.me"><i class="ion-person"></i>
									<div>Login</div></a></li>
							</c:if>
							<li id="searchLi">
								<form class="search" autocomplete="off" id="searchForm">
									<div class="form-group" id="searchDiv">
										<div class="input-group">
											<input type="text" name="q" class="form-control"
												placeholder="검색어를 입력해주세요">
											<div class="input-group-btn">
												<button class="btn btn-primary">
													<i class="ion-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
							</li>
						</ul>
					</div>
				</div>
				<!-- Header의 1번째 ROW -->
				<hr>
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-9">
						<div id="broadCastWarpper">
							<div id="broadCastDiv"></div>
							<div align="right" style="margin-right: 10px;">
								<img alt="s" src="/resources/images/siren.png" width="20"
									height="20" id="report">
							</div>
							<hr><div>
								<span>방제목 : </span><input type="text" id="title">
							</div>
							<div>
								<span>크리에이터 아이디 : </span><input type="text" id="creator" value="${ param.owner }">
							</div>
							<div>
								<span>유저 아이디 : </span><input type="text" id="user" value="${ loginUser.userId }">
							</div>					
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 hidden-sm hidden-xs">
						<div id="chatWrapper">
							<div id="optionDiv" class="row">
								<c:if test="${ (!empty loginUser) and (loginUser.userId eq param.owner) }">
								<div class="pull-right">
									<i class="ion-person-add icons" id="addManager"></i> &nbsp; <i
										class="ion-ios-people icons" id=userList></i> &nbsp; <i
										class="ion-android-remove-circle icons" id="addBanWord"></i>
									&nbsp; <i class="ion-android-settings icons"
										id="broadCastSetting"></i>
									<button id="CloseRoomBtn">방송시작</button>
								</div>
								</c:if>
							</div>
							<div id="chattingDiv" class="row"></div>
							<hr style="margin-top: 5px; margin-bottom: 5px">
							<div id="inputChatDiv" class="row">
								<div class="col-lg-9 col-md-9 col-sm-8"
									style="padding-left: 0px; padding-right: 0px; black; height: 100%">
									<c:choose>
										<c:when test="${ !empty loginUser }">
										<textarea class="form-control" rows="4" width="100%"
										style="height: 80px; resize: none" id="msg" name="msg" onkeyup="fc_chk_byte(this,20);" onkeypress="fc_chk2();" >								
										</textarea>
										</c:when>
										<c:otherwise>
										<textarea class="form-control" rows="4" width="100%"
										style="height: 80px; resize: none" id="msg" name="msg" maxlength="0">								
										</textarea>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-4"
									style="padding-left: 0px; padding-right: 0px; height: 100%">
									<c:choose>
										<c:when test="${ !empty loginUser }">
										<button type="button" class="btn btn-success"
										style="padding: 0px; height: 100%; width: 100%" id="sendBtn"
										onclick="notSend();">전송</button>
										</c:when>
										<c:otherwise>
										<button type="button" class="btn btn-success"
										style="padding: 0px; height: 100%; width: 100%" id="sendBtn"
										onclick="loginMsg();">전송</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
<script>
	$("#addManager").click(
			function() {
				window.open("/addManager.bc", "매니저 추가",
						"width=1250, height=1200, left=100, top=50");
			});
	$("#userList").click(
			function() {
				window.open("/userList.bc", "방송 시청자 목록",
						"width=1250, height=1200, left=100, top=50");
			});
	$("#addBanWord").click(
			function() {
				window.open("/addBanWord.bc", "금지단어 추가",
						"width=1250, height=1200, left=100, top=50");
			});
	$("#broadCastSetting").click(
			function() {
				window.open("/broadCastSetting.bc", "방송 설정",
						"width=1250, height=1200, left=100, top=50");
			});

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
	
 

</script>
<!-- socket.io를 가져오는 스크립트 -->
<script src="http://localhost:8010/socket.io/socket.io.js"></script>
<script>
	/* 소켓 통신 하는곳  */
	$(function(){
		//채팅 입력창 초기화
		$("#msg").val("");
		$("#title").val("제목이래");
		owner = $("#creator").val();
		title =	$("#title").val();
		user = $("#user").val();
		
		if("${ loginUser.userId }"==""){
			console.log("로그인 하지 않은 유저!");
		}else if("${ loginUser.userId }"!="" && "${loginUser.userId}"!="${ param.owner }"){
			console.log("방송채널 주인이 아닌 유저!");
			chatFunc();
		}else if("${ loginUser.userId }"=="${ param.owner }"){
			console.log("방송채널 주인인 유저!");		
		}
	});
		$("#CloseRoomBtn").click(()=>{
			roomFunc();
			setTimeout(() => {
				chatFunc();
			}, 1000);
		})
	
	
	//방만들기, 방송시작과 같음 채팅 방을 만드는 메서드
		function roomFunc() {
			var socket = io.connect('http://localhost:8010/room', {
				path : '/socket.io'	}); //localhost에 연결합니다.
				axios({
				    method: 'post',
				    url: 'http://localhost:8010/room',
				    params: {
				      title:$("#title").val(),	
				      owner:$("#creator").val()
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
			var socket = io.connect('http://localhost:8010/chat', {
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
			    	var $div = $("<div>");
					$div.addClass("system");
			      	$div.text(data.chat);
				    $("#chattingDiv").append($div);
			    });
			    
			    socket.on('chat',(data)=>{
			      console.log("chat 이벤트 확인!")
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
					  		socket.emit('joinRoom',{roomId:response.data.roomId, owner:$("#creator").val(),userSocketId:response.data.userSocketId,userId:$("#user").val()});		  		
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
			function msgSend(){
				console.log("send 메서드 메세지 전달!")
				var msg = $("#msg").val();
				if($("#msg").val().trim() != ""){
				$("#msg").val("");
				axios({
				    method: 'post',
				    url: 'http://localhost:8010/room/chat',
				    params: {
				    	owner:$("#creator").val(),
				    	user:$("#user").val(),
				    	msg:msg   	
				    }
				  })
				  .then(function (response) {
				    console.log(response);
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
			}
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
</script>
</html>