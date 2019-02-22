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
	$(document).ready(function(){
		Kakao.init("${kakaoAuth}");	

		// 카카오 로그인 버튼 생성
		Kakao.Auth.createLoginButton({
	       container: '#kakao-login-btn'
	      ,persistAccessToken :false
	      ,success: function(authObj) {
		    	// 로그인 성공시, API를 호출합니다.
	            Kakao.API.request({
	            	 url: '/v2/user/me'
	            	,success: function(res) {
	              			  	var privateInfo = res;
	              			  	console.log(privateInfo);
	              			  	console.log(Kakao.Auth.getAccessToken());
	              			  	Kakao.Auth.logout(function () {
	              			  			console.log(Kakao.Auth.getAccessToken());
	              			  		});
	              			  	Kakao.cleanup();
	              			  }
	            	,fail: function(error) {
				              alert(JSON.stringify(error));
				            }
          		});
	      },
	      fail: function(err) {
	    	  alert("카카오 로그인 에러");
	    	  console.error("error > " + JSON.stringify(err));
	      }
	    });
	});
	
</script>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />