<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

 <!-- 계좌 조회& 삭제 -->
	
	<script>
		$(function(){
			//계좌인증 클릭시 작동
			$("#deleteBank").click(function(){
				
				var bank = "${ m.getBank()}";
				console.log(bank);
				
				if(bank==""){
					alert("삭제시킬 계좌가 없습니다. \n\n (계좌를 먼저 등록시켜 주세요.)");
					
					location.href="bankChk.me?mUno=${sessionScope.loginUser.uno}";
				}else{
					
					var result = confirm("계좌를 삭제시키겠습니까? \n\n 삭제된 계좌는 복구되지 않습니다.");
					
					if(result==true){
						console.log("confirm 창 true");
						//계좌삭제하기
						location.href="deleteBank.me?mUno=${sessionScope.loginUser.uno}";
					} 
				}
			});
			
		});
	
	</script>
	
	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">		
				<!-- 카테고리 -->	
				<div class="ui top attached tabular menu">
				  <a href="bankChk3.me?mUno=${sessionScope.loginUser.uno}" class="active item">계좌 조회</a>
				  <a href="bankChk.me?mUno=${sessionScope.loginUser.uno}" class="item">계좌 인증</a>
				 </div>			
				<div class="box box-border">
					<div class="box-body">
						<!-- 계좌인증 입력폼 -->
						<form>
							<div class="form-group">
								<label>이름</label>
								<input type="text" name="username" class="form-control" value="${ m.getUserName()}" readonly>
							</div>
							<div class="form-group">
								<label class="fw">은행</label>
								<input type="text" name="userbank" class="form-control" value="${ m.getBank()}" readonly>
							</div>
							<div class="form-group">
								<label class="fw">계좌번호</label>
								<input type="text" name="banknumber" class="form-control" value="${ m.getBankNo()}" readonly>
							</div>
							<div class="form-group">
								<label class="fw">생년월일</label>
								<input type="date" name="birthday" class="form-control" value="${ m.getBirth()}" readonly>
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