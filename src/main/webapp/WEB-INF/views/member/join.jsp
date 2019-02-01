<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<h4>회원가입</h4>
						<form>
							<div class="form-group">
								<label>아이디</label>
								<input type="text" name="userId" class="form-control">
							</div>
							<div class="form-group">
								<label>이름</label>
								<input type="text" name="userName" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">Password</label>
								<input type="password" name="userPwd" class="form-control">
							</div>
							
							<div class="form-group">
								<label class="fw">Confirm Password</label>
								<input type="password" name="userPwdCheck" class="form-control">
							</div>
							<div class="form-group">
								<label>Name</label>
								<input type="email" name="email" class="form-control">
							</div>
							<div class="form-group">
								<label>Username</label>
								<input type="text" name="username" class="form-control">
							</div>
							<div class="form-group text-right">
								<button class="btn btn-primary btn-block">Register</button>
							</div>
							<div class="form-group text-center">
								<span class="text-muted">Already have an account?</span> <a href="login.html">Login</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />