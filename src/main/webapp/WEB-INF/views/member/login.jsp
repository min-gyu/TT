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
								<label>아이디</label>
								<input type="text" name="username" class="form-control">
							</div>
							<div class="form-group">
								<label class="fw">비밀번호
									<a href="#" class="pull-right">비밀번호 찾기</a>
								</label>
								<input type="password" name="password" class="form-control">
							</div>
							<div class="form-group text-right">
								<button class="btn btn-primary btn-block">로그인</button>
							</div>
							<div class="form-group text-center">
								<span class="text-muted">계정이 없으신가요?</span> <a href="joinView.me">회원가입</a>
							</div>
							<div class="title-line">or</div>
							
							<!-- API -->
             				<a href="#" class="btn btn-social btn-block facebook">구글로 로그인</a>
             				<a href="#" class="btn btn-social btn-block facebook" style="background:#F4FA58">카카오로 로그인</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />