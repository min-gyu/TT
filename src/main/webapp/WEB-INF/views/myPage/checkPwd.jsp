<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">				
				<div class="box box-border">
					<div class="box-body">
						<h4>개인정보 수정</h4>
						<form>
							<div class="form-group">
								<label>ID</label>
								<input type="text" name="username" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label class="fw">Password
									<a href="#" class="pull-right">Forgot Password?</a>
								</label>
								<input type="password" name="password" class="form-control">
							</div>
							<div class="form-group text-right">
								<button class="btn btn-primary btn-block" onclick="checkPwd();">확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
		function checkPwd(){
			alert("함수작동!");
		}
	</script>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />