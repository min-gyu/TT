<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 

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
             				<!-- <a href="#" class="btn btn-social btn-block facebook">구글로 로그인</a> -->
             				<a id="kakao-login-btn"></a>
             				<a href="http://developers.kakao.com/logout"></a>
						</div>
						
						  <a href="${google_url}">
						  <button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width: 100%">
                                <i class="fa fa-google" aria-hidden="true"></i>Google Login
                          </button>
                          </a> 
						
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script type="text/javascript">
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
					location.href="/goMain.me";
				}	
			})
		},
				fail 	: 	function(error){
					alert(JSON.stringify(error));
				}
	});
</script>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />