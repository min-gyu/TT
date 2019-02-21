<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

 <!-- 계좌 조회& 삭제 -->

	<script>
		$(function(){
			
			//계좌인증 클릭시 작동
			$("#deleteBank").click(function(){
				var result = confirm("계좌를 삭제시키겠습니까? \n\n 삭제된 계좌는 복구되지 않습니다.");
				
				if(result==true){
					//계좌삭제하기
					location.href="deleteBank.me?mUno="+${mUno};
				}
				
				console.log(result);
			});
			
		});
	
	</script>
	
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">		
				<!-- 카테고리 -->	
				<div class="ui top attached tabular menu">
				  <a href="bankChk2.me?mUno=${sessionScope.loginUser.uno}" class="active item">계좌 조회</a>
				  <a href="bankChk.me?mUno=${sessionScope.loginUser.uno}" class="item">계좌 인증</a>
				 </div>			
				<div class="box box-border">
					<div class="box-body">
						<!-- 계좌인증 입력폼 -->
						<form>
							<div class="form-group">
								<label>이름</label>
								<input type="text" name="username" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label class="fw">은행</label>
								<input type="text" name="userbank" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label class="fw">계좌번호</label>
								<input type="text" name="banknumber" class="form-control" readonly>
							</div>
							<div class="form-group">
								<label class="fw">생년월일</label>
								<input type="date" name="birthday" class="form-control" readonly>
							</div>
							<div class="form-group text-right">
								<a class="btn btn-primary btn-block" id="deleteBank">삭제</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
		
	</script>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />