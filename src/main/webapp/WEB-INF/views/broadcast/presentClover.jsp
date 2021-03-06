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

#myCloverD {
	width: 100%;
}
#searchListNum, #deleteBanWordDiv{
	display: inline-block;
	padding: 10.5px;
}
#dog{
	margin-left:10px;
	margin-top:15px;
}
#msgSpan{
	margin-left:5px;
	margin-top:10px;
	margin-right:10px;
}
#inputMsg{
	width:100%
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
			<a class="item" href="/goPresentClover.bc?owner=${ param.owner}"><i class="box icon"></i>클로버 선물하기</a>
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
							<input type="text" id="myCloverP" value="0" disabled="disabled" style = "text-align:right;">
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
			<div class="five wide column">
				<div class="ui input" id="myCloverD">
						<input type="text" id="addChatBanUser" disabled="disabled" value="${ param.owner }" style = "text-align:right;">
						<span id="dog">에게</span>
				</div>
			</div>
			<div class="five wide column">
				<div class="ui input" id="myClover">
						<input type="number" id="presentCloverNum">
						<span id="dog">개 선물하기</span>
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="thirteen wide column">
				<div class="ui input" id="inputMsg">
					<span id="msgSpan">전달하고 싶은 메세지 :</span>
						<input type="text" id="sendMsg" placeholder="전달하고 싶은 메세지를 입력하세요">						
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="sixteen wide column" id="presentClover" align="center">
				<button class="ui secondary button small" id="presentBtn">전달</button>
			</div>
		</div>
	</div>
</body>
<script src="https://192.168.30.51:8010/socket.io/socket.io.js"></script>
<script type="text/javascript">
	$(function(){
		if(${empty loginUser}){
			swal({
				  title: "경고",
				  text: "로그인이 필요한 서비스 입니다.",
				  icon: "warning",
				}).then(()=>{
					window.self.close(); //팝업 창을 닫는다
				});			
		}
		setTimeout(() => {
			$.ajax({
				url : "/refresh.bc",
				type : "post",
				data: {
			   		userId:"${loginUser.userId}",
			  	},
				success : function(data) {
					console.log(data);
					console.log(data.totalClover);
					$("#myCloverP").val(data.totalClover);			
				},
				error : function(data) {
					console.log("실패")
				}	
			}); 
		}, 0);
		
		
	})
	$("#presentBtn").click(function(){
		console.log("myCloverP :"+$("#myCloverP").val());
		console.log("presentCloverNum :"+$("#presentCloverNum").val());
		console.log(Number($("#myCloverP").val()) >= $("#presentCloverNum").val())
		if($("#presentCloverNum").val()!=""){
			if($("#presentCloverNum").val()>0){
				if(Number($("#myCloverP").val()) >= $("#presentCloverNum").val()){
					$.ajax({
						url : "/presentClover.bc",
						type : "post",
						data: {
					   		owner:"${ param.owner }",
					   		uno:"${loginUser.uno}",
					   		clover:$("#presentCloverNum").val()
					  	},
						success : function(data) {
							if(data==3){
									//선물 소켓 연결
									var socket = io.connect('https://192.168.30.51:8010/present', {
										path : '/socket.io'	}); //localhost에 연결합니다.
									socket.on('presentInfo',(data)=>{
										console.log("presentInfo 이벤트 확인!")
								 	  	console.log(data);
										axios({
										    method: 'post',
										    url: "https://192.168.30.51:8010/room/chat/present",	
										    params: {
										    	owner:"${param.owner}",
										    	userId:"${loginUser.userId}",
										    	userNick:"${loginUser.nickName}",
										    	clover:$("#presentCloverNum").val(),
										    	sendMsg:$("#sendMsg").val()			    	
										    }
										  })
										  .then(function (response) {
											   if(response.data=="방송중이 아닙니다."){
												   swal({
											  			title: "성공!",
											 		 	text: "${param.owner}님을 에게 클로버를 선물했습니다!",
											 		 	icon: "warning",
											 		 	button: "OK",
														})
														.then(()=>{
															window.location.reload()
														})   
											   }else{
												   swal({
											  			title: "성공!",
											 		 	text: "${param.owner}님을 에게 클로버를 선물했습니다!",
											 		 	icon: "success",
											 		 	button: "OK",
														})
														.then(()=>{
															window.location.reload()
														})   
											   }					
										  })								  
										  .catch(function (error) {
											  console.log(error);
										  });
								 		
								    });
								
							} 
								
						},
						error : function(data) {
							console.log("실패")
						}	
					}); 
				}else{
					swal({
						  title: "경고",
						  text: "클로버가 부족합니다.\n 클로버를 충전해주세요",
						  icon: "warning",
						})
				}
			}else{
				 swal({
				 	 title: "경고",
				 	 text: "음수는 입력할 수 없습니다.",
					  icon: "warning",
					})
			}
		}else{
			 swal({
			 	 title: "경고",
			 	 text: "선물할 클로버 개수를 입력해주세요",
				  icon: "warning",
				})
		}
		
	})
	
</script>
</html>