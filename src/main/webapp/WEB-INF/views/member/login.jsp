<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<h4>로그인</h4>
						<form>
							<div class="form-group">
								<label>ID</label>
								<input type="text" name="username" class="form-control">
							</div>
							<div class="form-group">
								<label class="fw">Password
									<a href="#" class="pull-right">Forgot Password?</a>
								</label>
								<input type="password" name="password" class="form-control">
							</div>
							<div class="form-group text-right">
								<button class="btn btn-primary btn-block">Login</button>
							</div>
							<div class="form-group text-center">
								<span class="text-muted">Don't have an account?</span> <a href="joinView.me">Create one</a>
							</div>
							<div class="title-line">or</div>
							
							<!-- API -->
             				<a href="#" class="btn btn-social btn-block facebook">Login with Google</a>
             				<a href="#" class="btn btn-social btn-block facebook" style="background:#F4FA58">Login with KaKao</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />