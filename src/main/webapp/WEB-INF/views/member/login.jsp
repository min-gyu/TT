<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<h4>로그인</h4>
						<form action="login.me" method="post">
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
							<div class="title-line">or</div>
							
							<!-- API -->
             				<a href="#" class="btn btn-social btn-block facebook">구글로 로그인</a>
             				<a href="#" class="btn btn-social btn-block facebook" style="background:#F4FA58">카카오로 로그인</a>
             				
             				<div id="kakao_btn_changed">
								<a id="custom-login-btn" href="javascript:loginWithKakao()">
								<img src="../images/sns/Kakao_login_btn.png" width="300"/></a>
							</div>


						    
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script type='text/javascript'>
		// 버튼 이미지 전환 
		$(document).ready(function(){
		 
		    $("#custom-login-btn, #custom-logout-btn").hover(
		    function(){
		        $("#custom-login-btn img").attr('src','../images/sns/Kakao_login_btn_c.png');
		        $("#custom-logout-btn img").attr('src','../images/sns/Kakao_logout_btn_c.png');
		        
		    }, 
		    function(){
		        $("#custom-login-btn img").attr('src','../images/sns/Kakao_login_btn.png');
		        $("#custom-logout-btn img").attr('src','../images/sns/Kakao_logout_btn.png');
		        
		    });
		 
		});
		 
		// 로그인 및 로그아웃 버튼 생성 처리
		var cookiedata = document.cookie;
		 
		if(cookiedata.indexOf('kakao_login=done') < 0){
		    createLoginKakao();
		}else{
		    createLogoutKakao();
		}
		 
		/* 로그인 관련 쿠키 생성 및 삭제 */
		function setCookie( name , value , expired ){
		 
		 var date = new Date();
		 date.setHours(date.getHours() + expired);
		 var expried_set = "expries="+date.toGMTString();
		 document.cookie = name + "=" + value + "; path=/;" + expried_set + ";"
		 
		}
		 
		function getCookie(name){
		 
		    var nameofCookie = name + "=";
		    var x = 0;
		    while(x <= document.cookie.length){
		        var y = ( x + nameofCookie.length);
		        if(document.cookie.substring(x,y) == nameofCookie){
		            if((endofCookie = document.cookie.indexOf(";",y)) == -1)
		                endofCookie = document.cookie.length;
		            return unescape(document.cookie.substring(y,endofCookie));
		        }
		        x = document.cookie.indexOf(" ",x) + 1;
		        if( x == 0 )
		            break;
		        }
		        
		        return "";
		}
		 
		// 카카오 script key 입력
		Kakao.init('41f4585e7739019ab56a3fd81ac273c4');
		 
		 // 로그인 처리
		function loginWithKakao(){
		    
		    Kakao.Auth.cleanup();
		    Kakao.Auth.login({
		        persistAccessToken: true,
		        persistRefreshToken: true,
		        success: function(authObj) {
		            setCookie("kakao_login","done",1); // 쿠키생성 (로그인)
		            //alert(cookiedata);
		            createLogoutKakao();
		            window.location.href="../index.html";
		        },
		            fail: function(err) {
		             alert(JSON.stringify(err));
		        }
		                 
		    });
		}
		 
		// 로그아웃 처리
		function logoutWithKakao(){
		    Kakao.Auth.logout();
		    alert('카카오 로그아웃 완료!');
		    setCookie("kakao_login","",-1);  // 쿠키삭제 (로그아웃)
		    //deleteCookie( "kakao_login" ); 쿠키삭제 다른 방법
		    createLoginKakao();
		    window.location.href="../index.html";
		}
		 
		// 로그인 버튼생성
		function createLoginKakao(){
		 var login_btn = "<a id='custom-login-btn' href='javascript:loginWithKakao()'>"+
		                "<img src='../images/sns/Kakao_login_btn.png' width='250'/>"+
		                "</a>";
		 document.getElementById('kakao_btn_changed').innerHTML  = login_btn;
		}
		 
		// 로그아웃 버튼생성
		function createLogoutKakao(){
		 var logout_btn = "<a id='custom-logout-btn' href='javascript:logoutWithKakao()'>"+
		                "<img src='../images/sns/Kakao_logout_btn.png' width='200'/>"+
		                "</a>";
		 document.getElementById('kakao_btn_changed').innerHTML  = logout_btn;
		 
		}
		 
		  //]]>
	</script>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />