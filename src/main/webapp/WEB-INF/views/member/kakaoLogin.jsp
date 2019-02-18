<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script> 
</head>

<body>
<!-- <a id="kakao-login-btn"></a>
<input type="button" class="btn btn-success" onclick="kakaoOut();" value="카카오톡 로그아웃">
<a href="http://developers.kakao.com/logout"></a> -->

<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
</body>
<!-- <script type="text/javascript">
	//발급받은 javaScript 키
	Kakao.init('41f4585e7739019ab56a3fd81ac273c4');	
	
	// 카카오 로그인 버튼 생성
	Kakao.Auth.createLoginButton({
		container: '#kakao-login-btn',
		success : function(authObj){
			Kakao.API.request({
				url : "/v1/user/me"
				, success : function(res){
					alert(JSON.stringify(res));								// kakao.api.request 에서 불러온 결과값 json형태로 출력
					alert(JSON.stringify(authObj));							// Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
					
					console.log("id > " + res.id);							// 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
					console.log("email > " + res.kaccount_email);			// 콘솔 로그에 email 정보 출력
					console.log("nickName > " + res.properties['nickname']);// 콘솔 로그에 닉네임 출력 = res.properties.nickname
					console.log("token > " + authObj.access_token);			// 콘솔 로그에 토큰값 출력
					
					alert(res.properties.nickname+'님 환영합니다.');
					location.href="/KakaoLogin.me";
				}	
			})
		},
				fail 	: 	function(error){
					alert(JSON.stringify(error));
				}
	});
	
	function KakaoOut(){
		Kakao.Auth.logout(function(){
			setTimeout(function(){
				alert("카카오톡 > 로그아웃 되었습니다.");
				location.href="/goMain.me";
			}, 1000)	// 로그아웃 되는 타임을 일시적으로 1000 설정(=1초)
		});
	}
</script> -->

<script>
		$(document).ready(function(){
			Kakao.init("41f4585e7739019ab56a3fd81ac273c4");
			
			function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						$("#kakao-profile").append(res.properties.nickname);
						$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"}));
					},
					fail: function(error) {
						console.log(error);
					}
				});
			}
			function createKakaotalkLogin(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"});
				loginBtn.click(function(){
					Kakao.Auth.login({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();
							createKakaotalkLogout();
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});
				$("#kakao-logged-group").prepend(loginBtn)
			}
			function createKakaotalkLogout(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
				logoutBtn.click(function(){
					Kakao.Auth.logout();
					createKakaotalkLogin();
					$("#kakao-profile").text("");
				});
				$("#kakao-logged-group").prepend(logoutBtn);
			}
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				createKakaotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});
	</script>

</html>
