<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<!-- Google auth key -->
<meta name = "google-signin-client_id" content="972317984791-3qn09b1dickillaqmt4ou3pqraql5na8.apps.googleusercontent.com">

<!-- KAKAO js -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Google js -->
<script src="https://apis.google.com/js/platform.js" async defer></script>


<!-- Google login css -->
<style type="text/css">
	.center-block{margin: 10px 0; text-align:center;}
	
	<!-- google CSS START-->
	#google-login-btn{
	    display: inline-block;
	}
	
	#google-login-btn #googleSignIn {
	    display: inline-block;
	    background: white;
	    color: #444;
	    height: 45px;
	    width: 225px;
	    border-radius: 5px;
	    border: thin solid #dddddd;
	    box-shadow: 1px 1px 1px grey;
	    white-space: nowrap;
	    text-align: left;
    	padding: 0 0 0 10px;
	}
	#google-login-btn #googleSignIn:hover {
	   cursor: pointer;
	}
	#google-login-btn #googleSignIn span.label {
	   font-family: serif;
	   font-weight: normal;
	}
	#google-login-btn #googleSignIn span.icon {
	   background: url('https://developers.google.com/identity/sign-in/g-normal.png') transparent 5px 50% no-repeat;
	   display: inline-block;
	   vertical-align: middle;
	   width: 42px;
	   height: 42px;
	}
	#google-login-btn #googleSignIn span.buttonText {
	    display: inline-block;
	    vertical-align: middle;
	    /* padding-left: 42px; */
	    /* padding-right: 42px; */
	    font-size: 15px;
	    font-weight: 900;
	}
	<!-- google CSS END -->
</style>

<script type="text/javascript">
	$(document).ready(function(){
		fn_kakao_core();
		fn_google_core();
	});
	
	//Google START
	function fn_google_core(){
		
		var loginHtml = '<div id="gSignInWrapper">';
		    loginHtml += '<div id="googleSignIn" class="customGPlusSignIn">';
		    loginHtml += '<span class="icon"></span>';
		    loginHtml += '<span class="buttonText">구글계정으로 로그인</span>';
		    loginHtml += '</div>';
		    loginHtml += '</div>';
		    
		$("#google-login-btn").html(loginHtml);
  	
		var startApp = function() {
			gapi.load(
						'auth2'
					  ,function() {
								auth2 = gapi.auth2
										.init({
											client_id : '972317984791-3qn09b1dickillaqmt4ou3pqraql5na8.apps.googleusercontent.com',
											cookiepolicy : 'single_host_origin',
										});
								fn_attachSignin(document.getElementById('googleSignIn'));
							}
					  );
		};
		
		function fn_attachSignin(element) {
			auth2.attachClickHandler(element, {}, function(googleUser) {
				fn_google_callAjax(googleUser);
			}, function(error) {
				alert(JSON.stringify(error, undefined, 2));
			});
		}

		function fn_google_callAjax(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log("google info >> ");
			console.log(profile);
			
			var data = {
					 id 		: "GOOGLE" + profile.getId()
					,nickName	: profile.getName()
					,email		: profile.getEmail()
					,image		: profile.getImageUrl()
			}
			
			var afterFn = function(resData){
				console.log(resData);
				var cnt = resData.cnt;
				
				switch (cnt) {
					case 0: // 회원이 없을 때
						var userId   = resData.id;
						var nickName = resData.nickName;
						var email 	 = resData.email;
						var loginType = "GOOGLE";
						
						$("#loginType").val(loginType);
						$("#userId").val(userId);
						$("#userPwd").val("GOOGLE");
						
						$("#email").val(email);
						$("#nickName").val(nickName);
						
						$("#modal_email_area").hide();
						$("#modal_easy_signUp").modal();
						//login.me
					break;
					
					case 1: // 회원이 있을 때
						window.location.href = "goMain.me";
					break;
				}
		  	};
		  	
			fn_callAjax("/login.google", data, afterFn, function(){alert("Ajax 통신 에러")});
		}
		
		startApp();
	}
	
	//KAKAO START
	function fn_kakao_core(){
		Kakao.init("${kakaoAuth}");
		
		fn_kakao_createButton();
		
		// 카카오 로그인 버튼 생성
		function fn_kakao_createButton(){
			Kakao.Auth.createLoginButton({
		       container: '#kakao-login-btn'
		      ,persistAccessToken :false
		      ,success: function(authObj) {
					    	  fn_kakao_getLoingUserInfo();	
					      }
			  ,fail: function(err) {
				    	  alert("카카오 로그인 에러");
				    	  console.error("error > " + JSON.stringify(err));
				      }
		    });
		}
		
		// 로그인 성공시, API를 호출
		function fn_kakao_getLoingUserInfo(){
	        Kakao.API.request({
	        	 url: '/v2/user/me'
	        	,success: function(res) {
	        				var reqParams = {
	        						 id 	  : "KAKAO" + res.id
	        						,nickName : res.properties.nickname
	        				};
	        		
	          			  	fn_kakao_callAjax(reqParams);
	          			  	// console.log(Kakao.Auth.getAccessToken());
	          			  }
	        	,fail: function(err) {
	        			  alert("카카오 API 호출 에러");
	        			  console.error("error > " + JSON.stringify(err));
			            }
	  		});
		}
		
		function fn_kakao_callAjax(data){
			var afterFn = function(resData){
								console.log(resData);
								var cnt = resData.cnt;
								
								switch (cnt) {
									case 0: // 회원이 없을 때
										var userId   = resData.id;
										var nickName = resData.nickName;
										var loginType = "KAKAO";
										
										$("#loginType").val(loginType);
										$("#userId").val(userId);
										$("#userPwd").val("KAKAO");
										$("#nickName").val(nickName);
										
										$("#modal_email_area").show();
										$("#modal_easy_signUp").modal();
										//login.me
									break;
									
									case 1: // 회원이 있을 때
										window.location.href = "goMain.me";
									break;
								}
						  };
			fn_callAjax("/login.kakao", data, afterFn, function(){alert("Ajax 통신 에러")});
		}
		
		function fn_kakao_clean(){
			Kakao.Auth.logout(function () {
	  			//console.log(Kakao.Auth.getAccessToken());
	  		});
	  		Kakao.cleanup();
		}
	}
</script>

<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
  

<section class="login first grey">
	<div class="container">
		<div class="box-wrapper">				
			<div class="box box-border">
				<div class="box-body">
					<h4>로그인</h4>
					<form action="/login.me" method="post">
						<div class="form-group">
							<label>아이디</label>
							<input type="text" name="userId" class="form-control">
						</div>
						<div class="form-group">
							<label class="fw">비밀번호
								<a href="#" class="pull-right">비밀번호 찾기</a>
							</label>
							<input type="password" name="userPwd" class="form-control">
						</div>
						<div class="form-group text-right">
							<button class="btn btn-primary btn-block">로그인</button>
						</div>
						<div class="form-group text-center">
							<span class="text-muted">계정이 없으신가요?</span> <a href="/joinView.me">회원가입</a>
						</div>
					</form>
					
					<div class="title-line">or</div>
					<!-- API -->
					<div class="center-block">
						<div id="kakao-login-btn"></div>
					</div>
					<div class="center-block">
						<div id="google-login-btn"></div>
				 	</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%-- modal css --%>
<style type="text/css">
	#modal_easy_signUp .form-group{display: inline;}
</style>
<!-- Modal -->
<section>
	<div class="modal fade" id="modal_easy_signUp" role="dialog" style="margin-top: 200px;">
		<div class="modal-dialog">
	  
			<!-- Modal content-->
			<div class="modal-content">
			    
			    <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
				    <h4 class="modal-title">회원 추가 입력 정보</h4>
			    </div>
				      
			    <div class="modal-body">
			   		<form id="myForm" action="/insertMember.me" method="post" class="form-horizontal">
			   			<input type="hidden" name="loginType" id="loginType">
			   			<input type="hidden" name="userId" id="userId">
			   			<input type="hidden" name="userPwd" class="form-control">
			   			
						<div class="form-group">
							<label>닉네임</label>
							<button type="button" id="checkBtn2" class="btn btn-warning bt-sm" onclick="fn_overlayCheck('nickName');">중복체크</button>
							<input type="text" id="nickName" name="nickName" class="form-control">
						</div>
						
						<div class="form-group">
							<label>이름</label>
							<input type="text" name="userName" class="form-control">
						</div>
						
						<div class="form-group">
							<label class="fw">생년월일</label>
							<input type="date" class="form-control onlyNumber" name="birth" placeholder="YYYY-MM-DD">
						</div>
						
						
						<div class="form-group">
							<label class="fw">성별</label>
							<div>
								<select class="form-control" name="gender">
									<option value="M">남</option>
									<option value="F">여</option>
								</select>
							</div>
						</div>
						
						<div id="modal_email_area">
							<div class="form-group">
								<label>이메일</label>
								<input type="email" id="email" name="email" class="form-control">
							</div>
							
							<div class="join_div">
								<button type="button" class="btn btn-success bt-lg" onclick="fn_sendEmail();">인증</button>
							</div>
	
							<div class="form-group">
								<label>인증번호</label>
								<input type="text" id="cNum" class="form-control">
							</div>
							
							<div class="join_div">
								<button type="button" class="btn btn-secondary bt-lg" onclick="fn_confirm();">확인</button>
							</div>
						</div>
						
						<div class="form-group text-right">
							<button type="submit" class="btn btn-primary btn-block" id="submitBtn">입력</button>
						</div>
					</form>
			    </div>
				      
			    <div class="modal-footer">
			    	<button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
			    </div>
		   	</div>
	    
  		</div>
	</div>
</section>

<!-- modal 추가 정보 js -->
<script type="text/javascript">
	//중복 체크
	function fn_overlayCheck(type){
		var resultValue = "";
		
		if(type === "id")		{resultValue = $("#userId").val();}
		if(type === "nickName") {resultValue = $("#nickName").val();}
		
		if(resultValue == ""){
			if(type == "id"){
				$("#userId").focus();
			}
			if(type == "nickName"){
				$("#nickName").focus();
			}
			return alert("입력 값이 없습니다.");
		}
		
		var url = "/overlayCheck/" + type + ".me"
		   ,data = {
				     params : {
				    	 			resultValue 	: resultValue
								}
				};
		var afterFn = function(resultData, status, headers, config){
				        	var ret_code 	= resultData.ret_code;
				        	var ret_message = resultData.ret_message;
				        	
				        	switch (ret_code) {
								case "E":
									alert("에러가 발생했습니다. : \n" + ret_message);
								break;
								
								case "S":
									alert(ret_message);
								break;
							}
				       };
				       
		fn_callAjax(url, data, afterFn);
	}
	
	function fn_sendEmail(){
		var url = "/authEmail"
		   ,data = {
				     params : {
				    	 			email 	: $("#email").val()
								}
				};
	
		var afterFn = function(resultData, status, headers, config){
					  	alert("이메일을 확인해주세요.");
					  	var keyCode = resultData["keyCode"];
					  	$("#cNum").attr("keyCode", keyCode);
					  	
				      };
		fn_callAjax(url, data, afterFn);
	};
	
	function fn_confirm(){
		var input = $("#cNum").val();
		var keyCode = $("#cNum").attr("keyCode");
		
		console.log(input);
		console.log(keyCode);
		
		if (keyCode == input){
			alert("인증되었습니다.")
			$("#submitBtn").focus();
		} else {
			alert("입력한 값이 일치하지 않습니다.")
		}
		
	};
</script>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />