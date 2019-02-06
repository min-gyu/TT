<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<h4>회원가입</h4>
						<form class="form-horizontal">
							<div class="form-group">
								<label>아이디</label>
								<a href="#" class="pull-right">아이디 중복 체크</a>
								<input type="text" name="userId" class="form-control">
							</div>
							
							<div class="form-group">
								<label>이름</label>
								<input type="text" name="userName" class="form-control">
							</div>
							
							<div class="form-group">
								<label>닉네임</label>
								<input type="text" name="nickName" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">비밀번호</label>
								<input type="password" name="userPwd" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">비밀번호 확인</label>
								<input type="password" name="userPwdCheck" class="form-control">
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
							
							<div class="form-group">
								<label>이메일</label>
								<a href="#" class="pull-right">이메일 중복 체크</a>
								<input type="email" name="email" class="form-control">
							</div>
							
							<div class="form-group">
								<label>인증번호</label>
								<input type="text" name="cNum" class="form-control">
							</div>
							
							<div class="join_div" style="text-align: center; margin-bottom: 25px;">
								<button type="button" class="btn btn-success">인증</button>
								<button type="button" class="btn btn-secondary">확인</button>
							</div>
							
							<div class="form-group text-right">
								<button class="btn btn-primary btn-block">회원가입</button>
							</div>
							
							<div class="form-group text-center">
								<span class="text-muted">이미 계정이 있으신가요?</span> <a href="loginView.me">로그인</a>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />