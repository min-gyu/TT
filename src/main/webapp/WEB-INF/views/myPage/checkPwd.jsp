<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<!-- 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


		<script>
		//비밀번호확인 눌렀을시
		//함수작동 후 에러나는 이유는?
		//사용자 회원번호까지는 잘 받아오는데 페이지이동이 안됨 modifyMyPage.me? 로 이동함 ㅠ
		$(function(){
			
			$("#chk").click(function(){

				var mUno = ${member1.getUno()};
				var inputPwd = $("#password1").val();
				var chkPwd = "${member1.getUserPwd()}";
				
				console.log(mUno+", "+inputPwd+", "+chkPwd);
				
				if(inputPwd=="pass"){
					console.log("로그인 성공");
					location.href="modifyMyPage2.me?mUno="+mUno;
				}else{
					console.log("로그인 실패!");
				} 
				

				/* var encPassword = passwordEncoder.encode(inputPwd);
				alert("변경 후 암호 > " + encPassword); */
				
				
				/* if(chkPwd.equals("$2a$10$Vn8uUpx3oQkJb3XH07vH9.STsXLWgRl8iyQPVIrQD9yFI.oICbHn6")){
					alert("비번일치!");
				}else{
					alert("비번일치하지않음");
				} */
				/* location.href="modifyMyPage2.me?mUno="+mUno; */
			
				
			});
		});
			
	</script>
	
	
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<h2>개인정보 수정</h2>
						<h4>비밀번호 확인</h4>
						<form>
							<div class="form-group">
								<label>ID</label>
								<input type="text" class="form-control" value="${member1.getUserId() }" readonly>
							</div>
							<div class="form-group">
								<label class="fw">Password
									<a href="#" class="pull-right">Forgot Password?</a>
								</label>
								<input type="password" id="password1" class="form-control">
							</div>
							<div class="form-group text-right">
								<a class="btn btn-primary btn-block" id="chk">확인</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	

	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />